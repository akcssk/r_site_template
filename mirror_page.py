import requests
from bs4 import BeautifulSoup
import os
import urllib.parse
import re
import logging
from urllib.parse import urlparse, urljoin
import chardet  # CSS等のエンコーディング検出に使用

# ロギングの設定
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

def download_webpage_with_resources(url, base_dir='website_mirror', mobile=False):
    """
    指定されたウェブページとその関連リソース（JS、CSS、画像など）をダウンロードし、
    元のディレクトリ構造および文字コードを尊重したローカルコピーを作成します。
    
    Args:
        url (str): ミラーリングするウェブページのURL
        base_dir (str): ダウンロードしたファイルを保存するベースディレクトリ
        mobile (bool): Trueの場合、スマホサイト用のユーザーエージェントでアクセス
    """
    # URLをパースして情報を取得
    parsed_url = urlparse(url)
    domain = parsed_url.netloc
    scheme = parsed_url.scheme
    base_domain_url = f"{scheme}://{domain}"
    
    # 既にダウンロードしたURLのリスト（重複防止用）
    downloaded_urls = set()
    
    # リソースのURLとローカルパスのマッピング
    url_to_local_map = {}
    
    # ユーザーエージェントの設定（mobileフラグに応じて切り替え）
    if mobile:
        headers = {
            'User-Agent': 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X) '
                          'AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15A372 Safari/604.1'
        }
    else:
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) '
                          'AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
    
    def is_same_domain(resource_url):
        """URLが同じドメインかどうかをチェック"""
        resource_domain = urlparse(resource_url).netloc
        return resource_domain == domain or resource_domain == ""
    
    def download_resource(resource_url):
        """リソースをダウンロードして保存する"""
        if resource_url in downloaded_urls:
            return url_to_local_map.get(resource_url)
        
        # 相対URLを絶対URLに変換
        absolute_url = urljoin(url, resource_url)
        
        # 同じドメインでない場合はスキップ
        if not is_same_domain(absolute_url):
            return resource_url
        
        # URLを正規化（クエリパラメータ等を削除）
        parsed_resource = urlparse(absolute_url)
        resource_path = parsed_resource.path
        
        # 空のパスの場合はスキップ
        if not resource_path or resource_path == '/':
            return resource_url
        
        # パスが/で始まる場合は先頭の/を削除
        if resource_path.startswith('/'):
            resource_path = resource_path[1:]
        
        # ローカルでの保存パス
        local_path = os.path.join(base_dir, resource_path)
        
        # ディレクトリを作成
        os.makedirs(os.path.dirname(local_path), exist_ok=True)
        
        try:
            # リソースをダウンロード
            resource_response = requests.get(absolute_url, headers=headers, stream=True)
            resource_response.raise_for_status()
            
            # ファイルを保存（バイナリモード）
            with open(local_path, 'wb') as f:
                for chunk in resource_response.iter_content(chunk_size=8192):
                    if chunk:
                        f.write(chunk)
            
            logger.info(f"ダウンロード成功: {absolute_url} -> {local_path}")
            downloaded_urls.add(absolute_url)
            url_to_local_map[absolute_url] = local_path
            
            # 相対パスでの参照用
            relative_path = os.path.relpath(local_path, os.path.dirname(os.path.join(base_dir, parsed_url.path.lstrip('/'))))
            url_to_local_map[resource_url] = relative_path
            
            return relative_path
            
        except Exception as e:
            logger.error(f"ダウンロード失敗: {absolute_url} - {e}")
            return resource_url
    
    # メインページをダウンロード
    try:
        logger.info(f"ウェブページ {url} をダウンロードしています...")
        response = requests.get(url, headers=headers)
        response.raise_for_status()
        
        # レスポンスのエンコーディングを検出
        if not response.encoding:
            response.encoding = response.apparent_encoding
        original_encoding = response.encoding
        
        # BeautifulSoupでHTMLを解析（元のエンコーディングを指定）
        soup = BeautifulSoup(response.content, 'html.parser', from_encoding=original_encoding)
        
        # 1. CSSファイルを抽出してダウンロード
        for link in soup.find_all('link', rel='stylesheet'):
            css_url = link.get('href')
            if css_url:
                local_css_path = download_resource(css_url)
                if local_css_path != css_url:
                    link['href'] = local_css_path
        
        # 2. JavaScriptファイルを抽出してダウンロード
        for script in soup.find_all('script', src=True):
            js_url = script.get('src')
            if js_url:
                local_js_path = download_resource(js_url)
                if local_js_path != js_url:
                    script['src'] = local_js_path
        
        # 3. 画像を抽出してダウンロード
        for img in soup.find_all('img', src=True):
            img_url = img.get('src')
            if img_url:
                local_img_path = download_resource(img_url)
                if local_img_path != img_url:
                    img['src'] = local_img_path
        
        # CSSの中に埋め込まれた画像URLを検索してダウンロード
        for style in soup.find_all('style'):
            if style.string:
                # url()関数を検索
                urls = re.findall(r'url\([\'"]?([^\'")]+)[\'"]?\)', style.string)
                modified_css = style.string
                for css_url in urls:
                    if not css_url.startswith('data:'):  # データURLはスキップ
                        local_css_resource = download_resource(css_url)
                        if local_css_resource != css_url:
                            modified_css = modified_css.replace(f'url({css_url})', f'url({local_css_resource})')
                style.string = modified_css
        
        # インラインスタイル属性内のURL
        for tag in soup.find_all(style=True):
            style_attr = tag['style']
            urls = re.findall(r'url\([\'"]?([^\'")]+)[\'"]?\)', style_attr)
            modified_style = style_attr
            for css_url in urls:
                if not css_url.startswith('data:'):
                    local_css_resource = download_resource(css_url)
                    if local_css_resource != css_url:
                        modified_style = modified_style.replace(f'url({css_url})', f'url({local_css_resource})')
            tag['style'] = modified_style
        
        # 4. その他の関連リソース（favicon、ビデオ、オーディオなど）
        for link in soup.find_all('link', rel='icon'):
            favicon_url = link.get('href')
            if favicon_url:
                local_favicon_path = download_resource(favicon_url)
                if local_favicon_path != favicon_url:
                    link['href'] = local_favicon_path
        
        for source in soup.find_all(['source', 'video', 'audio'], src=True):
            media_url = source.get('src')
            if media_url:
                local_media_path = download_resource(media_url)
                if local_media_path != media_url:
                    source['src'] = local_media_path
        
        # 5. CSSファイルをダウンロードして内部の参照を更新
        for css_url in list(url_to_local_map.keys()):
            if css_url.endswith('.css'):
                try:
                    css_local_path = url_to_local_map[css_url]
                    css_dir = os.path.dirname(css_local_path)
                    
                    # CSSファイルの内容をバイナリで読み取り、エンコーディングを検出
                    css_file_path = os.path.join(base_dir, css_local_path) if not os.path.isabs(css_local_path) else css_local_path
                    if os.path.exists(css_file_path):
                        with open(css_file_path, 'rb') as f:
                            raw_css = f.read()
                        detected = chardet.detect(raw_css)
                        css_encoding = detected['encoding'] if detected['encoding'] else 'utf-8'
                        css_content = raw_css.decode(css_encoding, errors='ignore')
                        
                        # url()関数を検索
                        urls = re.findall(r'url\([\'"]?([^\'")]+)[\'"]?\)', css_content)
                        modified_css = css_content
                        
                        for resource_url in urls:
                            if resource_url.startswith('data:'):  # データURLはスキップ
                                continue
                            # CSSファイルからの相対URLを変換
                            css_resource_absolute_url = urljoin(css_url, resource_url)
                            
                            if css_resource_absolute_url not in downloaded_urls:
                                local_resource = download_resource(css_resource_absolute_url)
                                if local_resource != css_resource_absolute_url:
                                    # CSSファイルからの相対パスに変換
                                    relative_to_css = os.path.relpath(
                                        os.path.join(base_dir, local_resource), 
                                        os.path.dirname(css_file_path)
                                    )
                                    modified_css = modified_css.replace(f'url({resource_url})', f'url({relative_to_css})')
                        
                        # 更新されたCSSを同じエンコーディングで保存
                        with open(css_file_path, 'wb') as f:
                            f.write(modified_css.encode(css_encoding))
                except Exception as e:
                    logger.error(f"CSSファイルの処理に失敗: {css_url} - {e}")
        
        # メインのHTMLファイルを保存
        html_path = os.path.join(base_dir, parsed_url.path.lstrip('/'))
        if html_path.endswith('/') or not os.path.basename(html_path):
            html_path = os.path.join(html_path, 'index.html')
            
        # ディレクトリを作成
        os.makedirs(os.path.dirname(html_path), exist_ok=True)
        
        # 更新されたHTMLを元のエンコーディングで保存（バイナリモード）
        with open(html_path, 'wb') as f:
            f.write(soup.encode(original_encoding))
            
        logger.info(f"ウェブページのダウンロードが完了しました！")
        logger.info(f"合計 {len(downloaded_urls)} 個のファイルをダウンロードしました。")
        logger.info(f"HTMLファイルは {html_path} に保存されました。")
        
        return html_path
        
    except Exception as e:
        logger.error(f"ウェブページのダウンロードに失敗しました: {e}")
        return None

if __name__ == "__main__":
    # 使用例
    target_url = input("ミラーリングするウェブページのURLを入力してください: ")
    download_directory = input("ダウンロード先ディレクトリを入力してください (デフォルト: 'website_mirror'): ")
    if not download_directory:
        download_directory = 'website_mirror'
    
    mobile_choice = input("スマホ版サイトとしてダウンロードする場合は 'y' を入力してください（デフォルトはPC版）: ")
    mobile_flag = True if mobile_choice.lower() == 'y' else False
    
    html_file = download_webpage_with_resources(target_url, download_directory, mobile=mobile_flag)
    
    if html_file:
        print(f"\nダウンロード完了！")
        print(f"ローカルでHTMLファイルを開くには: {html_file}")
