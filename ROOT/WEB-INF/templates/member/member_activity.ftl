<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />

<#-- 导入通用（用户中心）模板 -->
<#import "/common/common_member_template.ftl" as common_member_template  />

<#-- 导入样式、脚本 -->


<#import "./fields/field_member_activity_links.ftl" as field_member_activity_links />
<#import "./fields/field_member_activity_script.ftl" as field_member_activity_script />


<#-- 导入主要内容 -->
<#import "./fields/field_member_activity.ftl" as field_member_activity />
<#-- 导入页脚内容  -->

<#-- 调用通用（用户中心）模板 [ 标题 | metas | 链接 | 脚本 | 主要内容  | 左侧导航栏 | 页脚 | 数据  ]-->
<@common_member_template.render "卡券管理",[],[field_member_activity_links],[field_member_activity_script],[field_member_activity],"coupon",[],data?? />