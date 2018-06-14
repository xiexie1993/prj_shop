<?php
// +----------------------------------------------------------------------
// | Description: 基础框架路由配置文件
// +----------------------------------------------------------------------
// | Author: linchuangbin <linchuangbin@honghaiweb.com>
// +----------------------------------------------------------------------

return [

/**
 * 原则：
 *   1、尽量使前台在初始化化渲染页面时只需请求一次；
 *   2、建议按页面分，如果按功能和按页面无明显优势则按页面分；
 *      如获取首页banner图 放在首页的控制器内，但是如果多个页面引用可提出公共的控制器下
 */

// 【 首页 】
    // 查询banne
    'Index/index'         => ['home/Index/index', ['method' => 'GET']],

  // 【 基础 】
    // 【 基础 】 注册
    'base/register'       => ['home/base/register', ['method' => 'POST']],
    // 【 基础 】 登录
    'base/login'          => ['home/base/login', ['method' => 'POST']],
    // 【 基础 】 退出登录
    'base/logout'         => ['home/base/logout', ['method' => 'POST']],

// =============================================================================


    // 【 基础 】修改密码
    'users/setpwd'        => ['home/users/setpwd', ['method' => 'POST']],
    // 【 基础 】修改昵称
    'users/setnick'       => ['home/users/setnick', ['method' => 'POST']],

  // 【 Banner图 】
    // 【 Banner图 】查询 列表
    'banner/list'    => ['home/Banners/listdata', ['method' => 'get']],



    //【 操作日志 】查询 列表
    'operationlog/list'    => ['home/OperationLogs/listdata', ['method' => 'get']],
    //【 操作日志 】查询 单条
    'operationlog/showone' => ['home/OperationLogs/showone', ['method' => 'get']],



  // 【 租赁方案类目 】
    // 【 租赁方案类目 】查询 列表
    'goodscategory/list'    => ['home/GoodsCategorys/listdata', ['method' => 'get']],
    // 【 租赁方案类目 】查询 单条
    'goodscategory/showone' => ['home/GoodsCategorys/showone', ['method' => 'get']],
    // // 【 租赁方案类目 】新增
    // 'goodscategory/newadd' => ['admin/GoodsCategorys/newadd', ['method' => 'post']],
    // // 【 租赁方案类目 】编辑
    // 'goodscategory/edit'   => ['admin/GoodsCategorys/edit', ['method' => 'post']],
    // // 【 租赁方案类目 】软删除
    // 'goodscategory/vdel'   => ['admin/GoodsCategorys/vdel', ['method' => 'post']],



  // 【 租赁方案 】
    // 【 租赁方案 】查询 列表
    'goods/list'    => ['home/Goods/listdata', ['method' => 'get']],
    // 【 租赁方案 】查询 单条
    'goods/showone' => ['home/Goods/showone', ['method' => 'get']],
    // 【 租赁方案 】新增
    'goods/newadd'  => ['home/Goods/newadd', ['method' => 'post']],
    // 【 租赁方案 】编辑
    'goods/edit'    => ['home/Goods/edit', ['method' => 'post']],
    // 【 租赁方案 】软删除
    'goods/vdel'    => ['home/Goods/vdel', ['method' => 'post']],



  // 【 租赁订单 】
    // 【 租赁订单 】查询 列表
    'orders/list'     => ['home/Orders/listdata', ['method' => 'get']],
    // 【 租赁订单 】查询个各状态的订单数量
    'orders/listnum'  => ['home/Orders/listnum', ['method' => 'get']],
    // 【 租赁订单 】查询 单条
    'orders/showone'  => ['home/Orders/showone', ['method' => 'get']],
    // // 【 租赁订单 】新增
    // 'orders/newadd' => ['admin/Orders/newadd', ['method' => 'post']],
    // // 【 租赁订单 】编辑/处理
    // 'orders/edit'     => ['home/Orders/edit', ['method' => 'post']],
    // 【 租赁订单 】软删除
    // 'admin/orders/vdel'   => ['admin/Orders/vdel', ['method' => 'post']],




  // 【帮助中心】
    // 【 帮助中心 】 帮助文章一级类目 列表查询
    'helpcategory/list'   => ['home/HelpCategorys/listdata', ['method' => 'get']],
    // 【 帮助中心 】 帮助文章一级类目 查询 单条
    'helpcategory/showone'=> ['home/HelpCategorys/showone', ['method' => 'get']],
    // // 【 帮助中心 】 帮助文章一级类目 新增
    // 'helpcategory/newadd' => ['home/HelpCategorys/newadd', ['method' => 'post']],
    // // 【 帮助中心 】 帮助文章一级类目 编辑
    // 'helpcategory/edit'   => ['home/HelpCategorys/edit', ['method' => 'post']],
    // // 【 帮助中心 】 帮助文章一级类目 软删除
    // 'helpcategory/vdel'   => ['home/HelpCategorys/vdel', ['method' => 'post']],

    // 【 帮助中心 】 某一类目 帮助文章列表查询
    'helparticle/list'    => ['home/HelpArticles/listdata', ['method' => 'get']],
    // 【 帮助中心 】  查询 某一帮助文章
    'helparticle/showone' => ['home/HelpArticles/showone', ['method' => 'get']],
    // // 【 帮助中心 】 帮助文章 新增
    // 'helparticle/newadd' => ['home/HelpArticles/newadd', ['method' => 'post']],
    // // 【 帮助中心 】 帮助文章 编辑
    // 'helparticle/edit'   => ['home/HelpArticles/edit', ['method' => 'post']],
    // // 【 帮助中心 】 帮助文章 软删除
    // 'helparticle/vdel'   => ['home/HelpArticles/vdel', ['method' => 'post']],

  // 【 首页 】
    // 【 文件上传 】
    'home/index'   => ['home/Index/index', ['method' => 'get']],
    // 'summernote/upload_img'   => ['home/Upload/upload_img', ['method' => 'post']],



  // 【 文件 】
    // 【 文件上传 】
    'upload/img'   => ['home/Upload/img', ['method' => 'post']],
    // 'summernote/upload_img'   => ['home/Upload/upload_img', ['method' => 'post']],



  // 【 调试 】
    // 【 调试 】 上线前注释掉
    'xzb/index' => ['home/xzb/index', ['method' => 'GET']],
    'xzb/sessionpath' => ['home/xzb/sessionpath', ['method' => 'GET']],



  //【 其他 】
    // 【 MISS路由 】
    '__miss__'  => 'base/miss',




/*-----------------------------------------------------------------------------*/

];