
<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />

<#-- 导入通用（用户中心）模板 -->
<#import "/common/common_template.ftl" as common_template  />

<#-- 导入样式、脚本 -->
<#import "./fields/field_store_common_links.ftl" as field_store_common_links />
<#import "./fields/field_store_apply_script.ftl" as field_store_apply_script />

<#-- 导入主要内容 -->

<#import "./fields/field_store_apply_page.ftl" as field_store_apply_page />

<#-- 导入页脚内容  -->
<#-- 调用通用（用户中心）模板 [ 标题 | metas | 链接 | 脚本 | 主要内容  | 左侧导航栏 | 页脚 | 数据  ]-->
<@common_template.render "申请入驻第一步",[],[field_store_common_links],[field_store_apply_script],[field_store_apply_page],[],data?? />
<script type="text/javascript" src="${resources}/js/lib/date/date.js"></script>
<script type="text/javascript" src="${resources}/js/store/newDate.js"></script>



