<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />

<#-- 导入通用模板 -->

<#import "/common/common_template.ftl" as common_member_template  />

<#-- 导入样式、脚本 -->
<#import "./fields/field_order_submit_address_links.ftl" as links />
<#import "./fields/field_order_submit_address_scripts.ftl" as scripts />
<#import "./fields/field_order_submit_address.ftl" as main1 />
<#import "../member/fields/field_member_address_add_common.ftl" as main2 />


<#-- 调用通用模板 [ 标题  | metas | 链接  | 脚本  | 主要内容  | 页脚  | 数据  ]-->
<@common_member_template.render "提交订单",[],[links],[scripts],[main1,main2],[],data?? />
