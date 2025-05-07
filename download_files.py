#!/usr/bin/env python3
import argparse
import requests
from bs4 import BeautifulSoup
import os
import urllib.parse
from uuid import uuid4

def download_images_from_page(url, download_dir='downloaded_images'):
    """
    指定されたウェブページから画像ファイルをダウンロードし、
    URL のパス構造をローカルに再現します。
    """
    # ダウンロード先ルートフォルダを作成
    os.makedirs(download_dir, exist_ok=True)

    headers = {
        'User-Agent': (
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) '
            'AppleWebKit/537.36 (KHTML, like Gecko) '
            'Chrome/91.0.4472.124 Safari/537.36'
        )
    }

    # ページ取得
    try:
        response = requests.get(url, headers=headers)
        response.raise_for_status()
    except requests.RequestException as e:
        print(f"ページ取得失敗: {e}")
        return

    soup = BeautifulSoup(response.text, 'html.parser')
    images = soup.find_all('img')
    download_count = 0

    print(f"{url} から画像をダウンロードしています...")

    for img in images:
        # src または遅延読み込み属性を取得
        src = (
            img.get('src') or
            img.get('data-src') or
            img.get('data-original') or
            img.get('data-lazy-src')
        )
        if not src:
            continue

        # 絶対 URL に変換し、パスを解析
        img_url = urllib.parse.urljoin(url, src)
        parsed = urllib.parse.urlparse(img_url)
        rel_path = parsed.path.lstrip('/')               # 例: images/gallery/photo.jpg
        dir_part = os.path.dirname(rel_path)             # 例: images/gallery
        file_name = os.path.basename(rel_path)           # 例: photo.jpg

        # ファイル名が空 or クエリ付きならランダム生成
        if not file_name or '?' in file_name:
            ext = '.jpg'
            try:
                head = requests.head(img_url, headers=headers)
                ctype = head.headers.get('Content-Type', '')
                if 'png'    in ctype: ext = '.png'
                elif 'gif'  in ctype: ext = '.gif'
                elif 'webp' in ctype: ext = '.webp'
                elif 'svg'  in ctype: ext = '.svg'
            except:
                pass
            file_name = f"image_{uuid4().hex[:8]}{ext}"

        # ローカル保存用ディレクトリを作成（階層を再現）
        if dir_part:
            local_dir = os.path.join(download_dir, dir_part)
        else:
            local_dir = download_dir
        os.makedirs(local_dir, exist_ok=True)

        # 画像をダウンロード＆保存
        try:
            img_resp = requests.get(img_url, headers=headers, stream=True)
            img_resp.raise_for_status()
            if not img_resp.headers.get('Content-Type', '').startswith('image/'):
                print(f"スキップ（画像でない）: {img_url}")
                continue

            file_path = os.path.join(local_dir, file_name)
            with open(file_path, 'wb') as f:
                for chunk in img_resp.iter_content(8192):
                    f.write(chunk)
            print(f"[{dir_part or '.'}] {file_name} を保存")
            download_count += 1

        except requests.RequestException as e:
            print(f"ダウンロード失敗 ({img_url}): {e}")

    print(f"合計 {download_count} 個の画像をダウンロードしました。")

def main():
    parser = argparse.ArgumentParser(
        description="指定ページの画像をディレクトリ構造を保ってまとめてダウンロード"
    )
    parser.add_argument(
        "url",
        nargs="?",
        help="画像をダウンロードするウェブページのURL"
    )
    parser.add_argument(
        "-o", "--output",
        nargs="?",
        help="保存先ディレクトリ (デフォルト: downloaded_images)",
        default=None
    )
    args = parser.parse_args()

    # 引数がなければ対話形式で入力を促す
    if not args.url:
        args.url = input("ダウンロードするページのURLを入力してください: ").strip()
    if not args.output:
        out = input("保存先ディレクトリを入力してください (デフォルト: downloaded_images): ").strip()
        args.output = out if out else "downloaded_images"

    download_images_from_page(args.url, args.output)

if __name__ == "__main__":
    main()
