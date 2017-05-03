<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />

<#-- 导入通用模板 -->
<#import "/common/common_member_template.ftl" as common_member_template  />

<#-- 导入样式、脚本 -->
<#import "./fields/field_confirm_receive_success_message_links.ftl" as field_confirm_receive_success_message_links />
<#import "./fields/confirm_gene_send_back_success_scripts.ftl" as confirm_gene_send_back_success_scripts />

<#-- 导入主要内容 -->
<#import "./fields/field_gene_send_back_success_main.ftl" as field_gene_send_back_success_main />

<#-- 导入页脚内容  -->

<#-- 调用通用模板 [ 标题  | metas | 链接  | 脚本  | 主要内容  | 页脚  | 数据  ]-->
<@common_member_template.render "确认基因样品回寄成功",[],[field_confirm_receive_success_message_links],[confirm_gene_send_back_success_scripts],[field_gene_send_back_success_main],"order",[],data?? />