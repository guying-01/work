<#--二级类目页-->
<#include "/common/common_var_definds.ftl" />
<!DOCTYPE html>
<html>

<head lang="en">
    <title>饭饭1080°直采平台</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
    <script type="text/javascript">
        var deviceWidth = document.documentElement.clientWidth;
        if(deviceWidth>768){
            deviceWidth=768;
        }
        document.documentElement.style.fontSize = deviceWidth / 6.4 + 'px';
    </script>

<#import "/basepage/store/default/common/common_link.ftl" as link/>
<#import "/basepage/store/default/common/common_script.ftl" as script/>
<#import "/basepage/store/default/common/common_header_bar.ftl" as header_bar/>
<#import "/basepage/store/default/common/common_header_searchbox_default.ftl" as searchBox/>
<#import "/basepage/store/default/common/common_footer.ftl" as footer/>
<#import "/basepage/store/default/common/common_praise_business.ftl" as praBus/>
<#import "/basepage/store/default/common/common_scroll_top.ftl" as scrollTop/>
<@link.render />
    <!--导入共通样式-->
<@script.render />
    <!--导入共通脚本-->
    <link rel="stylesheet" href="${resources}/basepage/store/default/level_pages/css/fflv2_css/fflv2_css.css" type="text/css">
    <!--二级页共通样式-->
    <link rel="stylesheet" href="${resources}/basepage/store/default/common_css/praBus.css" type="text/css">
    <script src="${resources}/basepage/store/default/common_js/praBus.js" type="text/javascript" charset="utf-8"></script>
<#--<script type="text/javascript" src="${resources}/basepage/store/default/level_pages/js/fflv2_js/lv2_dynamics.js"></script>-->
    <!--此处是动态数据绑定函数-->
</head>
<style>

    .article p{
        text-indent: 0.6rem;
        padding: 0.1rem;
        line-height: 0.35rem;
        font-size: 0.3rem;
        color: #565656;
    }
