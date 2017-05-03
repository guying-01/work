<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />

<#-- 导入通用（用户中心）模板 -->
<#import "/common/common_seo_member_template.ftl" as common_member_template  />
<#import "/common/common_meta.ftl" as common_meta  />

<#-- 导入样式、脚本 -->
<#import "./fields/inner_notify_common_links.ftl" as links />
<#import "./fields/inner_notify_list_script.ftl" as scripts />

<#import "./fields/inner_notify_list.ftl" as main />


<#-- 调用通用（用户中心）模板 [ 标题 | metas | 链接 | 脚本 | 主要内容  | 左侧导航栏 | 页脚 | 数据  ]-->
<@common_member_template.render "消息",[common_meta],[links],[scripts],[main],"",[],data??,seoForm??/>