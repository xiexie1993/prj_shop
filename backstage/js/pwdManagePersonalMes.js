$(function(){
  var tableMes = {
    urlData: urlLink('pwdManagePersonalMes'),
    columns:[
      {field: 'usersName',title: '用户名',align: 'center',valign: 'middle'},
      {field: 'phone',title: '手机号',align: 'center',valign: 'middle'},
      {field: 'roleName',title: '角色名称',align: 'center',valign: 'middle'},
      {field: 'proName',title: '上级代理',align: 'center',valign: 'middle'},
      {field: 'tool',title: '操作',align: 'center',valign: 'middle',
      formatter:function(value,row,index){
          var element = "<a class='delet' data-id="
          +row.id
          +" onclick=operate('pwd',this)>密码修改</a>";
          return element;
      }}
    ],
    fnSuc:function(pageNumber,pageSize,data){
      var countData = data.rows[0];
      countData.mapOrdinaryUser.ordinaryUserNum = countData.ordinaryUserNum;
      countData.mapUnderLeve.underLevelNum = countData.underLevelNum;
      countTableData('underLevelTable',countData.mapUnderLeve);
      countTableData('ordinaryUserTable',countData.mapOrdinaryUser);
    },
    pagination: false
  };
  bstpTable=new BstpTable($(".table"),tableMes);
  bstpTable.inint({});
  // var data = ajaxMethod('pwdManagePersonalMes');
  // console.log(data);
  // $('.roomDayCount').html('aaa');
})
var operateStr = '';
//功能项
function operate (str,obj) {
  var id = $(obj).attr('data-id');
  operateStr = str;
  switch (operateStr) {
    case "pwd":
      operateFn(id).pwd();
      break;
    case "search":
      operateFn().search();
      break;
    case "jump":
      operateFn().jump(obj);
      break;
  }
}
//事件
function operateFn(id){
  var that = this;
  that.data = {id:id};
  return {
    pwd: function() {
      // var data = ajaxMethod('staffMesId',that.data);
      $('#pwdChange').modal({backdrop: 'static'});
      $('#pwdChange').attr('data-id',that.data.id);
      dataReflesh();
    },
    search: function() {
      bstpTable.inint({menuName:$('#searchMes').val()});
    },
    jump: function(obj) {
      sessionStorageSave('personalChildMes',[{link:'pwdManagePersonalMes.html',name:'个人信息'},{link:$(obj).attr('data-id'),name:$(obj).attr('data-name')}]);
    }
  }
}
//数据刷一遍
function dataReflesh(o){
  switch (operateStr) {
    case "pwd":
      // $('#pwdName').html(o.userName);
      $('#originalPwd input:first').val('');
      $('#pwdNew input:first').val('');
      break;
  }
}
//模态框确定事件
function sure (id) {
  switch(operateStr){
    case "pwd":
      var formData = formJson($('#pwdChange form:first').serializeArray());
      // var originalPwd = $('#originalPwd input:first').val();
      // var pwdNew = $('#pwdNew input:first').val();
      // formData.id = $('#pwdChange').attr('data-id');
      console.log(formData);
      if(formData.pwdNew.length >= 6 && formData.pwdNew.length <= 18){
        if(formData.pwdNew == formData.pwdRepeat){
          var data = {
            id: $('#pwdChange').attr('data-id'),
            originalPwd: $.md5(formData.originalPwd),
            password: $.md5(formData.pwdNew)
          };
          var result = ajaxMethod('pwdManagePersonalPwd',data);
          console.log(result);
          if(result.executeStatus != '1') {
            $('#pwdChange').modal('hide');
            bstpTable.inint({});
            layerMes('操作成功');
          }
        }else{
          layerMes('请输入相同的密码');
        }
      }else{
        layerMes('请输入6到18位长度的新密码');
      }
      break;
  }
}
//统计表格刷数据
function countTableData(id,data){
  for(var i in data){
    $('#'+id+' .'+i).html(data[i]);
  }
}