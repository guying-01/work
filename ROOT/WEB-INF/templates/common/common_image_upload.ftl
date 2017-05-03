<!-- 图片上传 -->
<script>
    var webapp = '/resources/imageupload/';
    var accessKey = "${Session.imageAccessKey!''}";
    var username = "admin";
</script>
<link rel="stylesheet" type="text/css" href="//img.fan1080.com/public/$assets/client/styles/common/public.css"/><#--
<link rel="stylesheet" type="text/css" href="//img.fan1080.com/public/$assets/client/styles/common/photo/popup_file.css"/>
<link rel="stylesheet" type="text/css" href="//img.fan1080.com/public/$assets/client/styles/common/photo/product.css"/>-->
<#--<link rel="stylesheet" type="text/css" href="//img.fan1080.com/public/$assets/client/vendor/dsdialog/css/base.css"/>-->
<link rel="stylesheet" href="//img.fan1080.com/public/$assets/js/jQuery-contextMenu/dist/jquery.contextMenu.css"/>
<link rel="stylesheet" href="//img.fan1080.com/public/$assets/js/jquery-ui/themes/base/all.css"/>
<script type="text/javascript" src="//img.fan1080.com/public/$assets/client/js/common/message.js"></script>
<script type="text/javascript" src="//img.fan1080.com/public/$assets/js/jquery-ui/jquery-ui.min.js"></script>
<#--<script type="text/javascript" src="//img.fan1080.com/public/$assets/client/vendor/jquery.loadmask.js"></script>-->
<#--<script type="text/javascript" src="//img.fan1080.com/public/$assets/client/vendor/dsdialog/js/dsdialog.js"></script>-->
<script type="text/javascript" src="//img.fan1080.com/public/$assets/client/vendor/underscore-min.js"></script>
<script type="text/javascript" src="//img.fan1080.com/public/$assets/client/vendor/handlebars.js"></script>
<script type="text/javascript" src="//img.fan1080.com/public/$assets/client/vendor/handlebars.helper.js"></script>
<script type="text/javascript" src="//img.fan1080.com/public/$assets/client/js/common/photo/productPhoto.js"></script>
<script type="text/javascript" src="//img.fan1080.com/public/$assets/js/jQuery-contextMenu/dist/jquery.contextMenu.min.js"></script>
<script type="text/javascript" src="//img.fan1080.com/public/$assets/js/jQuery-contextMenu/dist/jquery.ui.position.min.js"></script>


<#--<script type="text/javascript" src="/resources/imageupload/js/common/photo/photoAlbum.js"></script>-->

<link rel="stylesheet" type="text/css" href="/resources/imageupload/styles/common/photo/product.css"/>
<link rel="stylesheet" type="text/css" href="/resources/imageupload/styles/common/photo/popup_file.css"/>
<script type="text/javascript" src="/resources/imageupload/jquery.image.upload.js"></script>

<!-- end -->

