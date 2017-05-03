/**
 * Created by kuban on 2017/3/3.
 * 两个分类公用的静态json
 */
/*品牌厂家*/
function categoryBrand(){
    var data = [
        {
            "brand_name":"山东九联",
            "brand_href":"/fsst/101_00000000000000243_str/top.jhtml",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_brand1.png"
        },
        {
            "brand_name":"四川通威",
            "brand_href":"/fsst/101_00000000000000275_str/top.jhtml",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_brand2.png"
        },
        {
            "brand_name":"燕京啤酒",
            "brand_href":"/fsst/101_00000000000000289_str/top.jhtml",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_brand3.png"
        },
        {
            "brand_name":"武汉良之隆",
            "brand_href":"/fsst/101_00000000000000268_str/top.jhtml",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_brand4.png"
        },
        {
            "brand_name":"修正药业",
            "brand_href":"/fsst/101_00000000000000271_str/top.jhtml",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_brand5.png"
        },
        {
            "brand_name":"獐子岛",
            "brand_href":"/fsst/101_00000000000000298_str/top.jhtml",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_brand6.png"
        },
        {
            "brand_name":"光明乳业",
            "brand_href":"/fsst/101_00000000000000214_str/top.jhtml",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_brand7.png"
        },
        {
            "brand_name":"哇哈哈",
            "brand_href":"/fsst/101_00000000000000293_str/top.jhtml",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_brand8.png"
        },
        {
            "brand_name":"王致和",
            "brand_href":"/fsst/101_00000000000000346_str/top.jhtml",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_brand9.png"
        },
        {
            "brand_name":"元宝",
            "brand_href":"/fsst/101_00000000000000401_str/top.jhtml",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_brand10.png"
        },
        {
            "brand_name":"北大荒",
            "brand_href":"/fsst/101_00000000000000292_str/top.jhtml",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_brand11.png"
        },
        {
            "brand_name":"可口可乐",
            "brand_href":"####",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_brand12.png"
        },
        {
            "brand_name":"中粮",
            "brand_href":"/fsst/101_00000000000000315_str/top.jhtml",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_brand13.png"
        },
        {
            "brand_name":"泰国正大食品",
            "brand_href":"/fsst/101_00000000000000331_str/top.jhtml",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_brand14.jpg"
        },
        {
            "brand_name":"金龙鱼",
            "brand_href":"/fsst/101_00000000000000401_str/top.jhtml",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_brand15.png"
        },
        {
            "brand_name":"洪家鸡蛋",
            "brand_href":"/fsst/101_00000000000000258_str/top.jhtml",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_brand16.jpg"
        },
        {
            "brand_name":"大连电视台",
            "brand_href":"/fsst/101_00000000000000404_str/top.jhtml",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_brand17.png"
        }/*,
        {
            "brand_name":"双汇",
            "brand_href":"/fsst/101_00000000000000399_str/top.jhtml",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_brand18.jpg"
        }*/,
        {
            "brand_name":"百年东古",
            "brand_href":"/fsst/101_00000000000000346_str/top.jhtml",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_brand19.jpg"
        }
    ];

    var template_category_categoryBrand = $("#category_categoryBrand").html();
    var html = loadHandlebarsTemplate(template_category_categoryBrand, data);
    $(".page_yiji_wrap ul").html(html);
}
function fuel() {
    var data=[
        {
            "brand_name":"液体",
            "brand_href":"/page1/307_00000000000002542_gic.jhtml?name1=燃料类#tab0",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000002549_gic.jpg"
        },
        {
            "brand_name":"气体",
            "brand_href":"/page1/307_00000000000002542_gic.jhtml?name1=燃料类#tab1",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000002546_gic.jpg"
        },
        {
            "brand_name":"木炭",
            "brand_href":"/page1/307_00000000000002542_gic.jhtml?name1=燃料类#tab2",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000002544_gic.jpg"
        },
        {
            "brand_name":"固体",
            "brand_href":"/page1/307_00000000000002542_gic.jhtml?name1=燃料类#tab3",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000002554_gic.jpg"
        }
    ];
    var template_category_categoryBrand = $("#category_fuel").html();
    var html = loadHandlebarsTemplate(template_category_categoryBrand, data);
    $(".page_yiji_wrap ul").html(html);
}
/*维修保养*/
function service() {
    var data=[
        {
            "brand_name":"电器",
            "brand_href":"/page1/307_00000000000002606_gic.jhtml?name1=维修保养#tab0",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000002675_gic.jpg"
        },
        {
            "brand_name":"餐具",
            "brand_href":"/page1/307_00000000000002606_gic.jhtml?name1=维修保养#tab1",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000003260_gic.jpg"
        },
        {
            "brand_name":"电梯",
            "brand_href":"/page1/307_00000000000002606_gic.jhtml?name1=维修保养#tab2",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000002698_gic.jpg"
        },
        {
            "brand_name":"地板",
            "brand_href":"/page1/307_00000000000002606_gic.jhtml?name1=维修保养#tab3",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000003315_gic.jpg"
        },
        {
            "brand_name":"制冷设备",
            "brand_href":"/page1/307_00000000000002606_gic.jhtml?name1=维修保养#tab4",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000003342_gic.jpg"
        },
        {
            "brand_name":"水管",
            "brand_href":"/page1/307_00000000000002606_gic.jhtml?name1=维修保养#tab5",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000002821_gic.jpg"
        },
        {
            "brand_name":"布草",
            "brand_href":"/page1/307_00000000000002606_gic.jhtml?name1=维修保养#tab6",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000003288_gic.jpg"
        },
        {
            "brand_name":"万能工",
            "brand_href":"/page1/307_00000000000002606_gic.jhtml?name1=维修保养#tab7",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000003380_gic.jpg"
        },
        {
            "brand_name":"炉具",
            "brand_href":"/page1/307_00000000000002606_gic.jhtml?name1=维修保养#tab8",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000002828_gic.jpg"
        },
        {
            "brand_name":"电子",
            "brand_href":"/page1/307_00000000000002606_gic.jhtml?name1=维修保养#tab9",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000002874_gic.jpg"
        },
        {
            "brand_name":"下水管道",
            "brand_href":"/page1/307_00000000000002606_gic.jhtml?name1=维修保养#tab10",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000003359_gic.jpg"
        },
        {
            "brand_name":"机械",
            "brand_href":"/page1/307_00000000000002606_gic.jhtml?name1=维修保养#tab11",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000002889_gic.jpg"
        },
        {
            "brand_name":"家具",
            "brand_href":"/page1/307_00000000000002606_gic.jhtml?name1=维修保养#tab12",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000003329_gic.jpg"
        },
        {
            "brand_name":"排烟罩油烟机清洗维修",
            "brand_href":"/page1/307_00000000000002606_gic.jhtml?name1=维修保养#tab13",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000009156_gic.jpg"
        }
    ];
    var template_category_categoryBrand = $("#category_categoryService").html();
    var html = loadHandlebarsTemplate(template_category_categoryBrand, data);
    $(".page_yiji_wrap ul").html(html);
}
/*酒店专业装修*/
function h_service() {
    var data=[
        {
            "brand_name":"地面",
            "brand_href":"/page1/307_00000000000000236_gic.jhtml?name1=酒店专业装修#tab0",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000000238_gic.jpg"
        },
        {
            "brand_name":"包房",
            "brand_href":"/page1/307_00000000000000236_gic.jhtml?name1=酒店专业装修#tab1",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000000285_gic.jpg"
        },
        {
            "brand_name":"通排风",
            "brand_href":"/page1/307_00000000000000236_gic.jhtml?name1=酒店专业装修#tab2",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000000259_gic.jpg"
        },
        {
            "brand_name":"厨房",
            "brand_href":"/page1/307_00000000000000236_gic.jhtml?name1=酒店专业装修#tab3",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000000239_gic.jpg"
        },
        {
            "brand_name":"墙体",
            "brand_href":"/page1/307_00000000000000236_gic.jhtml?name1=酒店专业装修#tab4",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000000243_gic.jpg"
        },
        {
            "brand_name":"大厅",
            "brand_href":"/page1/307_00000000000000236_gic.jhtml?name1=酒店专业装修#tab5",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000000269_gic.jpg"
        },
        {
            "brand_name":"卫浴",
            "brand_href":"/page1/307_00000000000000236_gic.jhtml?name1=酒店专业装修#tab6",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000000245_gic.jpg"
        },
        {
            "brand_name":"餐厅",
            "brand_href":"/page1/307_00000000000000236_gic.jhtml?name1=酒店专业装修#tab7",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000000289_gic.jpg"
        },
        {
            "brand_name":"吊顶",
            "brand_href":"/page1/307_00000000000000236_gic.jhtml?name1=酒店专业装修#tab8",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000000253_gic.jpg"
        },
        {
            "brand_name":"门窗",
            "brand_href":"/page1/307_00000000000000236_gic.jhtml?name1=酒店专业装修#tab9",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000000250_gic.jpg"
        },
        {
            "brand_name":"水电",
            "brand_href":"/page1/307_00000000000000236_gic.jhtml?name1=酒店专业装修#tab10",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000000256_gic.jpg"
        },
        {
            "brand_name":"整体装修",
            "brand_href":"/page1/307_00000000000000236_gic.jhtml?name1=酒店专业装修#tab11",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000008679_gic.jpg"
        }
    ];
    var template_category_categoryBrand = $("#category_hotel_Service").html();
    var html = loadHandlebarsTemplate(template_category_categoryBrand, data);
    $(".page_yiji_wrap ul").html(html);
}
/*产地直供*/
function directSupply(){
    var data = [
        {
            "brand_name":"瓦房店",
            "brand_href":"/page1/307_00000000000000374_gic.jhtml?name1=产地直供#tab0",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000009109_gic.jpg"
        }/*,
        {
            "brand_name":"东港",
            "brand_href":"/others/comingSoon_2th.jhtml",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000009111_gic.jpg"
        },
        {
            "brand_name":"长海县",
            "brand_href":"/others/comingSoon_2th.jhtml",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000009110_gic.jpg"
        }*/,
        {
            "brand_name":"庄河",
            "brand_href":"/page1/307_00000000000000374_gic.jhtml?name1=产地直供#tab1",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000009113_gic.jpg"
        }/*,
        {
            "brand_name":"岫岩",
            "brand_href":"/others/comingSoon_2th.jhtml",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000009112_gic.jpg"
        },
        {
            "brand_name":"普兰店",
            "brand_href":"/others/comingSoon_2th.jhtml",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000009115_gic.jpg"
        },
        {
            "brand_name":"旅顺",
            "brand_href":"/others/comingSoon_2th.jhtml",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000009114_gic.jpg"
        }*/
    ];

    var template_category_categoryBrand = $("#category_categoryDirect").html();
    var html = loadHandlebarsTemplate(template_category_categoryBrand, data);
    $(".page_yiji_wrap ul").html(html);
}
/*餐饮名店特色菜*/
function nongJia(){
    var data = [
        {
            "brand_name":"食国列传",
            "brand_href":"/others/comingSoon_2th.jhtml",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cpic_shiguo.jpg"
        }
    ];

    var template_category_categoryBrand = $("#category_categoryNongJia").html();
    var html = loadHandlebarsTemplate(template_category_categoryBrand, data);
    $(".page_yiji_wrap ul").html(html);
}
/*进口免税*/
function taxExemption(){
    var data = [
        {
            "brand_name":"进口海鲜",
            "brand_href":"/FSgoodsSearch.jhtml?level1=307_00000000000009135_gic&name1=跨境产品&level2=307_00000000000009136_gic&name2=进口海鲜&level3=307_00000000000009149_gic&name3=进口海鲜",
            "brand_img"	:"/resources/basepage/store/default/category_navigation/img/cg_307_00000000000009136_gic.jpg"
        }
    ];

    var template_category_taxExemption = $("#category_taxExemption").html();
    var html = loadHandlebarsTemplate(template_category_taxExemption, data);
    $(".page_yiji_wrap ul").html(html);
}
/*第234批次上线*/
function comingSoon(lv1_id){
    var lv1_id = lv1_id ;
    if(lv1_id == "307_00000000000003414_gic"|| lv1_id == "307_00000000000000241_gic" || lv1_id =="307_00000000000002542_gic" || lv1_id =="307_00000000000003675_gic" || lv1_id=="307_00000000000003171_gic" || lv1_id=="307_00000000000004793_gic" || lv1_id=="307_00000000000002618_gic"){
        $(".page_yiji_wrap ul a").attr("href","/others/comingSoon_2th.jhtml");
    }
    if(lv1_id == "307_00000000000004089_gic" || lv1_id == "307_00000000000005535_gic" ||  lv1_id =="307_00000000000000382_gic" || lv1_id == "307_00000000000000390_gic" || lv1_id == "307_00000000000005895_gic" || lv1_id == "307_00000000000002200_gic" || lv1_id == "307_00000000000002238_gic"  || lv1_id == "307_00000000000001166_gic" || lv1_id=="307_00000000000000297_gic" || lv1_id=="307_00000000000000332_gic"){
        $(".page_yiji_wrap ul a").attr("href","/others/comingSoon_3th.jhtml");
    }
    if(lv1_id == "307_00000000000005479_gic" || lv1_id == "307_00000000000006104_gic"){
        $(".page_yiji_wrap ul a").attr("href","/others/comingSoon_4th.jhtml");
    }
}

function formatData_category(data) {
    var result = {};
    result["lv1"] = {};
    result["lv2_lv3"] = [];
    var lv2 = [];
    var lv3 = [];
    for (var i in data) {
        if (data[i].grade == 1) {
            result["lv1"] = data[i];
        }
        if (data[i].grade == 2) {
            lv2.push(data[i]);
        }
        if (data[i].grade == 3) {
            lv3.push(data[i]);
        }
    }
    for (var i in lv2) {
        var tempArr = [];
        var tempObj = {"lv2": lv2[i]};
        for (var j in lv3) {
            if (lv2[i].id == lv3[j].parentId) {
                tempArr.push(lv3[j]);
            }
        }
        tempObj["lv3"] = tempArr;
        result["lv2_lv3"].push(tempObj);
    }
    return result;
}
