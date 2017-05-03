<#--店铺首页-->
<#include "/common/common_var_definds.ftl" />
<#include "/basepage/store/default/hb_templates/store_hb_templates.ftl" />
<#import "/basepage/store/default/common/zizhi_slider.ftl" as zizhi/>
<#import "/basepage/store/default/common/dangan_slider.ftl" as dangan/>
<!DOCTYPE html>
<html>

<head lang="en">
    <meta charset="UTF-8">
    <title>饭饭1080°直采平台</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
    <script type="text/javascript">
        var deviceWidth = document.documentElement.clientWidth;
        if(deviceWidth > 768) {
            deviceWidth = 768;
        }
        document.documentElement.style.fontSize = deviceWidth / 6.4 + 'px';
    </script>
<#import "/basepage/store/default/common/common_link.ftl" as link/>
<#import "/basepage/store/default/common/common_script.ftl" as script/>
<#import "/basepage/store/default/common/common_header_bar.ftl" as header_bar/>
<#import "/basepage/store/default/common/common_header_searchbox_default.ftl" as searchBox/>
<#import "/basepage/store/default/common/common_footer.ftl" as footerNoTab/>
<#import "/basepage/seller/seller_header_search.ftl" as sellerSearch/>
<@link.render />
    <!--导入共通样式-->
<@script.render />
    <!--导入共通脚本-->
    <link rel="stylesheet" href="${resources}/basepage/seller/css/store.css" type="text/css">
    <script src="${resources}/basepage/seller/js/store_common_head_load.js"></script>
    <script src="${resources}/basepage/seller/js/staticStore.js"></script>
    <script src="${resources}/basepage/seller/js/store_dynamics.js"></script>
    <script src="${resources}/basepage/seller/js/sp_getAboutImg.js" type="text/javascript" charset="utf-8"></script>
</head>

