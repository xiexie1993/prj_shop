# 项目 商城

## 一、概述

###  1、 编写目的

+  为项目的系统的开发设计的依据与指导。
+  为参与该项目的编程人员提供依据；
+  为修改、维护提供条件；  
+  项目负责人将按计划书的要求布置和控制开发工作全过程；  
+  项目质量保证组将按此计划书做阶段性和总结性的质量验证和确认。

### 2、 读者对象

+  项目开发人员，特别是编程人员；
+  软件维护人员；
+  技术管理人员；
+  执行软件质量保证计划的专门人员；   
+  参与本项目开发进程各阶段验证、确认以及负责为最后项目验收、鉴定提供相应报告的有关人员。
+  合作各方有关部门的负责人；项目组负责人和全体参加人员。

### 3、 注意事项

+  权限审查：此文档仅供技术部功能组内部使用。
+  保存备份：此文档仅在服务器上作修改，不允许本地备份。
+  该文档采用 markdown 编写规范，建议使用markdownPad或相关编辑工具查看和修改。


## 二、 项目说明

### 1、概述

### 2、


## 三、源码说明

### 1、源代码说明

+ 项目采用前后端分离

### 2、 目录结构

~~~

project                应用根目录
├─ backstage           后台前端页面代码
│  └─ ...              
├─ reception_desk      前台前端页面代码
│  ├─ mobile_page...   手机尺寸风格页面
│  └─ ...              
├─ php_back_end        php后端应用（接口）
│  └─ ...              
├─ README.md          自述文件
└─ ...

~~~

### 3、 运行环境

+ 运行环境：
    * lampp或wampp
    * nginx
    * mysql或MariaDB

### 4、 部署说明

#### a、配置总纲

+ (1)、用nginx当前台前端、后台后端的web服务器，
+ (2)、使用nginx的转发代理功能转发请求到后端
    * 所需条件：
        1、域名（前台域名、后台域名）---本地配置修改host

#### b、nginx配置说明

+ nginx 配置说明

+ 配置例子

~~~



~~~

#### c、PHP环境配置说明


#### d、数据库配置说明


## 四、开发日志


## 五、任务或问题记录
