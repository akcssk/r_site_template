<script src="https://img.shop-pro.jp/tmpl_js/86/jquery.tile.js"></script>
<script src="https://img.shop-pro.jp/tmpl_js/86/jquery.skOuterClick.js"></script>

<!-- ヘッダー -->
<div class="l-header">
  <div class="l-header-main u-container">
    <div class="l-header-main__in">
      <div class="l-header-logo">
        <h1 class="l-header-logo__img<{if $logo_type !== "image"}> class="is-txt"<{/if}>">
          <a<{if $logo_type !== "image"}> class="l-header-logo__type-txt"<{/if}> href="<{$home_url}>"><{$logo}></a>
        </h1>
        <{if $logo_type == "image"}>
          <p class="l-header-logo__txt">
            <{$shop_name}>
          </p>
        <{/if}>
      </div>
      <div class="l-header-search">
        <button class="l-header-search__btn js-mega-menu-btn js-search-btn">
          <img src="https://img.shop-pro.jp/tmpl_img/86/icon-search.png" alt="検索" />
        </button>
        <div class="l-header-search__contents js-mega-menu-contents">
          <div class="l-header-search__box">
            <form action="<{$product_search_url}>" method="GET" class="l-header-search__form">
              <{$product_search_mode}>
              <div class="l-header-search__input">
                <input type="text" name="keyword" placeholder="商品検索" />
              </div>
              <button class="l-header-search__submit" type="submit">
                <img src="https://img.shop-pro.jp/tmpl_img/86/icon-search.png" alt="送信" />
              </button>
            </form>
            <button class="l-header-search__close js-search-close" type="submit" aria-label="閉じる">
              <span></span>
              <span></span>
            </button>
          </div>
        </div>
        <div class="l-header-cart">
          <a href="<{$view_cart_url}>">
            <img src="https://img.shop-pro.jp/tmpl_img/86/icon-cart.png" alt="カートを見る" />
            <span class="p-global-header__cart-count">
              <{$incart_total_count}>
            </span>
          </a>
        </div>
      </div>
      <button class="l-menu-btn js-navi-open" aria-label="メニュー">
        <span></span>
        <span></span>
      </button>
    </div><!-- /.l-header-main-top -->
    <div class="l-main-navi">
      <div class="l-main-navi__in">
        <ul class="l-main-navi-list">
          <{section name=num loop=$category}>
          <{if $smarty.section.num.first }>
          <li class="l-main-navi-list__item">
            <div class="l-main-navi-list__ttl">
              CATEGORY
            </div>
            <button class="l-main-navi-list__link js-mega-menu-btn">
              CATEGORY
            </button>
            <div class="l-mega-menu js-mega-menu-contents">
              <ul class="l-mega-menu-list">
                <{/if}>
                <li class="l-mega-menu-list__item">
                  <a class="l-mega-menu-list__link" href="<{$category[num].link_url}>">
                    <{$category[num].name}>
                  </a>
                </li>
                <{if $smarty.section.num.last }>
              </ul>
            </div><!-- /.l-mega-menu -->
          </li>
          <{/if}>
          <{/section}>
          <{section name=num loop=$group}>
          <{if $smarty.section.num.first }>
          <li class="l-main-navi-list__item">
            <div class="l-main-navi-list__ttl">
              GROUP
            </div>
            <button class="l-main-navi-list__link js-mega-menu-btn">
              GROUP
            </button>
            <div class="l-mega-menu js-mega-menu-contents">
              <ul class="l-mega-menu-list">
                <{/if}>
                <li class="l-mega-menu-list__item">
                  <a class="l-mega-menu-list__link" href="<{$group[num].link_url}>">
                    <{$group[num].name}>
                  </a>
                </li>
                <{if $smarty.section.num.last }>
              </ul>
            </div><!-- /.l-mega-menu -->
          </li>
          <{/if}>
          <{/section}>
          <{if $free_area_flg}>
          <li class="l-main-navi-list__item">
            <div class="l-main-navi-list__ttl">
              CONTENTS
            </div>
            <button class="l-main-navi-list__link js-mega-menu-btn">
              CONTENTS
            </button>
            <div class="l-mega-menu js-mega-menu-contents">
              <ul class="l-mega-menu-list">
                <{section name=num loop=$freepage}>
                <li class="l-mega-menu-list__item">
                  <a class="l-mega-menu-list__link" href="<{$freepage[num].link_url}>">
                    <{$freepage[num].page_title}>
                  </a>
                </li>
                <{/section}>
              </ul>
            </div><!-- /.l-mega-menu -->
          </li>
          <{/if}>
        </ul>
        <div class="l-help-navi-box">
          <ul class="l-help-navi-list">
            <li class="l-help-navi-list__item">
              <a class="l-help-navi-list__link" href="<{$view_myaccount_url}>">マイアカウント</a>
            </li>
            <{if $members_use_flg == true}>
              <{if $members_login_flg == false}>
                <{if $members_register_flg == true}>
                  <li class="l-help-navi-list__item">
                    <a class="l-help-navi-list__link" href="<{$members_regi_url}>">新規会員登録</a>
                  </li>
                <{/if}>
                <li class="l-help-navi-list__item">
                  <a class="l-help-navi-list__link" href="<{$members_login_url}>">ログイン</a>
                </li>
              <{else}>
                <li class="l-help-navi-list__item">
                  <a class="l-help-navi-list__link" href="<{$members_login_url}>">ログアウト</a>
                </li>
              <{/if}>
            <{/if}>
          </ul>
          <{if $instagram_url || $facebook_url || $twitter_url || $youtube_url}>
          <ul class="l-sns-navi-list u-opa">
            <{if $instagram_url}>
            <li class="l-sns-navi-list__item">
              <a href="<{$instagram_url}>" target="_blank">
                <i class="icon-lg-b icon-instagram" aria-label="instagram"></i>
              </a>
            </li>
            <{/if}>
            <{if $facebook_url}>
            <li class="l-sns-navi-list__item">
              <a href="<{$facebook_url}>" target="_blank">
                <i class="icon-lg-b icon-facebook" aria-label="Facebook"></i>
              </a>
            </li>
            <{/if}>
            <{if $twitter_url}>
            <li class="l-sns-navi-list__item">
              <a href="<{$twitter_url}>" target="_blank">
                <i class="icon-lg-b icon-twitter" aria-label="Twitter"></i>
              </a>
            </li>
            <{/if}>
            <{if $youtube_url}>
            <li class="l-sns-navi-list__item">
              <a href="<{$youtube_url}>" target="_blank">
                <i class="icon-lg-b icon-video" aria-label="Youtube"></i>
              </a>
            </li>
            <{/if}>
            <!-- <li class="l-sns-navi-list__item">
              <a href="" target="_blank">
                <i class="icon-lg-b icon-pinterest" aria-label="pinterest"></i>
              </a>
            </li> -->
          </ul>
          <{/if}>
        </div>
      </div><!-- /.l-main-navi__in -->
    </div><!-- /.l-main-navi -->
    <div class="l-main-navi-overlay js-navi-close"></div>
  </div><!-- /.l-header-main -->