<body>
<div id="pageInfo" store_id="${storeId!''}" store_template_code="${storeTemplateCode!''}" page_id="${storeTemplateCode!''}" style="display: none"></div>
<!--此处是头部开始-->
<div class="top"><@header_bar.render "商铺",""/></div>
<!--此处是头部结束-->
<!--网页头部&导航开始-->
<div id="sp_hd_1"></div>
<div id="sp_hd_2"></div>
<@sellerSearch.render />
<div id="ff_tab_box">
    <div class="ff_tab_content">
        <div class="ff-tab-title">
            <img src="/resources/basepage/seller/img/${storeId!''}/top2.jpg" /> <span>商家介绍</span>
        </div>
        <div class="ff-tab-con-detail">
            <p>
                红骨顶生态农场是由天津红骨顶农业集团有限公司于2014年成立，农场位于京津冀的枢纽地段天津市武清区大良镇蒙辛庄旁，共占地600余亩，依附武清区得天独厚的人文、交通、地理环境，在北运河畔打造一个生态自循环的放心农场。农场坚持中科院植物研究所蒋高明老师提出的“六不用”原则，即不使用化肥、人工合成农药、地膜、添加剂、除草剂、转基因技术，遵循物种自然生长，在津打造一个集动物养殖、植物种植、旅游观光、儿童游乐、生态教育、健康养老等多种功能的原生态农场。
            </p>
            <p style="color: #1f497d">农场现有特色项目：</p>
            <p style="color: #c0504d;">1、红骨顶市民农园（五月至十一月）（可参与采摘）</p>
            <p>红骨顶市民农园依照CSA（社区支持农业）模式进行生产经营，按照40㎡的大小划分成为“私家小菜园”，农园为认购菜园的市民提供技术服务与耕种所需的用具及种苗，市民可以按照自身的时间每月参与耕作当中，收获健康的蔬菜与生活。</p>
                <div class="store_fl_tb">
                    <div class="td1">芹菜</div>
                    <div>芹菜，属伞形科植物，富含蛋白质、碳水化合物、胡萝卜素具有有平肝清热，祛风利湿，除烦消肿，凉血止血，解毒宣肺，健胃利血、清肠利便、润肺止咳、降低血压、健脑镇静的功效。</div>
                </div>
                <div class="store_fl_tb">
                    <div class="td1">白菜</div>
                    <div>白菜，十字花科芸薹属，是中国的传统蔬菜。营养丰富，除含糖类、脂肪、蛋白质、粗纤维、钙、磷、铁、胡萝卜素外，其维生素C、核黄素的含量比苹果、梨分别高5倍、4倍;微量元素锌高于肉类，并含有能抑制亚硝酸胺吸收的钼。</div>
                </div>
                <div class="store_fl_tb">
                    <div class="td1">生菜</div>
                    <div>生菜味甘、性凉，有清热养神、清肝利胆、养胃的功效，生食、常食有利于女性保持良好的身材。</div>
                </div>
                <div class="store_fl_tb">
                    <div class="td1">萝卜</div>
                    <div>青萝卜富含人体所需的营养物质，淀粉酶含量很高，肉质致密，色呈淡绿色，水多味甜、微辣，是著名的生食品种，人称“水果萝卜”。除生食外，还可做汤，干腌、盐渍和制做泡菜等。 青萝卜还具有药用价值，有消积、祛痰、利尿、止泻等效用，被人们所喜爱。</div>
                </div>
                <div class="store_fl_tb">
                    <div class="td1">香菜</div>
                    <div>香菜性温味甘，能健胃消食，发汗透疹，驱风解毒。香菜营养丰富，香菜内含维生素c、胡萝卜素、维生素b1、b2等，同时还含有丰富的矿物质，如钙、铁、磷、镁等。</div>
                </div>
                <div class="store_fl_tb">
                    <div class="td1">茼蒿</div>
                    <div>茼蒿性味甘辛、平，具有安心气、和脾胃、消痰饮、利二便的功效。其花形似菊，又名菊花菜。茼蒿中因含有挥发性精油及胆碱等物质，所以有很浓郁的香气，茼蒿中富含胡萝卜素和矿物质。</div>
                </div>
                <div class="store_fl_tb">
                    <div class="td1">茄子</div>
                    <div>茄属植物，果可供蔬食。根、茎、叶入药，为收敛剂，有利尿之效，叶也可以作麻醉剂。种子为消肿药，也用为刺激剂，但容易引起胃弱及便秘，果生食可解食菌中毒。</div>
                </div>
                <div class="store_fl_tb">
                    <div class="td1">辣椒</div>
                    <div>一年生或多年生草本植物，特点是果实较大，辣味较淡甚至根本不辣，作蔬菜食用而不作为调味料。由于它翠绿鲜艳，新培育出来的品种还有红、黄、紫等多种颜色，因此不但能自成一菜，还被广泛用于配菜。</div>
                </div>
                <div class="store_fl_tb">
                    <div class="td1">西红柿</div>
                    <div>别名番茄，番茄的果实营养丰富，具特殊风味。可以生食、煮食、加工番茄酱、汁或整果罐藏。</div>
                </div>
                <div class="store_fl_tb" style="border-bottom: 1px solid #dcdcdc">
                    <div class="td1">黄瓜</div>
                    <div>黄瓜含水量为96％～98％，它不但脆嫩清香，味道鲜美，而且营养丰富。黄瓜是一味可以美容的菜蔬，被称为“厨房里的美容剂”，经常食用或贴在皮肤上可有效地抗皮肤老化，减少皱纹的产生，并可防止唇炎、口角炎。因此，黄瓜是很好的减肥品。</div>
                </div>
            <p style="color: #c0504d;">2、红心火龙果采摘（七月中旬至十一月底）</p>
            <p>红骨顶采摘园内设19个温室暖棚，种植着来自热带地区的水果宠儿“红心火龙果”。其可爱的外形与紫红色的果肉，富含花青素与植物性白蛋白，收到新一代年轻人的追捧。</p>
            <div>
                <img src="${resources}/basepage/seller/img/${storeId!''}/intro1.jpg" width="100%" style="padding-top: 0.1rem">
                <img src="${resources}/basepage/seller/img/${storeId!''}/intro2.jpg" width="100%" style="padding-top: 0.1rem">
            </div>
                <img src="${resources}/basepage/seller/img/${storeId!''}/intro3.jpg" width="100%" style="padding-top: 0.1rem">
            <p style="color: #c0504d;">3、散养鸡、鸭、鹅、蛋（全年）</p>
            <p>这里的散养家禽可不是一般的来头，红骨顶生态农场建设之前，这片土地生长着遍地的中草药材，目前正是这些可爱的家禽们的零食哦~</p>
            <div>
                <img src="${resources}/basepage/seller/img/${storeId!''}/inro4.jpg" width="100%" style="padding-top: 0.1rem">
                <img src="${resources}/basepage/seller/img/${storeId!''}/intro5.jpg" width="100%" style="padding-top: 0.1rem">
            </div>
            <img src="${resources}/basepage/seller/img/${storeId!''}/intro6.jpg" width="100%" style="padding-top: 0.1rem">
            <p style="color: #c0504d;">4、其他农事体验（全年）</p>
            <p>动物喂养、农耕体验、自主烧烤、植物认知，在这里你可以带上三五好友带上家里的小朋友尽情享受大自然的乐趣。</p>
            <p style="color: #c0504d;">农场实景拍摄：</p>
            <div>
                <img src="${resources}/basepage/seller/img/${storeId!''}/intro7.jpg" width="100%" style="padding-top: 0.1rem">
                <img src="${resources}/basepage/seller/img/${storeId!''}/intro8.jpg" width="100%" style="padding-top: 0.1rem">
            </div>
            <div>
                <img src="${resources}/basepage/seller/img/${storeId!''}/intro9.jpg" width="100%"style="padding-top: 0.1rem">
                <img src="${resources}/basepage/seller/img/${storeId!''}/intro10.jpg" width="100%" style="padding-top: 0.1rem">
            </div>
            <div>
                <img src="${resources}/basepage/seller/img/${storeId!''}/intro11.jpg" width="100%" style="padding-top: 0.1rem">
                <img src="${resources}/basepage/seller/img/${storeId!''}/intro12.jpg" width="100%" style="padding-top: 0.1rem">
            </div>
            <div>
                <img src="${resources}/basepage/seller/img/${storeId!''}/intro13.jpg" width="100%" style="padding-top: 0.1rem">
                <img src="${resources}/basepage/seller/img/${storeId!''}/intro14.jpg" width="100%" style="padding-top: 0.1rem">
            </div>
            <div>
                <img src="${resources}/basepage/seller/img/${storeId!''}/intro15.jpg" width="100%" style="padding-top: 0.1rem">
                <img src="${resources}/basepage/seller/img/${storeId!''}/intro16.jpg" width="100%" style="padding-top: 0.1rem">
            </div>
            <img src="${resources}/basepage/seller/img/${storeId!''}/intro17.jpg" width="100%" style="padding-top: 0.1rem">
        </div>
    </div>
    <div class="ff_tab_content only_book_content_zizhi">
        <div class="ff-tab-title">
            <img src="/resources/basepage/seller/img/${storeId!''}/top2.jpg" /><span>商家资质</span>
        </div>
        <div class="ff-tab-con-detail">
        <@zizhi.render />
        </div>
    </div>
    <div class="ff_tab_content">
        <div class="ff-tab-title">
            <img src="/resources/basepage/seller/img/${storeId!''}/top2.jpg" /> <span>商家活动</span>

        </div>
        <div class="ff-tab-con-detail">敬请期待</div>
    </div>
</div>
<@footerNoTab.render />
</body>

</html>