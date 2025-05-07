<ol id="TopicPath">
	<li id="TopPage">
		<a href="https://cake-rivage.shop-pro.jp/">スイーツ・ケーキのお取り寄せ・ギフト通販のTOP</a>
	</li>
	<li>特定商取引法に基づく表記</li>
</ol>

<style>
/* パンくずリスト */
ol#TopicPath {
	display: flex;
	flex-wrap: wrap;
	list-style: none;
	padding: 0;
	margin: 0 0 20px 0;
	font-size: 0.9em;
}
ol#TopicPath li {
	margin-right: 5px;
}
ol#TopicPath li:not(:last-child)::after {
	content: ">";
	margin-left: 5px;
	color: #666;
}
ol#TopicPath li a {
	color: #ad073b;
	text-decoration: none;
}
ol#TopicPath li a:hover {
	text-decoration: underline;
}

/* テーブルスタイル */
.commerce-table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 30px;
}
.commerce-table th,
.commerce-table td {
	padding: 15px;
	border: 1px solid #ddd;
	vertical-align: top;
}
.commerce-table th {
	width: 30%;
	background-color: #f8f8f8;
	font-weight: bold;
	text-align: left;
}
.commerce-table td {
	width: 70%;
}
@media screen and (max-width: 768px) {
	.commerce-table th,
	.commerce-table td {
		display: block;
		width: 100%;
		box-sizing: border-box;
	}
	.commerce-table th {
		background-color: #f8f8f8;
		border-bottom: none;
	}
	.commerce-table td {
		border-top: none;
	}
}

/* 支払い方法と配送料のスタイル */
.payment-method {
	margin-top: 30px;
}
.payment-method h3 {
	margin-bottom: 20px;
	font-size: 1.2em;
	color: #333;
}
.payment-method .notice {
	color: #ff0613;
	font-weight: bold;
	margin-bottom: 15px;
}
.payment-method .description {
	margin-bottom: 20px;
}
.payment-method .wrap,
.payment-method .wrap2 {
	margin-bottom: 25px;
	border: 1px solid #ddd;
	border-radius: 5px;
	overflow: hidden;
}
.payment-method dt {
	background-color: #f8f8f8;
	padding: 12px 15px;
	font-weight: bold;
	border-bottom: 1px solid #ddd;
}
.payment-method dd {
	padding: 15px;
}
.payment-method dd p {
	margin-bottom: 10px;
}
.payment-method dd p:last-child {
	margin-bottom: 0;
}
.payment-method dd ul {
	margin: 10px 0;
	padding-left: 20px;
}
.payment-method dd ul li {
	margin-bottom: 5px;
}

.delivery-info {
	margin-top: 30px;
}
.delivery-info h3 {
	margin-bottom: 20px;
	font-size: 1.2em;
	color: #333;
}
.delivery-info p {
	margin-bottom: 10px;
}
.delivery-info a {
	color: #ad073b;
	text-decoration: none;
}
.delivery-info a:hover {
	text-decoration: underline;
}

.footer-links {
	margin-top: 30px;
	margin-bottom: 30px;
}
.footer-links ul {
	display: flex;
	flex-wrap: wrap;
	list-style: none;
	padding: 0;
	margin: 0;
}
.footer-links li {
	margin-right: 20px;
}
.footer-links a {
	color: #ad073b;
	text-decoration: none;
}
.footer-links a:hover {
	text-decoration: underline;
}
</style>

<div class="" id=""> 
	<h3>特定商取引法に基づく表記 | スイーツ・ケーキのお取り寄せ・ギフト通販 | ケーキハウス - リバージュ</h3>

	<table class="commerce-table">
		<tr>
			<th>販売業者</th>
			<td><{ $shop.shop_name }></td>
		</tr>
		<tr>
			<th>運営統括責任者</th>
			<td><{ $shop.manager_name }></td>
		</tr>
		<tr>
			<th>本社所在地（本店）</th>
			<td><{ $shop.postal }>　<{ $shop.address }></td>
		</tr>
		<tr>
			<th>店舗名</th>
			<td><{ $shop.service_name }></td>
		</tr>
		<tr>
			<th>電話番号/FAX番号</th>
			<td><{ $shop.tel }></td>
		</tr>
		<tr>
			<th>メールアドレス</th>
			<td><{ $shop.email }></td>
		</tr>
		<tr>
			<th>販売価格</th>
			<td>各商品に明記。店頭価格と同一。</td>
		</tr>
		<tr>
			<th>販売数量</th>
			<td><{ $sales_num }></td>
		</tr>
		<tr>
			<th>商品代金以外の必要料金</th>
			<td><{ $shop.price }></td>
		</tr>
		<tr>
			<th>申し込みの有効期限</th>
			<td><{ $shop.apply_limit }></td>
		</tr>
		<tr>
			<th>引渡し時期</th>
			<td><{ $shop.delivery_time }></td>
		</tr>
		<tr>
			<th>お支払い方法</th>
			<td><{ $shop.payment_way }></td>
		</tr>
		<tr>
			<th>お支払い時期</th>
			<td><{ $payment_limit }></td>
		</tr>
		<tr>
			<th>返品・交換について</th>
			<td>生ものにつき返品はご容赦ください。<br />
				商品の不具合による返品のみ対応させていただきます。（送料は弊社の負担）</td>
		</tr>
		<tr>
			<th>返品期限</th>
			<td><{ $shop.return_limit }></td>
		</tr>
		<tr>
			<th>返品送料</th>
			<td><{ $shop.return_price }></td>
		</tr>
	</table>
