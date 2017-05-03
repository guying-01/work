
<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />

<#-- 导入通用（用户中心）模板 -->
<#import "/common/common_template.ftl" as common_template  />

<#-- 导入样式、脚本 -->
<#import "./fields/field_store_common_links.ftl" as field_store_common_links />
<#-- 导入主要内容 -->

<#import "./fields/field_store_apply_wait.ftl" as field_store_apply_wait  />
<#-- 导入页脚内容  -->

<#-- 调用通用（用户中心）模板 [ 标题 | metas | 链接 | 脚本 | 主要内容  | 左侧导航栏 | 页脚 | 数据  ]-->
<@common_template.render "入驻成功",[],[field_store_common_links],[],[field_store_apply_wait],[],data?? />

