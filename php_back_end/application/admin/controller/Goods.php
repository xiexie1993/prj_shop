<?php
// +----------------------------------------------------------------------
// | Description: 商品/租赁方案 控制器
// +----------------------------------------------------------------------
// | Author: xiezhenbin <Xzbde163yx@163.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

use think\Request;
use think\Db;
use app\common\adapter\AuthAdapter;
use app\common\controller\Common;

class Goods extends ApiCommon
{
    // 【 租赁方案 】查询出某一分类下的租赁方案/商品列表
    public function listdata()
    {
        $param = $this->param;
        $objModel = model('Good');
        if($param['category_id'] == null || $param['category_id'] =='')
        {
            $ret_data['status'] = 0;
            $ret_data['data'] = null;
            $ret_data['msg']  = "分类ID不能为空";
            $ret_data['code'] = null;
        }
        else
        {
            $map['category_id'] = $param['category_id'];
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
                $ret_data = ListPaging($alllist,$page_size,$page_no);
                // $ret_data['status'] = 1;
                // $ret_data['data'] = $data;
                // $ret_data['msg']  = null;
                // $ret_data['code'] = null;
                $ret_data['status'] = 1;
                $ret_data['code'] = null;
                $ret_data['msg']  = null;
                // return json($data);
                // return json($ret_data);
            }
        }
        if(config('api_debug_enabled')==1)//开启调试输出调试参数
        {
            $debug['title'] = '【 租赁方案 】列表查询';
            $debug['param'] = $param;
            $ret_data['debug'] = $debug;
        }
        return json($ret_data);
    }




    // 【 租赁方案 】查单条
    public function showone()
    {
        $param = $this->param;

        $objModel = model('Good');
        $map['status'] = 1;
        $map['category_id'] = $param['id'];
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
            return json($ret_data);
        }
        if(config('api_debug_enabled')==1)//开启调试输出调试参数
        {
            $debug['title'] = '【 租赁方案 】单条查询';
            $debug['param'] = $param;
            $ret_data['debug'] = $debug;
        }
        return json($ret_data);
    }
    // 【 租赁方案 】新增
    public function newadd()
    {
        $param    = $this->param;
        if($param['title'] == null || $param['title'] =='')
        {
            $ret_data['status'] = 0;
            $ret_data['data'] = null;
            $ret_data['msg']  = "商品名不能为空";
            $ret_data['code'] = null;
        }
        else
        {
            $objModel = model('Good');
            $data = $objModel->createData($param);
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
                $log['content']     = "新增了租赁方案";
                $log['create_time'] = time();
                $OpLogModel->createData($log);
                // 记录操作日志 End
                $ret['title']  = $param['title'];
                $ret['sort']   = $param['sort']   ? $param['sort']  :0;
                $ret['enable'] = $param['enable'] ? $param['enable']:0;
                $ret['status'] = $param['status'] ? $param['status']:1;
                $ret['remark'] = $param['remark'] ? $param['remark']:null;
                $ret_data['status'] = 1;
                $ret_data['data'] = $ret;
                $ret_data['msg']  = null;
                $ret_data['code'] = null;
            }
        }
        if(config('api_debug_enabled')==1)//开启调试输出调试参数
        {
            $debug['title'] = '【 租赁方案 】新增';
            $debug['param'] = $param;
            $ret_data['debug'] = $debug;
        }
        return json($ret_data);
    }


    // 【 租赁方案 】修改/编辑
    public function edit()
    {
        $param = $this->param;
        if(
              ($param['goods_id'] != null && $param['goods_id'] !='')
            ||($param['category_id'] != null && $param['category_id'] !='')
            ||($param['title']  != null && $param['title']  !='')
            ||($param['sort']   != null && $param['sort']   !='')
            ||($param['enable'] != null && $param['enable'] !='')
            ||($param['status'] != null && $param['status'] !='')
            ||($param['remark'] != null && $param['remark'] !='')
          )
        {
            $map['goods_id'] = $param['goods_id'];
            $objModel = model('Good');
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
                $log['content']     = "编辑了一个租赁方案";
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
            $debug['title'] = '【 租赁方案 】修改/编辑';
            $debug['param'] = $param;
            $ret_data['debug'] = $debug;
        }
        return json($ret_data);
    }
    
    
    
   // 【 租赁方案 】软删除
    public function vdel()
    {
        $param = $this->param;
        if(
            $param['category_id'] != null && $param['category_id'] !=''
          )
        {
            $setdata['status'] = 0;
            $map['goods_id'] = $param['goods_id'];
            $objModel = model('Good');
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
                $log['content']     = "删除了一个租赁方案";
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
            $debug['title'] = '【 租赁方案 】软删除';
            $debug['param'] = $param;
            $ret_data['debug'] = $debug;
        }
        return json($ret_data);
    }
}
