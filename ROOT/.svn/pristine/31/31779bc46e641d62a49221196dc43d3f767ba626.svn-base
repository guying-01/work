<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />

<#-- 导入通用模板 -->
<#import "/common/common_seo_member_template.ftl" as common_member_template  />
<#import "/common/common_meta.ftl" as common_meta  />

<#-- 导入样式、脚本 -->
<#import "./fields/field_member_common_links.ftl" as field_member_common_links />
<#import "./fields/field_member_address_scripts.ftl" as field_member_address_scripts />

<#-- 导入主要内容 -->
<#import "./fields/field_member_address_add_common.ftl" as address_add_common />
<#import "./fields/field_member_address_add.ftl" as field_member_address_add />

<#-- 导入页脚内容  -->

<#-- 调用通用模板 [ 标题  | metas | 链接  | 脚本  | 主要内容  | 页脚  | 数据 | SEO数据  ]-->
<@common_member_template.render "${seoForm.title!''}",[common_meta],[field_member_common_links],[field_member_address_scripts],[address_add_common,field_member_address_add],"address",[],data??,seoForm?? />
