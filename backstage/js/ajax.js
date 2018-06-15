function ajaxMethod(str,o) {
    var oLink = urlLink(str);
    var result = {};
    console.log("Ajax请求：我准备好了-^_^-");
    $.ajax({
        type: oLink.method,
        url: '${url}' + oLink.url,
        data: o,
        dataType:'json',
        async:false,
        cache:false,
        success:function (data) {
            result = data;
            //console.log(result.code);
            
             if(data.code == '1012' ||data.code == 1012 ){
            
                 window.location.href = 'index.html';
            }
            if(data.status == '0'){
           
                layerMes(data.msg);
            }
            
            
        },
        error:function (xhr,textStatus) {
            if(xhr == 504){
                layerMes('请求超时，请稍后再试。');
            }else{
                layerMes('连接出错，请稍后再试。');
            }
            result.status = 0;
        }
    });
    return result;
}


function urlLink(str){
    var url = {
        login:{//后台登陆
            method:'post',
            url:'/index.php/admin/base/login'
        },
        logout:{//退出
            method:'post',
            url:'/index.php/admin/base/logout'
        },
  //商品管理====================================================================
      //类目管理================================================================
        goodsOptionCategory:{//列表 分页
            method:'get',
            url:'/index.php/admin/goodsoptioncategory/list'
        },
        goodsOptionCategoryAll:{//列表 所有
            method:'get',
            url:'/index.php/admin/goodsoptioncategory/alllist'
        },
        goodsOptionCategoryAdd:{//增加
            method:'post',
            url:'/index.php/admin/goodsoptioncategory/newadd'
        },
        goodsOptionCategoryShowone:{//单条查询
            method:'get',
            url:'/index.php/admin/goodsoptioncategory/showone'
        },
        goodsOptionCategoryEdit:{//编辑
            method:'post',
            url:'/index.php/admin/goodsoptioncategory/edit'
        },
        goodsOptionCategoryDel:{//删除
            method:'post',
            url:'/index.php/admin/goodsoptioncategory/vdel'
        },
      //品牌管理================================================================
        goodsOptionBrand:{//列表 分页
            method:'get',
            url:'/index.php/admin/goodsoptionbrand/list'
        },
        // goodsOptionBrandAll:{//列表 所有
        //     method:'get',
        //     url:'/index.php/admin/goodsoptionbrand/alllist'
        // },
        goodsOptionBrandAdd:{//增加
            method:'post',
            url:'/index.php/admin/goodsoptionbrand/newadd'
        },
        goodsOptionBrandShowone:{//单条查询
            method:'get',
            url:'/index.php/admin/goodsoptionbrand/showone'
        },
        goodsOptionBrandEdit:{//编辑
            method:'post',
            url:'/index.php/admin/goodsoptionbrand/edit'
        },
        goodsOptionBrandDel:{//删除
            method:'post',
            url:'/index.php/admin/goodsoptionbrand/vdel'
        },
  //方案管理====================================================================
      //类别管理================================================================
        leaseType:{//租赁分类列表 分页
            method:'get',
            url:'/index.php/admin/goodscategory/list'
        },      
        leaseallType:{//租赁分类列表 所有
            method:'get',
            url:'/index.php/admin/goodscategory/alllist'
        },      
         leaseTypeAdd:{//租赁分类增加
            method:'post',
            url:'/index.php/admin/goodscategory/newadd'
        },
        leaseShowone:{//租赁类别单条查询
            method:'get',
            url:'/index.php/admin/goodscategory/showone'
        },
        leaseEdit:{//租赁分类编辑
            method:'post',
            url:'/index.php/admin/goodscategory/edit'
        }, 
        leaseDel:{//租赁分类删除
            method:'post',
            url:'/index.php/admin/goodscategory/vdel'
        },  
        //类别属性管理===========================================================
        categoryType:{//列表 分页
            method:'get',
            url:'/index.php/admin/categorytype/list'
        },      
        categoryallType:{//列表 所有
            method:'get',
            url:'/index.php/admin/categorytype/alllist'
        },
        categoryTypeAdd:{//增加
            method:'post',
            url:'/index.php/admin/categorytype/newadd'
        },
        categoryTypeShowone:{//单条查询
            method:'get',
            url:'/index.php/admin/categorytype/showone'
        },
        categoryTypeEdit:{//编辑
            method:'post',
            url:'/index.php/admin/categorytype/edit'
        }, 
        categoryTypeDel:{//删除
            method:'post',
            url:'/index.php/admin/categorytype/vdel'
        },  
        //类别属性得属性值管理===========================================================
        attrType:{//列表
            method:'get',
            url:'/index.php/admin/attrtype/list'
        },
        attrTypeAdd:{//增加
            method:'post',
            url:'/index.php/admin/attrtype/newadd'
        },
        attrTypeShowone:{//单条查询
            method:'get',
            url:'/index.php/admin/attrtype/showone'
        },
        attrTypeEdit:{//编辑
            method:'post',
            url:'/index.php/admin/attrtype/edit'
        }, 
        attrTypeDel:{//删除
            method:'post',
            url:'/index.php/admin/attrtype/vdel'
        },         //方案列表===========================================================
         leaseShop:{
            method:'get',
            url:'/index.php/admin/goods/list'
        }, 
       //发布方案===========================================================
  //订单管理===========================================================   
        orderList:{//所有订单
            method:'get',
            url:'/index.php/admin/orders/list'
        },
        orderEdit:{//订单状态编辑
            method:'post',
            url:'/index.php/admin/orders/edit'
        }, 
        orderNum:{//订单各状态数量
            method:'get',
            url:'/index.php/admin/orders/listnum'
        }, 
  //文档管理===========================================================   
        helpTypeList:{//帮助文档分类列表 分页
            method:'get',
            url:'/index.php/admin/helpcategory/list'
        },
        helpTypeListall:{//帮助文档分类列表 所有
            method:'get',
            url:'/index.php/admin/helpcategory/alllist'
        },
        helpTypeShowOne:{//帮助文档分类单条查询
            method:'get',
            url:'/index.php/admin/helpcategory/showone'
        },
        helpTypeAdd:{//帮助文档分类增加
            method:'post',
            url:'/index.php/admin/helpcategory/newadd'
        },
         helpTypeEdit:{//帮助文档分类编辑
            method:'post',
            url:'/index.php/admin/helpcategory/edit'
        },
         helpTypeDel:{//帮助文档分类删除
            method:'post',
            url:'/index.php/admin/helpcategory/vdel'
        },
        helpList:{//帮助文档列表
            method:'get',
            url:'/index.php/admin/helparticle/list'
        },
        helpShoeOne:{//帮助文档列表单条查询
            method:'get',
            url:'/index.php/admin/helparticle/showone'
        },
        helpEdit:{//帮助文档列表编辑
            method:'post',
            url:'/index.php/admin/helparticle/edit'
        },
        helpAdd:{//帮助文档添加
            method:'post',
            url:'/index.php/admin/helparticle/newadd'
        },
        helpDel:{//帮助文档删除
            method:'post',
            url:'/index.php/admin/helparticle/vdel'
        },
  // Banner管理=================================================================
        bannerList:{//列表 分页
            method:'get',
            url:'/index.php/admin/banner/list'
        },
        bannerShoeOne:{//列表单条查询
            method:'get',
            url:'/index.php/admin/banner/showone'
        },
        bannerEdit:{//编辑
            method:'post',
            url:'/index.php/admin/banner/edit'
        },
        bannerAdd:{//添加
            method:'post',
            url:'/index.php/admin/banner/newadd'
        },
        bannerDel:{//删除
            method:'post',
            url:'/index.php/admin/banner/vdel'
        },
  //我的账户===========================================================   
        updatePwd:{//修改密码
            method:'post',
            url:'/index.php/admin/users/setpwd'
        },
        operatRecord:{//操作日志
            method:'get',
            url:'/index.php/admin/operationlog/list'
        },
        
  //其他===========================================================   
        address:{//地址
            method:'post',
            url:'/cityC/SelctACS.do'
        },
        picUpload:{//图片上传
            method:'post',
            url:'/attachment/upload'
        }
        

    }
    return url[str];
}