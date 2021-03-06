<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />

<#-- 导入通用（用户中心）模板 -->
<#import "/common/common_member_template.ftl" as common_member_template  />

<#-- 导入样式、脚本 -->
<#import "./fields/field_member_common_links.ftl" as field_member_common_links />
<#import "./fields/field_member_browse_history_scripts.ftl" as field_member_browse_history_scripts />

<#-- 导入主要内容 -->
<#import "./fields/field_member_browse_history.ftl" as field_member_browse_history />
<#-- 导入页脚内容  -->

<#-- 调用通用（用户中心）模板 [ 标题 | metas | 链接 | 脚本 | 主要内容  | 左侧导航栏 | 页脚 | 数据  ]-->
<@common_member_template.render "浏览历史",[],[field_member_common_links],[field_member_browse_history_scripts],[field_member_browse_history],"history",[],data?? />