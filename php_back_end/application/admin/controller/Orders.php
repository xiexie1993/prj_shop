<?php
// +----------------------------------------------------------------------
// | Description: 租赁订单 控制器 
// +----------------------------------------------------------------------
// | Author: xiezhenbin <Xzbde163yx@163.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

use think\Request;
use think\Db;
use app\common\adapter\AuthAdapter;
use app\common\controller\Common;

class Orders extends ApiCommon
{
    // 【 租赁订单 】查询个各状态的订单数量
    public function listnum()
    {

        // $map['status'] = 1;
        $objModel = model('Order');
        $alllist = $objModel->getListNum();
        if (!$alllist)
        {
            $ret_data['status'] = 0;
            $ret_data['data'] = null;
            $ret_data['msg']  = $objModel->getError();
            $ret_data['code'] = null;
        }
        else
        {
            $status_num['status0'] = 0;
            foreach ($alllist as $key1 => $value1)
            {
                if($value1['order_status']>=1 && $value1['order_status']<=8)
                {
                    $status_num['status'.$value1['order_status']] =$value1['num'];
                    $status_num['status0'] = $status_num['status0'] + $value1['num'];
                }
            }
            $status_num['status0'] = $status_num['status0'] ? $status_num['status0'] : 0;
            $status_num['status1'] = $status_num['status1'] ? $status_num['status1'] : 0;
            $status_num['status2'] = $status_num['status2'] ? $status_num['status2'] : 0;
            $status_num['status3'] = $status_num['status3'] ? $status_num['status3'] : 0;
            $status_num['status4'] = $status_num['status4'] ? $status_num['status4'] : 0;
            $status_num['status5'] = $status_num['status5'] ? $status_num['status5'] : 0;
            $status_num['status6'] = $status_num['status6'] ? $status_num['status6'] : 0;
            $status_num['status7'] = $status_num['status7'] ? $status_num['status7'] : 0;
            
            $ret_data['status'] = 1;
            $ret_data['data'] = $status_num;
            $ret_data['msg']  = null;
            $ret_data['code'] = null;
        }
        if(config('api_debug_enabled')==1)//开启调试输出调试参数
        {
            $debug['title'] = '【 租赁订单 】查询个各状态的订单数量';
            $debug['param'] = $param;
            $ret_data['debug'] = $debug;
        }
        return json($ret_data);
    }



    // 【 租赁订单 】查询出列表
    public function listdata()
    {
        $param = $this->param;
        if(
            $param['order_status'] >=1 
            && $param['order_status'] <=7 )
        {
            $map['order_status'] = $param['order_status'];
        }
        // elseif($param['order_status'] == 0)
        // {
        //     $map['order_status'] = array(array('egt',1),array('elt',7));
        // }
        else
        {
            $map['order_status'] = array(array('egt',1),array('elt',7));
        }
        $map['status'] = 1;
        $objModel = model('Order');
        
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
            $debug['title'] = '【 租赁订单 】列表查询';
            $debug['param'] = $param;
            $ret_data['debug'] = $debug;
        }
        
        return json($ret_data);
    }


    // 【 租赁订单 】查单条
    public function showone()
    {
        $param = $this->param;
        $objModel = model('Order');
        $map['status'] = 1;
        $map['order_id'] = $param['order_id'];
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
            $debug['title'] = '【 租赁订单 】 单条查询';
            $debug['param'] = $param;
            $ret_data['debug'] = $debug;
        }
        return json($ret_data);
    }



    // 【 租赁订单 】修改/编辑
    public function edit()
    {
        $param = $this->param;
        if(
              ($param['order_id'] != null && $param['order_id'] !='')
            // ||($param['title']  != null && $param['title']  !='')
            // ||($param['sort']   != null && $param['sort']   !='')
            // ||($param['enable'] != null && $param['enable'] !='')
            // ||($param['status'] != null && $param['status'] !='')
            // ||($param['remark'] != null && $param['remark'] !='')
          )
        {
            $map['order_id'] = $param['order_id'];
            
            $objModel = model('Order');
            $data = $objModel->updateData($param,$map);
            if (!$data)
            {
                $ret_data['status'] = 0;
                $ret_data['data'] = null;
                $ret_data['msg']  = $objModel->getError();
                $ret_data['code'] = null;
            }
            else
            {
                // 记录操作日志 Start
                $auth_key   = $_COOKIE['authKey'];
                // $cache = cache('Auth_'.$authKey);
                $cache = cache('Auth_'.$auth_key);
                // $userInfo = $GLOBALS['userInfo'];
                $userInfo = $cache['userInfo'];
                $OpLogModel = model('OperationLog');
                $log['uid'] = $userInfo['id'];
                $log['username']    = $userInfo['username'];
                $log['content']     = "编辑了 租赁订单";
                $log['create_time'] = time();
                $OpLogModel->createData($log);
                // 记录操作日志 End
                $ret_data['status'] = 1;
                $ret_data['data'] = $data;
                $ret_data['msg']  = null;
                $ret_data['code'] = null;
            }
        }
        else
        {
            $ret_data['status'] = 0;
            $ret_data['data'] = null;
            $ret_data['msg']  = "参数非法或为空";
            $ret_data['code'] = null;
        }

        if(config('api_debug_enabled')==1)//开启调试输出调试参数
        {
            $debug['title'] = '【 租赁订单 】修改/编辑';
            $debug['param'] = $param;
            $ret_data['debug'] = $debug;
        }
        return json($ret_data);
    }



   // 【 租赁订单 】软删除
    public function vdel()
    {
        $param = $this->param;
        if(
            $param['order_id'] != null && $param['order_id'] !=''
          )
        {
            $setdata['status'] = 0;
            $map['order_id'] = $param['order_id'];
            $objModel = model('Order');
            $data = $objModel->updateData($setdata,$map);
            if (!$data)
            {
                $ret_data['status'] = 0;
                $ret_data['data'] = null;
                $ret_data['msg']  = $objModel->getError();
                $ret_data['code'] = null;
            }
            else
            {
                // 记录操作日志 Start
                $auth_key   = $_COOKIE['authKey'];
                // $cache = cache('Auth_'.$authKey);
                $cache = cache('Auth_'.$auth_key);
                // $userInfo = $GLOBALS['userInfo'];
                $userInfo = $cache['userInfo'];
                $OpLogModel = model('OperationLog');
                $log['uid'] = $userInfo['id'];
                $log['username']    = $userInfo['username'];
                $log['content']     = "删除了一个 租赁订单";
                $log['create_time'] = time();
                $OpLogModel->createData($log);
                // 记录操作日志 End
                $ret_data['status'] = 1;
                $ret_data['data'] = $data;
                $ret_data['msg']  = null;
                $ret_data['code'] = null;
            }
        }
        else
        {
            $ret_data['status'] = 0;
            $ret_data['data'] = null;
            $ret_data['msg']  = "参数非法或为空";
            $ret_data['code'] = null;
        }

        if(config('api_debug_enabled')==1)//开启调试输出调试参数
        {
            $debug['title'] = '【 租赁订单 】软删除';
            $debug['param'] = $param;
            $ret_data['debug'] = $debug;
        }
        return json($ret_data);
    }




}
