//form数据转json数据
function formJson(data){
	var o = {};
	$.each(data, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
}
//本地缓存保存、获取
function sessionStorageSave(name,json){
    sessionStorage.setItem(name,JSON.stringify(json));
}
function sessionStorageGet(name){
    return JSON.parse(sessionStorage.getItem(name));
}
//iframe链接本地缓存
function iframeSrcSave(){
    var src = window.location.pathname;
    sessionStorageSave('src',{url:src});
}
iframeSrcSave();
//弹窗
function layerMes(str){
    layer.open({
        title: '提示信息',
        content: str
    });
}
//刷对应id位置的数据
function brushIdData(data){
  for(var i in data){
    $('#'+i).html(data[i]);
  }
}
//select添加选项
function addSelect(id,data,bool,val,text){//bool是否添加“不限”选项
    val = val || 'type';
    text = text || 'name';
    console.log(val,text);
    var html = '<option value=""></option>';
    var $id = $('#'+id);
    $id.html('');
    if(bool){
        $id.html('<option value="">不限</option>');
    }
    $id.val('');
    for(var i in data){
        $id.html($id.html() + html);
        var $option = $id.find('option:last');
        $option.val(data[i][val]);
        $option.html(data[i][text]);
    }
}

//约定数据转换
function agreedDataReturn(type,data,val,text){
    val = val || 'type';
    text = text || 'name';
    console.log("loading。。。。。。。。。。。。。")
    var result = '';
    data.forEach(function(item){
        if(item[val] === type) {
            result = item[text];
        }
    });
    return result;
}
//约定数据转换
function agreedStrReturn(type,data){
    var result = '';
    data.forEach(function(item){
        if(item.name === type) {
            result = item.type;
        }
    });
    return result;
}

function BstpTable(obj,o){
    var that = this;
    that.obj=obj;
    that.data = o;
    return {inint:function(searchArgs){
            if(that.data.fnSuc) var fnSuc = that.data.fnSuc;
            that.obj.bootstrapTable('destroy');
            that.obj.bootstrapTable({

                url: '${url}' + that.data.urlData.url,
                method: that.data.urlData.method,
                contentType: 'application/x-www-form-urlencoded',
                queryParamsType:'',
                queryParams: function queryParams(params) {
                    var param = {
                        page_no: params.pageNumber,
                        page_size: params.pageSize
                    };
                    for(var key in searchArgs){
                        param[key]=searchArgs[key];
                    }
                    return param;                   
                },
                locale:'zh-CN',
                striped: true,
                pagination: (that.data.pagination === false? false : true),
                pageNumber:1,
                pageSize: 10,
                pageList: [10,20,30],
                sidePagination: "server",
                columns: that.data.columns,
                onLoadSuccess:function(data){  
                	//console.log(this.queryParams);
                    console.log('mes',data);
                   // console.log(data.code);
                    if(data.status == "0"){
                        layerMes(data.msg);
                    }
                    if(data.code == "1012"){
                    	//console.log("77777777777777--");
                         layerMes(data.msg);
                    }
                    if(fnSuc){
                        fnSuc(this.pageNumber,this.pageSize,data);
                    }
                },
                onLoadError:function(xhr,textStatus){
                    if(xhr == 504){
                        layerMes('请求超时，请稍后再试。504');
                    }else{
                        layerMes('连接出错，请稍后再试。');
                    }
                }
          })
        }
    }
}
//时间排序//&ensp;<span class="glyphicon glyphicon-triangle-bottom cur" onclick="timeOrdering(this)"></span>
function timeOrdering(obj){
    console.log(obj.className);
    if(obj.className.indexOf('top') != -1){
        console.log(1)
        obj.className = obj.className.replace('top','bottom');
    }else{
        console.log(2)
        obj.className = obj.className.replace('bottom','top');
    }
}
//全部选择操作
function selectAll(obj,inputName){
  // console.log(inputName);
  if($(obj).prop('checked') === true){
    $('input[name='+inputName+']').prop('checked',true);
  }else{
    $('input[name='+inputName+']').prop('checked',false);
  }
}
function selectAllEdit(inputName){
  var ids = [];
  $('input[name='+inputName+']').each(function(){
    if($(this).prop('checked')){
      ids.push($(this).val());
    }
  });
  return ids;
}
function checkAllPass(str){
    var formData = {ids:selectAllEdit('select')};
    formData.auditType = 'B';
    if(formData.ids.length == 0){
        layerMes('尚未选择任何对象。');
    }else{
        var result = ajaxMethod(str,formData);
        if(result.executeStatus != '1'){
            bstpTable.inint({});
            layerMes('操作成功');
        }
    }
}
function checkAllFail(str){
    var formData = {ids:selectAllEdit('select')};
    formData.auditType = 'C';
    if(formData.ids.length == 0){
        layerMes('尚未选择任何对象。');
    }else{
        var result = ajaxMethod(str,formData);
        if(result.executeStatus != '1'){
            bstpTable.inint({});
            layerMes('操作成功');
        }
    }
}

//原图展示
function originalPic(){
    var $originalPic = $('.original-pic');
    return {
        hiden: function(){
            if($originalPic.css('display') == 'flex'){
                $originalPic.css('display','none');
            }
        },
        show: function(obj){
            $originalPic.css('display','flex');
            $originalPic.find('img').attr('src',$(obj).attr('src'));
        }
    }
}

//图片上传
function picUpload(){
    $('#formPic').change(function(event){
        event = event? event: window.event;
        var target = event.target || event.srcElement;
        if (target.value.length == 0) {
            $('#pic').attr('src','');
            $('#pic').attr('data-src','');
        } else {
            $('#picUpLoad').submit();
        }
    })
    $('#picUpLoad').ajaxForm({
        beforeSend: function() {
            picSending = true;
        },
        uploadProgress: function(event, position, total, percentComplete) {
        // console.log(event, position, total, percentComplete);
        },
        success: function(data) {
        // console.log(data);
        },
        complete: function(xhr) {
            // console.log(xhr.responseText);
            var data = JSON.parse(xhr.responseText);
            console.log(data);
            if(data.executeStatus === '0'){
                $('#pic').attr('src',data.values[0].viewUrl);
                $('#pic').attr('data-src',data.values[0].storageUrl);
                picSending = false;
            }else{
                layerMes(data.errorMsg);
            }
        }
    });
}
//表情包上传
function zipUpload(){
    $('#formZip').change(function(event){
        event = event? event: window.event;
        var target = event.target || event.srcElement;
        $('#zipProgress').html('');
        if (target.value.length == 0) {
            $('#zipProgress').css('width','0%');
            $('#formZip').attr('data-url','');
        } else {
            if(target.value.indexOf('.zip') == -1){
                $('#formZip').val('');
                layerMes('请选择zip文件')
            }else{
                $('#zipUpLoad').submit();
            }
        }
    })
    $('#zipUpLoad').ajaxForm({
        beforeSend: function() {
            zipSending = true;
        },
        uploadProgress: function(event, position, total, percentComplete) {
            // console.log(event, position, total, percentComplete);
            upload = new progressBarRun('zipProgress');
        },
        success: function(data) {
            data = JSON.parse(data);
            console.log(data);
            if(data.executeStatus === '0'){
                upload.status = true;
                $('#zipProgress').html('上传成功');
                $('#formZip').attr('data-url',data.values[0].storageUrl);
                zipSending = false;
            }else{
                layerMes(data.errorMsg);
            }
        },
        complete: function(xhr) {
            // console.log(xhr.responseText);
        }
    });
}
//进度条
function progressBarRun(id){
    var that = this;
    that.status = false;
    that.$id = $('#'+id);
    var nowWidth = 0;
    that.$id.timer = setInterval(function(){
        if(nowWidth < 80){
            nowWidth += 3;
            that.$id.css('width',nowWidth+'%');
        }else if(that.status){
            nowWidth += 6;
            that.$id.css('width',nowWidth+'%');
        }
        if(nowWidth >= 100){
            console.log('finish');
            clearInterval(that.$id.timer);
        }
        // console.log(nowWidth);
    },10)
}
//期限刷数据
function dateReflesh(o,str){
    var htmlList = '';
    dateRefleshStr = str;
    if(o.values.length == 0){
        htmlList = '<div class="form-group">'
            +'<label class="col-xs-2 control-label"></label>'
            +'<div class="col-xs-4"><input type="number" class="form-control" name="useDate" placeholder="使用天数"></div>'
            +'<div class="col-xs-4"><input type="number" class="form-control" name="buyPrice" placeholder="购买价格"></div>'
            +'<label class="col-xs-2 dateMesPic">'
            +'<img src="img/sub.png" id="listSub" onclick="dateSub(this)">'
            +'</label>'
            +'</div>';
    }else{
        o.values.forEach(function(item, value, index){
            htmlList += '<div class="form-group">'
                +'<label class="col-xs-2 control-label"></label>'
                +'<div class="col-xs-4"><input type="number" class="form-control" name="useDate" placeholder="使用天数" value="'+item.dueTime+'"></div>'
                +'<div class="col-xs-4"><input type="number" class="form-control" name="buyPrice" placeholder="购买价格" value="'+item.propPrice+'"></div>'
                +'<label class="col-xs-2 dateMesPic">'
                +'<img src="img/sub.png" id="listSub" onclick="dateSub(this)">'
                +'</label>'
                +'</div>';
        })
    }
    $('#dateList').html(htmlList);
    $('#dateList .control-label:first').html(str);

    $('input[type=number]').keypress(function(e) {
    　　if (!String.fromCharCode(e.keyCode).match(/[0-9\.]/)) {
    　　　　return false;
    　　}
    });
}
//期限获取数据
function dateGet(){
    var $dateList = $('#dateList .form-group');
    var result = [];
    var status = true;
    $dateList.each(function(index){
        var useDate = $(this).find('input[name="useDate"]').val();
        var buyPrice = $(this).find('input[name="buyPrice"]').val();
        console.log('useDate:',useDate,'buyPrice:',buyPrice);
        result.push({price:buyPrice,dueTimes:useDate});
        if(!useDate || !buyPrice){
            status = false;
            layerMes('数据不全');
        }
    })
    result = status?result : null;
    return result;
}
//期限减
function dateSub(obj){
  var $dateList = $('#dateList .form-group');
  if($dateList.length <= 1){
    $dateList.find('input[name="useDate"]').val('');
    $dateList.find('input[name="buyPrice"]').val('');
  }else{
    $(obj).parent().parent().remove();
    $('#dateList .control-label:first').html(dateRefleshStr);
  }
}
//期限加
function dateAdd(){
  var htmlList = '<div class="form-group">'
            +'<label class="col-xs-2 control-label"></label>'
            +'<div class="col-xs-4"><input type="number" class="form-control" name="useDate" placeholder="使用天数"></div>'
            +'<div class="col-xs-4"><input type="number" class="form-control" name="buyPrice" placeholder="购买价格"></div>'
            +'<label class="col-xs-2 dateMesPic">'
              +'<img src="img/sub.png" id="listSub" onclick="dateSub(this)">'
            +'</label>'
          +'</div>';
  $('#dateList').append(htmlList); 
  $('#dateLists').append(htmlList);
  $('input[type=number]').keypress(function(e) {
    　　if (!String.fromCharCode(e.keyCode).match(/[0-9\.]/)) {
    　　　　return false;
    　　}
    });
}

var agreedData = {
    adviceStatus:[//企业服务信息
        //{type:'A',name:'已提交'},
        {type:'B',name:'已处理'},
        {type:'N',name:'未处理'}
    ],
    status:[
        {type:'E',name:'启用',radioName:'isVaild'},
        {type:'D',name:'禁用',radioName:'isVaild'}
    ],
    statusOpposite:[
        {type:'0',name:'禁用'},
        {type:'1',name:'启用'}
    ],
    userType:[
        {type:'C',name:'核心代理',nextName:''},
        {type:'O',name:'一级代理',nextName:'核心代理'},
        {type:'T',name:'二级代理',nextName:'一级代理'},
        {type:'G',name:'普通用户',nextName:'二级代理'},
        {type:'D',name:'公司账号',nextName:''}
    ],
    userChangeType:[
        {type:'C',name:''},
        {type:'O',name:'升级代理'},
        {type:'T',name:'升级代理'},
        {type:'G',name:'成为代理'}
    ],
    propType:[
        {type:'A',name:'龙珠'},
		{type:'B',name:'龙卡'},
        {type:'C',name:'钻石'},
		{type:'D',name:'道具'}
    ],
    giftType:[
        {type:'B',name:'龙卡'},
        {type:'A',name:'龙珠'},
        {type:'C',name:'钻石'},
        {type:'D',name:'其他'}
    ],
    issuePropType:[
        {type:'B',name:'龙卡'},
        {type:'A',name:'龙珠'},
        {type:'C',name:'钻石'}//,
        // {type:'D',name:'表情包'},
        // {type:'E',name:'语音包'},
        // {type:'F',name:'道具'}
    ],
    shareType:[
        {type:'B',name:'龙卡'}
    ],
    issueType:[
        {type:'A',name:'所有人'},
        {type:'B',name:'指定用户'}
    ],
    isFirst:[
        {type:'Y',name:'首充'},
        {type:'N',name:'非首充'}
    ],
    auditiStatus:[
        {type:'A',name:'提交'},
        {type:'B',name:'审核通过'},
        {type:'C',name:'审核失败'},
        {type:'D',name:'兑换成功'},
    ],
    typeStatus:[
        {type:'R',name:'龙卡'},
        {type:'G',name:'龙珠'}
    ],
    agentState:[
        {type:'D',name:'尚未审核'},
        {type:'A',name:'审核通过'},
        {type:'F',name:'审核失败'},
        {type:'R',name:'复审通过'}

    ],
    auditTypes:[
        {type:'A',name:'提交'},
        {type:'B',name:'审核通过'},
        {type:'C',name:'审核失败'}
    ],
    belongsType:[
        {type:'A',name:'内部'},
        {type:'I',name:'外部'}
    ],
    recommendType:[
        {type:'O',name:'普通用户'},
        {type:'P',name:'代理推荐'}
    ],
    goodsType:[
        {type:'B',name:'龙卡'},
        {type:'A',name:'龙珠'},
        {type:'C',name:'钻石'},
        {type:'D',name:'表情包'},
        {type:'E',name:'语音包'},
        {type:'F',name:'道具'}
    ],
	ID:[
        {type:'0',name:'-'}
    ],
    orderState:[
        {type:'A',name:'交易成功'},
        {type:'F',name:'交易失败'},
        {type:'N',name:'未支付'},
        {type:'C',name:'已取消'},
        {type:'T',name:'已退款'}
    ],
    profitStatus:[
        {type:'N',name:'未分润'},
        {type:'A',name:'已分润'},
    ],
    type:[
        {type:'A',name:'龙珠'},
        {type:'B',name:'龙卡'},
        {type:'C',name:'钻石'},
        {type:'D',name:'道具'},
        {type:'E',name:'表情包'},
        {type:'F',name:'语音包'},
    ],
    orderStates:[
        {type:'A',name:'交易成功'},
        {type:'F',name:'交易失败'},
        {type:'N',name:'未支付'},
        {type:'C',name:'已取消'},
        {type:'T',name:'已退款'}
    ],
    payStatus:[
        {type:'A',name:'已支付'},
        {type:'F',name:'支付失败'},
        {type:'N',name:'未支付'}
    ],
    changeType:[
        {type:'Z',name:'收入'},
        {type:'S',name:'支出'}
    ],
    sourceOfProps:[
        {type:'A',name:'首冲购买'},
        {type:'B',name:'商场购买'},
        {type:'C',name:'分享领取'},
        {type:'D',name:'首次登录领取'},
        {type:'E',name:'节日或活动群发'},
        {type:'F',name:'指定用户群发或个人'},
        {type:'G',name:'礼物指定发放'},
        {type:'H',name:'比赛场次赢取'},
        {type:'I',name:'兑换商品(消耗或退还)'},
        {type:'J',name:'后台手动编辑背包'}

    ],
    chooses:[
        {type:'S',name:'升序'},
        {type:'J',name:'降序'},

    ],
    isPlatformUser:[
        {type:'A',name:'是'},
        {type:'I',name:'否'}
    ],
    changeType:[
        {type:'Z',name:'收入'},
        {type:'S',name:'支出'}
    ],
    sourceOfProps:[
        {type:'A',name:'首冲购买'},
        {type:'B',name:'商场购买'},
        {type:'C',name:'分享领取'},
        {type:'D',name:'首次登录领取'},
        {type:'E',name:'节日或活动群发'},
        {type:'F',name:'指定用户群发或个人'},
        {type:'G',name:'礼物指定发放'},
        {type:'H',name:'比赛场次赢取'},
        {type:'I',name:'兑换商品'},
        {type:'J',name:'后台手动编辑背包'},
    ],
    priceType:[
        {type:'A',name:'总金额'},
        {type:'B',name:'龙珠分润金额'},
        {type:'C',name:'龙卡分润规则'},
        {type:'D',name:'最近增加金额'}
    ],
    enableType:[
         {type:'1',name:'启用'},
        {type:'0',name:'禁用'}
    ]
}