<!-- 单一图片Start -->
<script id="tpl_photo_simple" type="text/x-handlebars-template">
    <img id={{imgId}} data-target="image" width="100px" height="100px" style="border: 1px solid #DDDDDD;"  {{#if src}}  src="{{src}}" {{else}} src="/resources/img/common/selectImg.jpg" {{/if}}/>
    <br/>
    <input id={{textId}} name="{{textName}}" type="hidden" data-target="text" value="{{src}}" readonly {{#if required}}
           required="required" {{/if}}/>

</script>


<script>
    //    new PhotoAlbum('txt_test_photo', 'img_test_photo');
    //    new PhotoAlbum('txt_test_photo_1', 'img_test_photo_1');
</script>
<!-- 单一图片End -->

<!-- 画廊Start -->
<#--<div id="photo_list"></div>
<div id="photo_list2"></div>-->
<script id="tpl_photo_img" type="text/x-handlebars-template">
    {{#each this}}
    <img src="{{productPicturesUrl}}" data-uid="{{uid}}" >
    {{/each}}
</script>

<script id="tpl_photo_img_input_tmp" type="text/x-handlebars-template">
    <div id="tpl_photo_img_input">
        {{#each images}}
        <input type="hidden" value="{{productPicturesUrl}}" name="{{../name}}" data-uid="{{uid}}"/>
        {{/each}}
    </div>
</script>

<script id="tpl_photo_img_input_tmp_1" type="text/x-handlebars-template">
    {{#each images}}
        <input type="hidden" value="{{productPicturesUrl}}" name="{{../name}}" data-uid="{{uid}}"/>
    {{/each}}
</script>


<script id="tpl_photo_list" type="text/x-handlebars-template">
    <table width="100%" class="TAB_C price">
        <tbody>
        <tr>
            <td width="90" style="border-bottom: none;"><strong></strong></td>
        </tr>
        <tr>
            <td style="border-bottom: none;">
                <a href="javascript:void(0);" class="button_small popup_btn">+添加图片</a>
                <span class="text">2MB以内，支持格式jpg、png、gif，限8张</span>
            </td>
        </tr>
        <tr>
            <td>
                <div class="img_box">
                    <div class="zq_img_list">
                        {{#each this}}
                        <img src="{{productPicturesUrl}}" data-uid="{{uid}}"/>
                        {{/each}}
                    </div>
                    <div class="check_box">
                        <div class="opreatePanel" style="display:none">
                            <div style="width: 100px !important; float: left; display: none;">
                                <input name="father" type="checkbox" value="" class="cover"/>
                                <span>设为封面</span>
                            </div>
                        <#--      <div style="width: 100px !important; float: left; display: inline-block;">
                                  <input name="father" type="checkbox" value="" class="album"/>
                                  <span>设为相册</span>
                              </div>
                              <div style="width: 100px !important; float: left; display: inline-block;">
                                  <input name="father" type="checkbox" value="" class="detail"/> <span>详情</span>
                              </div>-->
                            <img src="/resources/imageupload/images/u120.png" class="zq_img_list_left"
                                 style="display: none"/>
                            <img src="/resources/imageupload/images/u118.png" class="zq_img_list_right"
                                 style="display: none"/>
                            <span class="zq_img_list_del">删除</span>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
</script>
<script>
    //    new PhotoList('photo_list');
    //    new PhotoList('photo_list2');
</script>
<!-- 画廊End -->

<!-- 相册Start -->
<link href="/resources/imageupload/styles/common/photo/photo.css" rel="stylesheet" type="text/css"/>

<div class="popUp pop_up fan1080-img cx2 " id="image-upload-panel" style="z-index: 99">
    <div class="popup_img_box">
        <div class="zq_tab zq_tab_on">网络相册</div>
        <div class="zq_tab">本地上传</div>
        <div class="path_addr"><span>路径:</span><span class="path_item"></span></div>
        <div class="popup_img_box_close">
            <img src="/resources/imageupload/images/popup_img_box_close.png" width="15" height="15"/>
        </div>
        <div class="clear"></div>
        <div class="popup_img_box_search_pop">
            <div class="popup_img_box_title">
                <div class="popup_img_box_title_left">选择图片 <span>还可选<b id="num2" style="color:red"></b>张</span>
                    <a href="javascript:void(0)" class="reload">刷新</a>
                    <a href="javascript:void(0)" class="mkdir">新建文件夹</a>
                </div>
            <#-- <em id="up_file" style="display: none; float:left;">

                    <a href="javascript:void(0)" class="up">返回上级</a></em>
               <a href="javascript:void(0)" class="search right m-l-10">搜索</a>
                <input type="text" class="right text_A" name="file_name" value="" placeholder="" id="file_name">
-->
                <div class="clear"></div>
            </div>
            <div id="mark">
                <div class="popup_img_box_search" style="display:block;overflow-y:auto;" id="net_photo"></div>
            </div>
        </div>
        <div class="popup_img_box_search_pop" style="display:none;">
            <div class="popup_img_box_search" style="display:block;overflow-y:auto;height:403px;">
                <div class="popup_img_box_title">
                    <div class="popup_img_box_title_left">选择图片 <span>还可选<b id="num" style="color:red"></b>张</span></div>
                    <div class="clear"></div>
                </div>
                <div class="uploadBrtton">
                    <div id="upload"><img id="tempimg" src="" style="display:none"/>
                        <a class="file" href="javascript:void(0)"> 添加图片
                            <input type="file" name="file" onchange="testload(this)" id="fileuploade">
                        </a>
                    </div>
                    <span style="color: red;">2MB以内，支持格式jpg、png、gif</span>
                </div>
                <div style="display:none;" id="file_photoDiv">
                    <div id="file_photo" style="display:inline-block">
                        <div id="uploadClon" class="file_img2"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="popup_img_box_btn"><a href="javascript:void(0)" class="confirmImg">确定</a><a
                href="javascript:void(0)" class="deleteImg">删除</a><a href="javascript:void(0)" class="deleteImgB">删除</a>
        </div>
    </div>
</div>
<!-- 图片上传-->


<script id="tpl_photo" type="text/x-handlebars-template">

    {{#each data}}
    {{#of type 'file'}}
    <div class="file_img" data-target="{{type}}" ><input id="check_img" type="checkbox" data-name="{{path}}"/>

        <div class="file_img_sub" data-type="{{type}}" data-path="{{path}}">
            <img src="{{../../host}}{{path}}" width="59" height="71"/>{{name}}
        </div>
    </div>
    {{/of}}

    {{#of type 'folder,sys-folder'}}
    <div class="file_img" data-target="{{type}}" >
        <div class="file_img_sub" data-path="{{path}}" data-type="{{type}}">
            <img src="/resources/imageupload/images/file.png" width="59" height="71"/>{{name}}
        </div>
    </div>
    {{/of}}
    {{/each}}
</script>
<script type="text/javascript" src="//img.fan1080.com/public/$assets/client/js/common/photo/image_util.js"></script>
<script type="text/javascript" src="//img.fan1080.com/public/$assets/client/js/common/photo/photo.js"></script>