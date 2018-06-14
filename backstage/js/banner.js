$(function()
{
  // console.log('attrType+++++++++++++++');
  var tableMes = {
        urlData: urlLink('bannerList'),
        columns:[
                  {field: 'banner_id',title: '序号',align: 'center',valign: 'middle',formatter: function (value, row, index) 
                      {
                          var page = $('.table:first').bootstrapTable("getOptions");
                          return page.pageSize * (page.pageNumber - 1) + index + 1;  
                      }
                  }, 
                  {field: 'name',title: 'banner名',align: 'center',valign: 'middle'},
                  {field: 'url',title: 'banner跳转链接',align: 'center',valign: 'middle'},
                  {field: 'banner_pic',title: 'bannner图片',align: 'center',valign: 'middle',formatter:function(value,row,index)
                      {
                        // var status = agreedDataReturn(row.isValid,agreedData.statusOpposite);
                        var pic_show = "<img src='"+row.banner_pic_url+"' style='height:100px'>";
                        return pic_show;
                      }},
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
                        +row.banner_id
                        +" onclick=operate('change',this)>编辑</a><span style='margin:0 6px'>|</span><a class='delet' data-id="
                        +row.banner_id
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
  that.data = {banner_id:id};
  //alert(that.data);
  return {
    new: function() {
      $('#myModal').modal({backdrop: 'static'});

      dataReflesh();
    },
    change: function() {
      //alert(that.data);
      var data = ajaxMethod('bannerShoeOne',that.data);
      // var attrCategorys = ajaxMethod('categoryallType');
      // // console.log(data);
      // // console.log(attrCategorys);
      // // 组装 下拉商品分类属性选择框
      // var selectstr = "<select id='lCategorydiv'>";
      // var rowsData = attrCategorys.rows;
      // for( var selectid =0;selectid< rowsData.length;selectid++)
      // {
      //       if(rowsData[selectid].type_id == data.data.type_id)
      //       {
      //         selectstr = selectstr +"<option value ='"+rowsData[selectid].type_id+"' selected>"+rowsData[selectid].title+"</option>";
      //       }
      //       else
      //       {
      //         selectstr = selectstr +"<option value ='"+rowsData[selectid].type_id+"' >"+rowsData[selectid].title+"</option>";
      //       }
      // }
      // selectstr  = selectstr + "</select>";

      $('#roleMes').modal({backdrop: 'static'});
       
      $('#roleMes').attr('data-id',data.data.category_attr_id);
      $('#lTypeid').val(data.data.banner_id);
      $('#lName').val(data.data.name);
      $('#lbannerpic').val(data.data.banner_pic);
      // console.log(data.data);
      // console.log(data.data.banner_pic);
      document.getElementById('banner_pic_id').src=data.data.banner_pic;
      // $('#lCategoryId').html(selectstr);
      // $('#lTypeList').val(data.data.format);
      // $('#lName').val(data.data.title);
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
      $('#typeDel').attr('data-id',that.data.banner_id);
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
      var formData0 = formJson($('#myModal form:first').serializeArray());
      // 先上传图片操作再 进行banner图数据更改
      // console.log('先上传图片操作再 进行banner图数据更改');
      up_add_banner_img(formData0);
      
      break;
    case "change":
      var formData1 = formJson($('#roleMes form:first').serializeArray());
      // console.log(formData);
      // formData.type_id = $('#roleMes').attr('data-id');
      // formData1.category_att_id = $('#lCategorydiv option:selected').val();

      // 判断是否需要上传图片
      var upflag = document.getElementById("file-edit").files[0];
      console.log(upflag);
      // alert("判断是否需要上传图片");
      if(upflag!=null)
      {
        // alert("需要上传图片");
        up_edit_banner_img(formData1);
      }
      else
      {
          // alert("不需要上传图片");
          var result = ajaxMethod('bannerEdit',formData1);
          // console.log(result);
          if(result.status != '0'){
            $('#roleMes').modal('hide');
            bstpTable.inint({});
            layerMes('操作成功');
          }
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
      var data = {banner_id:$('#typeDel').attr('data-id')};
      var result = ajaxMethod('bannerDel',data);
      if(result.status != '0'){
        $('#typeDel').modal('hide');
        bstpTable.inint({});
        layerMes('操作成功');
      }
      break;
  }
}



//添加banner的上传图片
function up_add_banner_img(formData0)
{
    var formData = new FormData();
    // formData.append("file", file);
    formData.append("file", document.getElementById("file-3").files[0]);
    $.ajax({
        url:  '${url}'+'/index.php/admin/upload/img',//径是你控制器中上传图片的方法
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        type: 'POST',
        success: function (data)
        {

            // console.log('收到返回值');
            // console.log(data);
            // alert('执行完上传图片程序！');
            if(data.status==1)
            {
              // console.log('上传图片成功');
              formData0.banner_pic = data.data.path;
              var result = ajaxMethod('bannerAdd',formData0);
              // console.log('收到更改数据响应');

              console.log(result);
              // console.log(formData,result);
              if(result.status != '0')
              {
                $('#myModal').modal('hide');
                bstpTable.inint({});
                layerMes('操作成功');
              }
            }
            else
            {
              // console.log('上传失败！');
              // alert(data.msg);
              layerMes(data.msg);
              return false;
            }
        }
    });
    // console.log('函数返回');
    // return data;
}

//编辑banner的上传图片
function up_edit_banner_img(formData1)
{
    var formData2 = new FormData();
    // formData.append("file", file);
    formData2.append("file", document.getElementById("file-edit").files[0]);
    $.ajax({
        url:  '${url}'+'/index.php/admin/upload/img',//径是你控制器中上传图片的方法
        data: formData2,
        cache: false,
        contentType: false,
        processData: false,
        type: 'POST',
        success: function (data)
        {
            // alert('执行完上传图片程序！');
            if(data.status==1)
            {
              formData1.banner_pic = data.data.path;
              // 上传图片成功后
              var result = ajaxMethod('bannerEdit',formData1);
              // console.log(result);
              if(result.status != '0')
              {
                $('#roleMes').modal('hide');
                bstpTable.inint({});
                layerMes('操作成功');
              }
            }
            else
            {
              // 上传图片不成功
              layerMes(data.msg);
            }
          
        }
    });
    // console.log('函数返回');
    // return data;
}