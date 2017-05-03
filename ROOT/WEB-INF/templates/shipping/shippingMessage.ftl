<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />

<#-- 导入通用模板 -->
<#import "/common/common_template.ftl" as common_template  />

<#-- 导入样式、脚本 -->
<#import "./fields/field_shipping_links.ftl" as field_shipping_links />
<#import "./fields/field_shipping_scripts.ftl" as field_shipping_scripts />

<#-- 导入主要内容 -->
<#import "./fields/field_shipping_message.ftl" as field_shipping_message />

<#-- 导入页脚内容  -->

<#-- 调用通用模板 [ 标题  | metas | 链接  | 脚本  | 主要内容  | 页脚  | 数据  ]-->
<@common_template.render "物流动态",[],[field_shipping_links],[field_shipping_scripts],[field_shipping_message],[],data?? />