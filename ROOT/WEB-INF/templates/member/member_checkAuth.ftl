<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />

<#-- 导入通用（用户中心）模板 -->
<#import "/common/common_seo_member_template.ftl" as common_member_template  />

<#-- 导入样式、脚本 -->
<#import "./fields/field_member_common_links.ftl" as links />
<#import "./fields/field_member_checkAuth_scripts.ftl" as scripts />
<#import "./fields/field_member_checkAuth.ftl" as main />


<#-- 调用通用（用户中心）模板 [ 标题 | metas | 链接 | 脚本 | 主要内容  | 左侧导航栏 | 页脚 | 数据  ]-->
<@common_member_template.render "安全设置",[],[links],[scripts],[main],"",[],data??,seoForm?? />
