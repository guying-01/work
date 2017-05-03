<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />

<#-- 导入通用（用户中心）模板 -->
<#import "/common/common_member_template.ftl" as common_member_template  />
<#-- 导入样式、脚本 -->
<#import "./fields/field_applyRefund_success_scripts.ftl" as field_applyRefund_success_scripts />
<#import "/return/fields/field_timer_scripts.ftl" as field_timer_scripts />
<#-- 导入主要内容 -->
<#import "./fields/field_applyRefundReturnGoods_success_message.ftl" as field_applyRefundReturnGoods_success_message />
<#-- 导入页脚内容  -->
<#-- 调用通用（用户中心）模板 [ 标题 | metas | 链接 | 脚本 | 主要内容  | 左侧导航栏 | 页脚 | 数据  ]-->
<@common_member_template.render "退货申请提交成功",[],[],[field_applyRefund_success_scripts,field_timer_scripts],[field_applyRefundReturnGoods_success_message],"return",[],data?? />