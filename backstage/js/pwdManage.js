$(function(){
  var tableMes = {
    urlData: urlLink('pwdManageMes'),
    columns:[
      {field: 'id',title: '序号',align: 'center',valign: 'middle',formatter: function (value, row, index) {
        var page = $('.table:first').bootstrapTable("getOptions");
        return page.pageSize * (page.pageNumber - 1) + index + 1;
      }},
      {field: 'usersName',title: '用户名',align: 'center',valign: 'middle'},
      {field: 'phone',title: '联系电话',align: 'center',valign: 'middle'},
      {field: 'roleName',title: '角色名称',align: 'center',valign: 'middle'},
     // {field: 'proName',title: '上级代理人',align: 'center',valign: 'middle'},
      {field: 'isVaild',title: '状态',align: 'center',valign: 'middle',formatter: function (value, row, index) {
        return agreedDataReturn(row.isVaild,agreedData.status);
      }},
      {field: 'tool',title: '操作',align: 'center',valign: 'middle',
      formatter:function(value,row,index){
          var element = "<a class='delet' data-id="
          +row.id
          +" onclick=operate('change',this)>编辑</a><span style='margin:0 6px'>|</span><a class='delet' data-id="
          +row.id
          +" onclick=operate('del',this)>删除</a>";
          return element;
      }}
    ],
    fnSuc:''
  };
  bstpTable=new BstpTable($("table"),tableMes);
  bstpTable.inint({});
  addSelect('isVaild',agreedData.status,true);
  var roleList = ajaxMethod('pwdManageRole');
  if(roleList.executeStatus === 0){
    addSelect('roleId',roleList.values,true,'id','roleName');
    addSelect('modalRoleId',roleList.values,false,'id','roleName');
  }
})
var operateStr = '';
//功能项
function operate (str,obj) {
  var id = $(obj).attr('data-id');
  operateStr = str;
  switch (operateStr) {
    case "new":
      operateFn().new();
      break;
    case "change":
      operateFn(id).change();
      break;
    case "del":
      operateFn(id).del();
      break;
    case "search":
      operateFn().search();
      break;
  }
}
//事件
function operateFn(id){
  var that = this;
  that.data = {id:id};
  return {
    new: function() {
      $('#roleMes').modal({backdrop: 'static'});
      // addChange('new');
      dataReflesh();
    },
    change: function() {
      var data = ajaxMethod('pwdManageMesId',that.data);
      // console.log(data);
      $('#roleMes').modal({backdrop: 'static'});
      dataReflesh(data.values);
    },
    del: function() {
      $('#delete').modal({backdrop: 'static'});
      $('#delete').attr('data-id',that.data.id);
    },
    search: function() {
      bstpTable.inint(formJson($('.search-box:first form:first').serializeArray()));
    }
  }
}
//数据刷一遍
function dataReflesh(o){
  switch (operateStr) {
    case "new":
      $('#roleMesLabel').html('新增');
      $('#modalUserName').css('display','none');
      $('#modalPwd').css('display','block');
      $('#modalPhone input:first').val('');
      $('#modalRoleId').val($('#modalRoleId option:first').val());
      $('#modalStatus input:radio[name="isVaild"]:first').prop("checked", "checked");
      break;
    case "change":
      console.log(o);
      $('#roleMesLabel').html('修改');
      $('#modalUserName').css('display','block');
      $('#modalUserName .control-mes:first').html(o.usersName);
      $('#modalPwd').css('display','none');
      $('#modalPhone input:first').val(o.phone);
      $('#modalRoleId').val(o.roleId);
      $('#modalStatus input:radio[name="isVaild"][value="'+o.isVaild+'"]').prop("checked", "checked");
      $('#roleMes').attr('data-id',o.id);
      break;
  }
}
//模态框确定事件
function sure (str) {
  operateStr = !str ? operateStr : str;
  switch(operateStr){
    case "new":
      $('#newSure').modal({backdrop: 'static'});
      break;
    case "newSure":
      // console.log($('#roleMes form:first').serialize());
      $('#newSure').modal('hide');
      var formData = formJson($('#roleMes form:first').serializeArray());
      var result = ajaxMethod('pwdManageAdd',formData);
      console.log(result);
      if(result.executeStatus != '1'){
        $('#roleMes').modal('hide');
        bstpTable.inint({});
        layerMes('操作成功');
      }
      break;
    case "change":
      var formData = formJson($('#roleMes form:first').serializeArray());
      formData.id = $('#roleMes').attr('data-id');
      console.log(formData);
      var result = ajaxMethod('pwdManageEdit',formData);
      // console.log(operateFn().data.id);
      if(result.executeStatus != '1'){
        $('#roleMes').modal('hide');
        bstpTable.inint({});
        layerMes('操作成功');
      }
      break;
    case "del":
      var data = {id:$('#delete').attr('data-id')};
      var result = ajaxMethod('pwdManageDel',data);
      if(result.executeStatus != '1'){
        $('#delete').modal('hide');
        bstpTable.inint({});
        layerMes('操作成功');
      }
      break;
  }
}