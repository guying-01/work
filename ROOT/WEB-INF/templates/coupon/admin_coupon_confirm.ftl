<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />

<#-- 导入通用模板 -->
<#import "/common/common_template.ftl" as common_template  />

<#-- 导入样式、脚本 -->
<#import "./fields/field_coupon_common_links.ftl" as field_coupon_common_links />
<#import "./fields/field_coupon_common_scripts.ftl" as field_coupon_common_scripts />

<#-- 导入主要内容 -->
<#import "./fields/field_admin_coupon_confirm_info.ftl" as field_admin_coupon_confirm_info />

<#-- 导入页脚内容  -->

<#-- 调用通用模板 [ 标题  | metas | 链接  | 脚本  | 主要内容  | 页脚  | 数据  ]-->
<@common_template.render "优惠券-领取确认",[],[field_coupon_common_links],[field_coupon_common_scripts],[field_admin_coupon_confirm_info],[],data?? />