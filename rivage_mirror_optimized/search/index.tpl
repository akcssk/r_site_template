<link href="https://schole.v2010.coreserver.jp/css/contents.css" rel="stylesheet" type="text/css">
<style>
/********** pager **********/
.c-pager {
  margin-top: 20px;
  margin-bottom: 20px;
  text-align: center;
}
.c-pager__total {
  margin-bottom: 15px;
}
.c-pager-list {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  margin-bottom: 30px;
}
.c-pager-list__item {
  box-sizing: border-box;
  overflow: hidden;
  margin-left: 3px;
  margin-right: 3px;
  min-width: 30px;
  line-height: 30px;
  background: #ffffff;
  text-align: center;
}
@media screen and (max-width: 767px) {
  .c-pager-list__item {
    display: none;
    min-width: 45px;
    line-height: 45px;
  }
}
@media screen and (max-width: 767px) {
  .c-pager-list__item.is-visible {
    display: block;
    margin-left: 15px;
    margin-right: 15px;
    width: auto;
  }
}
.c-pager-list__link {
  display: block;
  position: relative;
  border: 1px solid #ffffff;
  background: #ffffff;
  color: #000000;
  min-width: 30px;
  text-decoration: none;
  transition: all 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}
@media screen and (max-width: 767px) {
  .c-pager-list__link {
    min-width: 45px;
  }
}
.c-pager-list__link:hover {
  border-color: #d8d8d8;
  background: #d8d8d8;
  color: #000000;
  text-decoration: none;
}
.c-pager-list__link.is-current {
  border-color: #535353;
}
@media screen and (max-width: 767px) {
  .c-pager-list__link.is-current {
    border-color: #ffffff;
  }
}
.c-pager-list__link.is-current:hover {
  border-color: #535353;
  background: #ffffff;
}
@media screen and (max-width: 767px) {
  .c-pager-list__link.is-current:hover {
    border-color: #ffffff;
  }
}
.c-pager-list__link.is-prev, .c-pager-list__link.is-next {
  border-color: #d8d8d8;
  background: #d8d8d8;
  text-indent: -99999px;
}
.c-pager-list__link.is-prev:before, .c-pager-list__link.is-next:before {
  content: "";
  position: absolute;
  top: 50%;
  left: 50%;
  margin-left: -2px;
  margin-top: -4px;
  width: 0;
  height: 0;
  border-top: 4px solid transparent;
  border-bottom: 4px solid transparent;
}
@media screen and (max-width: 767px) {
  .c-pager-list__link.is-prev:before, .c-pager-list__link.is-next:before {
    margin-left: -4px;
    margin-top: -8px;
    border-top: 8px solid transparent;
    border-bottom: 8px solid transparent;
  }
}
.c-pager-list__link.is-prev:hover, .c-pager-list__link.is-next:hover {
  background: rgba(216, 216, 216, 0.7);
}
.c-pager-list__link.is-prev.is-disabled:hover, .c-pager-list__link.is-next.is-disabled:hover {
  background: #d8d8d8;
}
.c-pager-list__link.is-prev:before {
  border-right: 4px solid #000000;
}
@media screen and (max-width: 767px) {
  .c-pager-list__link.is-prev:before {
    border-right: 8px solid #000000;
  }
}
.c-pager-list__link.is-prev.is-disabled:before {
  border-right-color: #aaaaaa;
}
.c-pager-list__link.is-next:before {
  border-left: 4px solid #000000;
}
@media screen and (max-width: 767px) {
  .c-pager-list__link.is-next:before {
    border-left: 8px solid #000000;
  }
}
.c-pager-list__link.is-next.is-disabled:before {
  border-left-color: #aaaaaa;
}

.c-pager-list__page {
  display: none;
}
@media screen and (max-width: 767px) {
  .c-pager-list__page {
    display: inline-block;
  }
}

/* 検索結果用スタイル */
.search-result {
  margin-bottom: 30px;
}
.search-result__title {
  font-size: 1.5em;
  margin-bottom: 15px;
  color: #333;
}
.search-result__keyword {
  margin-bottom: 20px;
  font-size: 1.1em;
}
.search-result__count {
  margin-bottom: 15px;
  font-weight: bold;
}
.search-result__sort {
  margin-bottom: 20px;
}
.search-result__sort-list {
  display: flex;
  list-style: none;
  padding: 0;
  margin: 0;
}
.search-result__sort-item {
  margin-right: 15px;
}
.search-result__sort-link {
  color: #333;
  text-decoration: none;
}
.search-result__sort-link:hover {
  text-decoration: underline;
}
.search-result__sort-current {
  font-weight: bold;
  color: #ad073b;
}
</style>

