$(function(){
  var tableMes = {
    urlData: urlLink('operatRecord'),
    columns:[
      {field: 'id',title: '序号',align: 'center',valign: 'middle',formatter: function (value, row, index) {
        var page = $('.table:first').bootstrapTable("getOptions");
        return page.pageSize * (page.pageNumber - 1) + index + 1;  
      }}, 
      {field: 'uid',title: '用户ID',align: 'center',valign: 'middle'},
      {field: 'username',title: '用户名',align: 'center',valign: 'middle'},
      
      {field: 'content',title: '操作内容',align: 'center',valign: 'middle'},
    
       {field: 'update_time',title: '操作时间',align: 'center',valign: 'middle'}
        
    ],
    fnSuc:''
    };
  bstpTable=new BstpTable($("table"),tableMes);
  bstpTable.inint({});
})

