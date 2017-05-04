/**
 * Created by Administrator on 2015/11/3.
 */

//购物车
makerApp.controller('shoppingCartController', ['$scope', '$http', '$state', '$ionicViewSwitcher',
    'shoppingCartServices', 'popupAlertUtil', 'messageService', 'UrlService', 'userService','$ionicHistory',
    function ($scope, $http, $state, $ionicViewSwitcher, shoppingCartServices, popupAlertUtil, messageService,
              UrlService, userService,$ionicHistory) {
        /** 定义变量 */
        $scope.shoppingCartData = []; //购物车list
        $scope.isCheck = true; //全选按钮 true 选中  false: 为选中
        var channelId = {
            channelId: '10'
        };
        $scope.$on('$ionicView.beforeEnter', function () {
            //$scope.initShoppingCartInfo;
        });
        document.getElementById("btn").disabled = true;
        //加载页面数据
        $scope.initShoppingCartInfo = function () {
            shoppingCartServices.getShoppingCartInfo(channelId).then(function (shopCartJson) {
                console.log(shopCartJson);
                $scope.shopCartJson = shopCartJson;
                if ($scope.shopCartJson.success) {
                    if($scope.shopCartJson.resultStatusCode == 'E4000'){
                        popupAlertUtil.p_confirm_popup('提示', '您还未登录，请先登录').then(function (obj) {
                            if (obj) {
                                $state.go('loginViews');
                            }else{
                                if (!$ionicHistory.backView()) {
                                    $state.go('home');
                                } else {
                                    $ionicHistory.goBack();
                                }
                            }
                        });
                        return;
                    }
                    /** 拿出所有item  */
                    for(var i = 0; i < $scope.shopCartJson.result.length; i++){
                        if($scope.shopCartJson.result[i].list){
                            for (var j = 0; j < $scope.shopCartJson.result[i].list.length; j++) {
                                $scope.shoppingCartData.push($scope.shopCartJson.result[i].list[j]);
                                //除了失效的商品其他的商品都是选中状态
                                /*if ($scope.shopCartJson.result[i].list[j].isChecked == 0 && $scope.shopCartJson.result[i].list[j].isEnabled != 0) {
                                    $scope.isCheck = false;
                                }*/
                            }
                        }
                    }
                    /** 有效失效商品分组**/
                    $scope.shoppingCartData_eff=[];//有效组
                    $scope.shoppingCartData_inv=[];//失效组
                    var e_num=0;
                    var i_num=0;
                    var e_storeid=[];
                    var i_storeid=[];
                    for (var key in $scope.shoppingCartData){
                        if($scope.shoppingCartData[key].isEnabled==1){
                            e_storeid.push($scope.shoppingCartData[key].storeId);
                            $scope.shoppingCartData_eff.push($scope.shoppingCartData[key]);
                            e_num++;
                        }
                        else if($scope.shoppingCartData[key].isEnabled==0) {
                            i_storeid.push($scope.shoppingCartData[key].storeId);
                            $scope.shoppingCartData_inv.push($scope.shoppingCartData[key]);
                            i_num++;
                        }
                    }
                    /*同店铺分组*/
                    /*去重*/
                    function unique (arr) {
                        return Array.from(new Set(arr))
                    }
                    e_storeid=unique(e_storeid);
                    i_storeid=unique(i_storeid);
                    /*有效组重组格式*/
                    var json_e={};
                    for(var i=0;i<e_storeid.length;i++){
                        var goodslist=[];
                        var storename;
                        for(var key in $scope.shoppingCartData_eff){
                            if($scope.shoppingCartData_eff[key].storeId==e_storeid[i]){
                                goodslist.push($scope.shoppingCartData_eff[key]);
                                storename=$scope.shoppingCartData_eff[key].storeName;
                            }
                        }
                        var a={};
                        a[i]={
                            storeid:e_storeid[i],
                            storename:storename,
                            goodslist:goodslist
                        };
                        json_e=jQuery.extend(json_e,a);
                    }
                    $scope.shoppingCartData_eff=json_e;
                    /*对购物车中商品数量与库存进行对比，大于库存时进行抹平*/
                    for(var key in $scope.shoppingCartData_eff){
                        for(var key_in in $scope.shoppingCartData_eff[key].goodslist){
                            if($scope.shoppingCartData_eff[key].goodslist[key_in].amount>$scope.shoppingCartData_eff[key].goodslist[key_in].localStock){
                                $scope.shoppingCartData_eff[key].goodslist[key_in].amount=$scope.shoppingCartData_eff[key].goodslist[key_in].localStock;
                            }
                        }
                    }
                    /*失效组重组格式*/
                    var json_i={};
                    for(var i=0;i<i_storeid.length;i++){
                        var goodslist=[];
                        var storename;
                        for(var key in $scope.shoppingCartData_inv){
                            if($scope.shoppingCartData_inv[key].storeId==i_storeid[i]){
                                goodslist.push($scope.shoppingCartData_inv[key]);
                                storename=$scope.shoppingCartData_inv[key].storeName;
                            }
                        }
                        var a={};
                        a[i]={
                            storeid:i_storeid[i],//用于跳转商铺
                            storename:storename,//用于显示商铺名称
                            goodslist:goodslist
                        };
                        json_i=jQuery.extend(json_i,a);
                    }
                    $scope.shoppingCartData_inv=json_i;
                    $scope.ifnull=false;//失效商品  字样显示
                    for(var inv_key in $scope.shoppingCartData_inv){
                        $scope.ifnull=true;
                    }
                    /*初始化全选*/
                    for(var key in $scope.shoppingCartData_eff){
                        $scope.shoppingCartData_eff[key].isChecked=1;
                        for(var key_i in $scope.shoppingCartData_eff[key].goodslist){
                            $scope.shoppingCartData_eff[key].goodslist[key_i].isChecked=1;
                        }
                    }
                    /** 如果是组合商品加一波处理 */
                    /*for(var i = 0; i < $scope.shoppingCartData.length; i++){
                        $scope.shoppingCartData[i].zuheList = [];
                        if($scope.shoppingCartData[i].goodsId.indexOf('#') != -1){
                            var goodsIdArr =  $scope.shoppingCartData[i].goodsId.split('#');
                            var goodsNameArr =  $scope.shoppingCartData[i].goodsName.split('#');
                            var itemIdArr =  $scope.shoppingCartData[i].itemId.split('#');
                            var itemNameArr =  $scope.shoppingCartData[i].itemName.split('#');
                            var smallPicturePathArr =  $scope.shoppingCartData[i].smallPicturePath.split('#');
                            var standardArr =  $scope.shoppingCartData[i].standard.split('#');
                            /!** 把组合单品放到购物车主商品的 zuheList 中 *!/
                            for(var j = 0; j < goodsIdArr.length; j++){
                                //如果不是主商品
                                if(j != 0){
                                    var tem = {};
                                    tem.goodsId = goodsIdArr[j];
                                    tem.goodsName = goodsNameArr[j];
                                    tem.itemId = itemIdArr[j];
                                    tem.itemName = itemNameArr[j];
                                    tem.smallPicturePath = smallPicturePathArr[j];
                                    $scope.shoppingCartData[i].zuheList.push(tem);
                                }
                            }
                            $scope.shoppingCartData[i].goodsId = goodsIdArr[0];
                            $scope.shoppingCartData[i].goodsName = goodsNameArr[0];
                            $scope.shoppingCartData[i].itemId = itemIdArr[0];
                            $scope.shoppingCartData[i].itemName = itemNameArr[0];
                            $scope.shoppingCartData[i].smallPicturePath = smallPicturePathArr[0];
                            $scope.shoppingCartData[i].standard = standardArr[0];
                        }
                    }
                    console.log($scope.shoppingCartData);*/
                }
                $scope.calPrice();
                calCount();
            });
        };
        $scope.initShoppingCartInfo();

        //增加选购商品数量
        $scope.cartOnPlus = function (shopIndex,goodsIndex, goodsId, count) {
            $scope.addGoods = {
                id: goodsId,
                amount: count
            };
            var addParam = {
                id: $scope.addGoods.id,
                amount: count
            };
            var shopCartSubmit = {
                ids: [],
                goodsIds: [],
                goodsNames: [],
                itemIds: [],
                amounts: [],
                isCheckeds: [],
                isEnableds: []
            };
            var  isValidate = true;
            if(!(/^\d+$/.test($scope.shoppingCartData_eff[shopIndex].goodslist[goodsIndex].amount))) {//xuf 当不是数字
                isValidate = false;
            }
            shopCartSubmit.ids.push($scope.shoppingCartData_eff[shopIndex].goodslist[goodsIndex].id);
            shopCartSubmit.goodsIds.push($scope.shoppingCartData_eff[shopIndex].goodslist[goodsIndex].goodsId);
            shopCartSubmit.goodsNames.push($scope.shoppingCartData_eff[shopIndex].goodslist[goodsIndex].goodsName);
            shopCartSubmit.itemIds.push($scope.shoppingCartData_eff[shopIndex].goodslist[goodsIndex].itemId);
            shopCartSubmit.amounts.push($scope.shoppingCartData_eff[shopIndex].goodslist[goodsIndex].amount+1);//数量+1进行判断
            shopCartSubmit.isCheckeds.push($scope.shoppingCartData_eff[shopIndex].goodslist[goodsIndex].isChecked);
            if ($scope.shoppingCartData_eff[shopIndex].goodslist[goodsIndex].isEnabled == 0) {
                shopCartSubmit.isEnableds.push($scope.shoppingCartData_eff[shopIndex].goodslist[goodsIndex].id);
            }
            if(!isValidate){ // xuf
                popupAlertUtil.p_alert_example('提示','购物车数量请输入纯数字！');
                return ;
            }
            shoppingCartServices.getShoppingCartBalanceInfo(shopCartSubmit).then(function (data) {
                // console.log(data);
                if (data.success) {
                    shoppingCartServices.getShoppingCartAddCountINfo(addParam).then(function (data) {
                        if (data.success) {
                            $scope.shoppingCartData_eff[shopIndex].goodslist[goodsIndex].amount++;
                            $scope.calPrice();
                            calCount();
                        }else{
                            popupAlertUtil.p_alert_example('提示',data.resultStatusMessage);
                        }
                    });

                } else {
                    popupAlertUtil.p_alert_example('提示', "已达库存最大上限");
                }
            });

        };

        //减少选购商品数量
        $scope.cartOnMinus = function (shopIndex,goodsIndex, goodsId, count) {
            if($scope.shoppingCartData_eff[shopIndex].goodslist[goodsIndex].amount==1){
                popupAlertUtil.p_alert_example('提示','商品数量不可少于1');
            }
            else {
                $scope.reduceGoods = {
                    id: goodsId,
                    amount: count
                };
                if ($scope.shoppingCartData_eff[shopIndex].goodslist[goodsIndex] != 1) {
                    var reduceParam = {
                        id: $scope.reduceGoods.id,
                        amount: count
                    };
                    shoppingCartServices.getShoppingCartReduceCountINfo(reduceParam).then(function (data) {
                        if(data.success){
                            $scope.shoppingCartData_eff[shopIndex].goodslist[goodsIndex].amount--;
                            $scope.calPrice();
                            calCount();
                        }else{
                            popupAlertUtil.p_alert_example('提示',data.resultStatusMessage);
                        }
                    });
                }
            }
        };

        //改变复选框状态
        $scope.toggleCheck = function (shopIndex,goodsIndex) {//, goodsIndex
            //判断点击的复选框是否被选择
            //console.log($scope.shoppingCartData[shopIndex].isChecked);
            // console.log('shopIndex:'+shopIndex+',goodsIndex:'+goodsIndex);
            if ( $scope.shoppingCartData_eff[shopIndex].goodslist[goodsIndex].isChecked == 1) {
                //取消选中
                $scope.shoppingCartData_eff[shopIndex].goodslist[goodsIndex].isChecked = 0;
                $scope.shoppingCartData_eff[shopIndex].isChecked = 0;
            } else if ($scope.shoppingCartData_eff[shopIndex].goodslist[goodsIndex].isChecked == 0) {
                //选中
                $scope.shoppingCartData_eff[shopIndex].goodslist[goodsIndex].isChecked = 1;
                var num=0;
                for( var key in $scope.shoppingCartData_eff[shopIndex].goodslist){
                    if($scope.shoppingCartData_eff[shopIndex].goodslist[key].isChecked==0){
                        num++;
                    }
                }
                if(num>0){
                    $scope.shoppingCartData_eff[shopIndex].isChecked = 0;
                }
                else {
                    $scope.shoppingCartData_eff[shopIndex].isChecked = 1;
                }
            }
            //判断是否全被选中如果全选中了就改变一下全选按钮状态
            $scope.isCheck = true;
            for(var a_key in $scope.shoppingCartData_eff){
                for( var a_key_in in $scope.shoppingCartData_eff[a_key].goodslist){
                    if($scope.shoppingCartData_eff[a_key].goodslist[a_key_in].isChecked==0){
                        $scope.isCheck = false;
                    }
                }
            }
            /*判断店铺对应商铺全选*/
            for( var key in $scope.shoppingCartData_eff[shopIndex].goodslist){
                if($scope.shoppingCartData_eff[shopIndex].goodslist[key].isChecked==0){
                    $scope.shoppingCartData_eff[shopIndex].isChecked = 0;
                }
            }
            $scope.calPrice();
            calCount();
        };
        //跳转到详情界面
        $scope.toDetailViews = function (commodityId) {
            $state.go('commodityDetail', {commodityId: commodityId})
        };

        //全选按钮改变复选框状态
        $scope.toggleCheckAll = function () {
            //当前是选中状态
            if ($scope.isCheck) {
                //取消全选
                for(var key in $scope.shoppingCartData_eff){
                    $scope.shoppingCartData_eff[key].isChecked=0;
                    for(var key_i in $scope.shoppingCartData_eff[key].goodslist){
                        $scope.shoppingCartData_eff[key].goodslist[key_i].isChecked=0;
                    }
                }
                $scope.isCheck = false;
            } else {
                //全选
                for(var key in $scope.shoppingCartData_eff){
                    $scope.shoppingCartData_eff[key].isChecked=1;
                    for(var key_i in $scope.shoppingCartData_eff[key].goodslist){
                        $scope.shoppingCartData_eff[key].goodslist[key_i].isChecked=1;
                    }
                }
                $scope.isCheck = true;
            }
            $scope.calPrice();
            calCount();
        };

       //计算商品数量
        function calCount() {
            var sum = 0;
            for(var key in $scope.shoppingCartData_eff){
                for(var key_in in $scope.shoppingCartData_eff[key].goodslist){
                    if($scope.shoppingCartData_eff[key].goodslist[key_in].isChecked==1){
                        sum +=$scope.shoppingCartData_eff[key].goodslist[key_in].amount
                    }
                }
            }
            $scope.totalCount = sum;
            if ($scope.totalCount == 0) {
                document.getElementById("btn").disabled = true;
            } else {
                document.getElementById("btn").disabled = false;
            }
        }

        //计算价格
        $scope.calPrice = function () {
            var sum = 0;
            for(var key in $scope.shoppingCartData_eff){
                for(var key_in in $scope.shoppingCartData_eff[key].goodslist){
                    if($scope.shoppingCartData_eff[key].goodslist[key_in].isChecked==1){
                        sum +=$scope.shoppingCartData_eff[key].goodslist[key_in].amount*$scope.shoppingCartData_eff[key].goodslist[key_in].salesPrice;
                    }
                }
            }
            $scope.totalPrice = sum;
        };

        $scope.calPrice();
        //去结算
        $scope.confirmOrder = function () {
            if ($scope.totalCount == 0) {
                popupAlertUtil.p_alert_example('提示', '请选择商品').then(function (res) {
                    if (res) {
                        document.getElementById("btn").disabled = true;
                    }
                });
            } else {
                var shopCartSubmit = {
                    ids: [],
                    goodsIds: [],
                    goodsNames: [],
                    itemIds: [],
                    amounts: [],
                    isCheckeds: [],
                    isEnableds: []
                };
                var  isValidate = true;
                for(var key in $scope.shoppingCartData_eff){
                    for(var key_in in $scope.shoppingCartData_eff[key].goodslist){
                        if(!(/^\d+$/.test($scope.shoppingCartData_eff[key].goodslist[key_in].amount))) {//xuf 当不是数字
                            isValidate = false;
                        }
                        shopCartSubmit.ids.push($scope.shoppingCartData_eff[key].goodslist[key_in].id);
                        shopCartSubmit.goodsIds.push($scope.shoppingCartData_eff[key].goodslist[key_in].goodsId);
                        shopCartSubmit.goodsNames.push($scope.shoppingCartData_eff[key].goodslist[key_in].goodsName);
                        shopCartSubmit.itemIds.push($scope.shoppingCartData_eff[key].goodslist[key_in].itemId);
                        //对库存二次校验进行商品数量提交限制
                        if($scope.shoppingCartData_eff[key].goodslist[key_in].amount>$scope.shoppingCartData_eff[key].goodslist[key_in].localStock){
                            shopCartSubmit.amounts.push($scope.shoppingCartData_eff[key].goodslist[key_in].localStock);
                        }
                        else {
                            shopCartSubmit.amounts.push($scope.shoppingCartData_eff[key].goodslist[key_in].amount);
                        }
                        shopCartSubmit.isCheckeds.push($scope.shoppingCartData_eff[key].goodslist[key_in].isChecked);
                        if ($scope.shoppingCartData_eff[key].goodslist[key_in].isEnabled == 0) {
                            shopCartSubmit.isEnableds.push($scope.shoppingCartData_eff[key].goodslist[key_in].id);
                        }
                    }
                }
                /*angular.forEach($scope.shoppingCartData_eff, function (items) {
                    if(!(/^\d+$/.test(items.amount))) {//xuf 当不是数字 
                        isValidate = false;
                    }
                    shopCartSubmit.ids.push(items.id);
                    shopCartSubmit.goodsIds.push(items.goodsId);
                    shopCartSubmit.goodsNames.push(items.goodsName);
                    shopCartSubmit.itemIds.push(items.itemId);
                    shopCartSubmit.amounts.push(items.amount);
                    shopCartSubmit.isCheckeds.push(items.isChecked);
                    if (items.isEnabled == 0) {
                        shopCartSubmit.isEnableds.push(items.id);
                    }
                });*/
                // console.log(shopCartSubmit);
                if(!isValidate){ // xuf
                    popupAlertUtil.p_alert_example('提示','购物车数量请输入纯数字！');

                    return ;
                }
                shoppingCartServices.getShoppingCartBalanceInfo(shopCartSubmit).then(function (data) {
                    // console.log(data);
                    if (data.success) {
                        //清空本地缓存订单信息
                        userService.clearCommitOrderModel();
                        $state.go('confirmOrder', {goodsListModel: JSON.stringify(shopCartSubmit)});
                    } else {
                        popupAlertUtil.p_alert_example('提示', data.resultStatusMessage);
                    }
                });

            }
        };


        //删除按钮
        $scope.deleteGoodsList = function (parentIndex,index,str) {
            var id='';
            if(str=='eff'){id=$scope.shoppingCartData_eff[parentIndex].goodslist[index].id;}
            else if(str=='inv'){id=$scope.shoppingCartData_inv[parentIndex].goodslist[index].id;}
            var ids = {
                ids: []
            };
            popupAlertUtil.p_confirm_popup('提示消息', '确定删除该商品?').then(function (res) {
                if (res) {
                    ids.ids.push(id);
                    /*输出 修改数据库里的更新操作*/
                    shoppingCartServices.getShoppingCartDeleteInfo(ids).then(function (data) {
                        if (data.success) {
                            // 移除
                            if(str=='eff'){
                                if($scope.shoppingCartData_eff[parentIndex].goodslist.length<=1){
                                    $scope.shoppingCartData_eff[parentIndex]={};
                                }
                                else {
                                    $scope.shoppingCartData_eff[parentIndex].goodslist.splice(index, 1);
                                }
                            }
                            else if(str=='inv'){
                                if($scope.shoppingCartData_inv[parentIndex].goodslist.length<=1){
                                    $scope.shoppingCartData_inv[parentIndex]={};
                                    $scope.ifnull=false;
                                }
                                else {
                                    $scope.shoppingCartData_inv[parentIndex].goodslist.splice(index, 1);
                                }
                            }
                            //判断是否全被选中如果全选中了就改变一下全选按钮状态
                            $scope.isCheck = true;
                            for(var a_key in $scope.shoppingCartData_eff){
                                for( var a_key_in in $scope.shoppingCartData_eff[a_key].goodslist){
                                    if($scope.shoppingCartData_eff[a_key].goodslist[a_key_in].isChecked==0){
                                        $scope.isCheck = false;
                                    }
                                }
                            }
                            $scope.calPrice();//[shopIndex]
                            calCount();
                        }
                    })
                }
            })

        };
        //删除全部
        $scope.deleteAll = function () {
            var ids = {
                ids: []
            };
            /** 取出购物车id */
            for(var key in $scope.shoppingCartData_eff){
                for(var key_in in $scope.shoppingCartData_eff[key].goodslist){
                    if($scope.shoppingCartData_eff[key].goodslist[key_in].isChecked==1){
                        ids.ids.push($scope.shoppingCartData_eff[key].goodslist[key_in].id);
                    }
                }
            }
            if(ids.ids.length <= 0){
                popupAlertUtil.p_alert_example('提示','请选择要删除的商品！');
                return;
            }
            popupAlertUtil.p_confirm_popup('提示消息', '确定删除所有选中商品?').then(function (res) {
                if (res) {
                    shoppingCartServices.getShoppingCartDeleteInfo(ids).then(function (data) {
                        console.log(data);
                        if (data.success) {
                            // 移除
                            $scope.shoppingCartData.splice(0, $scope.shoppingCartData.length);//重置购物车里的数据，不然下个函数内没有重置
                            $scope.initShoppingCartInfo();
                        }
                    });
                    $scope.totalCount = 0;
                    $scope.totalPrice = 0;
                }
            });
        };
        /** 判断是否登录 */
        if (userService.getUsername() == "-1") {
            $state.go('loginViews');
        }
        /** 跳转商铺**/
        $scope.OnStore = function (storeId) {
            $state.go('store', {storeId: storeId});
        };
        /** 商铺全选复选框状态**/
        $scope.store_toggleCheck = function (storeIndex) {
            if($scope.shoppingCartData_eff[storeIndex].isChecked==1){
                for(var key in $scope.shoppingCartData_eff[storeIndex].goodslist){
                    $scope.shoppingCartData_eff[storeIndex].goodslist[key].isChecked=0;
                }
                $scope.shoppingCartData_eff[storeIndex].isChecked=0;
                $scope.isCheck = false;
            }
            else {
                for(var key in $scope.shoppingCartData_eff[storeIndex].goodslist){
                    $scope.shoppingCartData_eff[storeIndex].goodslist[key].isChecked=1;
                }
                $scope.shoppingCartData_eff[storeIndex].isChecked=1;
                //判断是否全被选中如果全选中了就改变一下全选按钮状态
                $scope.isCheck = true;
                for(var a_key in $scope.shoppingCartData_eff){
                    for( var a_key_in in $scope.shoppingCartData_eff[a_key].goodslist){
                        if($scope.shoppingCartData_eff[a_key].goodslist[a_key_in].isChecked==0){
                            $scope.isCheck = false;
                        }
                    }
                }
            }
            $scope.calPrice();
            calCount();
        }
    }]);
