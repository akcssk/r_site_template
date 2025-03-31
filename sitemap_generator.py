import requests
from bs4 import BeautifulSoup
from urllib.parse import urlparse, urljoin
import time
from collections import defaultdict
import argparse
import sys

# 標準出力の文字エンコーディングをUTF-8に設定
sys.stdout.reconfigure(encoding='utf-8') if hasattr(sys.stdout, 'reconfigure') else None

class SiteMapper:
    def __init__(self, start_url, max_depth=3, delay=1):
        self.start_url = start_url
        self.base_domain = urlparse(start_url).netloc
        self.visited_urls = set()
        self.url_titles = {}
        self.url_children = defaultdict(list)
        self.max_depth = max_depth
        self.delay = delay

    def get_page_info(self, url):
        """指定されたURLのページタイトルとリンクを取得する"""
        try:
            response = requests.get(url, headers={'User-Agent': 'SiteMapperBot/1.0'})
            response.raise_for_status()
            
            # エンコーディングを適切に処理
            if response.encoding.lower() == 'iso-8859-1':
                # Content-Typeヘッダーからエンコーディングを取得できない場合、
                # エンコーディングを推測してみる
                response.encoding = response.apparent_encoding
            
            soup = BeautifulSoup(response.text, 'html.parser')
            title = soup.title.string.strip() if soup.title else "No Title"
            
            links = []
            for a_tag in soup.find_all('a', href=True):
                link = a_tag['href']
                # 相対URLを絶対URLに変換
                absolute_link = urljoin(url, link)
                
                # 同じドメイン内のリンクのみ処理
                if urlparse(absolute_link).netloc == self.base_domain:
                    # フラグメントを除去（#以降を削除）
                    absolute_link = absolute_link.split('#')[0]
                    # GETパラメータは保持する
                    if absolute_link and absolute_link not in links:
                        links.append(absolute_link)
            
            return title, links
        except Exception as e:
            print(f"Error fetching {url}: {e}")
            return None, []

    def crawl(self, url, depth=0, parent=None):
        """サイトを再帰的にクロールしてサイトマップを構築する"""
        if url in self.visited_urls or depth > self.max_depth:
            return
        
        self.visited_urls.add(url)
        print(f"Crawling: {url}")
        
        title, links = self.get_page_info(url)
        if title:
            self.url_titles[url] = title
            if parent is not None:
                self.url_children[parent].append(url)
            
            # クロール制限のための遅延
            time.sleep(self.delay)
            
            # 子ページを再帰的に処理
            for link in links:
                if link not in self.visited_urls:
                    self.crawl(link, depth + 1, url)

    def generate_sitemap(self):
        """クロールされたデータからタブインデントによるサイトマップを生成する"""
        self.crawl(self.start_url)
        
        def print_tree(url, depth=0):
            title = self.url_titles.get(url, "No Title")
            # URLを取得（GETパラメータ含む）
            parsed_url = urlparse(url)
            path = parsed_url.path
            query = f"?{parsed_url.query}" if parsed_url.query else ""
            
            # パスが空の場合は / を設定
            if path == "":
                path = "/"
                
            # タブを使用したインデント
            indent = "\t" * depth
            print(f"{indent}{title} ({path}{query})")
            
            # 子ページを処理
            children = self.url_children.get(url, [])
            for child in children:
                print_tree(child, depth + 1)
        
        print(f"サイトマップ: {self.start_url}")
        print(f"総ページ数: {len(self.visited_urls)}")
        print("=" * 50)
        
        # ルートURLからツリーを表示
        print_tree(self.start_url)

    def save_sitemap_to_file(self, filename="sitemap.txt"):
        """サイトマップをファイルに保存する"""
        # 一時的に標準出力をリダイレクト
        original_stdout = sys.stdout
        
        with open(filename, 'w', encoding='utf-8') as f:
            sys.stdout = f
            self.generate_sitemap()
            
        # 標準出力を元に戻す
        sys.stdout = original_stdout
        print(f"サイトマップを {filename} に保存しました。")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Crawl a website and generate a site map")
    parser.add_argument("start_url", help="The URL to start crawling from")
    parser.add_argument("--max-depth", type=int, default=3, help="Maximum crawl depth (default: 3)")
    parser.add_argument("--delay", type=float, default=1, help="Delay between requests in seconds (default: 1)")
    parser.add_argument("--output", "-o", help="Save sitemap to file")
    args = parser.parse_args()
    
    mapper = SiteMapper(args.start_url, args.max_depth, args.delay)
    
    if args.output:
        mapper.save_sitemap_to_file(args.output)
    else:
        mapper.generate_sitemap()