<div class="store-header">
    <img class="store-header-bg" src="/resources/basepage/seller/img/#storeId#/top1.jpg"/>

    
</div>
<script>
    $(function () {
        $.ww.getHeadTopInfo("#storeId#", "#storeTemplateCode#");
    });
</script>
<style>
   .store-header{
   	 width: 100%;
   	 height: 1.9rem;
   	 position: relative;
   	 overflow: hidden;
   }
   .store-header img{
   	 position: absolute;
   	 width: 100%;
   	 height: 100%;
   	 z-index: -1;
   }
   .store-header .goBack{
	   position: absolute;
	   left: 0.3rem;
       top:0.2rem;
	   width: 0.4rem;
	   height: 0.4rem;
	   background: url("/resources/basepage/seller/img/common/store_goBack.png") no-repeat center center;
	   background-size: contain;
   }
   .favStore{
   		width: 1.45rem;
   		height: 0.4rem;
   		line-height: 0.4rem;
   		background:#d01202;
   		color: #fff;
   		font-size: 0.24rem;
   		text-align: center;
   		margin-top:0.2rem;
   		margin-left: 4.65rem;
   		border-radius: 0.06rem;
   }
   .store-info-box{
   		color: #fff;
   		margin-top: 0.18rem;
        margin-left: 0.6rem;
   		font-size: 0.24rem;
   }
   .store-info-box img{
   	width: 0.31rem;
   	height: 0.31rem;
   }
   .store-name-box{
       margin-bottom: 0.04rem;   		
   }
   .store-name-box .store-name{
   	float: left;
   	font-size: 0.3rem;
   	max-width: 5rem;
   	white-space: nowrap;
   	overflow: hidden;
   	text-overflow: ellipsis;
   	float: left;
   }
   .store-name-box .store-level{
   	float: left;
   	margin-left: 0.1rem;
    margin-top: 0.08rem;
   }
   .store-name-box span img{
   		width: 0.31rem;
   		height: 0.31rem;
   }
   .store-name-box:after{
   	content: '.';
   	clear: both;
   	visibility: hidden;
   	height: 0;
   	display: block;
   }
   .store-info-box li{
   		float: left;
   		padding-right: 0.1rem;
   		border-right: 1px solid #fff;
   }
   .store-info-box ul :last-child{
   	 border:0;
   	}
   	.store-info-box ul :nth-child(2),.store-info-box ul :nth-child(3){
   		padding-left: 0.15rem;
   	}
</style>