<section>
  <!-- ページ内容ここから ------------------------------------------------------------------>
  <div class="bgWhite">
    <h3 class="search-result__title">商品検索結果</h3>
    <div class="search-result__keyword">
      キーワード：<{if $search_keyword!=""}><{$search_keyword}><{else}>指定なし<{/if}>
    </div>
    
    <{if $productlist_num != 0}>
      <div class="search-result__count">
        全<{$productlist_num}>商品
      </div>
      <!-- ソート -->
      <div class="search-result__sort">
        <ul class="search-result__sort-list">
          <li class="search-result__sort-item">
            <{if $productlist_sort_now != ""}>
              <a href="<{$productlist_sort_def}>" class="search-result__sort-link">おすすめ順</a>
            <{else}>
              <span class="search-result__sort-current">おすすめ順</span>
            <{/if}>
          </li>
          <li class="search-result__sort-item">
            <{if $productlist_sort_now != "p"}>
              <a href="<{$productlist_sort_price}>" class="search-result__sort-link">価格順</a>
            <{else}>
              <span class="search-result__sort-current">価格順</span>
            <{/if}>
          </li>
          <li class="search-result__sort-item">
            <{if $productlist_sort_now != "n"}>
              <a href="<{$productlist_sort_new}>" class="search-result__sort-link">新着順</a>
            <{else}>
              <span class="search-result__sort-current">新着順</span>
            <{/if}>
          </li>
        </ul>
      </div>
      <!-- // ソート -->
      
      <!-- 商品リスト -->
      <div class="prodList">
        <{section name=num loop=$productlist}>
          <div class="prodListBox">
            <a href="<{$productlist[num].link_url}>">
              <p class="prodListImg">
                <{if $productlist[num].img_url != ""}>
                  <img src="<{$productlist[num].img_url}>" alt="<{$productlist[num].name|escape:'html'}>" class="mrgnB15" />
                <{else}>
                  <img src="https://img.shop-pro.jp/tmpl_img/86/no-image.jpg" alt="<{$productlist[num].name|escape:'html'}>" class="mrgnB15" />
                <{/if}>
              </p>
              <p class="prodListIco"></p>
              <p class="prodListName">
                <{$productlist[num].name}>
              </p>
              <{* 簡易説明文 *}>
              <{if $productlist[num].s_expl != ""}>
                <!-- <p class="prodListPoint">
                  <{$productlist[num].s_expl}>
                </p> -->
              <{/if}>
              <{if !$productlist[num].soldout_flg}>
                <div class="prodListPrice<{if $members_login_flg && $productlist[num].discount_flg}> is-discount<{/if}>">
                  <{* 販売価格（ログイン時は会員価格） *}>
                  <{$productlist[num].price}>
                  <{* 割引率（ログイン時、通常販売価格と会員価格が異なる場合のみ） *}>
                  <{if $members_login_flg && $productlist[num].discount_flg}>
                    <{$productlist[num].discount_rate}>OFF
                  <{/if}>
                </div>
                <{* 通常販売価格（ログイン時、通常販売価格と会員価格が異なる場合のみ） *}>
                <{if $members_login_flg && $productlist[num].discount_flg}>
                  <div class="prodListPrice is-strikethrough">
                    <{$productlist[num].regular_price}>
                  </div>
                <{/if}>
              <{else}>
                <{* 売り切れの表記 *}>
                <div class="prodListPrice is-soldout">
                  売り切れ
                </div>
              <{/if}>
            </a>
          </div>
        <{/section}>
      </div>
      <!-- // 商品リスト -->
      
      <!-- ページャー -->
      <{if $productlist_total_pages != 1}>
        <div class="c-pager">
          <div class="c-pager__total">
            全<span><{$productlist_num}></span>商品中 <span><{$productlist_snum}> - <{$productlist_enum}></span>表示
          </div>
          <ul class="c-pager-list" role="navigation" aria-label="商品一覧のページネーション">
            <li class="c-pager-list__item is-visible" role="listitem">
              <{if $productlist_prev_page != ""}>
                <a href="<{$productlist_prev_page}>" class="c-pager-list__link is-prev" aria-label="前のページへ">
                  前へ
                </a>
              <{else}>
                <span class="c-pager-list__link is-prev is-disabled">
                  前へ
                </span>
              <{/if}>
            </li>
            <{section name=pager start=$productlist_first_page loop=$productlist_last_page+1}>
              <{if $smarty.section.pager.first && $smarty.section.pager.index > 1}>
                <li class="c-pager-list__item">
                  <a href="<{$productlist_link_base}>" class="c-pager-list__link">1</a>
                </li>
                <li class="c-pager-list__item">
                  ...
                </li>
              <{/if}>
              <{if $smarty.section.pager.index == $productlist_current_page}>
                <li class="c-pager-list__item is-visible">
                  <span class="c-pager-list__link is-disabled is-current">
                    <{$smarty.section.pager.index}>
                    <span class="c-pager-list__page">ページ目</span>
                  </span>
                </li>
              <{else}>
                <li class="c-pager-list__item">
                  <a href="<{$productlist_link_base}>&page=<{$smarty.section.pager.index}>" class="c-pager-list__link">
                    <{$smarty.section.pager.index}>
                  </a>
                </li>
              <{/if}>
              <{if $smarty.section.pager.last && $smarty.section.pager.index < $productlist_total_pages}>
                <li class="c-pager-list__item">
                  ...
                </li>
                <li class="c-pager-list__item">
                  <a href="<{$productlist_link_base}>&page=<{$productlist_total_pages}>" class="c-pager-list__link">
                    <{$productlist_total_pages}>
                  </a>
                </li>
              <{/if}>
            <{/section}>
            <li class="c-pager-list__item is-visible">
              <{if $productlist_next_page != ""}>
                <a href="<{$productlist_next_page}>" class="c-pager-list__link is-next">
                  次へ
                </a>
              <{else}>
                <span class="c-pager-list__link is-next is-disabled">
                  次へ
                </span>
              <{/if}>
            </li>
          </ul>
        </div><!-- /.c-pager-list -->
      <{/if}>
      <!-- // ページャー -->
    <{else}>
      <{if $subcategory_num == 0 && $subgroup_num == 0}>
        <p class="c-not-found">
          該当する商品がありません
        </p>
      <{/if}>
    <{/if}>
  </div>
  <!-- /ページ内容ここまで ------------------------------------------------------------------>
</section>

<script>
  $(window).load(function () {
    $('.productlist-unit').tile();
  });
  $(window).resize(function () {
    $('.productlist-unit').tile();
  });
</script>

<script type="text/javascript">
$(document).ready(function() {
  $(".js-toggle-btn").click(function () {
    $(this).next(".js-toggle-contents").slideToggle(200,"swing");
    $(this).toggleClass("is-on");
  });
});
</script>
