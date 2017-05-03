<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />

<#-- 导入通用（用户中心）模板 -->
<#import "/common/common_template.ftl" as common_template  />

<#import "/common/fields/field_common_store_scripts.ftl" as field_common_store_scripts  />

<#-- 导入主要内容 -->
<#import "./fields/field_goods_not_exist.ftl" as field_goods_not_exist />

<#-- 导入页脚内容  -->
<#import "./fields/field_goods_detail_foot.ftl" as field_goods_detail_foot />

<#-- 调用通用（用户中心）模板 [ 标题 | metas | 链接 | 脚本 | 主要内容  | 左侧导航栏 | 页脚 | 数据  ]-->
<@common_template.render "商品不存在",[],[],[],[field_goods_not_exist],[field_common_store_scripts,field_goods_detail_foot],data??/>