</div>


<div class="guidewrap2 payment-method" id="payment">
	<h3>お支払い方法</h3>

	<div class="description">
		<p class="notice">※店頭引き取りは、「 クレジットカード 」のみのお支払いとなります<br>
		店頭引き取りは会員限定サービスとなります(商品代金(税込)のみ、送料は無料)<br><br></p>
		<p>お支払い代金は、（ 商品代金(税込) ) ＋ ( 配送料金(税込) ) ＝ ご請求金額　となります。</p>
		<p>お支払い方法は下記の内容になります。その他の方法はご利用できませんのでご理解下さいませ。</p>
	</div>

	<dl class="wrap">
		<dt>代金引換</dt>
		<dd>
			<p><strong>商品到着時に、宅急便のドライバーに商品と引換に現金でお支払いください。</strong> </p>
			<p>お届け先がご自宅の場合は代金引換をご利用いただけますが、御依頼主とお届け先が異なる場合はご利用頂けません。<br />
			下記の代引手数料はお客様ご負担になります。<br />
			※　1万円未満＝330円、1万円～3万円＝440円、3万円～10万円＝660円 </p>
		</dd>
	</dl>

	<dl class="wrap2">
		<dt>郵便振替</dt>
		<dd>
			<p><strong>当店ご指定の口座にお支払いください。</strong></p>
			<p>郵便振替の払い込み用紙到着後、7日以内にお振込お願いいたします。<br />
			<strong style="font-weight: bold; color: #cc0000;">尚、土日、祝日は入金確認が出来ませんので、配達日時指定日に添えないこともございます。ご理解くださいませ。</strong><br />
			※お振込手数料は当社が負担いたします。 </p>
			<p><strong>
			※先に郵便局備え付けの郵便振替の払い込み用紙をお送りいたしますので必要事項をご確認のうえ、代金を払い込んでください。入金確認後、商品を発送いたします。 <br />
			また確認に1週間程のお時間を頂きますのでご了承くださいませ。</strong></p>
			<ul>
				<li>払込先 口座番号 009308-38440<br />
				加入者名 株式会社　マツヒサ　リバージュ </li>
			</ul>
		</dd>
	</dl>
	<dl class="wrap2">
		<dt>クレジットカード</dt>
		<dd>
			<{section name=num loop=$sk_payment}>
					<{if $sk_payment[num].img_url != "" }>
						<img src="<{$sk_payment[num].img_url}>" /><br />
					<{/if}>
					<{if $sk_payment[num].card_img != "" }>
						<{$sk_payment[num].card_img}><br />
					<{/if}>
					<{$sk_payment[num].other}>&nbsp;
			<{/section}>
		</dd>
	</dl>

</div>


<div class="guidewrap3 delivery-info" id="delivery">
	<h3>配送・送料について</h3>
	<div>
		<p>配送料金は、都道府県により異なります。</p>
    <p><a href="https://img13.shop-pro.jp/PA01073/838/etc_base64/MjAyNDA0X8H3zsE.jpg?cmsp_timestamp=20240426122241" target="_blank">&gt;&gt;都道府県別配送料はこちら </a></p>
		<p>※夏期（5月頃～9月頃）はクール便利用のため、配送料金は送料＋250円(税込275円)となります。</p>
	</div>
</div>

<div class="footer-links">
	<div>
		<ul class="ClearFix">
			<li><a href="https://cake-rivage.shop-pro.jp/?tid=1&mode=f1">&gt;ご注文の流れ</a></li>
			<li><a href="https://cake-rivage.shop-pro.jp/?mode=privacy">&gt;個人情報の取扱いについて</a></li>
		</ul>
	</div>
</div>