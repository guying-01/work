<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />

<#-- 导入通用（用户中心）模板 -->
<#import "/common/common_seo_member_template.ftl" as common_member_template  />
<#import "/common/common_meta.ftl" as common_meta  />

<#-- 导入样式、脚本 -->
<#import "./fields/field_member_detail_edit_links.ftl" as field_member_detail_edit_links />
<#import "./fields/field_member_detail_edit_scripts.ftl" as field_member_detail_edit_scripts />

<#-- 导入主要内容 -->
<#import "./fields/field_member_detail_edit2b.ftl" as field_member_detail_edit />
<#-- 导入页脚内容  -->

<#-- 调用通用（用户中心）模板 [ 标题 | metas | 链接 | 脚本 | 主要内容  | 左侧导航栏 | 页脚 | 数据 | SEO数据  ]-->
<@common_member_template.render "采购商资料",[common_meta],[field_member_detail_edit_links],[field_member_detail_edit_scripts],[field_member_detail_edit],"",[],data??,seoForm?? />
