
// 首页js
$(function()
{
    console.log('这是首页js--开始执行！');
    // 执行页面数据初始化函数
    initpage();
})

// 请求初始化
function initpage()
{
    console.log('执行页面数据初始化函数');
    var init_data = ajaxMethod('IndexInit');
    console.log(init_data);
    if(init_data.status==1)
    {
        // 组合Banner轮播区html代码
        var bannerArr = init_data.data.banner;
        // var htmlStr =StitchingbannerHtml(bannerArr);
        StitchingbannerHtml(bannerArr);
        // console.log(htmlStr);
        //组合类目选择菜单栏

        
    }
    else
    {
        console.log('初始化请求数据出错！');
    }
    

}

// 拼接 Banner轮播html
function StitchingbannerHtml(bannerArr)
{
    // <div class="aui-banner-wrapper-item">
    //     <a href="#">
    //         <img src="themes/img/banner/banner3.jpg">
    //     </a>
    // </div>
    var htmlStr = '';
    for (var bannerNum = 0;bannerNum < bannerArr.length; bannerNum++)
    {
        htmlStr = htmlStr 
                 + '<div class="aui-banner-wrapper-item">'
                        +'<a href='+bannerArr[bannerNum].url+'>'
                        +'<img src='+bannerArr[bannerNum].banner_pic_url+'>'
                        +'</a>'
                 + '</div>'
    }
    // 更改html
    $('#index_banner_group').html(htmlStr);
    // return htmlStr;
}

// 拼接 Banner轮播html
function StitchingCategoryHtml(dataArr)
{
    // <a href="my-invitation.html" class="aui-grid-row-item">
    //     <i class="aui-icon-large aui-icon-share"></i>
    //     <p class="aui-grid-row-label">分享领券</p>
    // </a>
    // var htmlStr = '';
    // for (var ArrNum = 0;ArrNum < dataArr.length; ArrNum++)
    // {
    //     htmlStr = htmlStr 
    //              + '<a href='++' class="aui-grid-row-item">'
    //                     +'<i class="aui-icon-large aui-icon-share"></i>'
    //                     +'<img src='+dataArr[ArrNum].banner_pic_url+'>'
    //                     +'<p class="aui-grid-row-label">'++'</p>'
    //              + '</a>'
    // }
    // // 更改html
    // $('#index_category_group').html(htmlStr);
    // // return htmlStr;
}

