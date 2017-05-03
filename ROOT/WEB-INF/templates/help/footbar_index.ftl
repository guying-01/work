<script src="${resources}/js/common/footer.js"></script>
<div class="footernav  clear">
<ul class=" footernav_I">
   ${Application["link__storeQuality__"]!""}
</ul>
<div class="footernav_W">
${Application["link__helpCenter__"]!""}
<div class="footTel">${Application["link__customService__"]!""}</div>
    <div class="clear"></div>
  </div>
  </div>
  <div class="footLink">${Application["link__foot__"]!""}</div>
  <div class="footFried"><p>${Application["link__link__"]!""}</p></div>
<div class="footer">
  ${Application["link__beian__"]!""}
</div>
<#if footParts??>
<#list footParts as part>
<@part.render data/>
</#list>
</#if>
<div class="tool">
    <div class="tool-top">
        <div class="tool-tab tool-tabA"><a href="/member/index.jhtml"><i></i>

            <P><u></u>个人中心 </P>
        </a></div>
        <div class="tool-tab tool-tabB"><em id="shopCtCountEm">0</em><a href="/sc/toList.jhtml"><i></i>

            <P><u></u>购物车 </P>
        </a></div>
        <div class="tool-tab tool-tabC"><a href="/fav/toList.jhtml"><i></i>

            <P><u></u>我的收藏 </P>
        </a></div>
	    <div class="tool-tab tool-tabE"><a id="setQQ" href="javascript:QQtalk('1739073619');"><i>&nbsp;</i>
	      <P><u>&nbsp;</u>平台客服</P>
	      </a></div>
        <div class="tool-tab tool-tabD"><i></i>

            <div class="tool-code"><u></u><img src="/resources/img/common/code.jpg" width="166" height="205"></div>
        </div>
        <div class="tool-scroll"></div>
    </div>
</div>


