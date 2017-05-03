<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />

<#-- 导入通用模板 -->
<#--<#import "/common/common_seo_template.ftl" as common_template  />-->
<#import "/common/common_template.ftl" as common_template  />
<#import "/common/common_meta.ftl" as common_meta  />

<#-- 导入样式、脚本 -->
<#import "./fields/field_promotion_list_link.ftl" as field_promotion_list_link />
<#import "./fields/field_promotion_more_list_scripts.ftl" as field_promotion_more_list_scripts />

<#-- 导入主要内容 -->
<#import "./fields/field_promotion_more_list.ftl" as field_promotion_more_list />

<#-- 调用通用模板 [ 标题  | metas | 链接  | 脚本  | 主要内容  | 页脚  | 数据  | SEO数据 ]-->
<#--<@common_template.render "${seoForm.title!''}", [common_meta],[field_promotion_list_link],[field_promotion_list_scripts],[field_promotion_list],[],data??,seoForm?? />-->
<@common_template.render "营销活动商品",[],[field_promotion_list_link],[field_promotion_more_list_scripts],[field_promotion_more_list],[],data??/>