<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />

<#-- 导入通用模板 -->
<#import "/common/common_member_template.ftl" as common_member_template  />

<#-- 导入样式、脚本 -->
<#import "./fields/field_order_detail_message_links.ftl" as field_order_detail_message_links />
<#import "./fields/field_gene_send_back_scripts.ftl" as field_gene_send_back_scripts />

<#-- 导入主要内容 -->
<#import "./fields/field_gene_send_back_main.ftl" as field_gene_send_back_main />

<#-- 导入页脚内容  -->

<#-- 调用通用模板 [ 标题  | metas | 链接  | 脚本  | 主要内容  | 页脚  | 数据  ]-->
<@common_member_template.render "基因检测回寄",[],[field_order_detail_message_links],[field_gene_send_back_scripts],[field_gene_send_back_main],"order",[],data?? />
