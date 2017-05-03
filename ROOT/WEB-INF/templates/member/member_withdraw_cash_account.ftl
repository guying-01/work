<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />

<#-- 导入通用（用户中心）模板 -->
<#import "/common/common_seo_member_template.ftl" as common_member_template  />
<#import "/common/common_meta.ftl" as common_meta  />

<#-- 导入样式、脚本 -->
<#import "./fields/field_member_withdraw_cash_account_links.ftl" as field_member_withdraw_cash_account_links />
<#import "./fields/field_member_withdraw_cash_account_scripts.ftl" as field_member_withdraw_cash_account_scripts />
<#import "./fields/field_member_withdraw_cash_account_main.ftl" as field_member_withdraw_cash_account_main />


<#-- 调用通用（用户中心）模板 [ 标题 | metas | 链接 | 脚本 | 主要内容  | 左侧导航栏 | 页脚 | 数据| SEO数据  ]-->
<@common_member_template.render "提现账户设置",[common_meta],[field_member_withdraw_cash_account_links],[field_member_withdraw_cash_account_scripts],[field_member_withdraw_cash_account_main],"withDrawAccount",[],data??,seoForm?? />