<section>
  <link href="https://schole.sakura.ne.jp/css/contents.css" rel="stylesheet" type="text/css">
  <style>
    /* トップページ専用スタイル */
    .top-breadcrumb {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      margin-bottom: 20px;
      font-size: 0.9em;
    }
    .top-breadcrumb span {
      margin: 0 8px;
      color: #666;
    }
    .top-breadcrumb a {
      color: #ad073b;
      text-decoration: none;
    }
    .top-breadcrumb a:hover {
      text-decoration: underline;
    }
    
    .top-mainvisual {
      margin-bottom: 30px;
    }
    .top-mainvisual img {
      width: 100%;
      height: auto;
    }
    
    .top-gift-wrap {
      background-color: #fff;
      padding: 10px;
      margin-bottom: 30px;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    .top-gift-wrap h2 {
      color: #ad073b;
      font-size: 1.4em;
      margin-bottom: 15px;
      text-align: center;
    }
    .top-gift-wrap h3 {
      color: #333;
      font-size: 1.2em;
      margin-bottom: 15px;
      text-align: center;
    }
    .top-gift-wrap p {
      color: #555;
      line-height: 1.6;
      margin-bottom: 15px;
      padding: 0 20px;
    }
    
    
    .top-gift-wrap03 {
      margin-bottom: 30px;
      background-color: #f8f8f8;
      padding: 10px;
      border-radius: 5px;
    }
    .top-gift-wrap03 h5 {
      color: #ad073b;
      font-size: 1.1em;
      margin-bottom: 15px;
      text-align: center;
    }
    .top-gift-wrap03 ul {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      list-style: none;
      padding: 0;
      margin: 0;
    }
    .top-gift-wrap03 li {
      margin: 0 8px 8px;
    }
    .top-gift-wrap03 a {
      display: inline-block;
      padding: 6px 12px;
      background-color: #fff;
      color: #333;
      text-decoration: none;
      border-radius: 4px;
      font-size: 0.9em;
      border: 1px solid #ddd;
      transition: all 0.3s ease;
    }
    .top-gift-wrap03 a:hover {
      background-color: #ad073b;
      color: #fff;
      border-color: #ad073b;
    }
    
    .top-enter-wrap {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      margin-bottom: 30px;
    }
    .top-enter-wrap .enter,
    .top-enter-wrap .enter2 {
      width: 48%;
    }
    .top-enter-wrap img {
      width: 100%;
      height: auto;
      border-radius: 5px;
    }
    
    .top-banner {
      margin-bottom: 30px;
    }
    .top-banner img {
      width: 100%;
      height: auto;
      border-radius: 5px;
    }
    
    .top-recommend {
      margin-bottom: 30px;
    }
    .top-recommend h2 {
      color: #ad073b;
      font-size: 1.2em;
      margin-bottom: 15px;
      text-align: center;
    }
    .top-recommend p {
      text-align: center;
      margin-bottom: 20px;
      color: #666;
    }
    
    .top-item {
      border: 1px solid #eee;
      padding: 10px;
      margin-bottom: 20px;
      border-radius: 5px;
      transition: all 0.3s ease;
    }
    .top-item:hover {
      box-shadow: 0 3px 10px rgba(0,0,0,0.1);
    }
    .top-item .pic {
      text-align: center;
      margin-bottom: 10px;
    }
    .top-item .pic img {
      max-width: 100%;
      height: auto;
    }
    .top-item .name {
      font-weight: bold;
      margin-bottom: 10px;
      color: #333;
    }
    .top-item .price {
      color: #ad073b;
      font-weight: bold;
      margin-bottom: 10px;
    }
    .top-item .btn {
      text-align: center;
    }
    .top-item .btn img {
      max-width: 100%;
      height: auto;
    }
    
    @media screen and (max-width: 767px) {
      .top-enter-wrap .enter,
      .top-enter-wrap .enter2 {
        width: 100%;
        margin-bottom: 15px;
      }
      
      .top-gift-wrap03 ul {
        flex-direction: column;
        align-items: center;
      }
      
      .top-gift-wrap03 li {
        width: 100%;
        margin: 0 0 10px;
      }
      
      .top-gift-wrap03 a {
        display: block;
        width: 100%;
        text-align: center;
        padding: 12px;
        font-size: 1em;
      }
    }

    /* 追加スタイル */
    .page-title {
      color: #ad073b;
      font-size: 1.6em;
      margin: 20px 0 15px;
      text-align: center;
      position: relative;
      padding-bottom: 15px;
    }
    .page-title:after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
      width: 60px;
      height: 3px;
      background-color: #ad073b;
    }
    .page-description {
      color: #ad073b;
      font-size: 1.2em;
      margin: 0 0 30px;
      text-align: center;
      line-height: 1.6;
      font-family: "游明朝", YuMincho, "Hiragino Mincho ProN", HGS明朝E, serif;
      padding: 15px 20px;
      border-left: none;
      font-weight: bold;
      letter-spacing: 0.05em;
    }
  </style>


  <h3 class="page-title">スイーツ・ケーキのお取り寄せ・ギフト通販</h3>
  
  <h4 class="page-description">全国地方発送承ります<br />──ふるさと堺より大切なあの方へ──<br />真心を添えてリバージュの贈り物をどうぞ</h4>

  <div class="top-gift-wrap">
    
    <h5>人気のバームクーヘンから焼き菓子まで</h5>
    <p>小さなお子様がいてなかなか足を運べない…、店が遠くて…<br />
    そんなお客様のお声のお応えして、ネットショッピングをご案内しています。<br />
    全国にお届けできますので、ご自宅用のお取り寄せはもちろん、お友達や、ご家族への贈り物にも是非ご利用下さい。</p>
  </div>

  <div class="top-gift-wrap">
    <h5>熨斗紙サービスもご用意しております。</h5>
    <p>贈答用などのご利用のお客様には、熨斗紙サービスもご用意しております。 <br />
    ご希望の方はお支払い方法・お届け先入力画面の【その他ご要望】にご記入いただくか、お電話にてお気軽にお問い合わせください。</p>
  </div>

  <div class="top-gift-wrap03">
    <ul>
      <li><a href="https://secure.shop-pro.jp/?mode=myaccount&shop_id=PA01073838">マイアカウント</a></li>
      <li><a href="/?tid=1&mode=f1">ご注文方法</a></li>
      <li><a href="/?mode=sk">特定商取引法に基づく表示</a></li>
      <li><a href="/?mode=privacy">個人情報の取扱いについて</a></li>
      <li><a href="https://schole.sakura.ne.jp/form" target="_blank" rel="noopener">お問合せ</a></li>
    </ul>
  </div>

  <div class="top-enter-wrap">
    <div class="enter">
      <a href="?mode=cate&cbid=2712567&csid=0">
        <img src="https://img13.shop-pro.jp/PA01073/838/etc/2021.9.16%C5%B9%C6%AC%BC%F5%BC%E8%B8%C2%C4%EA%A4%CF%A4%B3%A4%C1%A4%E9%C2%D3%A4%A2%A4%EA.jpg?cmsp_timestamp=20210916135538" alt="店舗受け取りのスイーツ" />
      </a>
    </div>
    
    <div class="enter2">
      <a href="?mode=grp&gid=2589164">
        <img src="https://img13.shop-pro.jp/PA01073/838/etc/2021.9.16%A4%AA%BC%E8%A4%EA%B4%F3%A4%BB%A4%CF%A4%B3%A4%C1%A4%E9%C2%D3%A4%A2%A4%EA.jpg?cmsp_timestamp=20210916135843" alt="お取り寄せスイーツ・焼菓子"/>
      </a>
    </div>
  </div>

  <div class="top-banner">
    <a href="?mode=f3"><img src="https://img13.shop-pro.jp/PA01073/838/etc/%A4%AA%A4%AA%A4%AD%A4%CB%A5%C8%A5%C3%A5%D1%A5%AF%A5%AC%A5%F3.jpg?cmsp_timestamp=20210921121946" alt="しっとりバームクーヘンの焼き菓子/ スイーツお取り寄せ"></a>
  </div>

  <div class="top-banner">
    <a href="?pid=13983030"><img src="https://img13.shop-pro.jp/PA01073/838/etc/%A5%D1%A5%A6%A5%F3%A5%C9%A5%C8%A5%C3%A5%D1.jpg?cmsp_timestamp=20210921122212" alt="選べる人気のパウンド ケーキ 詰め合わせ/ スイーツお取り寄せ"></a>
  </div>

  <!-- 3列バナー -->
  <div class="prodList">
    <div class="top-item">
      <a href="?pid=93174954">
        <div class="pic">
          <img src="https://img13.shop-pro.jp/PA01073/838/product/93174954_o1.jpg?cmsp_timestamp=20220213143410" alt="リバージュプリン [6個入] セット スイーツ 通販"/>
        </div>
        <p class="name">リバージュ プリン [6個入] セット</p>
      </a>
    </div>

    <div class="top-item">
      <a href="?pid=113364972">
        <div class="pic">
          <img src="https://img13.shop-pro.jp/PA01073/838/product/113364972.jpg?cmsp_timestamp=20220213132930" alt="堺 ふるさとお菓子衆 3300円セット お取り寄せスイーツ・焼菓子"/>
        </div>
        <p class="name">堺 ふるさとお菓子衆 セット</p>
      </a>
    </div>
    
    <div class="top-item">
      <a href="?pid=13982695">
        <div class="pic">
          <img src="https://img13.shop-pro.jp/PA01073/838/product/13982695_o1.jpg?cmsp_timestamp=20220213142233" alt="晶子の里＆りんごのパイセット お取り寄せスイーツ・焼菓子"/>
        </div>
        <p class="name">晶子の里＆りんごのパイ ギフトセット</p>
      </a>
    </div>
  </div>
  <!-- 3列バナーここまで -->

  <div class="top-banner">
    <a href="?pid=13977347"><img src="https://schole.sakura.ne.jp/sweets/baum/img/pic09.png" alt="アップルクーヘンの焼き菓子/ スイーツお取り寄せ"></a>
  </div>

  <div class="top-enter-wrap">
    <div class="enter">
      <a href="?mode=cate&cbid=2712567&csid=0">
        <img src="https://img13.shop-pro.jp/PA01073/838/etc/2021.9.16%C5%B9%C6%AC%BC%F5%BC%E8%B8%C2%C4%EA%A4%CF%A4%B3%A4%C1%A4%E9%C2%D3%A4%A2%A4%EA.jpg?cmsp_timestamp=20210916135538" alt="店舗受け取りのスイーツ" />
      </a>
    </div>
    
    <div class="enter2">
      <a href="?mode=grp&gid=2589164">
        <img src="https://img13.shop-pro.jp/PA01073/838/etc/2021.9.16%A4%AA%BC%E8%A4%EA%B4%F3%A4%BB%A4%CF%A4%B3%A4%C1%A4%E9%C2%D3%A4%A2%A4%EA.jpg?cmsp_timestamp=20210916135843" alt="お取り寄せスイーツ・焼菓子"/>
      </a>
    </div>
  </div>

  <div class="top-gift-wrap04">
    <h4>おすすめのお取り寄せスイーツ｜WEB SHOPPING ITEM LIST</h4>
    <p>各商品の写真をクリックすると、詳細情報・お買い物かごが表示されます。</p>
    <div class="prodList">
      <{if $recommend_num != 0}>
      <!-- おすすめ商品一覧 -->
      <{section name=num loop=$recommend}>
      <div class="top-item">
        <div class="pic">
          <{if $recommend[num].img_url != ""}>
            <a href="<{$recommend[num].link_url}>"><img src="<{$recommend[num].img_url}>" /></a>
          <{else}>
            <a href="<{$recommend[num].link_url}>"><img src="https://img.shop-pro.jp/tmpl_img/24/noimg.gif" /></a>
          <{/if}>
        </div>
        <p class="name">
          <a href="<{$recommend[num].link_url}>"><{$recommend[num].name}></a>
        </p>
        <p class="price">
          <{if $members_login_flg == true && $recommend[num].discount_flg == true}>
          <!-- 通常販売価格 -->
          <{$recommend[num].regular_price}><br />
          <{/if}>
          <!-- 販売価格 -->
          <{$recommend[num].price}>
        </p>
        <div class="btn">
          <a href="<{$recommend[num].link_url}>"><img src="https://img13.shop-pro.jp/PA01073/838/etc/shopbtn.png" alt="詳細情報・ご購入はこちら" title="詳細情報・ご購入はこちら" /></a>
        </div>
      </div>
      <{/section}>
      <{/if}>
      <!--// おすすめ商品一覧 -->
      <!-- 売れ筋商品一覧 -->
      <{if $seller_num != 0}>
      <{section name=num loop=$seller}>
      <div class="top-item">
        <div class="pic">
          <{if $seller[num].img_url != ""}>
            <a href="<{$seller[num].link_url}>"><img src="<{$seller[num].img_url}>"></a>
          <{else}>
            <a href="<{$seller[num].link_url}>"><img src="https://img.shop-pro.jp/tmpl_img/24/noimg.gif" /></a>
          <{/if}>
        </div>
        <p class="name">
          <a href="<{$seller[num].link_url}>"><{$seller[num].name}></a>
        </p>
        <p class="price">
          <{if $members_login_flg == true && $seller[num].discount_flg == true}>
          <!-- 通常販売価格 -->
          <{$seller[num].regular_price}><br />
          <{/if}>
          <!-- 販売価格 -->
          <{$seller[num].price}>
        </p>
        <div class="btn">
          <a href="<{$seller[num].link_url}>"><img src="https://img13.shop-pro.jp/PA01073/838/etc/shopbtn.png" alt="詳細情報・ご購入はこちら" title="詳細情報・ご購入はこちら" /></a>
        </div>
      </div>
      <{/section}>
      <{/if}>
      <!--// 売れ筋商品一覧 -->
    </div>
  </div>
</section>