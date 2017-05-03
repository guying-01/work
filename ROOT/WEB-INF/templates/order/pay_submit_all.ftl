<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />

<#-- 导入通用模板 -->
<#import "/common/common_template.ftl" as common_template  />

<#-- 导入样式、脚本 -->
<#import "./fields/field_pay_submit_links.ftl" as field_pay_submit_links />
<#import "./fields/field_pay_submit_scripts.ftl" as field_pay_submit_scripts />

<#-- 导入主要内容 -->
<#import "./fields/field_pay_submit.ftl" as field_pay_submit />

<#-- 调用通用模板 [ 标题  | metas | 链接  | 脚本  | 主要内容  | 页脚  | 数据  ]-->
<@common_template.render "支付订单",[],[field_pay_submit_links],[field_pay_submit_scripts],[field_pay_submit],[],data?? />
