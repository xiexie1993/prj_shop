
$(function(){
    createCode();//创建二维码
    //登陆按钮
    $("#login").click(function(){
        loginEnter();
    });
    //回车事件
    document.onkeydown = function(e){
        // 兼容FF和IE和Opera
        var theEvent = e || window.event;
        var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
        if(code == 13){
            if(enterStatus == false){
                loginEnter();
            }else{
                $("a.layui-layer-btn0").click();//弹出层关闭
                enterStatus = false;
            }
        }
    };
    $('#username').val(getCookie('_CONST_USER_ID_KZ_'));
    $('#password').val('');
    $('#codeInput').val('');
})

function loginEnter(){
    //校验验证码
    var codeReturn = validate();
    //校验登录
    var mesReturn = logins();
    if(codeReturn && mesReturn){
        addCookie("_CONST_USER_ID_KZ_",$("#username").val());
        var data = {
            user_name: $('#username').val(),
            password: $.md5($('#password').val()),
        };
        var result = ajaxMethod('login',data);
        console.log(result);
        if(result.status === 1){
            sessionStorage.setItem('src',JSON.stringify({url:'welcome.html'}));
            addCookie("authKey",result.data.authKey);
            addCookie("sessionId",result.data.sessionId);
            // addCookie("userInfo",result.data.userInfo);
            window.location.href = 'home.html';
        }else{
            createCode();
        }
    }
}
function getCookie(str){
    var aStr = document.cookie.split(';');
    for(var i=0; i<aStr.length; i++){
        while(aStr[i].indexOf(' ')!=-1){
            aStr[i] = aStr[i].replace(' ','');
        }
        var arr = aStr[i].split('=');
        if(arr[0] == str){
            return arr[1];
        }
    }
}
function addCookie(str,value){
    var date = new Date();
    var delDay = 7;//保存7天时间
    date.setTime(date.getTime()+delDay*24*3600*1000);
    document.cookie = str+"="+value+";"+"expires="+date.toGMTString();
}
function delCookie(str){
    var date = new Date();
    date.setTime(date.getTime()-10000);
    document.cookie = str+"="+";"+"expires="+date.toGMTString();
}
//验证用户名跟密码
function logins(){
    var user = $('#username').val();
    var pass = $('#password').val();
    enterStatus = true;
    if(user.length <= 0 || user.length =="" ) {
        layerMes('请输入用户名');
    }else if(user.length>20){
        layerMes('用户名必须在20字符之间');
    }else if(pass.length <= 0 || pass.length =="" ) {
        layerMes('请输入密码');
    }else if(pass.length>18){
        layerMes('用户名必须在18个字符之间');
    }else{
        return true;
        enterStatus = false;
    }
}

var code;//在全局定义验证码
var enterStatus = false;
function createCode(){
    code = "";
    var codeLength = 4;//验证码的长度
    var checkCode = document.getElementById("code");
    var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');//随机数
    for(var i = 0; i < codeLength; i++) {//循环操作
        var index = Math.floor(Math.random()*36);//取得随机数的索引（0~35）
        code += random[index];//根据索引取得随机数加到code上
    }
    checkCode.value = code;//把code值赋给验证码
}
//校验验证码
function validate(){
    var inputCode = $('#codeInput').val().toUpperCase();//取得输入的验证码并转化为大写
    enterStatus = true;
    if(inputCode.length <= 0) {//若输入的验证码长度为0
        layerMes('请输入验证码！');
    }else if(inputCode != code ) { //若输入的验证码与产生的验证码不一致时
        layerMes('验证码输入错误');
        createCode();//刷新验证码
        document.getElementById("codeInput").value = "";//清空文本框
    }else{
        return true;
        enterStatus = false;
    }
}
//弹窗
function layerMes(str){
    layer.open({
        title: '提示信息',
        content: str
    });
}