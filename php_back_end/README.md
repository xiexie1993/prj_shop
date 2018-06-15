# 项目-商城（后端代码的自述文件）

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


+ 总体目录结构

~~~

project                应用根目录
├─ backstage           后台前端页面代码
│  └─ ...              
├─ reception_desk      前台前端页面代码
│  ├─ Mobile...          手机尺寸风格页面
│  └─ PC...              PC电脑尺寸风格页面
├─ php_back_end        php后端
│  └─ ...              
├─ README.md          自述文件
└─ ...

~~~

+ 后端部分目录结构



~~~
project  应用部署目录
├─application               应用目录（可设置）
│  ├─common                 公共模块目录（可更改）
│  ├─index                  模块目录(可更改)
│  │  ├─config.php          模块配置文件
│  │  ├─common.php          模块函数文件
│  │  ├─controller          控制器目录
│  │  ├─model               模型目录
│  │  ├─view                视图目录
│  │  └─ ...                更多类库目录
│  ├─command.php            命令行工具配置文件
│  ├─common.php             应用公共（函数）文件
│  ├─config.php             应用（公共）配置文件
│  ├─database.php           数据库配置文件
│  ├─tags.php               应用行为扩展定义文件
│  └─route.php              路由配置文件
├─extend                    扩展类库目录（可定义）
├─public                    WEB 部署目录（对外访问目录）
│  ├─static                 静态资源存放目录(css,js,image)
│  ├─index.php              应用入口文件
│  ├─router.php             快速测试文件
│  └─.htaccess              用于 apache 的重写
├─runtime                   应用的运行时目录（可写，可设置）
├─vendor                    第三方类库目录（Composer）
├─thinkphp                  框架系统目录
│  ├─lang                   语言包目录
│  ├─library                框架核心类库目录
│  │  ├─think               Think 类库包目录
│  │  └─traits              系统 Traits 目录
│  ├─tpl                    系统模板目录
│  ├─.htaccess              用于 apache 的重写
│  ├─.travis.yml            CI 定义文件
│  ├─base.php               基础定义文件
│  ├─composer.json          composer 定义文件
│  ├─console.php            控制台入口文件
│  ├─convention.php         惯例配置文件
│  ├─helper.php             助手函数文件（可选）
│  ├─LICENSE.txt            授权说明文件
│  ├─phpunit.xml            单元测试配置文件
│  ├─README.md              README 文件
│  └─start.php              框架引导文件
├─build.php                 自动生成定义文件（参考）
├─composer.json             composer 定义文件
├─LICENSE.txt               授权说明文件
├─think                     命令行入口文件
├─DevelopmentTutorial.md    开发教程和开发实例记录
├─DevelopmentLog.md         开发日志
├─prj_shop.sql              SQL数据库文件
└─README.md                 自述文件
~~~