</style>
<body>
    <div id="pageInfo_ww" lv1_id="${level1}" lv1_name="${name1}" currentPageId="${level2}" currentPageName="${name2}" style="display:none"></div>
    <!--页面信息-->
    <#--<@praBus.render />-->
    <!--此处是头部开始-->
    <div class="top">
        <div class="ff_list_search_box">
        <@searchBox.render />
        </div>
    <@header_bar.render "大连海鲜传",""/>
    <#--导入header_top-->
    </div>

    <#--<@top.render />-->
    <#--导入header_top-->

    <#--<@searchBox.render />-->
    <div class="article" style="padding: 0.3rem;word-break: break-all">

        <div class="seafoodHistory-contain">
            <div class="boxTitle">
                大连海鲜传
            </div>
    <p>大连位于辽东半岛最南端，所及经纬度为东经121°44’-121°49’,北纬39°01’-39°04’，东濒黄海，西临渤海，背依中国东北腹地，北靠辽南群山。天蓝海碧，峰峦耸翠，山海相依，独蕴风情，属天地精魂，钟灵毓秀之地，素有“东北之窗”、“ 北方明珠 ”、“浪漫之都”的美誉。</p>
    <p>“海”是大连最闻名的特色，永恒的主题，也是诞生美丽传说和故事的地方，大海也让大连充满了浪漫和妩媚。整个城市三面环海，且处在黄海与渤海的分界线上，全地区海岸线长1906公里，占辽宁省海岸线总长度的73％，沿海岛礁星罗棋布，总数710多个。俗话说：“靠山吃山，靠海吃海。”由于大连盛产“海鲜”，而且海产品种类繁多，资源丰富，“海鲜”就成了大连的特产和名牌。</p>
    <p>大连海鲜很有名气，名气大到被冠以“大连海鲜甲天下”、“大连海鲜鲜天下”之定位，以至于北京、上海、天津甚至香港等城市，许多海鲜酒店都打出“大连海鲜”的招牌来招徕顾客。大连海鲜为什么这样有名气？大连海鲜为什么这么好吃？因为大连海鲜“鲜夺天下”，就是一个绝字“鲜”，大连海鲜为什么这么鲜？因为大连拥有绝对独一无二的海域环境优势。</p>
    <p class="title">绝佳海域孕育传奇海鲜</p>
    <p>大连，濒临浩瀚之黄渤海，水域环境，得天独厚。一则，黄渤海北岸平均水深44米，少有大江大河淡水注入，故而水质盐分较高，正好满足了海洋生物生长对盐分的要求。盐分较高的海域，海洋生物异常丰富，而且生长在盐分较高海区的海产品格外鲜咸可口。二则，大连海域浅海区，夏季海水表层水温平均为26.3℃，最高达30.4℃；冬季表层水温低于0℃，最低仅-2.7℃，呈近岸水温低于外海的特征，且近岸有大量海冰出现。加之受黄渤海冷水团的影响，除夏季休渔期外，大连海域的水温长期处于相对较低状态，这种优质的冷水环境格外适宜海洋生物的生长。科研人员经长期研究验证，水温越低，海鲜的品质越高，故而产地越往北，海鲜越是鲜美。三则，大连海域处于内湾，水质清澈、深度适宜，海水上层潮流通畅、流速舒缓、表面少有风浪，海水的交换速度快，自净能力强，故而大连海域水质远远优于其它海域，这就为海洋生物的生长繁殖营造了优良的洁净环境，成为海鲜家族的天然乐土。四则，黄渤海北部海底地貌特征独特，海底沙滩在潮流冲刷下形成了众多与潮流平行的“潮流脊”。巨大的潮差不仅仅为海洋生物的生长带来了丰富的浮游生物和饵料，还带来了宽广富饶的滩涂地域。辽阔的滩涂可以有效的增强海水自净能力，也为海洋生物等海中珍品的生长提供了优良环境。五则，大连地处北温带，属于暖温带湿润性季风气候，冬季受亚洲大陆蒙古冷高压影响，盛行偏北风；夏季受印度洋热低压和北太平洋热高压影响，盛行偏南风，宏大的季风和洋流不仅为海洋生物带来了丰富的浮游生物和饵料，而且能经得住海底风暴考验的海洋生物，必定肉质韧性，品质上佳。六则，大连海产品质量管理水平亦是全国一流，无公害水产品面积达180万亩，无公害产品达100多个。如此优越的天然海域环境，让大连海鲜的魅力独步天下，蜚声海内</p>
    <p class="title">种类繁多的海鲜天堂</p>
    <p>由于纬度、水质、水温、含盐量适宜等缘由，黄渤海海域，海洋生物资源极其丰富，种类繁多，“鱼类王国”就多达200多个成员，经济鱼类50余种，更有对虾、毛虾、鹰爪虾、梭子蟹、文蛤、毛蚶、四角蛤、青蛤、杂色蛤、贻贝、扇贝、牡蛎、鲍鱼、海参等众多海中珍品，而海藻、海菜资源更为丰富，约有400多种。其中尤以皱纹盘鲍，刺海参、紫海胆、对虾、虾夷扇贝、贻贝、香螺、黄花鱼、加吉鱼、带鱼、海带、裙带菜等天下知名。丰富的海洋资源成就了大连“海鲜天堂”的美誉，大连海鲜生猛鲜活，口感上佳，营养丰富，品类齐全，不油不腻，绵香袅袅，悄然浸润，峰回路转，如丝如缕，在满足口腹之欲的同时又满足了人们对养生、对健康的无限追求，真可谓“五行入味驱暑寒，玉盘珍馐值万钱。羊肉千斤酒万斛，不及海鲜半丝弦”。大连海鲜名扬四海，大连人感恩馈赠，面对海洋，以心相印、以情相许，朝朝暮暮，相依相偎；外地人闻香而来，放开怀抱，肆意享受，大快朵颐，继而无限艳羡，流连忘返。</p>
    <p class="title">品种神奇天下绝 </p>
    <p>大连海鲜中奇珍异品比较多，是中国多种珍贵海产品的主要产地。海参、鲍鱼、干贝是海八珍中的珍品海味，人人皆知，而“海参”“鲍鱼”“干贝”这些名贵海鲜品，在大连不仅盛产，而且也是特产。我国品质最好的海参是刺参，而刺身基本都出产于大连地区；大连出产的皱纹盘鲍是我国所产鲍鱼中个体最大的，被称为“海味之冠”。目前大连的“海参”“鲍鱼”已列入了国家地理标志产品。这是大自然给大连最好的恩赐，也为大连的海产品穿上了“御赐黄马褂”，不仅得到保护，同时也得到全国甚至全世界的美赞。</p>
    <p>大连盛产栉孔扇贝，栉孔扇贝虽然味鲜，但个头较小，很难成为极品。20世纪80年代，大连从日本引进了虾夷扇贝。虾夷扇贝是世界知名的优良品种，个大而味鲜，但由于这种扇贝需要生活在低温的水域，在我国只有大连水域适合其生活，因此大连又增添了一种珍奇海鲜。</p>
    <p>大连还有些珍奇海鲜虽然并没有列入到海八珍中，但也闻名天下。如大连的紫海胆，不仅个大、味鲜，而且在我国海鲜中享有盛誉，日本人就每每点名要大连的紫海胆。20世纪90年代，大连又从日本引进了虾夷马粪海胆，这种海胆名虽然不是很雅，但营养价值和味道却都胜紫海胆一筹。虾夷马粪海胆也是冷水性的种类，在我国的其他海域也很难生存，所以也成为大连的特有海鲜。</p>
    <p>大连沿海还出产一种个体很大的蚶，名为魁蚶，其个体要比毛蚶、泥蚶大几倍，日本人称为赤贝，可以生吃。因为魁蚶也是喜欢生活在较低的水温中，所以我国南部海域根本没有，这也是北方海域的一大特产。即使你在北京、上海有时也能吃到魁蚶，但味道绝对比不上大连海边新采捕的魁蚶。</p>
    <p>大连海域清洁纯净，浮游生物和饵料丰富，滩涂宽广富饶，渔业异常发达，鱼虾贝等小海鲜种类多、数量庞大。大连素有“对虾之乡”的称号，是对虾的盛产地和重点捕捞作业区，也是太平洋牡蛎主产区之一。大连更有“世界岘库”的盛誉，贝类品种之多之全、味道之鲜之美、数量之大，无与伦比，令人叹为观止。</p>
    <p>大连的珍奇海鲜，五彩斑斓、艳丽夺目、奇形怪状、千姿百态，带着浓浓的童话色彩，强烈的刺激着我们的食欲，让我们深陷大海的无限诱惑而不能自拔。浩瀚的大海赐予了大连一生都食之不尽、享用不完的海鲜珍宝，让生活在大连土地上的人，也因之时时充满了惊喜、期盼、满足和幸福。</p>
    <p class="title">大连海鲜鲜天下</p>
    <p>海洋食物最大的特点、最被人酷爱、最令人欲罢不能的，就是一个“鲜”，这是一种极致的、纯净的、天然的“鲜”，也是海产品又叫“海鲜”的原因，海鲜海鲜，吃的就是这个“鲜”味。大连海鲜之所以“鲜冠天下”，因为它鲜得霸道，鲜得直接，鲜得纯粹、鲜得绵长、鲜得魔幻。大连海鲜的“鲜”来自两个方面：一是吃起来味道鲜，另一是海鲜的品质新鲜，吃起来更鲜。由于大连三面临海，市场上出售的海鲜一般都出水时间比较短，新鲜度比较好。大连地处北温带，可以说是我国沿海最北边的城市之一，海水冬季平均温度1℃~2℃，夏季则达到20℃以上，近海年平均水温在10℃左右，加之大连又在黄、渤海冷暖水交界带，许多冷水性的海鲜只有大连附近才有。正是因为这样独特的气候条件，长年生活在这种低温、周年温差大的海水中，海产品的生长速度相对放缓，营养成分积累较为丰富，从而产生独特的“鲜”味来，才使得出产在这里的海参、鲍鱼、虾夷、扇贝、裙带菜等能成为同类海产品中的极品。专家还认为，在海水盐分高、含盐量24％~35％的海水中生长的海产品味道最鲜美，特殊的海洋生长环境让它具有比陆地食物更多的生物活性成分和质感，而大连附近沿海的含盐量均在30％左右，盐度垂直分布一致，因而蕴育了举世闻名的大连海“鲜”，连几百年前的医药大师李时珍都称赞“品质极佳”。</p>
    <p>“天下海鲜在大连”、“大连海鲜鲜天下”,大连海鲜以鲜美闻名于世，天下皆知。轻轻放一块在口里，最美的是它那柔软的肌肉，饱满的汁液，嫩嫩的、滑滑的口感，总是让人心惜，舍不得一口吞下；最绝的是那一个“鲜”：这是“活”的“鲜”，那一缕“鲜”气，先在舌尖融化，然后浸满全身，于是整个人都清爽了、滋润了、鲜溜了。大连海鲜的绝美，岂一个“鲜”字了得，那个“鲜”啊，冰莹剔透，涤心荡肺，美轮美奂，一朝品尝，感觉三日饶舌不尽，令人大有吃大连海鲜而绝天下鲜的魅力。</p>
    <p>大连人崇尚海鲜的自然与营养，并将这种健康的饮食习惯，作为世袭的养生理念一代代传承着。都说大连的海里有“仙”，因而海里才有了“鲜”。生活在“仙”世界的“鲜”，依附风光绮旎的海洋，顺应天地，集日月之精华，天生、天养、天成，怎不叫人倾心向往……</p>
    <p>大连海鲜的鲜味，还孕育了大连人的性格和情感。许是海鲜吃多了（大连人年均消费海鲜量是全国平均值的10倍），大连人说话厚重粗犷，干脆直接，被称为“海蛎子味”；大连人性格豪迈直爽，义气干云，像大海一样刚毅奔放；大连女人白皙粉嫩，浪漫雅致，那是被海鲜养出来的尤物……一个“鲜”字，养出了大连的风情万种，浪漫时尚， 孕育了大连的淳朴清新，醇香醉人。 </p>
    <p>“鲜”，也是大连这座城市的味道。</p>
    <p class="title">最自然主义的海鲜吃法</p>
    <p>爱海之地必是以浪漫清新为美，爱海之人必是以烹制海鲜见长。大连吃海鲜，有自己独道的食风食俗，很多吃法都让外地人震撼和惊讶，吃后却抚掌赞叹。大连人的海鲜美食观点是：对海产品而言，“鲜”就具有生食性特征，过分熟食化和复杂的烹调过程，反而会降低其鲜美度和营养价值，故“鲜”的特点，使海产品对烹调技术的依赖程度相对很低，象清水煮虾、清水蛤蜊、清蒸螃蟹、葱拌八带、鲜鱼汤、生鱼片……所以大连海鲜的吃法一般比较特别，即追求最质朴的原汁、原味、原色，海鲜用这种最自然主义的烹饪手法，就可以媲美与色香味俱全的人工烹调菜品，所以生猛活鲜是大连海产品最重要的食用特征。大连人甚至把海鲜的食用文化升华为一种哲学：海鲜重在鲜，对于真正的食客来说，海鲜食物最令人着迷的是那股真实的海水味，丰腴、优雅又带着粗犷，任何吃法，都比不上生吃，任何佐料，都比不上海水天然的佐伴，来自海洋的原味，才是最纯、最高、最隽永之味。海味的天然与精细需要我们以诚心对待，海味不难求，但谁能真正知其美，知其心 知其个中滋味？海到无边天作岸，万味归一自无味 ，大味无味，正如人生。</p>
    <p>在大连，吃海鲜绝对是一种平实中的奢华。说海鲜平实，是因为它外表敦厚，出身质朴，说海鲜奢华，则是因为它营养丰富，滋身养人，用“宴席佳肴、滋补珍品”来形容它绝不为过。海鲜菜流传至今，浓缩凝聚了上千年的文化精髓，彰显无尽的海洋魄力，味道也鲜美无比，天下独步，而海鲜菜的品相艺术，更是惟妙惟肖、精彩绝伦，让人在未品尝之前就已拥有一份难得的好心情。</p>
    <p>爱海恋鲜，是海边人永远戒不掉的“瘾”，而那些海鲜背后丰富多彩的营养价值，倒是成了心上与舌尖外的额外馈赠。蚬子、牡蛎、海虹、黄鱼、带鱼、乌贼……品类繁多、鲜味各异的小海鲜当然是餐桌上必备的一道佳肴，从最初的海鲜市场选材用料开始，到刀工火候、配料蘸料乃至菜的色、香、味、形等方面，丝毫不能马虎。比如一道家常辣炒花蚬，出锅时清澈的鲜味铺面而来，口水顿时泛滥成灾，从骨髓至味蕾一同被这道“鲜”唤醒，这是大海对寻常老百姓的恩赐，那鲜嫩无比的蚬肉，浸满壳内的汁水，不知不觉地一个接上一个，好不欢愉。蚬子肉味甘、咸，性寒，具有清热解毒、补阴除烦、益肾利水、解酒毒等功效，特别是对因放射疗法、化学疗法产生的口干烦热等症有一定的疗效。蚬子除了含大量蛋白质和钙以外，还富含碘、硒、锌、锰等微量元素，常食蚬子，更有益于脑子的营养补充，有健脑益智的作用。小海鲜养生的创造，应归功于那些平民百姓，他们未必个个都是美食家、营养师，却用极其简单的手法，烧得一手饱含营养价值的海鲜家常菜。海鲜养生文化的渊源，也是通过他们的双手融会贯通，即便知其然不知其所以然，这信手拈来美味营养，还是深得民意。正如“治大国若烹小鲜”的说法，越是简单、轻而易举的，反而越能见真章。那些数不胜数的小海鲜美味，稍加烹饪便可尽享美味又尽享健康，比如：大连人最喜欢吃的是鲅鱼馅饺子和鲅鱼肉丸子汤，其肉质细腻，味道鲜美，虽然不是特别名贵的菜肴，但却是一道独具风味的美食。很多人都吃过海参，但没有几个人吃过“生拌海参”，在大连很多饭店都可以吃到生拌海参，这种吃海参的方法也是别有风味。说是生拌海参，其实是将新鲜海参用沸水焯过以后再凉拌的，说熟还有一点脆生生的生鲜味，说生又是用沸水焯熟的。吃过生拌海参的人，会在他们脑海中留下深刻的印象。更特殊的还不是吃生拌海参，而是吃凉拌新鲜海蜇。新鲜海蜇体内95％是水分，而且是又苦又咸的海水，让你没想到的是，新鲜海蜇经厨师的一番调理，却像拌凉粉那样清爽可口，成为一道妙不可言的下酒菜。大连还有一道人人都能吃得起的特色菜——咸鱼饼子。咸鱼一般是用咸鲅鱼或咸偏口鱼蒸烤而成，饼子是用玉米面做的。咬一口金黄色香喷喷的玉米面饼子，再就一口香气四溢的咸鱼，那种感觉是只可品味而无法言表的。虽然这是一道大众菜，便宜实惠，几乎各饭店都能做出，但咸鱼配饼子的独特风味却只能在大连品尝到最地道鲜美的味道。</p>
    <p>说到海鲜菜品相，就不得不说到日本人，他们在饱食终日之时，把吃海鲜的过程，提炼成为向哲学靠拢的“料理”，有点在清风、明月、插花与器皿中求真理的意思。大连海鲜厨师则更胜一筹，把每一道海鲜菜都当作兢兢业业的功课，煞费苦心，一心追求着那令人拍案称绝的艺术效果，从精致的色彩搭配到合理的摆放格局，精美的食具、造型逼真多样的摆盘艺术，使人在享受海鲜菜的同时，不光满足了舌尖、肠胃，同时也满足了缤纷的视觉享受，欣赏到一件件精美的艺术品。当一席海鲜盛宴合盘托出，井然有序地布置在餐桌中央，瞬间就像揭开了蒙在某一尊珍藏艺术品上面的幕布，望之恬静纯美、别有洞天，入口不腻不燥、沁人心脾，加上清新怡然的心情，杂尘烦恼一扫而光，倍感舒畅。品吃愉快之鲜，赏析艺术之景，带着快意的心情，乐在其所。海鲜菜，将养生与健康简简单单的归纳到盘中，外从形，内从鲜。从外，不得不感叹厨师们精妙的超群技艺与运筹帷幄的色彩搭配，处处风景，处处情，只看着，便莫名的欢心。浅闻，眼前似能看见一片皎洁无比的蔚蓝色，慢慢的，那股鲜味便蔓延开来，如平静的海面吹起了绝细绝细的千万个粼粼的小皱纹，未曾下嘴，便已置身于海边、晒于初夏的阳光之下的，一片金光灿烂。入口，各种绝妙的滋味在口中绽放，是从没有过的味觉冲击，像汹涌的潮水，后浪推前浪，一排排白花花的潮水簇拥着盈满口腔，鲜美、香嫩至极。细品，似有温柔的风拂过沙滩，清新、舒爽。而且海鲜菜常常有不少新异有趣的别名，具有拟人色彩的别名尤为常见，如淡菜别名为东海夫人，大海的女儿；石首鱼别名称郎君鱼；黄蛤别称老婆牙；吹沙鱼别称新妇臂等。诗人就喜欢利用这些海鲜的别名，巧笔点化，造成谐趣横生的艺术效果。如姚燮《西沪棹歌》中的“软骨虾蛄谁与聘，郎君鲞自爵溪来”两句，真是异想天开，无理而妙。</p>
    <p>清人陈汝谐写过两首诗：“骨软膏柔嘴贱微，桂花时节最鲜肥。灵蛛不结青丝网，八足轻趱斗水飞”，“形如覆斗极离奇，逐浪双双每伏雌。剑客手劙珠满簏，一帆风送稻花时”，情调诙谐，笔致幽默，别出心裁的将北方海鲜的鲜美与内涵表现的生动透彻。碧海磅礴，海面上洒满金色的阳光，品类繁多的海鲜则成了镶嵌其间的点点素雅淡彩。鲜味袅袅、清雅如莲，海鲜已不仅仅是简单的美食滋味，它滋养了千种心情、万种体魄，让世人意犹未尽。海鲜集所有补益与一体，鲜醇如化不开的甜美梦境，相对其他食材，海鲜硬是多了一层让人怀念的海洋味道。也正是这种清新、绵鲜的味道，给海鲜带来了更加丰富的层次与口感，并且余韵幽长。细细品味，似乎牵引出心底里那一丝丝关于幸福的感觉，在大海的浓情里交织缠绕；醉人的醇香让人迷恋其中，久久无法忘怀……一味海鲜，浸润于口于心，便轻松地调动起所有味蕾的动力与想象力。</p>
    <p>啊，那充满阳光与蓝色气息的大连海鲜，美在双目绽放，鲜在舌尖交融，养在体内汇聚，为我们演绎了多少精致的“生活秀”，让我们从中体会了多少舌尖上的幸福和满足。</p>
        </div>
</div>

</body>
<@footer.render />
<!--导入footer-->
<@scrollTop.render />

</html>




