<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />

<#-- 导入通用（用户中心）模板 -->
<#import "/common/common_seo_member_template.ftl" as common_template  />

<#-- 导入样式、脚本 -->
<#import "./fields/field_member_common_links.ftl" as field_member_common_links />
<#import "./fields/field_member_forgetPwdInputNew_scripts.ftl" as field_member_scripts />
<#-- 导入主要内容 -->

<#import "./fields/field_member_forgetPwdInputNew.ftl" as field_member_forgetPwdInit  />
<#-- 导入页脚内容  -->

<#-- 调用通用（用户中心）模板 [ 标题 | metas | 链接 | 脚本 | 主要内容  | 左侧导航栏 | 页脚 | 数据  ]-->
<@common_template.render "找回登录密码",[],[field_member_common_links],[field_member_scripts],[field_member_forgetPwdInit],"address",[],data??,seoForm?? />
