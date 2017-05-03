<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />

<#-- 导入通用（用户中心）模板 -->
<#import "/common/common_member_template.ftl" as common_member_template  />
<#-- 导入主要内容 -->
<#import "./fields/field_applyRefundReturnOrderCancel_success_message.ftl" as field_applyRefundCancel_success_message />
<#-- 导入页脚内容  -->

<#-- 调用通用（用户中心）模板 [ 标题 | metas | 链接 | 脚本 | 主要内容  | 左侧导航栏 | 页脚 | 数据  ]-->
<@common_member_template.render "退款申请撤销成功",[],[],[],[field_applyRefundCancel_success_message],"return",[],data?? />