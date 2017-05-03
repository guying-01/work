<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />
<#assign status=updateStatus?string/><#--不明白updateStatus的数据类型为什么为"命名空间"，需要转换成string才能在下边if比较-->
<#-- 导入通用（用户中心）模板 -->
<#if status == 'forgetPwd'>
<#import "/common/common_seo_member_template.ftl" as common_template  />
<#else>
<#import "/common/common_member_template.ftl" as common_template  />
</#if>

<#-- 导入样式、脚本 -->
<#import "./fields/field_member_common_links.ftl" as links />
<#import "./fields/field_member_security_edit_scripts.ftl" as scripts />
<#-- 导入主要内容 -->
<#import "./fields/field_member_security_"+updateStatus+"_update_success.ftl" as updateStatus />
<#-- 导入页脚内容  -->

<#-- 调用通用（用户中心）模板 [ 标题 | metas | 链接 | 脚本 | 主要内容  | 左侧导航栏 | 页脚 | 数据  ]-->
<#if status == 'forgetPwd'>
<@common_template.render "找回登录密码",[],[links],[scripts],[updateStatus],"address",[],data??,seoForm?? />
<#else>
<@common_template.render "设置成功",[],[links],[scripts],[updateStatus],"",[],data?? />
</#if>
