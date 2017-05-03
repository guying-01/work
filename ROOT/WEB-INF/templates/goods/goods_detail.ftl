<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />

<#-- 导入通用（用户中心）模板 -->
<#import "/common/common_seo_template.ftl" as common_template  />
<#import "/common/common_meta.ftl" as common_meta  />

<#-- 导入样式、脚本 -->
<#import "./fields/field_goods_detail_links.ftl" as field_goods_detail_links />
<#import "./fields/field_goods_detail_scripts.ftl" as field_goods_detail_scripts />

<#import "/common/fields/field_common_store_scripts.ftl" as field_common_store_scripts  />

<#-- 导入主要内容 -->
<#import "./fields/field_goods_detail.ftl" as field_goods_detail />

<#-- 导入页脚内容  -->
<#import "./fields/field_goods_detail_foot.ftl" as field_goods_detail_foot />

<#-- meta -->
<#import "/common/common_meta.ftl" as field_meta />

<#-- 调用通用（用户中心）模板 [ 标题 | metas | 链接 | 脚本 | 主要内容  | 左侧导航栏 | 页脚 | 数据  | SEO数据 ]-->
<@common_template.render "${seoForm.title!''}", [common_meta],[field_goods_detail_links],[field_goods_detail_scripts],[field_goods_detail,field_common_store_scripts,field_goods_detail_foot],"",data,seoForm??/>