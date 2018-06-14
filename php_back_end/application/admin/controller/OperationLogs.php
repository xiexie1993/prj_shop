<?php
// +----------------------------------------------------------------------
// | Description:操作日志 控制器
// +----------------------------------------------------------------------
// | Author: xiezhenbin <Xzbde163yx@163.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

use think\Request;
use think\Db;
use app\common\adapter\AuthAdapter;
use app\common\controller\Common;

class OperationLogs extends ApiCommon
{
    // 【 操作日志 】查询出列表
    public function listdata()
    {
        $param = $this->param;
        $objModel = model('OperationLog');
        $map['status'] = 1;
        $alllist = $objModel->getDataList($map);
        if (!$alllist)
        {
            $ret_data['status'] = 0;
            $ret_data['data'] = null;
            $ret_data['msg']  = $objModel->getError();
            $ret_data['code'] = null;
        }
        else
        {
            $page_no = $param['page_no'] ? $param['page_no'] : 1;
            $page_size = $param['page_size'] ? $param['page_size'] : 10;
            // $data = $this->ListPaging($alllist,$page_size,$page_no);
            $data = ListPaging($alllist,$page_size,$page_no);
            // $ret_data['status'] = 1;
            // $ret_data['data'] = $data;
            // $ret_data['msg']  = null;
            // $ret_data['code'] = null;
            $data['status'] = 1;
            $data['code'] = null;
            $data['msg']  = null;
            // return json($data);
            // return json($ret_data);
            $ret_data= $data;
        }
        
        if(config('api_debug_enabled')==1)//开启调试输出调试参数
        {
            $debug['title'] = '【操作日志】列表查询';
            $debug['param'] = $param;
            $ret_data['debug'] = $debug;
        }
        
        return json($ret_data);
    }


    // 【 操作日志 】查单条
    public function showone()
    {
        $param = $this->param;
        $objModel = model('OperationLog');
        $map['status'] = 1;
        $map['category_id'] = $param['category_id'];
        $data = $objModel->getOneData($map);
        if (!$data)
        {
            $ret_data['status'] = 0;
            $ret_data['data'] = null;
            $ret_data['msg']  = $objModel->getError();
            $ret_data['code'] = null;
        }
        else
        {
            $ret_data['status'] = 1;
            $ret_data['data'] = $data;
            $ret_data['msg']  = null;
            $ret_data['code'] = null;
            // return json($data);
            // return json($ret_data);
        }
        if(config('api_debug_enabled')==1)//开启调试输出调试参数
        {
            $debug['title'] = '【操作日志】单条查询';
            $debug['param'] = $param;
            $ret_data['debug'] = $debug;
        }
        return json($ret_data);
    }


}
