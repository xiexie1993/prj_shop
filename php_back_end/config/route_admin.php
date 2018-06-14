<?php
// +----------------------------------------------------------------------
// | Description: 基础框架路由配置文件
// +----------------------------------------------------------------------
// | Author: linchuangbin <linchuangbin@honghaiweb.com>
// +----------------------------------------------------------------------

return [



  // 【 基础 】
    // 【 基础 】登录
    'admin/base/login'   => ['admin/base/login', ['method' => 'POST']],
    // 【 基础 】退出登录
    'admin/base/logout'  => ['admin/base/logout', ['method' => 'POST']],
    // 【 基础 】修改密码
    'admin/users/setpwd'  => ['admin/users/setpwd', ['method' => 'POST']],
    // 【 基础 】修改昵称
    'admin/users/setnick' => ['admin/users/setnick', ['method' => 'POST']],



    //【 操作日志 】查询 列表 分页
    'admin/operationlog/list'   => ['admin/OperationLogs/listdata', ['method' => 'get']],
    //【 操作日志 】查询 单条
    'admin/operationlog/showone'   => ['admin/OperationLogs/showone', ['method' => 'get']],



  // 【 商品类目 】
    // 【 商品类目 】查询 列表 分页
    'admin/goodsoptioncategory/list'   => ['admin/GoodsOptionCategorys/listdata', ['method' => 'get']],
    // 【 商品类目 】查询 所有
    'admin/goodsoptioncategory/alllist'=> ['admin/GoodsOptionCategorys/alllist', ['method' => 'get']],
    // 【 商品类目 】查询 单条
    'admin/goodsoptioncategory/showone'=> ['admin/GoodsOptionCategorys/showone', ['method' => 'get']],
    // 【 商品类目 】新增
    'admin/goodsoptioncategory/newadd' => ['admin/GoodsOptionCategorys/newadd', ['method' => 'post']],
    // 【 商品类目 】编辑
    'admin/goodsoptioncategory/edit'   => ['admin/GoodsOptionCategorys/edit', ['method' => 'post']],
    // 【 商品类目 】软删除
    'admin/goodsoptioncategory/vdel'   => ['admin/GoodsOptionCategorys/vdel', ['method' => 'post']],



  // 【 商品品牌 】
    // 【 商品品牌 】查询 列表 分页
    'admin/goodsoptionbrand/list'   => ['admin/GoodsOptionBrands/listdata', ['method' => 'get']],
    // // 【 商品品牌 】查询 所有
    // 'admin/goodsoptionbrand/alllist'=> ['admin/GoodsOptionBrands/alllist', ['method' => 'get']],
    // 【 商品品牌 】查询 单条
    'admin/goodsoptionbrand/showone'=> ['admin/GoodsOptionBrands/showone', ['method' => 'get']],
    // 【 商品品牌 】新增
    'admin/goodsoptionbrand/newadd' => ['admin/GoodsOptionBrands/newadd', ['method' => 'post']],
    // 【 商品品牌 】编辑
    'admin/goodsoptionbrand/edit'   => ['admin/GoodsOptionBrands/edit', ['method' => 'post']],
    // 【 商品品牌 】软删除
    'admin/goodsoptionbrand/vdel'   => ['admin/GoodsOptionBrands/vdel', ['method' => 'post']],



  // 【 租赁方案类目 】
    // 【 租赁方案类目 】查询 列表 分页
    'admin/goodscategory/list'   => ['admin/GoodsCategorys/listdata', ['method' => 'get']],
    // 【 租赁方案类目 】查询 所有
    'admin/goodscategory/alllist'   => ['admin/GoodsCategorys/alllist', ['method' => 'get']],
    // 【 租赁方案类目 】查询 单条
    'admin/goodscategory/showone'   => ['admin/GoodsCategorys/showone', ['method' => 'get']],
    // 【 租赁方案类目 】新增
    'admin/goodscategory/newadd' => ['admin/GoodsCategorys/newadd', ['method' => 'post']],
    // 【 租赁方案类目 】编辑
    'admin/goodscategory/edit'   => ['admin/GoodsCategorys/edit', ['method' => 'post']],
    // 【 租赁方案类目 】软删除
    'admin/goodscategory/vdel'   => ['admin/GoodsCategorys/vdel', ['method' => 'post']],



  // 【 租赁方案类目 下 商品规格 】
    // 【 租赁方案类目 下 商品规格 】查询 列表 分页
    'admin/categorytype/list'     => ['admin/CategorysTypes/listdata', ['method' => 'get']],
    // 【 租赁方案类目 下 商品规格 】查询 所有
    'admin/categorytype/alllist'   => ['admin/CategorysTypes/alllist', ['method' => 'get']],
    // 【 租赁方案类目 下 商品规格 】查询 单条
    'admin/categorytype/showone'  => ['admin/CategorysTypes/showone', ['method' => 'get']],
    // 【 租赁方案类目 下 商品规格 】新增
    'admin/categorytype/newadd'   => ['admin/CategorysTypes/newadd', ['method' => 'post']],
    // 【 租赁方案类目 下 商品规格 】编辑
    'admin/categorytype/edit'     => ['admin/CategorysTypes/edit', ['method' => 'post']],
    // 【 租赁方案类目 下 商品规格 】软删除
    'admin/categorytype/vdel'     => ['admin/CategorysTypes/vdel', ['method' => 'post']],


  // 【 租赁方案类目 下 商品规格 属性值 】
    // 【 租赁方案类目 下 商品规格 属性值】查询 列表 分页
    'admin/attrtype/list'     => ['admin/AttrTypes/listdata', ['method' => 'get']],
    // 【 租赁方案类目 下 商品规格 属性值】查询 单条
    'admin/attrtype/showone'  => ['admin/AttrTypes/showone', ['method' => 'get']],
    // 【 租赁方案类目 下 商品规格 属性值】新增
    'admin/attrtype/newadd'   => ['admin/AttrTypes/newadd', ['method' => 'post']],
    // 【 租赁方案类目 下 商品规格 属性值】编辑
    'admin/attrtype/edit'     => ['admin/AttrTypes/edit', ['method' => 'post']],
    // 【 租赁方案类目 下 商品规格 属性值】软删除
    'admin/attrtype/vdel'     => ['admin/AttrTypes/vdel', ['method' => 'post']],


  // 【 租赁方案 】
    // 【 租赁方案 】查询 列表 分页
    'admin/goods/list'   => ['admin/Goods/listdata', ['method' => 'get']],
    // 【 租赁方案 】查询 单条
    'admin/goods/showone'   => ['admin/Goods/showone', ['method' => 'get']],
    // 【 租赁方案 】新增
    'admin/goods/newadd' => ['admin/Goods/newadd', ['method' => 'post']],
    // 【 租赁方案 】编辑
    'admin/goods/edit'   => ['admin/Goods/edit', ['method' => 'post']],
    // 【 租赁方案 】软删除
    'admin/goods/vdel'   => ['admin/Goods/vdel', ['method' => 'post']],



  // 【 租赁订单 】
    // 【 租赁订单 】查询 列表 分页
    'admin/orders/list'   => ['admin/Orders/listdata', ['method' => 'get']],
    // 【 租赁订单 】查询个各状态的订单数量
    'admin/orders/listnum'   => ['admin/Orders/listnum', ['method' => 'get']],
    // 【 租赁订单 】查询 单条
    'admin/orders/showone'   => ['admin/Orders/showone', ['method' => 'get']],
    // 【 租赁订单 】新增
    // 'admin/orders/newadd' => ['admin/Orders/newadd', ['method' => 'post']],
    // 【 租赁订单 】编辑/处理
    'admin/orders/edit'   => ['admin/Orders/edit', ['method' => 'post']],
    // 【 租赁订单 】软删除
    // 'admin/orders/vdel'   => ['admin/Orders/vdel', ['method' => 'post']],



  // 【帮助中心】
    // 【 帮助中心 】 帮助文章一级类目 列表查询 分页
    'admin/helpcategory/list'   => ['admin/HelpCategorys/listdata', ['method' => 'get']],
    // 【 帮助中心 】 某一类目 帮助文章列表 所有
    'admin/helpcategory/alllist'   => ['admin/HelpCategorys/alllist', ['method' => 'get']],
    // 【 帮助中心 】 帮助文章一级类目 查询 单条
    'admin/helpcategory/showone'   => ['admin/HelpCategorys/showone', ['method' => 'get']],
    // 【 帮助中心 】 帮助文章一级类目 新增
    'admin/helpcategory/newadd' => ['admin/HelpCategorys/newadd', ['method' => 'post']],
    // 【 帮助中心 】 帮助文章一级类目 编辑
    'admin/helpcategory/edit'   => ['admin/HelpCategorys/edit', ['method' => 'post']],
    // 【 帮助中心 】 帮助文章一级类目 软删除
    'admin/helpcategory/vdel'   => ['admin/HelpCategorys/vdel', ['method' => 'post']],



    // 【 帮助中心 】 某一类目 帮助文章列表查询 分页
    'admin/helparticle/list'   => ['admin/HelpArticles/listdata', ['method' => 'get']],
    // 【 帮助中心 】  查询 某一帮助文章
    'admin/helparticle/showone'   => ['admin/HelpArticles/showone', ['method' => 'get']],
    // 【 帮助中心 】 帮助文章 新增
    'admin/helparticle/newadd' => ['admin/HelpArticles/newadd', ['method' => 'post']],
    // 【 帮助中心 】 帮助文章 编辑
    'admin/helparticle/edit'   => ['admin/HelpArticles/edit', ['method' => 'post']],
    // 【 帮助中心 】 帮助文章 软删除
    'admin/helparticle/vdel'   => ['admin/HelpArticles/vdel', ['method' => 'post']],



  // 【 Banner图 】
    // 【 Banner图 】 查询 列表
    'admin/banner/list'    => ['admin/Banners/listdata', ['method' => 'get']],
    // 【 Banner图 】 查询 某一帮助文章
    'admin/banner/showone' => ['admin/Banners/showone', ['method' => 'get']],
    // 【 Banner图 】 新增
    'admin/banner/newadd'  => ['admin/Banners/newadd', ['method' => 'post']],
    // 【 Banner图 】 编辑
    'admin/banner/edit'    => ['admin/Banners/edit', ['method' => 'post']],
    // 【 Banner图 】 软删除
    'admin/banner/vdel'    => ['admin/Banners/vdel', ['method' => 'post']],



  // 【 文件 】
    // 【 文件上传 】
    'admin/upload/img'   => ['admin/Upload/img', ['method' => 'post']],
    'admin/summernote/upload_img'   => ['admin/Upload/upload_img', ['method' => 'post']],



  // 【 调试 】
    // 【 调试 】 上线前注释掉
    'admin/xzb/index' => ['admin/xzb/index', ['method' => 'GET']],
    'admin/xzb/sessionpath' => ['admin/xzb/sessionpath', ['method' => 'GET']],



  //【 其他 】
    // 【 MISS路由 】
    '__miss__'  => 'admin/base/miss',




/*-----------------------------------------------------------------------------*/



    // 定义资源路由
    // '__rest__'=>[
    //     'admin/rules'          =>'admin/rules',
    //     'admin/groups'         =>'admin/groups',
    //     'admin/users'          =>'admin/users',
    //     'admin/menus'          =>'admin/menus',
    //     'admin/structures'     =>'admin/structures',
    //     'admin/posts'          =>'admin/posts',
    // ],
/*
    // 【基础】登录
    'admin/base/login' => ['admin/base/login', ['method' => 'POST']],
    // 【基础】记住登录
    'admin/base/relogin'    => ['admin/base/relogin', ['method' => 'POST']],
    // 【基础】修改密码
    'admin/base/setInfo' => ['admin/base/setInfo', ['method' => 'POST']],
    // 【基础】退出登录
    'admin/base/logout' => ['admin/base/logout', ['method' => 'POST']],
    // 【基础】获取配置
    'admin/base/getConfigs' => ['admin/base/getConfigs', ['method' => 'POST']],
    // 【基础】获取验证码
    'admin/base/getVerify' => ['admin/base/getVerify', ['method' => 'GET']],
    // 【基础】上传图片
    'admin/upload' => ['admin/upload/index', ['method' => 'POST']],
    // 保存系统配置
    'admin/systemConfigs' => ['admin/systemConfigs/save', ['method' => 'POST']],
    // 【规则】批量删除
    'admin/rules/deletes' => ['admin/rules/deletes', ['method' => 'POST']],
    // 【规则】批量启用/禁用
    'admin/rules/enables' => ['admin/rules/enables', ['method' => 'POST']],
    // 【用户组】批量删除
    'admin/groups/deletes' => ['admin/groups/deletes', ['method' => 'POST']],
    // 【用户组】批量启用/禁用
    'admin/groups/enables' => ['admin/groups/enables', ['method' => 'POST']],
    // 【用户】批量删除
    'admin/users/deletes' => ['admin/users/deletes', ['method' => 'POST']],
    // 【用户】批量启用/禁用
    'admin/users/enables' => ['admin/users/enables', ['method' => 'POST']],
    // 【菜单】批量删除
    'admin/menus/deletes' => ['admin/menus/deletes', ['method' => 'POST']],
    // 【菜单】批量启用/禁用
    'admin/menus/enables' => ['admin/menus/enables', ['method' => 'POST']],
    // 【组织架构】批量删除
    'admin/structures/deletes' => ['admin/structures/deletes', ['method' => 'POST']],
    // 【组织架构】批量启用/禁用
    'admin/structures/enables' => ['admin/structures/enables', ['method' => 'POST']],
    // 【部门】批量删除
    'admin/posts/deletes' => ['admin/posts/deletes', ['method' => 'POST']],
    // 【部门】批量启用/禁用
    'admin/posts/enables' => ['admin/posts/enables', ['method' => 'POST']],
    
    //@2017-12-08 22:08:29 Start
    // +++++++++++++++++++++++++++++++++++++++【租赁商品类目方案】商品类目操作类
    //【商品类目】类目列表查询
    'admin/ordercategory/list' => ['admin/category/list', ['method' => 'GET']],
    //【商品类目】类目新增
    'admin/ordercategory/add'  => ['admin/category/add', ['method' => 'POST']],
    //【商品类目】类目查询
    'admin/category/inquiry'   => ['admin/category/inquiry', ['method' => 'GET']],
    //【商品类目】类目编辑    
    'admin/category/edit'      => ['admin/category/edit', ['method' => 'POST']],
    //【商品类目】类目显示/隐藏
    'admin/category/enabled'   => ['admin/category/enabled', ['method' => 'POST']],
    //【商品类目】类目删除
    'admin/category/delete'    => ['admin/category/delete', ['method' => 'POST']],

    // +++++++++++++++++++++++++++++++++++++++++++++++【租赁商品方案】商品操作类
    //【商品】筛选列表查询
    'admin/scheme/list'        => ['admin/scheme/list', ['method' => 'GET']],
    //【商品】某商品禁用/启用
    'admin/scheme/enabled'     => ['admin/scheme/enabled', ['method' => 'POST']],
    //【商品】详情查询
    'admin/scheme/inquiry'     => ['admin/scheme/inquiry', ['method' => 'POST']],
    //【商品】新增
    'admin/scheme/add'         => ['admin/scheme/add', ['method' => 'POST']],
    //【商品】/【租赁方案】信息编辑
    'admin/scheme/edit'        => ['admin/scheme/edit', ['method' => 'POST']],
    //【商品】删除
    'admin/scheme/delete'      => ['admin/scheme/delete', ['method' => 'POST']],


    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++订单操作类
    //【订单】列表（按类别） [所有订单、待付款、待发货、待收货、待归还、待确认归还、交易完成、订单关闭、退货]
    'admin/order/list'         => ['admin/order/list', ['method' => 'GET']],
    //【订单】编辑 （处理,[支付确认、发货,返还确认]）
    'admin/order/edit'         => ['admin/order/edit', ['method' => 'POST']],
    //【订单】详情查看
    'admin/order/inquiry'      => ['admin/order/inquiry', ['method' => 'POST']],
    //【订单】订单删除
    'admin/order/delete'       => ['admin/order/delete', ['method' => 'POST']],
    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++用户操作类
    //

    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++订单操作类
    //【商品类目】列表
    'admin/goodscategory/list'         => ['admin/goodscategory/list', ['method' => 'GET']],
    //【商品类目】编辑 
    'admin/goodscategory/edit'         => ['admin/goodscategory/edit', ['method' => 'POST']],
    //【商品类目】增加
    'admin/goodscategory/add'          => ['admin/goodscategory/add', ['method' => 'POST']],
    //【商品类目】订单真删除
    'admin/goodscategory/delete'       => ['admin/goodscategory/delete', ['method' => 'POST']],
    //【商品类目】订单软删除
    'admin/goodscategory/vdelete'      => ['admin/goodscategory/vdelete', ['method' => 'POST']],
    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++用户操作类
    // 
    'admin/test/login'      => ['admin/test/login', ['method' => 'get']],
    'admin/test/login'      => ['admin/test/login', ['method' => 'post']],

    //@2017-12-08 22:08:20 End
    // MISS路由
    '__miss__'  => 'admin/base/miss',
    */
];