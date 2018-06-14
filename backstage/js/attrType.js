$(function()
{
  // console.log('attrType+++++++++++++++');
  var tableMes = {
        urlData: urlLink('attrType'),
        columns:[
                  {field: 'attr_id',title: '序号',align: 'center',valign: 'middle',formatter: function (value, row, index) 
                      {
                          var page = $('.table:first').bootstrapTable("getOptions");
                          return page.pageSize * (page.pageNumber - 1) + index + 1;  
                      }
                  }, 
                  {field: 'category_id',title: '所属类目',align: 'center',valign: 'middle'},
                  {field: 'category_attr_id',title: '所属属性',align: 'center',valign: 'middle'},
                  {field: 'title',title: '名称',align: 'center',valign: 'middle'},
                  {field: 'remark',title: '备注',align: 'center',valign: 'middle'},
                  {field: 'sort',title: '排序',align: 'center',valign: 'middle'},
                  // {field: 'enable',title: '排序擦擦擦',align: 'center',valign: 'middle'},
                  {field: 'enable',title: '启用/禁用',align: 'center',valign: 'middle',formatter: function (value, row, index)
                    {
                      return typearry.hh[row.enable];
                    }
                  },
                  {field: 'remark',title: '备注',align: 'center',valign: 'middle'},
                  {field: 'tool',title: '操作',align: 'center',valign: 'middle',formatter:function(value,row,index)
                      {
                        // var status = agreedDataReturn(row.isValid,agreedData.statusOpposite);
                        var element = "<a class='delet' data-id="
                        +row.attr_id
                        +" onclick=operate('change',this)>编辑</a><span style='margin:0 6px'>|</span><a class='delet' data-id="
                        +row.attr_id
                        +" onclick=operate('del',this)>删除</a>";
                        return element;
                      }
                  }
                ],
        fnSuc:''
      };

  bstpTable =new BstpTable($("table"),tableMes);
  bstpTable.inint({});
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
  that.data = {attr_id:id};
  //alert(that.data);
  return {
    new: function() {
      $('#myModal').modal({backdrop: 'static'});
      // addChange('new'); 
      var attrCategorys = ajaxMethod('categoryallType');
      // console.log(attrCategorys);
      // console.log(attrCategorys);
      // 组装 下拉分类选择框
      var rowsData = attrCategorys.rows;
      var selectstr = "<select id='addlCategorydiv1'>";
      selectstr = selectstr +"<option value ='0' >未选择分类</option>";

      for( var selectid =0;selectid< rowsData.length;selectid++)
      {
          selectstr = selectstr +"<option value ='"+rowsData[selectid].type_id+"' >"+rowsData[selectid].title+"</option>";
      }
      selectstr  = selectstr + "</select>";
      $('#addselectcategory').html(selectstr);
      dataReflesh();
    },
    change: function() {
      //alert(that.data);
      var data = ajaxMethod('attrTypeShowone',that.data);
      var attrCategorys = ajaxMethod('categoryallType');
      // console.log(data);
      // console.log(attrCategorys);
      // 组装 下拉商品分类属性选择框
      var selectstr = "<select id='lCategorydiv'>";
      var rowsData = attrCategorys.rows;
      for( var selectid =0;selectid< rowsData.length;selectid++)
      {
            if(rowsData[selectid].type_id == data.data.type_id)
            {
              selectstr = selectstr +"<option value ='"+rowsData[selectid].type_id+"' selected>"+rowsData[selectid].title+"</option>";
            }
            else
            {
              selectstr = selectstr +"<option value ='"+rowsData[selectid].type_id+"' >"+rowsData[selectid].title+"</option>";
            }
      }
      selectstr  = selectstr + "</select>";

      $('#roleMes').modal({backdrop: 'static'});
       
      $('#roleMes').attr('data-id',data.data.category_attr_id);
      $('#lTypeid').val(data.data.attr_id);
      $('#lName').val(data.data.title);
      // $('#lCategoryId').val(data.data.category_id);
      $('#lCategoryId').html(selectstr);
      $('#lTypeList').val(data.data.format);
      $('#lName').val(data.data.title);
      $('#lSore').val(data.data.sort);
      $("#modalStatus input[name='enable']").each(function()
        {  
          if($(this).val() == data.data.enable)
          {  
              $(this).prop( "checked", true );  
          }  
       });  
      $('#lRem').val(data.data.remark);
    },
    power: function() {
      var data = ajaxMethod('leaseTypeId',{roleId:that.data.id});
      console.log(that.data,data);
      $('#power').modal({backdrop: 'static'});
      $('#power').attr('data-id',that.data.id);
      dataReflesh(data.values);
    },
    search: function()
    {
      bstpTable.inint({roleName:$('#searchMes').val()});
    },
    del: function()
    {
      // console.log('xzb2017-12-30 22:52:05');
      // console.log(that.data);
      $('#typeDel').modal({backdrop: 'static'});
      $('#typeDel').attr('data-id',that.data.attr_id);
      // $('#typeDeltext').val(that.data.attr_id);
    }
  }
}
//数据刷一遍
function dataReflesh(o){
  switch (operateStr) {
    case "new":
      // $('#roleMesLabel').html('新增');
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
  switch(operateStr)
  {
    case "new":
      // console.log($('#roleMes form:first').serialize());
      var formData = formJson($('#myModal form:first').serializeArray());
      formData.category_att_id = $('#addlCategorydiv1 option:selected').val();
      // formData.enable = '1';
      // console.log(formData);
      var result = ajaxMethod('attrTypeAdd',formData);
      // console.log(result);
      // console.log(formData,result);
      if(result.status != '0')
      {
        $('#myModal').modal('hide');
        bstpTable.inint({});
        layerMes('操作成功');
      }
      break;
    case "change":
      var formData = formJson($('#roleMes form:first').serializeArray());
      // console.log(formData);
      // formData.type_id = $('#roleMes').attr('data-id');
      formData.category_att_id = $('#lCategorydiv option:selected').val();
      // console.log(formData);
      var result = ajaxMethod('attrTypeEdit',formData);
      // console.log(result);
      if(result.status != '0'){
        $('#roleMes').modal('hide');
        bstpTable.inint({});
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
        if(formData.menuIds.indexOf(pid) == -1)
        {
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
      var data = {attr_id:$('#typeDel').attr('data-id')};
      var result = ajaxMethod('attrTypeDel',data);
      if(result.status != '0'){
        $('#typeDel').modal('hide');
        bstpTable.inint({});
        layerMes('操作成功');
      }
      break;
  }
}