$(function(){
	/*$(".J_menuItem").on('click',function(){
            var url = $(this).attr('data-href');
            var getdate = $(this).attr('getdata');
            //alert(url);
            //alert(getdate);
            $("#J_iframe").attr('src',url);
            $("#J_iframe").attr('data-id',getdate);
            // sessionStorageSave('src',{url:url});
            return false;
        });*/
    //菜单获取
   /* var result = ajaxMethod('menu');
    if(result.executeStatus === 0){
        var mL=result.values;
        //循环一级菜单
        $.each(mL, function(i,j){
            var html = "";
            //var aa=ml[i].secondMenus;
             var aa=result.values[i].secondMenus;

            html+= '<li>'
            html+='<a href="'+j.menuUrl+'"><i class="fa fa-table"></i> <span class="nav-label">'+j.menuName+' </span><span class="fa arrow"></span></a>'
            //循环二级菜单
            $.each(aa, function(m, n){
              
                 html+= '<ul class="nav nav-second-level">'
                 html+= '<li><a class="J_menuItem" data-href="'+n.menuUrl+'"> '+n.menuName +'</a></li>'
                  html+= '</ul>'
            })
             html+= '</li>'
             $("#side-menu").append(html);
        })
        //下拉菜单
        $('#side-menu').metisMenu();
        $(".J_menuItem").on('click',function(){
            var url = $(this).attr('data-href');
            var getdate = $(this).attr('getdata');
            //alert(url);
            //alert(getdate);
            $("#J_iframe").attr('src',url);
            $("#J_iframe").attr('data-id',getdate);
            // sessionStorageSave('src',{url:url});
            return false;
        });
        //F5刷新保持当前页面功能
        /*var src = JSON.parse(sessionStorage.getItem('src'));
        if(src){
            $("#J_iframe").attr('src',src.url);
        }else{
            $("#J_iframe").attr('src','/welcome.html');
        }
    }else{
        window.location.href="index.html";
    }*/


        // MetsiMenu
    $('#side-menu').metisMenu();

    // 打开右侧边栏
    $('.right-sidebar-toggle').click(function () {
        $('#right-sidebar').toggleClass('sidebar-open');
    });

    //固定菜单栏
    $(function () {
        $('.sidebar-collapse').slimScroll({
            height: '100%',
            railOpacity: 0.9,
            alwaysVisible: false
        });
    });


    // 菜单切换
    $('.navbar-minimalize').click(function () {
        $("body").toggleClass("mini-navbar");
        SmoothlyMenu();
    });


    // 侧边栏高度
    function fix_height() {
        var heightWithoutNavbar = $("body > #wrapper").height() - 61;
        $(".sidebard-panel").css("min-height", heightWithoutNavbar + "px");
    }
    fix_height();

    $(window).bind("load resize click scroll", function () {
        if (!$("body").hasClass('body-small')) {
            fix_height();
        }
    });

    //侧边栏滚动
    $(window).scroll(function () {
        if ($(window).scrollTop() > 0 && !$('body').hasClass('fixed-nav')) {
            $('#right-sidebar').addClass('sidebar-top');
        } else {
            $('#right-sidebar').removeClass('sidebar-top');
        }
    });

    $('.full-height-scroll').slimScroll({
        height: '100%'
    });

    $('#side-menu>li').click(function () {
        if ($('body').hasClass('mini-navbar')) {
            NavToggle();
        }
    });
    $('#side-menu>li li a').click(function () {
        if ($(window).width() < 769) {
            NavToggle();
        }
    });

    $('.nav-close').click(NavToggle);

    //ios浏览器兼容性处理
    if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
        $('#content-main').css('overflow-y', 'auto');
    }

});
function logOut(){
    layer.confirm('是否退出当前账号？', {
      btn: ['确定','取消'] //按钮
    }, function(){
      //window.location.href="index.html";
      sureLogOut()
    }, function(){
      // console.log('取消');
    });

}
function sureLogOut(){
	  var data = {
           id:"1"
        };
	 var result = ajaxMethod('logout',data);
	 console.log(result);
	 if(result.status == 1){
	 	  addCookie("authKey","");
            addCookie("sessionId","");
            window.location.href="index.html";
          
	 }
	 else{
	 	 layer.msg(result.msg);
	 }
	
	
}
function addCookie(str,value){
    var date = new Date();
    var delDay = 7;//保存7天时间
    date.setTime(date.getTime()+delDay*24*3600*1000);
    document.cookie = str+"="+value+";"+"expires="+date.toGMTString();
}
$(window).bind("load resize", function () {
    if ($(this).width() < 769) {
        $('body').addClass('mini-navbar');
        $('.navbar-static-side').fadeIn();
    }
});

function NavToggle() {
    $('.navbar-minimalize').trigger('click');
}

function SmoothlyMenu() {
    if (!$('body').hasClass('mini-navbar')) {
        $('#side-menu').hide();
        setTimeout(
            function () {
                $('#side-menu').fadeIn(500);
            }, 100);
    } else if ($('body').hasClass('fixed-sidebar')) {
        $('#side-menu').hide();
        setTimeout(
            function () {
                $('#side-menu').fadeIn(500);
            }, 300);
    } else {
        $('#side-menu').removeAttr('style');
    }
}
//弹窗
function layerMes(str){
    layer.open({
        title: '提示信息',
        content: str
    });
}