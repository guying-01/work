<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />

<#-- 导入通用模板 -->
<#import "/common/common_seo_template.ftl" as common_template  />
<#import "/common/common_meta.ftl" as common_meta  />

<#-- 导入样式、脚本 -->
<#import "./fields/field_goods_search_links.ftl" as field_goods_search_links />
<#import "./fields/field_goods_search_scripts.ftl" as field_goods_search_scripts />

<#-- 导入主要内容 -->
<#import "./fields/field_goods_search.ftl" as field_goods_search />

<#-- 导入页脚内容  -->

<#-- 调用通用模板 [ 标题  | metas | 链接  | 脚本  | 主要内容  | 页脚  | 数据  | SEO数据 ]-->
<@common_template.render "${seoForm.title!''}", [common_meta],[field_goods_search_links],[field_goods_search_scripts],[field_goods_search],[],data??,seoForm?? />