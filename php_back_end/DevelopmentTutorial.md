
# 开发教程和开发实例记录

## 开发教程
---

### 本框架Api接口开发教程

框架版本：thinkphp5.0.6
@2017-12-21 19:24:58
作者：xiexie1993

+ 步骤大纲：
    * 1、到路由配置文件，增加路由
    * 2、根据路由表的映射关系，建立相应的控制器文件
    * 3、建立相关的模型文件（也可不建，有时一个有时多个，有时不用）
    * 4、到数据库建立相关的数据表
    * 5、到控制器或模型中，编写相应的方法（函数），进行数据处理

> 注：
>    + 1、建议在控制器中写业务逻辑，复杂的业务逻辑可以新建逻辑文件，将逻辑处理函数放到里面，
>    + 2、建议模型里只写相应的数据库，增删查改函数和，修改数据库时的检验函数

+ 例子：
  *  目的：写一个查询商品类目的api接口，get请求，（例子暂不讨论权限校验问题）
     + GET请求：http://IP:PORT/index.php/admin/goodscategory/list
     + 参数：无
     + 响应：JSON
    ~~~
    {
    "status": 1,
    "msg": null,
    "code": null,
        "total": 5,
        "page_size": 10,
        "total_page": 1,
        "page_no": 1,
        "start_id": 0,
        "rows": [
            {
                "category_id": 4,
                "title": "办公用品",
                "remark": null,
                "sort": 5,
                "enable": 1,
                "status": 1
            },
            {
                "category_id": 1,
                "title": "手机",
                "remark": null,
                "sort": 0,
                "enable": 1,
                "status": 1
            },
            {
                "category_id": 2,
                "title": "电脑",
                "remark": null,
                "sort": 0,
                "enable": 1,
                "status": 1
            },
            {
                "category_id": 3,
                "title": "冰箱",
                "remark": null,
                "sort": 0,
                "enable": 1,
                "status": 1
            },
            {
                "category_id": 6,
                "title": "床上用品",
                "remark": null,
                "sort": 0,
                "enable": 0,
                "status": 1
            }
        ]
    }
    ~~~

  * 实现例子的详细步骤：
    + 前提：
        * 数据库配置OK，thinkphp运行环境OK
        * 1、到路由配置文件，增加路由

          ~~~
            文件地址：
            ./config/route_admin.php
            添加一条路由：
              代码如下：
              //【租赁方案类目】查询 列表
              'admin/goodscategory/list'   => ['admin/GoodsCategory/listdata', ['method' => 'get']],
          ~~~

        * 2、根据路由表的映射关系，建立相应的控制器文件

          ~~~
            新建文件：
             ./application/admin/controller/GoodsCategory.php
            文件内容（代码）
            <?php
            namespace app\admin\controller;
            use think\Request;
            use think\Db;
            use app\common\adapter\AuthAdapter;
            use app\common\controller\Common;
            class GoodsCategory extends ApiCommon
            {
                // 【租赁方案类目】查询出列表
                public function listdata()
                {
                    $param = $this->param;//获取相关的参数 可取得POST和GET的传参数据
                    $objModel = model('GoodsCategory');//实例化模型
                    $map['status'] = 1;
                    $alllist = $objModel->getDataList($map); //调用实例化模型中的函数
                    if (!$alllist)
                    {
                        $ret_data['status'] = 0;
                        $ret_data['data'] = null;
                        $ret_data['msg']  = $objModel->getError();//获取实例化模型中的数据
                        $ret_data['code'] = null;
                    }
                    else
                    {
                        $page_no = $param['page_no'] ? $param['page_no'] : 1;
                        $page_size = $param['page_size'] ? $param['page_size'] : 10;
                        $data = ListPaging($alllist,$page_size,$page_no);
                        $data['status'] = 1;
                        $data['code'] = null;
                        $data['msg']  = null;
                        $ret_data= $data;
                    }
                    return json($ret_data);//返回响应 格式为JSON
                }
            }
          ~~~

        * 3、建立相关的模型文件（也可不建，有时一个有时多个，有时不用）

          ~~~
              注释：由于控制器引用了些自定义模型，切需要一些自定义的函数处理数据，所以需
                    要建立相应的模型，来让控制器调用。
                    还需要建立对应的数据表
              建立模型文件：
              ./application/admin/model/GoodsCategory.php
              文件内容（代码）：
              <?php
              namespace app\admin\model;
              use think\Db;
              use app\admin\model\Common;
              class GoodsCategory extends Common 
              {
                  //
                  //为了数据库的整洁，同时又不影响Model和Controller的名称
                  //我们约定每个模块的数据表都加上相同的前缀，比如微信模块用weixin作为数据表前缀
                  //
                  protected $name = 'goods_category';//表名 省略了公共的前缀bwh
                  // 
                  // [getDataList 获取列表]
                  // @Author xiezhenbin
                  // @DateTime  2017-12-15 22:21:08
                  // @param   
                  // @return    [type]                               [description]
                  // 
                  public function getDataList($map)
                  {
                      // 获取
                      // $map['status'] = 1;
                      $info = $this->where($map)->order('sort desc')->select();
                      // 返回信息
                      $data = $info;
                      return $data;
                  }
              }
          ~~~

      * 4、到数据库建立相关的数据表

          ~~~
            到项目配置的数据库建立数据表
            SQL语句如下：
            CREATE TABLE `bwh_goods_category` (
              `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
              `title` varchar(100) DEFAULT NULL COMMENT '类目名称',
              `remark` varchar(100) DEFAULT NULL COMMENT '备注',
              `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
              `enable` tinyint(5) DEFAULT '0' COMMENT '启禁状态 （0 禁用,1 启用）',
              `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
              PRIMARY KEY (`category_id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【商品】类目表';
          ~~~

      * 5、到控制器、模型（或逻辑）中，编写相应的方法（函数），进行数据处理
      > 注：该例子教程结束


================================================================================

## 开发实例记录
---


### 小技巧、知识、资料记录

+ 查看thinkPHP的版本
    * 文件位置：./thinkphp/base.php

+ VueThink 的前端UI 
    * Element UI——一套基于 Vue 2.0 的桌面端组件库
    * [桌面版UI组件库](http://element.eleme.io/#/zh-CN/resource)
    * [移动端UI组件库](http://mint-ui.github.io/#!/zh-cn)


+ 在设置VueThink的前端的访问路径时要使用单引号

+ 修改Vue前端的访问端口的位置在frontEnd/config/index.js的第21行附近

+ thinkphp5设置路由配置文件
    * 文件位置:./config/config.php   第93行附近 route_config_file


@2017-12-17 15:52:04
+ fildder调试常用
    * Content-Type: application/x-www-form-urlencoded; charset=utf-8
    ~~~
    登录
    user_name=admin&password=e10adc3949ba59abbe56e057f20f883e
    old_pwd=e10adc3949ba59abbe56e057f20f883e&new_pwd=123456
    new_pwd=e10adc3949ba59abbe56e057f20f883e&old_pwd=123456
    // 新建cookie
    oSession.oRequest.headers.Add("Cookie", "xx=123456;testpassword=P@ssword1");
    ~~~



+ 坑：nginx的发布目录不能带有'.'
  ~~~
    windows 建立软连接
                 软连接                   源目录
    mklink /D C:\MyWorkSpace\dh C:\MyWorkSpace\xx.xxx.com\dh 
    mklink /D C:\MyWorkSpace\php C:\MyWorkSpace\xxx.xxx.com\php 
  ~~~

+ sublime列编辑的绑定快捷键配置
  ~~~
    { "keys": ["ctrl+alt+k"], "command": "select_lines", "args": {"forward": false} },
    { "keys": ["ctrl+alt+j"], "command": "select_lines", "args": {"forward": true} }
  ~~~


+ 开启数据库日志输出
  ~~~
    set global general_log="ON";
    show variables like "general_log%";
    查看配置： SHOW VARIABLES LIKE "general_log%"; 
    开启日志 ： SET GLOBAL general_log = 'ON';
  ~~~


  
### 开发过程实例记录


### 2017-12-14 20:17:32

+ 数据库商品类目表
  ~~~
    //数据库商品类目表
    CREATE TABLE `bwh_goods_category` (
      `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
      `title` varchar(100) DEFAULT NULL COMMENT '类目名称',
      `remark` varchar(100) DEFAULT NULL COMMENT '备注',
      `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
      `enable` tinyint(5) DEFAULT '0' COMMENT '启禁状态 （0 禁用,1 启用）',
      `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
      PRIMARY KEY (`category_id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【商品】类目表';

    相关文件：
    路由：
    /config/route_admin.php
    控制器：
    /application/admin/controller/Category.php
    模型：
    /application/admin/model/Category.php
  ~~~


+ 商品数据相关表结构

~~~
CREATE TABLE `bwh_goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `name` varchar(100) DEFAULT NULL COMMENT '类目名称',
  `cover` varchar(100) DEFAULT NULL COMMENT '商品封面',
  `price` DECIMAL(10,2) DEFAULT NULL COMMENT '商品价格',
  `category_id` int(11)  COMMENT '所属类目ID',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
  `enable` tinyint(5) DEFAULT '0' COMMENT '启禁状态 （0 禁用,1 启用）',
  `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '数据更新时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='【租赁方案】表';


CREATE TABLE `bwh_goods_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表ID',
  `good_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `title` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
  `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '数据更新时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【商品】信息表';

CREATE TABLE `bwh_goods_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表ID',
  `good_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `content` text NULL COMMENT '商品详细介绍内容',
  `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '数据更新时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【商品】内容表';

CREATE TABLE `bwh_goods_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表ID',
  `good_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `path` varchar(100) DEFAULT NULL COMMENT '商品相册图片路径',
  `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '数据更新时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【商品】相册表（不含封面图）';

~~~


+ 订单相关表

  ~~~
    CREATE TABLE `bwh_orders` (
      `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
      `name` varchar(100) DEFAULT NULL COMMENT '订单名称',
      `cover` varchar(100) DEFAULT NULL COMMENT '订单封面',
      `price` DECIMAL(10,2) DEFAULT NULL COMMENT '订单价格',
      `order_status` tinyint(3) DEFAULT NULL COMMENT '订单状态0待付款,1未支付取消,2待发货,3待发货,4待收货,5待归还,6待确认归还,7交易完成,8订单关闭,9退货',
      `remark` varchar(100) DEFAULT NULL COMMENT '客户备注',
      `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
      `update_time` int(11) DEFAULT NULL COMMENT '数据更新时间',
      `enable` tinyint(5) DEFAULT '1' COMMENT '启禁状态 （0 禁用,1 启用）',
      `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除, 1 未删除）',
      PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【订单】简表';

    CREATE TABLE `bwh_orders_info` (
      `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表ID',
      `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
      `title` varchar(100) DEFAULT NULL COMMENT '商品名称',
      `remark` varchar(100) DEFAULT NULL COMMENT '备注',
      `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
      `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
      `update_time` int(11) DEFAULT NULL COMMENT '数据更新时间',
      `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
      PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【订单】信息表';

    CREATE TABLE `bwh_orders_content` (
      `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表ID',
      `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
      `content` text NULL COMMENT '商品详细介绍内容',
      `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
      `update_time` int(11) DEFAULT NULL COMMENT '数据更新时间',
      `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
      PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【订单】内容表';
  ~~~





### 2017-12-23 21:09:43

~~~
登录登出操作日志：
  操作日志表结构
  CREATE TABLE `bwh_admin_operation_log` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表ID',
    `uid` int(11) NOT NULL COMMENT '订单ID',
    `username` varchar(50) NOT NULL COMMENT '记录该日志时的用户名',
    `content` varchar(255) DEFAULT NULL COMMENT '操作内容',
    `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
    `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
    `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
    PRIMARY KEY (`id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='【操作日志】后台管理员';
  ~~~

### 2017-12-24 14:18:21
  ~~~
  文件上传记录表
  CREATE TABLE `bwh_upload_file` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表ID',
    `name` varchar(255) NULL COMMENT '上传时的文件名',
    `savename` varchar(255) NULL COMMENT '保存时的文件名',
    `path` varchar(255) NULL COMMENT '文件存放路径（相对路径）',
    `extension` varchar(50) NULL COMMENT '扩展名',
    `type` varchar(50) NULL COMMENT '文件类型',
    `size` varchar(50) NULL COMMENT '文件存储大小',
    `md5` varchar(255) NULL COMMENT '文件MD5散列',
    `sha1` varchar(255) NULL COMMENT '文件sha1散列',
    `md5_hash` varchar(255) NULL COMMENT '文件md5哈希散列',
    `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
    `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
    `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
    PRIMARY KEY (`id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【上传文件】文件信息表';
  ~~~

### 2017-12-24 15:39:00
  ~~~
  后台订单操作
  //租赁订单表
  CREATE TABLE `bwh_orders` (
    `order_id`            int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
    `order_number`        varchar(18) NOT NULL COMMENT '订单号',
    `client_uid`          int(11) NOT NULL COMMENT '客户UID',
    `name`                varchar(100) DEFAULT NULL COMMENT '订单名称',
    `cover`               varchar(100) DEFAULT NULL COMMENT '订单封面',
    `rent`                DECIMAL(10,2) DEFAULT NULL COMMENT '租金',
    `deposit`             DECIMAL(10,2) DEFAULT NULL COMMENT '押金',
    `num`                 int(10) DEFAULT NULL COMMENT '数量',
    `lease_period_start`  int(10) DEFAULT NULL COMMENT '租期开始时间',
    `lease_period_end`    int(10) DEFAULT NULL COMMENT '租期结束时间',
    `address`             varchar(255) DEFAULT NULL COMMENT '用户地址',
    `certification_info`  varchar(255) DEFAULT NULL COMMENT '当时认证资料',
    `price`               DECIMAL(10,2) DEFAULT NULL COMMENT '实付款',
    `remark` varchar(100) DEFAULT NULL COMMENT '客户备注',
    `order_status`        tinyint(3) DEFAULT NULL COMMENT '订单状态 1待付款,2待发货,4待收货,5待归还,6归还中,7交易完成, 8 订单关闭',
    `ship_name`           varchar(100) DEFAULT NULL COMMENT '发货物流名称',
    `ship_number`         varchar(100) DEFAULT NULL COMMENT '发货物流订单号',
    `return_ship_name`    varchar(100) DEFAULT NULL COMMENT '归还物流名称',
    `return_ship_number`  varchar(100) DEFAULT NULL COMMENT '归还物流订单号',
    `create_time`         int(11) DEFAULT NULL COMMENT '数据创建时间',
    `update_time`         int(11) DEFAULT NULL COMMENT '数据更新时间',
    `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
    `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除, 1 未删除）',
    PRIMARY KEY (`order_id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【 租赁订单 】简表';


  //租赁订单 日志表

  CREATE TABLE `bwh_orders_log` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表ID',
    `order_id` int(11) NOT NULL  COMMENT '订单ID',
    `order_number` varchar(18) NOT NULL  COMMENT '订单号',
    `order_status` tinyint(3) DEFAULT NULL COMMENT '订单状态 1待付款,2待发货,4待收货,5待归还,6归还中,7交易完成, 8 订单关闭',
    `operator` varchar(100) DEFAULT NULL COMMENT '操作者',
    `operat_content` varchar(255) DEFAULT NULL COMMENT '操作内容',

    `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '数据更新时间',
    `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
    `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除, 1 未删除）',
    PRIMARY KEY (`id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【 租赁订单 】日志表';
  ~~~

### 2017-12-24 18:06:30
~~~
  类目下的产品的类型表
  CREATE TABLE `bwh_category_type` (
    `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型ID',
    `category_id` int(11) NOT NULL  COMMENT '所属类目ID',
    `title` varchar(100) DEFAULT NULL COMMENT '类型名称',
    `remark` varchar(100) DEFAULT NULL COMMENT '备注',
    `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
    `enable` tinyint(5) DEFAULT '0' COMMENT '启禁状态 （0 禁用,1 启用）',
    `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
    PRIMARY KEY (`type_id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='【商品】类目下商品的类型表';

  //查询统计

  select order_status,count(*) as num from orders group by order_status;
~~~



### 2017-12-26 20:26:32

  ~~~
  帮助中心
  帮助中心的一级分类表数据表
  CREATE TABLE `bwh_help_category` (
    `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
    `title` varchar(100) DEFAULT NULL COMMENT '类目名称',
    `remark` varchar(100) DEFAULT NULL COMMENT '备注',
    `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
    `enable` tinyint(5) DEFAULT '0' COMMENT '启禁状态 （0 禁用,1 启用）',
    `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
    `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '数据更新时间',
    `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
    PRIMARY KEY (`category_id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【帮助中心】一级类目表';


  CREATE TABLE `bwh_help_article` (
    `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型ID',
    `category_id` int(11) NOT NULL  COMMENT '所属类目ID',
    `title` varchar(100) DEFAULT NULL COMMENT '标题',
    `author` varchar(100) DEFAULT NULL COMMENT '文章作者',
    `content` text DEFAULT NULL COMMENT '文章内容',
    `remark` varchar(100) DEFAULT NULL COMMENT '备注',
    `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
    `enable` tinyint(5) DEFAULT '0' COMMENT '启禁状态 （0 禁用,1 启用）',
    `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
    `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '数据更新时间',
    `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
    PRIMARY KEY (`article_id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【帮助中心】帮助文章';


  HelpCategory
  帮助中心文章
  ~~~



### 2017-12-27 20:49:42
~~~
  商品某一分类下的类型属性
  如：类目手机下的电信卡、移动卡、三网通
      类目电脑下的机型：一体机、上网本、笔记本


  CREATE TABLE `bwh_category_type` (
    `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型ID',
    `category_id` int(11) NOT NULL COMMENT '所属类目ID',
    `title` varchar(100) DEFAULT NULL COMMENT '类型名称',
    `format` text DEFAULT NULL COMMENT '类型下的规格/属性的列表（序列化）',
    `remark` varchar(100) DEFAULT NULL COMMENT '备注',
    `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
    `enable` tinyint(5) DEFAULT '0' COMMENT '启禁状态 （0 禁用,1 启用）',
    `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
    PRIMARY KEY (`type_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='【商品】类目下商品的类型表';

  注：商品一级分类下的类型 类型下的属性/规格 存放则放在同一个字段（序列化后存放）
~~~



### 2017-12-28 20:02:41 更改商品的属性表

~~~
  @商品分类中的属性表 （采用纵表形式）

  CREATE TABLE `bwh_category_type` (
    `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表ID',
    `category_id` int(11) NOT NULL COMMENT '所属类目ID',
    `title` varchar(100) DEFAULT NULL COMMENT '类型名称',
    `remark` varchar(100) DEFAULT NULL COMMENT '备注',
    `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
    `enable` tinyint(5) DEFAULT '0' COMMENT '启禁状态 （0 禁用,1 启用）',
    `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
    PRIMARY KEY (`type_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='【商品】扩展属性（纵表）';


  CREATE TABLE `bwh_extended_attributes` (
    `attr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性值表ID表ID',
    `category_id` int(11) NOT NULL COMMENT '所属类目ID',
    `category_att_id` int(11) NOT NULL COMMENT '所属属性ID',
    `title` varchar(100) DEFAULT NULL COMMENT '属性名称',
    `remark` varchar(100) DEFAULT NULL COMMENT '备注',
    `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
    `enable` tinyint(5) DEFAULT '0' COMMENT '启禁状态 （0 禁用,1 启用）',
    `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
    PRIMARY KEY (`att_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='【商品】扩展属下的具体属性值表(纵表) ';

~~~




### 2018-01-04 21:41:27

~~~
  banner管理

  CREATE TABLE `bwh_banner` (
    `banner_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'BannerID',
    `name` varchar(100) DEFAULT NULL COMMENT 'banner名',
    `url` varchar(255) DEFAULT NULL COMMENT 'banner跳转链接',
    `banner_pic` varchar(255) DEFAULT NULL COMMENT 'bannner地址',
    `remark` varchar(100) DEFAULT NULL COMMENT '备注',
    `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
    `enable` tinyint(5) DEFAULT '0' COMMENT '启禁状态 （0 禁用,1 启用）',
    `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '数据更新时间',
    `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
    PRIMARY KEY (`banner_id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【  banner图  】表';
~~~



### 2018-01-07 19:53:26

~~~
  规划前台前端登录部分（数据库、业务流程、页面）

  数据库
  CREATE TABLE `bwh_users` (
    `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `nickname` varchar(255) DEFAULT NULL COMMENT '用户名/昵称',
    `avatar` varchar(255) DEFAULT NULL COMMENT '头像图片',
    `remark` varchar(100) DEFAULT NULL COMMENT '备注',
    `enable` tinyint(5) DEFAULT '0' COMMENT ' 启禁状态 （0 禁用,1 启用）',
    `create_time`    int(11) DEFAULT NULL COMMENT '（代码）数据创建时间戳',
    `update_time`    int(11) DEFAULT NULL COMMENT '（代码）数据更新时间戳',
    `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
    `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
    PRIMARY KEY (`uid`)
  ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【  用户表-客户  】主表 用户基础信息表';



  CREATE TABLE `bwh_user_auths` (
    `id`             int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `uid`            int(11) NOT NULL  COMMENT '用户ID',
    `identity_type`  varchar(255) DEFAULT NULL COMMENT ' 登录类型 （ 手机号 邮箱 用户名 ）或第三方应用名称（微信 微博等） mobile（手机）、 mailbox （邮箱）、username（用户名）、WeChat（微信）、Alipay（支付宝）、Weibo（微博）',
    `identifier`     varchar(255) DEFAULT NULL COMMENT ' 标识 （ 手机号 邮箱 用户名或第三方应用的唯一标识 ）',
    `credential`     varchar(255) DEFAULT NULL COMMENT ' 密码凭证 （站内的保存密码，站外的不保存或保存token）',
    `enable`         tinyint(5) DEFAULT '0' COMMENT ' 启禁状态 （0 禁用,1 启用）',
    `create_time`    int(11) DEFAULT NULL COMMENT '（代码）数据创建时间戳',
    `update_time`    int(11) DEFAULT NULL COMMENT '（代码）数据更新时间戳',
    `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
    `status`         tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
    PRIMARY KEY (`id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【  用户表-客户  】用户授权信息表（第三方应用授权）';

~~~
参考资料：   
  [浅谈数据库用户表结构设计，第三方登录](https://www.cnblogs.com/nuanxin/p/6215237.html)
  [设计一个可扩展的用户登录系统（第三方登录）](http://caimx.iteye.com/blog/2286568)
  [支持多种登录方式的数据表设计](https://blog.6ag.cn/1619.html)

### 2018-01-10 21:41:21

~~~
  商品数据表组

  CREATE TABLE `bwh_goods` (
    `goods_id`    int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID/商品编号',
    `name`        varchar(255) DEFAULT NULL COMMENT '类目名称',
    `cover`       varchar(255) DEFAULT NULL COMMENT '商品封面',
    `price`       decimal(10,2) DEFAULT NULL COMMENT '商品价格',
    `category_id` int(11) DEFAULT NULL COMMENT '所属类目ID',
    `brand`       varchar(255) DEFAULT NULL COMMENT '所属品牌名称',
    `brand_id`    int(11) DEFAULT NULL COMMENT '所属品牌ID',
    `remark`      varchar(255) DEFAULT NULL COMMENT '备注',
    `sort`        tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
    `enable`      tinyint(5) DEFAULT '0' COMMENT '启禁状态 （0 禁用,1 启用）',
    `create_time` int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
    `up_time`     timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
    `status`      tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
    PRIMARY KEY (`goods_id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【 商品信息表 】主表';

  CREATE TABLE `bwh_goods_picture` (
    `pic_id`      int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `goods_id`    int(11) DEFAULT NULL COMMENT '商品ID/商品编号',
    `pic_path`    varchar(255) DEFAULT NULL COMMENT '图片路径',
    `remark`      varchar(100) DEFAULT NULL COMMENT '备注',
    `sort`        tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
    `enable`      tinyint(5) DEFAULT '1' COMMENT '启禁状态 （0 禁用,1 启用）',
    `create_time` int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
    `up_time`     timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
    `status`      tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
    PRIMARY KEY (`pic_id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【 商品信息子表 】 商品图片表';

  CREATE TABLE `bwh_goods_belong_value` (
    `id`            int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `goods_id`      int(11) NOT NULL  COMMENT '商品ID/商品编号',
    `category_id`   varchar(255) DEFAULT NULL COMMENT '类目编号',
    `attr_id`       varchar(255) DEFAULT NULL COMMENT '属性编号',
    `attr_value_id` varchar(255) DEFAULT NULL COMMENT '属性名称值下的值编号',
    `create_time`   int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
    `update_time`   int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
    `up_time`       timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
    `status`        tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
    PRIMARY KEY (`id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【 商品信息子表 】 具体商品中的所属属性数据表';

  CREATE TABLE `bwh_goods_extended_attributes` (
    `id`          int(11) NOT NULL AUTO_INCREMENT COMMENT '表ID',
    `goods_id`    int(11) NOT NULL  COMMENT '商品ID/商品编号',
    `name`        varchar(255) DEFAULT NULL COMMENT ' 名称 ',
    `attr_value`  varchar(255) DEFAULT NULL COMMENT ' 对应值 ',
    `create_time` int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
    `up_time`     timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
    `status`      tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
    PRIMARY KEY (`id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【 商品信息子表 】 商品介绍中的自定义规格属性数据表（纵表）';

  CREATE TABLE `bwh_goods_describe` (
    `desc_id`     int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `goods_id`    int(11) DEFAULT NULL COMMENT '商品ID/商品编号',
    `content`     text COMMENT '商品描述内容（富文本编辑器的html内容）',
    `create_time` int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
    `up_time`     timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
    `status`      tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
    PRIMARY KEY (`desc_id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【 商品信息子表 】 商品图片表';

  CREATE TABLE `bwh_goods_evaluate` (
    `evaluate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价ID',
    `goods_id`    int(11) DEFAULT NULL COMMENT '商品ID/商品编号',
    `content`     varchar(255) DEFAULT NULL COMMENT ' 评价内容 ',
    `create_time` int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
    `up_time`     timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
    `status`      tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
    PRIMARY KEY (`evaluate_id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【 商品信息子表 】 商品评论表';

  CREATE TABLE `bwh_goods_evaluate_reply` (
    `eval_reply_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论回复ID',
    `respondent_id` int(11) DEFAULT NULL COMMENT '回复者ID',
    `content`     varchar(255) DEFAULT NULL COMMENT '评论回复内容',
    `create_time` int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
    `up_time`     timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
    `status`      tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
    PRIMARY KEY (`eval_reply_id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【 商品信息子表 】 商品评论回复表';

  CREATE TABLE `bwh_goods_message` (
    `msg_id`      int(11) NOT NULL AUTO_INCREMENT COMMENT '留言ID',
    `customer_id` int(11) DEFAULT NULL COMMENT '客户',
    `goods_id`    int(11) DEFAULT NULL COMMENT '商品ID/商品编号',
    `content`     varchar(255) DEFAULT NULL COMMENT ' 留言内容 ',
    `create_time` int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
    `up_time`     timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
    `status`      tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
    PRIMARY KEY (`msg_id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【 商品信息子表 】 商品留言表';

  CREATE TABLE `bwh_goods_message_reply` (
    `msg_rep_id`        int(11) NOT NULL AUTO_INCREMENT COMMENT '留言回复ID',
    `respondent_id` int(11) DEFAULT NULL COMMENT '回复者ID',
    `goods_id`      int(11) DEFAULT NULL COMMENT '商品ID/商品编号',
    `content`       varchar(255) DEFAULT NULL COMMENT ' 留言内容 ',
    `create_time`   int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
    `update_time`   int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
    `up_time`       timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
    `status`        tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
    PRIMARY KEY (`msg_rep_id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【 商品信息子表 】 商品留言回复表';

  CREATE TABLE `bwh_goods_option_category` (
    `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
    `title`       varchar(100) DEFAULT NULL COMMENT '类目名称',
    `remark`      varchar(100) DEFAULT NULL COMMENT '备注',
    `sort`        tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
    `enable`      tinyint(5) DEFAULT '0' COMMENT '启禁状态 （0 禁用,1 启用）',
    `create_time` int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
    `up_time`     timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
    `status`      tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
    PRIMARY KEY (`category_id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='【 商品 选项数据 】 品类选项表';

  CREATE TABLE `bwh_goods_option_attr` (
    `attr_id`     int(11) NOT NULL AUTO_INCREMENT COMMENT '属性ID',
    `category_id` int(11) NOT NULL  COMMENT '类目ID',
    `attr_name`   varchar(255) NOT NULL COMMENT '属性ID',
    `create_time` int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
    `up_time`     timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
    `status`      tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
    PRIMARY KEY (`attr_id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【 商品 选项数据 】 品类下的属性表';

  CREATE TABLE `bwh_goods_option_attr_value` (
    `attr_value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性值ID',
    `category_id`   int(11) NOT NULL  COMMENT '类目ID',
    `attr_id`       int(11) NOT NULL COMMENT '属性ID',
    `attr_value`    varchar(255) NOT NULL COMMENT '属性值',
    `create_time`   int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
    `update_time`   int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
    `up_time`       timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
    `status`        tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
    PRIMARY KEY (`attr_value_id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【 商品 选项数据 】类目下属性值选项表';

  CREATE TABLE `bwh_goods_option_brand` (
    `brand_id`    int(11) NOT NULL AUTO_INCREMENT COMMENT '品牌ID',
    `category_id` int(11) NOT NULL COMMENT '类目ID',
    `name`        varchar(100) DEFAULT NULL COMMENT '名称',
    `remark`      varchar(100) DEFAULT NULL COMMENT '备注',
    `sort`        tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
    `enable`      tinyint(5) DEFAULT '0' COMMENT '启禁状态 （0 禁用,1 启用）',
    `create_time` int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
    `up_time`     timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
    `status`      tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
    PRIMARY KEY (`brand_id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='【 商品 选项数据 】 不同品类下的品牌选择值';

~~~
