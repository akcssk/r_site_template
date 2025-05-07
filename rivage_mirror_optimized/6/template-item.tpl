<section>
  <!-- ページ内容ここから ------------------------------------------------------------------>
  <link href="https://schole.sakura.ne.jp/css/contents.css" rel="stylesheet" type="text/css">
<style>
/* 数量 */
.p-product-form-stock {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: flex-end;
  margin-top: 20px;
  margin-bottom: 20px;
}
.p-product-form-stock__label {
  margin-right: 10px;
  font-weight: bold;
  color: #333;
}
.p-product-form-stock__input {
  display: flex;
  align-items: center;
}
.p-product-form-stock__input input {
  width: 60px;
  height: 40px;
  border: 1px solid #ced4da;
  border-radius: 4px;
  padding: 0 10px;
  font-size: 1em;
  text-align: center;
  background-color: #fff;
}
.p-product-form-stock__input input:focus {
  outline: none;
  border-color: #ad073b;
  box-shadow: 0 0 0 2px rgba(173, 7, 59, 0.25);
}
.p-product-form-stock__unit {
  margin-left: 10px;
  font-weight: bold;
  color: #495057;
}
.p-product-form-stock__stock {
  margin-left: 25px;
  color: #6c757d;
  font-size: 0.9em;
}
/* パンくずリスト */
.pan {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  margin-bottom: 20px;
  font-size: 0.9em;
}
.pan span {
  margin: 0 8px;
  color: #666;
}
.pan a {
  color: #ad073b;
  text-decoration: none;
}
.pan a:hover {
  text-decoration: underline;
}
/* ボタン */
.p-product-form-btn {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}
.p-product-form-btn__cart {
  width: 100%;
}
@media screen and (max-width: 1030px) {
  .p-product-form-btn__cart {
    flex: 1;
    width: auto;
  }
}
.p-product-form-btn__favorite {
  width: 50px;
}
.p-product-form-btn__favorite-btn {
  display: inline-block;
  margin-top: 22px;
  margin-left: 22px;
  padding: 0;
  border: 0;
  background: transparent;
  color: #d8d8d8;
  cursor: pointer;
  text-align: center;
  transition: all 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}
.p-product-form-btn__favorite-btn.is-added {
  color: #000000;
}
.p-product-form-btn__favorite-btn svg {
  width: 25px;
  height: 25px;
  fill: currentColor;
}
.p-product-form__error-message {
  color: #DB5656;
  margin-top: 15px;
}
/* カートボタン基本スタイル */
.c-btn-cart {
  display: block;
  text-align: center;
  border-radius: 10px;
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  padding: 20px 0;
  background: #ad073b;
  color: #ffffff;
  font-size: 1.2em;
  font-weight: bold;
  border: none;
  cursor: pointer;
  width: 100%;
  transition: all 0.3s ease;
}

.c-btn-cart:hover {
  background: #8a052f;
}

.c-btn-cart i {
  margin-right: 8px;
}
/* 会員限定商品のスタイル */
.c-btn-cart.is-membersonly {
  background-color: #f8d7da;
  color: #721c24;
  border: 1px solid #f5c6cb;
  padding: 12px 20px;
  font-weight: bold;
  text-align: center;
  border-radius: 4px;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  position: relative;
  overflow: hidden;
}

