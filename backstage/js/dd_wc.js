$(function(){
  var tableMes = {
    urlData: urlLink('orderList'),
    columns:[
      {field: 'order_id',title: '序号',align: 'center',valign: 'middle',formatter: function (value, row, index) {
        var page = $('.table:first').bootstrapTable("getOptions");
        return page.pageSize * (page.pageNumber - 1) + index + 1;  
      }}, 
      {field: 'order_number',title: '订单号',align: 'center',valign: 'middle'},
      {field: 'client_uid',title: '订单所属客户UID',align: 'center',valign: 'middle'},
      {field: 'name',title: '订单名称',align: 'center',valign: 'middle'},
      
      {field: 'cover',title: '订单封面',align: 'center',valign: 'middle'},
      {field: 'rent',title: '租金',align: 'center',valign: 'middle'},
      {field: 'deposit',title: '押金',align: 'center',valign: 'middle'},
      {field: 'num',title: '数量',align: 'center',valign: 'middle'},
      {field: 'lease_period_start',title: '租期开始时间',align: 'center',valign: 'middle'},
      {field: 'lease_period_end',title: '租期结束时间',align: 'center',valign: 'middle'},
      {field: 'address',title: '用户地址',align: 'center',valign: 'middle'},
      
      {field: 'certification_info',title: '当时认证资料',align: 'center',valign: 'middle'},
      {field: 'price',title: '实付款',align: 'center',valign: 'middle'},
      {field: 'remark',title: '客户备注',align: 'center',valign: 'middle'},
      {field: 'order_status',title: '订单状态',align: 'center',valign: 'middle'},
       {field: 'order_status',title: '订单状态',align: 'center',valign: 'middle',formatter: function (value, row, index) {
      return typearry.order[row.order_status];
      }},
      {field: 'ship_name',title: '发货物流名称',align: 'center',valign: 'middle'},
      {field: 'ship_number',title: '发货物流订单号',align: 'center',valign: 'middle'},
      {field: 'return_ship_name',title: '归还物流名称',align: 'center',valign: 'middle'},
     
      {field: 'return_ship_number',title: '归还物流订单号',align: 'center',valign: 'middle'},
      
     /* {field: 'enable',title: '启用/禁用',align: 'center',valign: 'middle',formatter: function (value, row, index) {
        return row.enable;
      }},*/
      
    
     
      {field: 'tool',title: '操作',align: 'center',valign: 'middle',formatter:function(value,row,index){
          // var status = agreedDataReturn(row.isValid,agreedData.statusOpposite);
          var element = "<a class='delet' data-id="
        
          +row.order_id
          +" onclick=operate('del',this)>删除</a>";
          return element;
      }}
    ],
    fnSuc:''
    };
 bstpTable=new BstpTable($("table"),tableMes);
 // bstpTable.inint({});
   bstpTable.inint({order_status:'6'});
  addSelect('searchPropType',agreedData.propType,true);
  addSelect('searchAuditiStatus',agreedData.auditiStatus,true);

/*  var leaseType = ajaxMethod('leaseType').values;

  var html = '';
  $powerCheckbox = $('#powerCheckbox');
  console.log('leaseType',leaseType);
  console.log(Array.isArray(leaseType));
  leaseType.forEach(function(item, index, array){
    var checkHtml = '';
    item.listm.forEach(function(checkItem){
      // console.log(checkItem);
      checkHtml += '<label><input type="checkbox" name="menuIds" value='
        + checkItem.id + ' data-pid=' + item.id + '> ' + checkItem.menuName + '</label>';
    })
    html += '<label class="col-sm-3 control-label">' + item.menuName + '：</label><div class="col-sm-9"><div class="checkbox">' + checkHtml + '</div></div>';
    $powerCheckbox.html(html);
  })
  $powerCheckbox = null;*/
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
    case "power":
      operateFn(id).power();
      break;
    case "search":
      operateFn().search();
      break;
    case "del":
      operateFn(id).del();
      break;
  }
}
//事件
function operateFn(id){
  var that = this;
  that.data = {order_id:id};
  //alert(that.data);
  return {
    new: function() {
      $('#myModal').modal({backdrop: 'static'});
      // addChange('new');
      dataReflesh();
    },
    change: function() {
    
      $('#roleMes').modal({backdrop: 'static'});
       
      $('#roleMes').attr('data-id',id);
     
   
    },
    power: function() {
      var data = ajaxMethod('leaseTypeId',{roleId:that.data.id});
      console.log(that.data,data);
      $('#power').modal({backdrop: 'static'});
      $('#power').attr('data-id',that.data.id);
      dataReflesh(data.values);
    },
    search: function() {
      bstpTable.inint({roleName:$('#searchMes').val()});
    },
    del: function() {
      $('#typeDel').modal({backdrop: 'static'});
      $('#typeDel').attr('data-id',that.data.id);
    }
  }
}
//数据刷一遍
function dataReflesh(o){
  switch (operateStr) {
    case "new":
      $('#roleMesLabel').html('新增角色');
      $('#modalName input:first').val('');
      $('#modalStatus input:radio[name="isValid"]:first').prop("checked", "checked");
    
      break;
    case "change":
       console.log('o',o);
     // $('#roleMesLabel').html('编辑');
      //$('#modalName input:first').val(o.roleName);
      //$('#modalStatus input:radio[name="enable"][value="'+o.isVaild+'"]').prop("checked", "checked");
         $('#lRem').val('');
      break;
    case "power":
      console.log('o',o);
      var arr = [];
      var i = 0;
      o.forEach(function(item){
        arr[i++] = item.id;
      });
      console.log(arr);
      $('#power input:checkbox[name="menuIds"]').each(function(){
        var $that = $(this);
        // $that.attr('checked',false);
        if(arr.indexOf($that.val()) == -1){
          $that.prop('checked',false);
        }else{
          $that.prop('checked',true);
        }
      })
      break;
  }
}
//模态框确定事件
function sure (id) {
  switch(operateStr){
    case "new":
      // console.log($('#roleMes form:first').serialize());
      var formData = formJson($('#myModal form:first').serializeArray());
      formData.enable = '1';
      var result = ajaxMethod('leaseTypeAdd',formData);
      console.log(formData,result);
      if(result.status != '0'){
        $('#myModal').modal('hide');
        bstpTable.inint({});
        layerMes('操作成功');
      }
      break;
    case "change":
    var data = {
    	order_id:$('#roleMes').attr('data-id'),
    	order_status:'7'
    	};
      var result = ajaxMethod('orderEdit',data);
      if(result.status != '0'){
        $('#roleMes').modal('hide');
          bstpTable.inint({order_status:'6'});
        layerMes('操作成功');
      }
      break;
    case "power":
      var formData = formJson($('#power form:first').serializeArray());
      console.log(formData);
      if(!Array.isArray(formData.menuIds)){
        formData.menuIds = [''];
      }
      $('#power input[name="menuIds"]:checked').each(function(){
        var pid = $(this).attr('data-pid');
        if(formData.menuIds.indexOf(pid) == -1){
          formData.menuIds.push(pid);
        }
      })
      console.log('formData',formData);
      // formData.menuIds = formData.menuIds.split(',');
      formData.roleId = $('#power').attr('data-id');
      console.log('formData',formData);
      var result = ajaxMethod('characterPowerId',formData);
      if(result.executeStatus != '1'){
        $('#power').modal('hide');
        bstpTable.inint({});
        layerMes('操作成功');
      }
      break;
    case "del":
      var data = {category_id:$('#typeDel').attr('data-id')};
      var result = ajaxMethod('leaseDel',data);
      if(result.status != '0'){
        $('#typeDel').modal('hide');
        bstpTable.inint({});
        layerMes('操作成功');
      }
      break;
  }
}