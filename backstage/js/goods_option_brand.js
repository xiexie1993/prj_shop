$(function(){
  var tableMes = {
    urlData: urlLink('goodsOptionBrand'),
    columns:[
      {field: 'brand_id',title: '序号',align: 'center',valign: 'middle',formatter: function (value, row, index) {
        var page = $('.table:first').bootstrapTable("getOptions");
        return page.pageSize * (page.pageNumber - 1) + index + 1;  
      }},
      {field: 'category_id',title: '所属商品类目ID',align: 'center',valign: 'middle'},
      {field: 'name',title: '品牌',align: 'center',valign: 'middle'},
      {field: 'sort',title: '排序',align: 'center',valign: 'middle'},
      {field: 'enable',title: '启用/禁用',align: 'center',valign: 'middle',formatter: function (value, row, index) {
         return typearry.hh[row.enable];
      }},
      {field: 'remark',title: '备注',align: 'center',valign: 'middle'},
      {field: 'up_time',title: '修改时间',align: 'center',valign: 'middle'},
      {field: 'tool',title: '操作',align: 'center',valign: 'middle',formatter:function(value,row,index){
          // var status = agreedDataReturn(row.isValid,agreedData.statusOpposite);
          var element = "<a class='delet' data-id="
          +row.article_id
          +" onclick=operate('change',this)>编辑</a><span style='margin:0 6px'>|</span><a class='delet' data-id="
          +row.article_id
          +" onclick=operate('del',this)>删除</a>";
          return element;
      }}
    ],
    fnSuc:''
    };
  bstpTable=new BstpTable($("table"),tableMes);
  bstpTable.inint({});
  getDocType();
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

function getDocType(){
    var resultType = ajaxMethod('goodsOptionCategoryAll');
    // console.log(resultType.rows[2].title);
    // console.log(resultType.rows.length);
    var str = "<ol class='breadcrumb'>";
    str = str + "<li onclick='hpDocSear(0)'>全部</li>";
    for(var i=0;i<resultType.rows.length;i++)
    {
            str = str + "<li onclick='hpDocSear("+resultType.rows[i].category_id+")'>"+resultType.rows[i].title+"</li>";
    }
    str = str + "</ol>";
    // console.log(str);
    $(".gettype").append(str);
}

function hpDocSear(id){
    bstpTable.inint({category_id:id});
}
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
  that.data = {article_id:id};
  //alert(that.data);
  return {
    new: function() {
      $('#myModal').modal({backdrop: 'static'});
      // addChange('new');
      var categorydata = ajaxMethod('goodsOptionCategoryAll');
      // console.log(data);
      // console.log(categorydata);
      var rowsData = categorydata.rows;
      var selectstr = "<select id='addlCategorydiv'>";
      selectstr = selectstr +"<option value ='0' >未选择分类</option>";

      for( var selectid =0;selectid< rowsData.length;selectid++)
      {
          selectstr = selectstr +"<option value ='"+rowsData[selectid].category_id+"' >"+rowsData[selectid].title+"</option>";
      }
      selectstr  = selectstr + "</select>";
      $('#addselectcategory').html(selectstr);
      dataReflesh();
    },
    change: function() {
        //alert(that.data);
      var data = ajaxMethod('goodsOptionBrandShoeOne',that.data);
      var categorydata = ajaxMethod('goodsOptionCategoryAll');
      // console.log(data);
      // console.log(categorydata);
      // 组装 下拉分类选择框
      var rowsData = categorydata.rows;
      var selectstr = "<select id='Categorydiv'>";
      for( var selectid =0;selectid< rowsData.length;selectid++)
      {
            if(rowsData[selectid].category_id == data.data.category_id)
            {
              selectstr = selectstr +"<option value ='"+rowsData[selectid].category_id+"' selected>"+rowsData[selectid].title+"</option>";
            }
            else
            {
              selectstr = selectstr +"<option value ='"+rowsData[selectid].category_id+"' >"+rowsData[selectid].title+"</option>";
            }
      }
      selectstr  = selectstr + "</select>";
      $('#selectcategory').html(selectstr);

      $('#roleMes').modal({backdrop: 'static'});
       
      $('#roleMes').attr('data-id',data.data.category_id);
      $('#lName').val(data.data.title);
      $('#lArticleId').val(data.data.article_id);
      $('#lAuthor').val(data.data.author);
      $('#lSore').val(data.data.sort);
      $("#modalStatus input[name='enable']").each(function(){  
        if($(this).val() == data.data.enable){  
            $(this).prop( "checked", true );  
        }  
      
    });  
     $(".panel-body").empty();
      $(".panel-body").append(data.data.content);
     $('#lRem').val(data.data.remark);
     // $('input[name="status"]:checked').val();
     // dataReflesh(data.data);
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
      $('#typeDel').attr('data-id',that.data.article_id);
    }
  }
}
//数据刷一遍
function dataReflesh(o){
  switch (operateStr) {
    case "new":
     // $('#roleMesLabel').html('新增角色');
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
      formData.category_id = $('#addlCategorydiv option:selected').val();
      var result = ajaxMethod('helpAdd',formData);
      console.log(formData,result);
      if(result.status != '0'){
        $('#myModal').modal('hide');
        bstpTable.inint({});
        layerMes('操作成功');
      }
      break;
    case "change":
      var formData = formJson($('#roleMes form:first').serializeArray());
      formData.category_id = $('#Categorydiv option:selected').val();
      formData.article_id = $('#roleMes').attr('data-id');
       formData.content = $('.panel-body').html();
      // console.log(formData);
      var result = ajaxMethod('helpEdit',formData);
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
      var data = {article_id:$('#typeDel').attr('data-id')};
      var result = ajaxMethod('helpDel',data);
      if(result.status != '0'){
        $('#typeDel').modal('hide');
        bstpTable.inint({});
        layerMes('操作成功');
      }
      break;
  }
}