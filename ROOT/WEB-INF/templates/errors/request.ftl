<#-- 加载通用变量定义 -->
<#include "/common/common_var_definds.ftl" />
<#-- 导入通用模板 -->
<#import "/common/common_template.ftl" as common_template  />
<#-- 导入主要内容 -->
<#import "./fields/fields_request_main.ftl" as fields_request_main  />

<#-- 导入页脚内容  -->

<#-- 调用通用（用户中心）模板 [ 标题 | metas | 链接 | 脚本 | 主要内容  | 左侧导航栏 | 页脚 | 数据  ]-->
<@common_template.render "非法请求",[],[],[],[fields_request_main],[],data?? />