</div><!-- /.l-header -->
<!-- メインコンテンツ -->
<{if $tpl_name|truncate:4:"" == "free"}>
<div class="l-main u-container <{$tpl_name}>">
  <div class="c-breadcrumbs">
    <ul class="c-breadcrumbs-list">
      <li class="c-breadcrumbs-list__item">
        <a class="c-breadcrumbs-list__link" href="<{$home_url}>">ホーム</a>
      </li>
      <li class="c-breadcrumbs-list__item">
        <{$current_freepage_title}>
      </li>
    </ul>
  </div>
  <div class="u-contents">
    <{include file = $file_name}>
  </div>
</div>
<{else}>
<div class="l-main <{$tpl_name}>">
  <{include file = $file_name}>
</div>
<{/if}>
<!-- ボトム -->
<div class="l-bottom u-container">
  <{* 最近チェックした商品 *}>
  <{if $history_num != 0}>
  <div class="p-checked u-contents-s">
    <h2 class="c-ttl-main">
      CHECKED ITEMS
      <span class="c-ttl-main__ja">最近チェックした商品</span>
    </h2>
    <div class="u-overflow-slide">
      <ul class="c-favorite-list">
        <{section name=num loop=$history}>
        <li class="c-favorite-list__item">
          <div class="c-favorite-list__img">
            <a class="u-img-scale" href="<{$history[num].link_url}>">
              <{if $history[num].img_url != ""}>
              <img src="<{$history[num].img_url}>" alt="<{$history[num].name|escape:'html'}>" />
              <{else}>
              <img src="https://img.shop-pro.jp/tmpl_img/86/no-image.jpg" alt="<{$history[num].name|escape:'html'}>" />
              <{/if}>
            </a>
          </div>
          <div class="c-favorite-list__txt">
            <{if !$history[num].soldout_flg}>
            <div class="c-favorite-list__price<{if $members_login_flg && $history[num].discount_flg}> is-discount<{/if}>">
              <{* 販売価格（ログイン時は会員価格） *}>
              <{$history[num].price}>
              <{* 割引率（ログイン時、通常販売価格と会員価格が異なる場合のみ） *}>
              <{if $members_login_flg && $history[num].discount_flg}><{$history[num].discount_rate}>OFF<{/if}>
            </div>
            <{* 通常販売価格（ログイン時、通常販売価格と会員価格が異なる場合のみ） *}>
            <{if $members_login_flg && $history[num].discount_flg}>
            <div class="c-favorite-list__price is-strikethrough">
              <{$history[num].regular_price}>
            </div>
            <{/if}>
            <{else}>
            <{* 売り切れの表記 *}>
            <div class="c-favorite-list__price is-soldout">
              SOLD OUT
            </div>
            <{/if}>
          </div>
        </li>
        <{/section}>
      </ul>
    </div>
  </div><!-- /.p-checked -->
  <{/if}>
  <{* // 最近チェックした商品 *}>
  <div class="p-shop-info">
    <!-- 店長からのメッセージ -->
    <{if $manager_name != "" && $manager_memo != ""}>
    <div class="u-contents-s">
      <div class="p-staff">
        <h2 class="c-ttl-sub">
          MESSAGE FROM STAFF
          <span class="c-ttl-sub__ja">店長からのメッセージ</span>
        </h2>
        <div class="p-staff-box">
          <{if $manager_img != ""}>
          <div class="p-staff__img">
            <img src="<{$manager_img}>" alt="<{$manager_name|escape:'html'}>" />
            <div class="p-staff__img-name">
              <{$manager_name}>
            </div>
          </div>
          <{else}>
          <div class="u-bold">
            <{$manager_name}>
          </div>
          <{/if}>
          <{$manager_memo}>
        </div>
      </div><!-- /.p-staff -->
    </div>
    <{/if}>
    <!-- //店長からのメッセージ -->
    <!-- カレンダー -->
    <{if $calendar != ""}>
    <div class="u-contents-s">
      <div class="p-calendar">
        <h2 class="c-ttl-sub">
          CALENDAR
          <span class="c-ttl-sub__ja">カレンダー</span>
        </h2>
        <div class="side_section side_section_cal">
          <div class="side_cal">
            <{$calendar}>
          </div>
          <{if $calendar_memo != ""}>
          <div class="side_cal_memo">
            <{$calendar_memo}>
          </div>
          <{/if}>
        </div>
      </div><!-- /.p-calendar -->
    </div>
    <{/if}>
    <!-- //カレンダー -->
  </div><!-- /.p-shop-info -->
  <div class="p-shopguide u-contents-s">
    <h2 class="u-visually-hidden">
      ショッピングガイド
    </h2>
    <div class="p-shopguide-wrap">
      <{if $sk_delivery != ""}>
      <div class="p-shopguide-column">
        <div class="p-shopguide-box js-matchHeight">
          <div class="p-shopguide-head">
            <div class="p-shopguide__icon">
              <img src="https://img.shop-pro.jp/tmpl_img/86/shopguide-icon-shipping.png" alt="" />
            </div>
            <h3 class="c-ttl-sub">
              SHIPPING
              <span class="c-ttl-sub__ja">配送・送料について</span>
            </h3>
          </div>
          <dl class="p-shopguide-txt">
            <{section name=num loop=$sk_delivery}>
            <dt class="p-shopguide__ttl">
              <{$sk_delivery[num].name}>
            </dt>
            <dd class="p-shopguide__body">
              <{if $sk_delivery[num].img_url != ""}>
              <div class="p-shopguide__img">
                <img src="<{$sk_delivery[num].img_url}>" />
              </div>
              <{/if}>
              <{$sk_delivery[num].other}>
            </dd>
            <{/section}>
          </dl>
        </div><!-- /.p-shopguide-box -->
      </div><!-- /.p-shopguide-column -->
      <{/if}>
      <div class="p-shopguide-column">
        <div class="p-shopguide-box js-matchHeight">
          <div class="p-shopguide-head">
            <div class="p-shopguide__icon">
              <img src="https://img.shop-pro.jp/tmpl_img/86/shopguide-icon-return.png" alt="" />
            </div>
            <h3 class="c-ttl-sub">
              RETURN
              <span class="c-ttl-sub__ja">返品について</span>
            </h3>
          </div>
          <dl class="p-shopguide-txt">
            <{if $shop.bad_product != ""}>
            <dt class="p-shopguide__ttl">
              不良品
            </dt>
            <dd class="p-shopguide__body">
              <{$shop.bad_product}>
            </dd>
            <{/if}>
            <{if $shop.return_limit != ""}>
            <dt class="p-shopguide__ttl">
              返品期限
            </dt>
            <dd class="p-shopguide__body">
              <{$shop.return_limit}>
            </dd>
            <{/if}>
            <{if $shop.return_price != ""}>
            <dt class="p-shopguide__ttl">
              返品送料
            </dt>
            <dd class="p-shopguide__body">
              <{$shop.return_price}>
            </dd>
            <{/if}>
          </dl>
        </div><!-- /.p-shopguide-box -->
      </div><!-- /.p-shopguide-column -->
      <{if $sk_payment != ""}>
      <div class="p-shopguide-column">
        <div class="p-shopguide-box js-matchHeight">
          <div class="p-shopguide-head">
            <div class="p-shopguide__icon">
              <img src="https://img.shop-pro.jp/tmpl_img/86/shopguide-icon-payment.png" alt="" />
            </div>
            <h3 class="c-ttl-sub">
              PAYMENT
              <span class="c-ttl-sub__ja">お支払いについて</span>
            </h3>
          </div>
          <dl class="p-shopguide-txt">
            <{section name=num loop=$sk_payment}>
            <dt class="p-shopguide__ttl">
              <{$sk_payment[num].name}>
            </dt>
            <dd class="p-shopguide__body">
              <{if $sk_payment[num].img_url != ""}>
              <div class="p-shopguide__img">
                <img src="<{$sk_payment[num].img_url}>" />
              </div>
              <{/if}>
              <{if $sk_payment[num].card_img != ""}>
              <div class="p-shopguide__img">
                <{$sk_payment[num].card_img}>
              </div>
              <{/if}>
              <{$sk_payment[num].other}>
            </dd>
            <{/section}>
          </dl>
        </div><!-- /.p-shopguide-box -->
      </div><!-- /.p-shopguide-column -->
      <{/if}>
    </div><!-- /.p-shopguide-wrap -->
  </div><!-- /.p-shopguide -->
</div><!-- /.l-bottom -->
<!-- フッター -->
<div class="l-footer">
  <div class="u-container">
    <div class="l-footer-main">
      <div class="l-footer-shopinfo">
        <div class="l-footer-shopinfo__logo">
          <a href="<{$home_url}>"><{$logo}></a>
        </div>
        <{if $logo_type == "image"}>
        <div class="l-footer-shopinfo__txt">
          <{$shop_name}>
        </div>
        <{/if}>
        <ul class="l-footer-sns-list u-opa">
          <{if $instagram_url}>
          <li class="l-footer-sns-list__item">
            <a href="<{$instagram_url}>" target="_blank">
              <i class="icon-lg-b icon-instagram" aria-label="instagram"></i>
            </a>
          </li>
          <{/if}>
          <{if $facebook_url}>
          <li class="l-footer-sns-list__item">
            <a href="<{$facebook_url}>" target="_blank">
              <i class="icon-lg-b icon-facebook" aria-label="Facebook"></i>
            </a>
          </li>
          <{/if}>
          <{if $twitter_url}>
          <li class="l-footer-sns-list__item">
            <a href="<{$twitter_url}>" target="_blank">
              <i class="icon-lg-b icon-twitter" aria-label="Twitter"></i>
            </a>
          </li>
          <{/if}>
          <{if $youtube_url}>
          <li class="l-footer-sns-list__item">
            <a href="<{$youtube_url}>" target="_blank">
              <i class="icon-lg-b icon-video" aria-label="Youtube"></i>
            </a>
          </li>
          <{/if}>
          <!-- <li class="l-footer-sns-list__item">
            <a href="" target="_blank">
              <i class="icon-lg-b icon-pinterest" aria-label="pinterest"></i>
            </a>
          </li> -->
        </ul>
        <{if $qrcode_url}>
        <div class="l-footer-qrcode">
          <img src="<{$qrcode_url}>" />
        </div>
        <{/if}>
      </div>
      <div class="l-footer-navi">
        <ul class="l-footer-navi-list">
          <li class="l-footer-navi-list__item">
            <a class="l-footer-navi-list__link" href="<{$home_url}>">
              ホーム
            </a>
          </li>
          <li class="l-footer-navi-list__item">
            <a class="l-footer-navi-list__link" href="<{$sk_url}>#delivery">
              配送・送料について
            </a>
          </li>
          <li class="l-footer-navi-list__item">
            <a class="l-footer-navi-list__link" href="<{if $tpl_name != "shopkeeper"}><{$sk_url}><{/if}>#return">
              返品について
            </a>
          </li>
          <li class="l-footer-navi-list__item">
            <a class="l-footer-navi-list__link" href="<{if $tpl_name != "shopkeeper"}><{$sk_url}><{/if}>#payment">
              支払い方法について
            </a>
          </li>
          <li class="l-footer-navi-list__item">
            <a class="l-footer-navi-list__link" href="<{if $tpl_name != "shopkeeper"}><{$sk_url}><{/if}>#info">
              特定商取引法に基づく表記
            </a>
          </li>
          <li class="l-footer-navi-list__item">
            <a class="l-footer-navi-list__link" href="<{$privacy_url}>">
              プライバシーポリシー
            </a>
          </li>
        </ul>
        <ul class="l-footer-navi-list">
          <{if $manager_url != ""}>
          <li class="l-footer-navi-list__item">
            <a class="l-footer-navi-list__link" href="<{$manager_url}>">
              ショップブログ
            </a>
          </li>
          <{/if}>
          <{if $mailmaga_url != ""}>
          <li class="l-footer-navi-list__item">
            <a class="l-footer-navi-list__link" href="<{$mailmaga_url}>">
              メルマガ登録・解除
            </a>
          </li>
          <{/if}>
          <li class="l-footer-navi-list__item">
            <span class="l-footer-navi-list__link">
              <a href="<{$rss_url}>">RSS</a> / <a href="<{$atom_url}>">ATOM</a>
            </span>
          </li>
        </ul>
        <ul class="l-footer-navi-list">
          <li class="l-footer-navi-list__item">
            <a class="l-footer-navi-list__link" href="<{$view_myaccount_url}>">
              マイアカウント
            </a>
          </li>
          <{if $members_use_flg}>
          <{if !$members_login_flg}>
          <{if $members_register_flg}>
          <li class="l-footer-navi-list__item">
            <a class="l-footer-navi-list__link" href="<{$members_regi_url}>">
              会員登録
            </a>
          </li>
          <{/if}>
          <li class="l-footer-navi-list__item">
            <a class="l-footer-navi-list__link" href="<{$members_login_url}>">
              ログイン
            </a>
          </li>
          <{else}>
          <li class="l-footer-navi-list__item">
            <a class="l-footer-navi-list__link" href="<{$members_login_url}>">
              ログアウト
            </a>
          </li>
          <{/if}>
          <{/if}>
          <li class="l-footer-navi-list__item">
            <{if $is_enable_async_cart_in_pc}>
            <form name="cart_view_with_async" method="POST" action="<{$view_cart_url}>">
              <{$view_cart_with_async_info}>
            </form>
            <a class="l-footer-navi-list__link" href="javascript:void(0)">
              カートを見る
            </a>
            <{else}>
            <a class="l-footer-navi-list__link" href="<{$view_cart_url}>">
              カートを見る
            </a>
            <{/if}>
          </li>
          <li class="l-footer-navi-list__item">
            <a class="l-footer-navi-list__link" href="<{$view_inq_url}>">
              お問い合わせ
            </a>
          </li>
        </ul>
      </div><!-- /.l-footer-navi -->
    </div><!-- /.l-footer-main -->
  </div><!-- /.u-container -->
</div><!-- /.l-footer -->
<div class="l-copyright">
  <div class="l-copyright__txt">
    <{$e_copyright}>
  </div>
  <div class="l-copyright__logo">
    <a href="https://shop-pro.jp" target="_blank">Powered by<img src="https://img.shop-pro.jp/tmpl_img/86/powered.png" alt="カラーミーショップ" /></a>
  </div><!-- /.l-copyright__txt -->
</div>

<script src="https://img.shop-pro.jp/tmpl_js/86/jquery.biggerlink.min.js"></script>
<script src="https://img.shop-pro.jp/tmpl_js/86/jquery.matchHeight-min.js"></script>
<script src="https://img.shop-pro.jp/tmpl_js/86/what-input.js"></script>

<script type="text/javascript">
$(document).ready(function() {
  //category search
  $(".js-mega-menu-btn").on("click",function() {
    if ($(this).hasClass("is-on")) {
      $(this).removeClass("is-on");
      $(this).next(".js-mega-menu-contents").fadeOut(200,"swing");
    } else {
      $(".js-mega-menu-btn").removeClass("is-on");
      $(".js-mega-menu-btn").next().fadeOut(200,"swing");
      $(this).addClass("is-on");
      $(this).next(".js-mega-menu-contents").fadeIn(200,"swing");
    }
  });
  $(".js-search-close").on('click',function() {
    $(".l-header-search__contents").fadeOut(200,"swing");
    $(".l-header-search__btn").removeClass("is-on");
  });
  $(".js-search-btn").on('click',function() {
    $(".l-main-navi").removeClass("is-open");
    $(".js-navi-open").removeClass("is-on");
  });

  //hamburger
  $(".js-navi-open,.js-navi-close").on('click',function() {
    $(".l-header-search__contents").fadeOut(200,"swing");
    $(".l-header-search__btn").removeClass("is-on");
    $(".l-header").toggleClass("is-open");
    $(".l-main-navi").toggleClass("is-open");
    $(".l-menu-btn").toggleClass("is-on");
    $(".l-main-navi-overlay").toggleClass("is-on");
  });
});
</script>

<script type="text/javascript">
$(document).ready(function() {
  var header = $(".l-header")
  var headerHeight = header.outerHeight()
  var navPos = $(".l-main-navi").offset().top

  $(window).on("load scroll", function() {
    var value = $(this).scrollTop();
    if ( value > navPos ) {
      $(".l-header").addClass("is-fixed");
      $(".l-main").css("margin-top", headerHeight);
    } else {
      $(".l-header").removeClass("is-fixed");
      $(".l-main").css("margin-top", '0');
    }
  });
  $(window).on("load resize", function() {
    if ($(window).width() < 1030) {
      $("body").css("margin-top", header.outerHeight());
    } else {
      $("body").css("margin-top", "");
    }
  });
});
</script>

<script type="text/javascript">
$(document).ready(function() {
  $(".js-bigger").biggerlink();
});
</script>

<script type="text/javascript">
$(document).ready(function() {
  $(".js-matchHeight").matchHeight();
});
</script>

<script>
  $(function () {
  function window_size_switch_func() {
    if($(window).width() >= 768) {
    // product option switch -> table
    $('#prd-opt-table').html($('.prd-opt-table').html());
    $('#prd-opt-table table').addClass('table table-bordered');
    $('#prd-opt-select').empty();
    } else {
    // product option switch -> select
    $('#prd-opt-table').empty();
    if($('#prd-opt-select > *').size() == 0) {
      $('#prd-opt-select').append($('.prd-opt-select').html());
    }
    }
  }
  window_size_switch_func();
  $(window).load(function () {
    $('.history-unit').tile();
  });
  $(window).resize(function () {
    window_size_switch_func();
    $('.history-unit').tile();
  });
  });
</script>
