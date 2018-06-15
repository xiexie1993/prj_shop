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

+ 配置

~~~
    
    ## 负载均衡转发配置列表
    #upstream shopapiurl{
    #    #ip_hash;
    #    #server   127.0.0.1:80;  # 后端服务 对应后台API接口
    #    #server   127.0.0.1:9001; # 后端服务 对应后台API接口
    #}

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

    ## 项目 前台前端页面服务端（手机）
    server {
        listen       80;
        server_name  mobile.prj_shop.com;

        root   'C:/MyWorkSpace/GitHub_Prj/prj_shop/reception_desk/mobile_page';
        #转发1
        location ^~ /${url}/ {
          #proxy_pass          http://shopapiurl/;
          proxy_pass          http://api.prj_shop.com/;
          #proxy_set_header  X-Real-IP  $remote_addr;
        }
    }

    ## 项目 后台前端管理页面服务
    server {
        listen       80;
        server_name  admin.prj_shop.com;

        root   'C:/MyWorkSpace/GitHub_Prj/prj_shop/backstage';
        #转发1
        location ^~ /${url}/ {
          #proxy_pass          http://shopapiurl/;
          proxy_pass          http://api.prj_shop.com/;
          #proxy_set_header  X-Real-IP  $remote_addr;
        }
    }

    ## 项目 图片服务
    server {
        listen       80;
        server_name  img.prj_shop.com;

        root   'C:/MyWorkSpace/GitHub_Prj/prj_shop/php_back_end/public/';
        location / {
            index  index.html index.htm index.php l.php;
           autoindex  off;
        }
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


## 四、开发日志

### 1、nginx转发配置调试技巧

+ 设置nginx日志格式
    ~~~
        http {
            #...其他配置...
            log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                              '$status $body_bytes_sent "$http_referer" '
                              '"$http_user_agent" "$http_x_forwarded_for"';
             #...其他配置...
             }
    ~~~
+ 参考资料
    * [文章18 ：Nginx中http请求的处理过程](https://blog.csdn.net/yankai0219/article/details/8220695)
    * [搭建nginx反向代理用做内网域名转发](http://www.ttlsa.com/nginx/use-nginx-proxy/)
    * [Nginx 记录请求分发日志](https://blog.csdn.net/lkx94/article/details/54575225)

### 2、数据库调试技巧

+ 开启数据库日志输出
  ~~~
    set global general_log="ON";
    show variables like "general_log%";
    查看配置： SHOW VARIABLES LIKE "general_log%"; 
    开启日志 ： SET GLOBAL general_log = 'ON';
  ~~~

## 五、任务或问题记录

