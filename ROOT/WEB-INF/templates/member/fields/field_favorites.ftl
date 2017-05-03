<#include "/common/common_var_definds.ftl" />
<#macro render data>
<script type="text/javascript" src="${resources}/js/member/store_favorite.js"></script>
<#import "./field_favorite_goods.ftl" as field_favorite_goods />
<#import "./field_favorite_store.ftl" as field_favorite_store />

<div class="member-list">
    <h2 class="member-tit favTitle" style="position: relative"> <i></i><a class="goBack" href="javascript:;"  onclick="window.history.go(-1);"></a><div class="all favAll" onclick="editBtn()">编辑</div>
        我的收藏</h2>
    <ul class="tabT">
        <li onclick="JavaScript:ChangeDiv('0','JKDiva_',1)" class="on" ><span>收藏的商品</span></li>
        <li onclick="JavaScript:ChangeDiv('1','JKDiva_',1)" id="storeLi"><span>收藏的商铺</span></li>
      </ul>

  <#-- 商品收藏 开始 -->
  <@field_favorite_goods.render data??/>
  <#-- 商品收藏  结束 -->

  <#-- 店铺收藏 开始 -->
  <@field_favorite_store.render data??/>
  <#-- 商品评价  结束 -->

  </div>
<div class="favoriteFill"></div>

</#macro>