.c-btn-cart.is-membersonly i {
  margin-right: 8px;
  color: #721c24;
}
/* 会員限定商品のリンク */
.membersonly-links {
  margin-top: 10px;
  text-align: center;
  font-size: 0.9em;
}
.membersonly-links a {
  display: block;
  margin: 5px 0;
  color: #ad073b;
  text-decoration: underline;
}
.membersonly-links a:hover {
  text-decoration: none;
}
/* 在庫切れ商品のスタイル */
.c-btn-cart.is-soldout {
  background-color: #e2e3e5;
  color: #383d41;
  border: 1px solid #d6d8db;
  padding: 20px 0;
  font-weight: bold;
  text-align: center;
  border-radius: 10px;
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  font-size: 1.2em;
  cursor: not-allowed;
  opacity: 0.8;
}
/* ショップ休止中のスタイル */
.c-btn-cart.is-disabled {
  background-color: #e2e3e5;
  color: #383d41;
  border: 1px solid #d6d8db;
  padding: 20px 0;
  font-weight: bold;
  text-align: center;
  border-radius: 10px;
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  font-size: 1.2em;
  cursor: not-allowed;
  opacity: 0.8;
}
/* 商品名のスタイル */
.product-name {
  color: #ad073b;
  font-weight: bold;
  font-size: 1.2em;
  margin-bottom: 15px;
}
/* dtタグのスタイル */
.itemDetail>div dt {
  color: #ad073b;
  font-weight: bold;
  background: linear-gradient(to right, rgba(173, 7, 59, 0.1), rgba(173, 7, 59, 0.05));
  border-left: 4px solid #ad073b;
  padding: 8px 12px;
  margin-bottom: 10px;
  border-radius: 0 4px 4px 0;
  position: relative;
}
.itemDetail>div dt::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(to right, rgba(173, 7, 59, 0.1), transparent);
  z-index: -1;
}
</style>
  <div class="pan">
    <{if $bid_name != ""}>
      <a href="<{$bid_link}>"><{$bid_name}></a>
      <span>></span>
    <{/if}>
    <{if $sid_name != ""}>
      <a href="<{$sid_link}>"><{$sid_name}></a>
      <span>></span>
    <{/if}>
    <span><{$product.name}></span>
  </div>
  <br />
  <h3 class="mrgnB20 mrgnT10 product-name"><{$product.name}></h3>

  
  <div class="clearfix itemDetail">
    <p class="price">
      <{if !$product.soldout_flg}>
        <{if $members_login_flg && $product.discount_flg}>
          <strong><{$product.sales}> </strong>
          <span class="discount-rate"><{$product.discount_rate}>OFF</span>
          <span class="regular-price"><{$product.regular_price}></span>
        <{else}>
          <strong><{$product.sales}> </strong>
        <{/if}>
      <{else}>
        <span class="soldout">売り切れ</span>
      <{/if}>
    </p>
    <ul class="itemPhoto">
      <li><img alt="<{$product.name|escape:'html'}>" class="mrgnB15" height="750" src="<{$product.img_url}>" width="745" />
      </li>
      <li></li>
    </ul>
    <div class="itemImages">
    <ul class="column clearfix">
      <{if $product.ot1_url != ""}>
      <li>
        <a href="<{$product.ot1_url}>" target="_blank">
          <img alt="<{$product.name|escape:'html'}>" class="mrgnB15" height="750" src="<{$product.ot1_url}>" />
        </a>
      </li>
      <{/if}>
      <{if $product.ot2_url != ""}>
      <li>
        <a href="<{$product.ot2_url}>" target="_blank">
          <img alt="<{$product.name|escape:'html'}>" class="mrgnB15" height="750" src="<{$product.ot2_url}>" />
        </a>
      </li>
      <{/if}>
      <{if $product.ot3_url != ""}>
      <li>
        <a href="<{$product.ot3_url}>" target="_blank">
          <img alt="<{$product.name|escape:'html'}>" class="mrgnB15" height="750" src="<{$product.ot3_url}>" />
        </a>
      </li>
      <{/if}>
      <{if $product.ot4_url != ""}>
      <li>
        <a href="<{$product.ot4_url}>" target="_blank">
          <img alt="<{$product.name|escape:'html'}>" class="mrgnB15" height="750" src="<{$product.ot4_url}>" />
        </a>
      </li>
      <{/if}>
      <{if $product.ot5_url != ""}>
      <li>
        <a href="<{$product.ot5_url}>" target="_blank">
          <img alt="<{$product.name|escape:'html'}>" class="mrgnB15" height="750" src="<{$product.ot5_url}>" />
        </a>
      </li>
      <{/if}>
      <{if $product.ot6_url != ""}>
      <li>
        <a href="<{$product.ot6_url}>" target="_blank">
          <img alt="<{$product.name|escape:'html'}>" class="mrgnB15" height="750" src="<{$product.ot6_url}>" />
        </a>
      </li>
      <{/if}>
      <{if $product.ot7_url != ""}>
      <li>
        <a href="<{$product.ot7_url}>" target="_blank">
          <img alt="<{$product.name|escape:'html'}>" class="mrgnB15" height="750" src="<{$product.ot7_url}>" />
        </a>
      </li>
      <{/if}>
      <{if $product.ot8_url != ""}>
      <li>
        <a href="<{$product.ot8_url}>" target="_blank">
          <img alt="<{$product.name|escape:'html'}>" class="mrgnB15" height="750" src="<{$product.ot8_url}>" />
        </a>
      </li>
      <{/if}>
      <{if $product.ot9_url != ""}>
      <li>
        <a href="<{$product.ot9_url}>" target="_blank">
          <img alt="<{$product.name|escape:'html'}>" class="mrgnB15" height="750" src="<{$product.ot9_url}>" />
        </a>
      </li>
      <{/if}>
    </ul>
  </div>
    <div class="mrgnB30 mrgnT10">

      <div class="mrgnB10">
          <{$product.explain}>
      </div>
      <ul class="comment">
        <{if $product.simple_explain != ""}>
          <li><{$product.simple_explain}></li>
        <{/if}>
      </ul>

      <p class="price mrgnT10">
        <{if !$product.soldout_flg}>
          <{if $members_login_flg && $product.discount_flg}>
            <strong><{$product.sales}></strong>
            <span class="discount-rate"><{$product.discount_rate}>OFF</span>
            <span class="regular-price"><{$product.regular_price}></span>
          <{else}>
            <strong><{$product.sales}></strong>
          <{/if}>
        <{else}>
          <span class="soldout">売り切れ</span>
        <{/if}>
      </p>

    </div>
  </div>
  <p class="btnDetail clearBoth">
     <!-- 購入フォーム -->
     <div class="p-product-form">
     <{if !$shop_stop_flg && $product.soldout_flg == 0 && !$product.login_sale_flg}>
     <div class="p-product-form-stock">
       <span class="p-product-form-stock__label">購入個数:</span>
       <div class="p-product-form-stock__input">
         <input type="text" name="product_num" value="<{$product.init_num}>" />
         <span class="p-product-form-stock__unit"><{$product.unit}></span>
       </div>
       <{if $product.stock_disp}>
       <div class="p-product-form-stock__stock">
         在庫：<{$product.stock_str}>
       </div>
       <{/if}>
     </div>
     <{/if}>
     <div class="p-product-form-btn">
       <div class="p-product-form-btn__cart">
       <{if $product.soldout_flg == 0 && !$shop_stop_flg && !$product.login_sale_flg}>
         <{if $is_enable_async_cart_in_pc}>
           <button type="submit" class="c-btn-cart">
             <i class="c-icon-cart"></i>カートに入れる
           </button>
         <{else}>
           <div class="disable_cartin">
             <button class="c-btn-cart" type="submit">
               <i class="c-icon-cart"></i>カートに入れる
             </button>
           </div>
         <{/if}>
         <p class="p-product-form__error-message stock_error"></p>
         <{else}>
         <{if $product.soldout_flg}>
           <button class="c-btn-cart is-soldout" type="button" disabled="disabled">
             売り切れ
           </button>
         <{elseif $product.login_sale_flg}>
           <div class="c-btn-cart is-membersonly">
             <i class="c-icon-cart"></i>会員のみ購入できます
           </div>
           <div class="membersonly-links">
             <a href="/customer/login">会員の方はこちらからログイン</a>
             <a href="/customer/signup/new">会員でない方はこちらから登録</a>
           </div>
         <{/if}>
       <{/if}>
       <{if $shop_stop_flg}>
         <button class="c-btn-cart is-disabled" type="button" disabled="disabled">
           休止中
         </button>
       <{/if}>
       </div>
     </div><!-- /.p-product-form-btn -->
   </div><!-- /.p-product-form -->
   <!-- // 購入フォーム -->
  </p>

  <{if $product.password_field != ""}>
  <div class="password-field">
    <{$product.password_field}>
  </div>
  <{/if}>
  <!-- /ページ内容ここまで ------------------------------------------------------------------>
</section>