> + 框架版本：thinkphp5.0.6
> + 详细开发文档参考 [ThinkPHP5完全开发手册](http://www.kancloud.cn/manual/thinkphp5)


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
        + 1、域名（前台域名、后台域名）---本地配置修改host
            * 本地开发的重定向配置（windows配置文件C:\Windows\System32\drivers\etc\HOSTS）
            ~~~
                127.0.0.1    api.prj_shop.com
                127.0.0.1    admin.prj_shop.com
                127.0.0.1    mobile.prj_shop.com
                127.0.0.1    img.prj_shop.com
            ~~~

#### b、nginx配置说明

+ nginx 配置说明

+ 配置例子

~~~
    ## 项目 后端服务端
    server {
        listen       80;
        server_name  api.prj_shop.com;

        #charset koi8-r;

        access_log  logs/tp5_prj_shop_access.log  main;
            root   "C:/MyWorkSpace/GitHub_Prj/prj_shop/php_back_end/public";
        location / {
            index  index.html index.htm index.php l.php;
           autoindex  off;
        }

        #error_page  404              /404.html;

        # redirect server error pages to the static page /50x.html
        #
        error_page   500 502 503 504  /50x.html;


        # proxy the PHP scripts to Apache listening on 127.0.0.1:80
        #
        #location ~ \.php$ {
        #    proxy_pass   http://127.0.0.1;
        #}

        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
        #
        location ~ \.php(.*)$  {
            fastcgi_pass   127.0.0.1:9000;
            fastcgi_index  index.php;
            fastcgi_split_path_info  ^((?U).+\.php)(/?.+)$;
            fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
            fastcgi_param  PATH_INFO  $fastcgi_path_info;
            fastcgi_param  PATH_TRANSLATED  $document_root$fastcgi_path_info;
            include        fastcgi_params;
        }

        # deny access to .htaccess files, if Apache's document root
        # concurs with nginx's one
        #
        #location ~ /\.ht {
        #    deny  all;
        #}
    }


~~~

#### c、PHP环境配置说明


#### d、数据库配置说明

+ 建议版本： MySQL5.8及以上 或MariaDB
+ 字符集：   utf8--UTF-8 Unicode
+ 排序规则   utf8_general_ci

> 环境要求
> + PHP >= 5.4.0
> + PDO PHP Extension
> + MBstring PHP Extension
> + CURL PHP Extension




## 四、参考资料

+ 数据库表结构设计（登录部分）
    * [浅谈数据库用户表结构设计，第三方登录](https://www.cnblogs.com/nuanxin/p/6215237.html)
    * [设计一个可扩展的用户登录系统（第三方登录）](http://caimx.iteye.com/blog/2286568)
    * [支持多种登录方式的数据表设计](https://blog.6ag.cn/1619.html)
+ 数据库表结构设计（商品部分）
    * [商城商品属性表设计思路](http://blog.sina.com.cn/s/blog_8efa3c4f0101ef53.html)
    * [商城 商品模块 数据库 表设计](http://blog.csdn.net/wwwdc1012/article/details/71774280)
    * [【淘淘商城项目】商品规格参数的表结构设计](http://blog.csdn.net/qq_1017097573/article/details/68501687)
    * [商城数据库设计--商品属性](http://blog.csdn.net/tyd0437/article/details/50420004)
    * [数据库设计(二) 商品信息表的设计](http://blog.csdn.net/qq_38537286/article/details/78710237)
    * [商品属性与商品产品之间的表设计结构,供参考!](http://blog.csdn.net/quweiie/article/details/29219695)


## 五、开发日志

详细见本目录文件DevelopmentTutorial.md与DevelopmentLog.md

## 五、任务或问题记录


+ 后台代码任务：
    * 1、后台商品 
        + （1）、商品基础信息主表
        + （2）、添加商品是需要的数据选择部分的数据表（商品类目表、商品属性表、商品属性值表、商品租赁方案/套餐表、套餐与信用积分阀值押金优惠对应表）
        + （3）、商品信息附表（商品类目表、商品属性表等）的增删查改接口与页面
        + （4）、发布商品（即、生成或者叫添加商品）的接口和流程页面（给商品分类目、选择属性、选择买家可选租赁套餐等）
        
    * 2、订单部分（后台）
        + （1）、数据库表结构（子表部分---订单状态修改日志表）
        + （2）、代码部分，后台进行订单状态修改时，识别修改者，和修改状态、时间记录的到订单状态日志表中，

    * 3、前台商品展示
        + （1）、商品列表页
        + （2）、商品详情页
               * 商品介绍部分（商品属性、套餐价格选择）接口、
               * 商品生成订单的租赁方案（套餐）选择
               * 商品生成到订单的价格生成接口

    * 4、前台订单流程
        + （1）前提：订单部分的数据表结构（主表、子表）
        + （2）代码部分，前台模块（买家自己）进行订单状态修改时，识别修改者，和修改状态、时间记录的到订单状态日志表中，

    * 5、帮助中心（前台前端）
        + （1）、前台前端页面
        + （2）、后端前台模块部分的帮助中心接口 （查询）


    * 6、留言或咨询客服部分
        + （1）、业务流程与实现方案
        + （2）、对应的表结构
        + （3）、对应接口（前后台 前后端接口与页面）

