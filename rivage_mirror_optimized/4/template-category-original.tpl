<div>
  <!-- パンくずリスト -->
  <ul class="topicpath-nav inline txt_12">
    <li><a href="<{$home_url}>">ホーム</a></li>
    <{if $smarty.get.mode != "grp"}>
      <{if $bid_name != ""}>
        <li>&nbsp;&gt;&nbsp;<a href="<{$bid_link}>"><{$bid_name}></a></li>
      <{/if}>
      <{if $sid_name != ""}><li>&nbsp;&gt;&nbsp;<a href="<{$sid_link}>"><{$sid_name}></a></li><{/if}>
    <{else}>
      <{section name=num loop=$group_breadcrumb}><li>&nbsp;&gt;&nbsp;<a href="<{$group_breadcrumb[num].link_url}>"><{$group_breadcrumb[num].name}></a></li><{/section}>
    <{/if}>
  </ul>
  <!-- //パンくずリスト -->

  <h2 class="pad_l_10 mar_b_20 txt_28 txt_fwn bor_b_1">
    <{if $sid_name != ""}>
      <{$sid_name}>
    <{elseif $bid_name != ""}>
      <{$bid_name}>
    <{else}>
      該当のカテゴリーがありません
    <{/if}>
  </h2>

  <!-- カテゴリー(大) フリースペース 1 -->
  <{if $category_desc_1}>
    <div class="cg_freespace_01"><{$category_desc_1}></div>
  <{/if}>
  <!-- // カテゴリー(大) フリースペース 1 -->

  <!-- カテゴリー(小) フリースペース 1 -->
  <{if $subcategory_desc_1}>
    <div class="cg_freespace_01"><{$subcategory_desc_1}></div>
  <{/if}>
  <!-- // カテゴリー(小) フリースペース 1 -->

  <!-- グループ フリースペース 1 -->
  <{if $group_desc_1}>
    <div class="cg_freespace_01"><{$group_desc_1}></div>
  <{/if}>
  <!-- // グループ フリースペース 1 -->

  <!-- 小カテゴリーリスト -->
  <{if $subcategory_num != 0}>
    <h3 class="mar_t_50 mar_b_20 txt_20 txt_fwn">カテゴリー一覧</h3>
    <ul class="category-list row">
      <{section name=num loop=$sub_category}>
        <li class="col col-lg-2 col-sm-4 col-xs-6 txt_c pad_10">
          <a href="<{$sub_category[num].link_url}>">
            <{if $sub_category[num].img_url != "" }><img src="<{$sub_category[num].img_url}>" class="show mar_auto mar_b_5" /><{/if}>
            <{$sub_category[num].name}>
          </a>
        </li>
      <{/section}>
    </ul>
  <{/if}>
  <!-- // 小カテゴリーリスト -->

  <!-- 小グループリスト -->
  <{if $subgroup_num != 0}>
    <h3 class="mar_t_50 mar_b_20 txt_20 txt_fwn">グループ一覧</h3>
    <ul class="category-list row">
      <{section name=num loop=$sub_group}>
        <li class="col col-lg-2 col-sm-4 col-xs-6 txt_c pad_10">
          <a href="<{$sub_group[num].link_url}>">
            <{if $sub_group[num].img_url != "" }><img src="<{$sub_group[num].img_url}>" class="show mar_auto mar_b_5" /><{/if}>
            <{$sub_group[num].name}>
          </a>
        </li>
      <{/section}>
    </ul>
  <{/if}>
  <!-- // 小グループリスト -->

  <{if $productlist_num != 0}>
    <!-- ソート -->
    <p class="txt_r mar_t_30 mar_b_30">
      <{if $productlist_sort_now != ""}>
        <a href="<{$productlist_sort_def}>">おすすめ順</a><{else}>おすすめ順
      <{/if}>
      &nbsp;|&nbsp;
      <{if $productlist_sort_now != "p"}>
        <a href="<{$productlist_sort_price}>">価格順</a><{else}>価格順
      <{/if}>
      &nbsp;|&nbsp;
      <{if $productlist_sort_now != "n"}>
        <a href="<{$productlist_sort_new}>">新着順</a><{else}>新着順
      <{/if}>
    </p>
    <!-- // ソート -->
    <!-- 商品リスト -->
    <ul class="row unstyled">
      <{section name=num loop=$productlist}>
        <li class="col col-xs-12 col-lg-4 productlist-unit pad_20 mar_b_30 txt_c">
          <a href="<{$productlist[num].link_url}>">
            <{if $productlist[num].img_url != ""}>
              <img src="<{$productlist[num].img_url}>" alt="<{$productlist[num].name}>" class="show mar_auto mar_b_10" />
            <{else}>
              <img src="https://img.shop-pro.jp/tmpl_img/73/noimage.png" alt="<{$productlist[num].name}>" class="show mar_auto mar_b_10" />
            <{/if}>
          </a>
          <a href="<{$productlist[num].link_url}>"><{$productlist[num].name}></a>
          <{if $productlist[num].s_expl != ""}>
            <{$productlist[num].s_expl}>
          <{/if}>
          <{if $productlist[num].soldout_flg == false}>
            <{if $members_login_flg == true && $productlist[num].discount_flg == true}>
              <{$productlist[num].regular_price}>
            <{/if}>
            <{$productlist[num].price}>
            <{if $members_login_flg == true && $productlist[num].discount_flg == true}>
              <{$productlist[num].discount_rate}>OFF!!
            <{/if}>
          <{else}>
            SOLD OUT
          <{/if}>
        </li>
      <{/section}>
    </ul>
    <!-- // 商品リスト -->
    <!-- ページャー -->
    <div class="txt_c mar_t_50 mar_b_50">
      <ul class="inline">
        <li>
          <{if $productlist_prev_page == ""}>
            <span class="btn disabled">&laquo; Prev</span>
          <{else}>
            <a href="<{$productlist_prev_page}>" class="btn">&laquo; Prev</a>
          <{/if}>
        </li>
        <li>
          <{if $productlist_next_page == ""}>
            <span class="btn disabled">Next &raquo;</span>
          <{else}>
            <a href="<{$productlist_next_page}>" class="btn">Next &raquo;</a>
          <{/if}>
        </li>
      </ul>
      <p>
        <b><{$productlist_num}></b><span>商品中</span>&nbsp;<b><{$productlist_snum}>-<{$productlist_enum}></b><span>商品</span>
      </p>
    </div>
    <!-- // ページャー -->
  <{else}>
    <{if $subcategory_num == 0 && $subgroup_num == 0}>
      <p class="mar_t_50 txt_c txt_18">該当する商品がありません</p>
    <{/if}>
  <{/if}>

  <!-- カテゴリー(大) フリースペース 2 -->
  <{if $category_desc_2}>
    <div class="cg_freespace_02"><{$category_desc_2}></div>
  <{/if}>
  <!-- // カテゴリー(大) フリースペース 2 -->

  <!-- カテゴリー(小) フリースペース 2 -->
  <{if $subcategory_desc_2}>
    <div class="cg_freespace_02"><{$subcategory_desc_2}></div>
  <{/if}>
  <!-- // カテゴリー(小) フリースペース 2 -->

  <!-- グループ フリースペース 2 -->
  <{if $group_desc_2}>
    <div class="cg_freespace_02"><{$group_desc_2}></div>
  <{/if}>
  <!-- // グループ フリースペース 2 -->

</div>

<script>
  $(window).load(function () {
    $('.productlist-unit').tile();
  });
  $(window).resize(function () {
    $('.productlist-unit').tile();
  });
</script>
