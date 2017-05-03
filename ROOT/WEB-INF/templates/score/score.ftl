<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />

<#-- 导入通用模板 -->
<#import "/common/common_member_template.ftl" as common_member_template  />

<#-- 导入样式、脚本 -->
<#import "./fields/field_score_common_links.ftl" as field_score_common_links />
<#import "./fields/field_saleafter_score_scripts.ftl" as field_saleafter_score_scripts />
<#-- 导入主要内容 -->
<#import "./fields/field_saleafter_score_main.ftl" as field_saleafter_score_main />

<#-- 导入页脚内容  -->

<#-- 调用通用模板 [ 标题  | metas | 链接  | 脚本  | 主要内容  | 页脚  | 数据  ]-->
<@common_member_template.render "评价交易",[],[field_score_common_links],[field_saleafter_score_scripts],[field_saleafter_score_main],"score",[],data?? />
