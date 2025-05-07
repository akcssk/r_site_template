#!/usr/bin/env python3
import requests
from bs4 import BeautifulSoup
import csv
import re
import jaconv  # pip install jaconv
from datetime import datetime

# 移行対象のURLリスト
urls = [
    'https://www.rivage.jp/news/227.html',
    'https://www.rivage.jp/news/225.html',
    'https://www.rivage.jp/news/230.html',
    'https://www.rivage.jp/news/229.html',
    'https://www.rivage.jp/news/228.html',
    'https://www.rivage.jp/news/58.html',
    'https://www.rivage.jp/news/221.html',
    'https://www.rivage.jp/news/191.html',
    'https://www.rivage.jp/news/142.html',
    'https://www.rivage.jp/news/201.html',
    'https://www.rivage.jp/news/208.html',
    'https://www.rivage.jp/news/188.html',
    'https://www.rivage.jp/news/181.html',
    'https://www.rivage.jp/news/118.html',
    'https://www.rivage.jp/news/107.html',
]

with open('rivage_news.csv', 'w', newline='', encoding='utf-8') as f:
    writer = csv.DictWriter(f, fieldnames=[
        'post_title','post_name','post_date','post_status',
        'post_author','post_category','post_excerpt',
        'post_content','custom_field_original_id'
    ])
    writer.writeheader()

    for url in urls:
        # ページをバイトで取得
        try:
            res = requests.get(url)
            res.raise_for_status()
        except requests.exceptions.RequestException as e:
            print(f"Error fetching {url}: {e}")
            continue

        # CP932 (Windows-31J) でパースして絵文字を含む全ての文字を取得
        soup = BeautifulSoup(res.content, 'html.parser', from_encoding='cp932')

        # ニュース一覧の <ul class="news">
        news_ul = soup.select_one('ul.news')
        if not news_ul:
            print(f"Skip {url}: <ul class=\"news\"> not found")
            continue

        # 子 li 要素を順番に取得
        items = news_ul.find_all('li', recursive=False)
        if not items:
            print(f"Skip {url}: news items not found")
            continue

        # ① 日付＋タイトルの li
        head_li = items[0]
        strings = list(head_li.stripped_strings)
        # 例: ['2025/04/15', 'お知らせ', '5/5 (日・祝) こどもの日ケー予約承ります🎏']
        if len(strings) < 2:
            print(f"Skip {url}: cannot parse date/title")
            continue

        date_text  = strings[0]            # 'YYYY/MM/DD'
        title_text = strings[-1]           # 最後の文字列をタイトルとする

        # 日付をパース（失敗したら今日の日付）
        try:
            dt = datetime.strptime(date_text, '%Y/%m/%d')
            post_date = dt.strftime('%Y-%m-%d 00:00:00')
        except ValueError:
            post_date = datetime.now().strftime('%Y-%m-%d 00:00:00')

        # スラッグ生成
        raw_slug = jaconv.kana2alphabet(title_text)
        slug = re.sub(r'[^a-z0-9]+', '-', raw_slug.lower()).strip('-')

        # ② 本文 li.newsTxt
        content_li = next((li for li in items if 'newsTxt' in (li.get('class') or [])), None)
        # 抜粋
        excerpt = ''
        if content_li:
            excerpt_tag = content_li.select_one('p')
            excerpt = excerpt_tag.get_text(strip=True) if excerpt_tag else ''
        # 本文HTML
        content_html = str(content_li) if content_li else ''

        # 元サイトID
        m = re.search(r'/news/(\d+)\.html$', url)
        original_id = m.group(1) if m else ''

        writer.writerow({
            'post_title': title_text,
            'post_name': slug,
            'post_date': post_date,
            'post_status': 'publish',
            'post_author': 'admin',
            'post_category': 'news',
            'post_excerpt': excerpt,
            'post_content': content_html,
            'custom_field_original_id': original_id,
        })

print("CSV出力が完了しました: rivage_news.csv")
