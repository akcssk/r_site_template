import requests
from bs4 import BeautifulSoup
import os
import urllib.parse

def download_images_from_page(url, download_dir='downloaded_images'):
    """
    指定されたウェブページから画像ファイルをダウンロードします。
    
    Args:
        url (str): 画像をダウンロードするウェブページのURL
        download_dir (str): ダウンロードした画像を保存するディレクトリ
    """
    # ダウンロードディレクトリが存在しない場合は作成
    if not os.path.exists(download_dir):
        os.makedirs(download_dir)
    
    # ウェブページを取得
    try:
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        response = requests.get(url, headers=headers)
        response.raise_for_status()  # エラーがあれば例外を発生させる
    except requests.exceptions.RequestException as e:
        print(f"ウェブページの取得に失敗しました: {e}")
        return
    
    # BeautifulSoupでHTMLを解析
    soup = BeautifulSoup(response.text, 'html.parser')
    
    # すべての画像タグを探す
    images = soup.find_all('img')
    
    # ベースURLを取得（相対パスを絶対パスに変換するため）
    base_url = url
    
    # ダウンロードカウンター
    download_count = 0
    
    print(f"{url} から画像をダウンロードしています...")
    
    # 各画像をチェック
    for img in images:
        src = img.get('src')
        
        # srcがない場合、data-srcやdata-original-srcなどの属性をチェック（遅延読み込み対応）
        if not src:
            for attr in ['data-src', 'data-original', 'data-original-src', 'data-lazy-src']:
                src = img.get(attr)
                if src:
                    break
        
        # 画像URLがない場合はスキップ
        if not src:
            continue
        
        # URLが相対パスの場合、絶対URLに変換
        img_url = urllib.parse.urljoin(base_url, src)
        
        # ファイル名を取得
        file_name = os.path.basename(urllib.parse.urlparse(img_url).path)
        
        # ファイル名が空の場合やクエリパラメータがある場合の処理
        if not file_name or '?' in file_name:
            # ランダムなファイル名を生成
            from uuid import uuid4
            file_extension = '.jpg'  # デフォルトの拡張子
            
            # Content-Typeから拡張子を推測
            try:
                head_response = requests.head(img_url, headers=headers)
                content_type = head_response.headers.get('Content-Type', '')
                if 'image/jpeg' in content_type:
                    file_extension = '.jpg'
                elif 'image/png' in content_type:
                    file_extension = '.png'
                elif 'image/gif' in content_type:
                    file_extension = '.gif'
                elif 'image/webp' in content_type:
                    file_extension = '.webp'
                elif 'image/svg+xml' in content_type:
                    file_extension = '.svg'
            except:
                pass
                
            file_name = f"image_{uuid4().hex[:8]}{file_extension}"
        
        # ファイルをダウンロード
        try:
            img_response = requests.get(img_url, headers=headers, stream=True)
            img_response.raise_for_status()
            
            # 画像かどうかをContent-Typeでチェック
            content_type = img_response.headers.get('Content-Type', '')
            if not content_type.startswith('image/'):
                print(f"スキップ: {img_url} - 画像ではありません")
                continue
                
            # ファイルを保存
            file_path = os.path.join(download_dir, file_name)
            with open(file_path, 'wb') as f:
                for chunk in img_response.iter_content(chunk_size=8192):
                    f.write(chunk)
            
            print(f"ダウンロード完了: {file_name}")
            download_count += 1
            
        except requests.exceptions.RequestException as e:
            print(f"画像のダウンロードに失敗しました ({img_url}): {e}")
    
    print(f"ダウンロード完了！合計 {download_count} 個の画像をダウンロードしました。")

if __name__ == "__main__":
    # 使用例
    target_url = input("画像をダウンロードするウェブページのURLを入力してください: ")
    download_directory = input("ダウンロード先ディレクトリを入力してください (デフォルト: 'downloaded_images'): ")
    
    if not download_directory:
        download_directory = 'downloaded_images'
    
    download_images_from_page(target_url, download_directory)