// 封装的公共函数
function ajaxMethod(str,o) {
    var oLink = urlLink(str);
    var result = {};
    console.log("===执行封装的公共函数ajaxMethod===");
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

// 请求
function urlLink(str)
{
    // url对应的 API地址

    var url = {

        // getBanner:{//获取首页banner
        //     method:'get',
        //     url:'/index.php/Index/index'
        // },
        IndexInit:{//获取首页初始化数据
            method:'get',
            url:'/index.php/Index/index'
        },
        login:{//登陆
            method:'post',
            url:'/index.php/admin/base/login'
        },
        logout:{//退出
            method:'post',
            url:'/index.php/admin/base/logout'
        },
        picUpload:{//图片上传
            method:'post',
            url:'/index.php/attachment/upload'
        }
    }
    return url[str];
}