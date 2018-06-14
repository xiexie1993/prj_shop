$(function(){
  // sessionStorageSave('src',{url:'pwdManagePersonalMesChild.html'})
  // var data = sessionStorageGet('personalChildMes');
  // var link = data.id;
  // $('#personalMesChildName').html(data.name);
  sessionGet();
  linkLower();
})
function linkLower(obj){
  if(obj){
    var data = sessionStorageGet('personalChildMes');
    data.push({link:'pwdManagePersonalLowerUser',name:$(obj).html(),id:$(obj).attr('data-id')});
    sessionStorageSave('personalChildMes',data);
    sessionGet();
  }
  var data = sessionStorageGet('personalChildMes');
  data = data[data.length-1];
  // console.log(data);
  // var $personalMesChildName = $('#personalMesChildName').
  var tableMes = {
    urlData: urlLink(data.link),
    columns:[
      {field: 'id',title: '序号',align: 'center',valign: 'middle',formatter: function (value, row, index) {
        var page = $('.table:first').bootstrapTable("getOptions");
        return page.pageSize * (page.pageNumber - 1) + index + 1;
      }},
      {field: 'usersName',title: '用户名称',align: 'center',valign: 'middle',formatter: function (value, row, index) {
        var type = row.userType;
        if(type === 'C' || type === 'O' || type === 'T'){
          return '<a href="javascript:void(0);" data-id="'+row.id+'" onclick="linkLower(this)">'+value+'</a>';
        }else{
          return value;
        }
      }},
      {field: 'phone',title: '联系电话',align: 'center',valign: 'middle'},
      {field: 'proName',title: '上级推广人',align: 'center',valign: 'middle'},
      {field: 'userType',title: '用户类别',align: 'center',valign: 'middle',formatter: function (value, row, index) {
        return agreedDataReturn(row.userType,agreedData.userType);
      }},
      {field: 'isVaild',title: '状态',align: 'center',valign: 'middle',formatter: function (value, row, index) {
        return agreedDataReturn(row.isVaild,agreedData.status);
      }}
    ],
    fnSuc:''
  };
  bstpTable=new BstpTable($("table"),tableMes);
  bstpTable.inint({id:(!data.id?'':data.id)});
}
//
function sessionGet(){
  var data = sessionStorageGet('personalChildMes');
  var length = data.length-1;
  // console.log(data,length);
  var html = '';
  for(var i=0; i<=length; i++){
    // console.log(i);
    if(i<length){
      // if(i === 0){
      html += '&gt;<a href="javascript:void(0);" data-link="'+data[i].link+'" data-position="'+i+'" onclick="linkGo(this)">'+data[i].name+'</a>';
      // }
    }else{
      html += '&gt;<span id="personalMesChildName" data-link="'+data[i].link+'" data-position="'+i+'">'+data[i].name+'</span>'
    }
  }
  $('.position-title:first').html('当前位置：密码管理'+html);
}

function linkGo(obj){
  var data = sessionStorageGet('personalChildMes');
  var $obj = $(obj);
  var dataLink = $obj.attr('data-link');
  var dataPosition = $obj.attr('data-position')*1;
  // console.log('dataPosition',dataPosition);
  data.splice(dataPosition+1,data.length-1);
  sessionStorageSave('personalChildMes',data);
  if(dataPosition === 0){
    window.location.pathname = dataLink;
  }else{
    sessionGet();
    linkLower();
  }
}