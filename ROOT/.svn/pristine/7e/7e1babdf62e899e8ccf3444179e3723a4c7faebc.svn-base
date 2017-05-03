<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />

<#-- 导入通用（用户中心）模板 -->
<#import "/common/common_member_template.ftl" as common_member_template  />

<#-- 导入样式、脚本 -->
<#import "./fields/field_applyRefund_links.ftl" as field_applyRefund_links />
<#import "./fields/field_return_order_detail_scripts.ftl" as field_return_order_detail_scripts />
<#import "./fields/field_applyRefund_scripts.ftl" as field_applyRefund_scripts />
<#import "./fields/field_return_order_shipping_scripts.ftl" as field_return_order_shipping_scripts />
<#import "./fields/field_return_history_script.ftl" as field_return_history_script />
<#import "/return/fields/field_timer_scripts.ftl" as field_timer_scripts />

<#-- 导入主要内容 -->
<#import "./fields/field_return_order_shipping.ftl" as field_return_order_shipping />
<#-- 导入页脚内容  -->

<#-- 调用通用（用户中心）模板 [ 标题 | metas | 链接 | 脚本 | 主要内容  | 左侧导航栏 | 页脚 | 数据  ]-->
<@common_member_template.render "退货物流信息",[],[field_applyRefund_links],[field_return_order_detail_scripts,field_applyRefund_scripts,field_return_order_shipping_scripts,field_return_history_script,field_timer_scripts],[field_return_order_shipping],"return",[],data?? />