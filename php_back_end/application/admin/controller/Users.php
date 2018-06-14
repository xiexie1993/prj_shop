<?php
// +----------------------------------------------------------------------
// | Description: 系统用户
// +----------------------------------------------------------------------
// | Author: linchuangbin <linchuangbin@honraytech.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

class Users extends ApiCommon
{


    // 设置密码
    public function setpwd()
    {
        $objModel = model('User');
        $param    = $this->param;
        $auth_key = $_COOKIE['authKey'];
        $old_pwd  = $param['old_pwd'];
        $new_pwd  = $param['new_pwd'];
        $pwd_confirm  = $param['pwd_confirm'];
        $data = $objModel->setpwd($auth_key, $old_pwd, $new_pwd,$pwd_confirm);
        if (!$data)
        {
            $ret_data['status'] = 0;
            $ret_data['data']   = null;
            $ret_data['msg']    = $objModel->getError();
            $ret_data['code']   = null;
        }
        else
        {
            // 记录操作日志 Start
            $cache = cache('Auth_'.$auth_key);
            $userInfo = $cache['userInfo'];
            $OpLogModel = model('OperationLog');
            $log['uid'] = $userInfo['id'];
            $log['username']    = $userInfo['username'];
            $log['content']     = "修改密码！";
            $log['create_time'] = time();
            $OpLogModel->createData($log);
            // 记录操作日志 End
            $ret_data['status'] = 1;
            $ret_data['data'] = $data;
            $ret_data['msg']  = null;
            $ret_data['code'] = null;
        }
        if(config('api_debug_enabled')==1)//开启调试输出调试参数
        {
            $debug['title'] = '【基础】后台用户修改密码';
            $debug['param'] = $param;
            $ret_data['debug'] = $debug;
        }
        return json($ret_data);
    }



    // 设置昵称
    public function setnick()
    {
        $objModel = model('User');
        $param    = $this->param;
        $auth_key = $_COOKIE['authKey'];
        $realname =  $param['realname'];
        $data = $objModel->setrealname($auth_key, $realname);
        if (!$data)
        {
            $ret_data['status'] = 0;
            $ret_data['data']   = null;
            $ret_data['msg']    = $objModel->getError();
            $ret_data['code']   = null;
        }
        else
        {
            // 记录操作日志 Start
            $cache = cache('Auth_'.$auth_key);
            $userInfo = $cache['userInfo'];
            $OpLogModel = model('OperationLog');
            $log['uid'] = $userInfo['id'];
            $log['username']    = $userInfo['username'];
            $log['content']     = "修改昵称！";
            $log['create_time'] = time();
            $OpLogModel->createData($log);
            // 记录操作日志 End
            $ret_data['status'] = 1;
            $ret_data['data']   = $data;
            $ret_data['msg']    = null;
            $ret_data['code']   = null;
        }
        if(config('api_debug_enabled')==1)//开启调试输出调试参数
        {
            $debug['title'] = '【基础】后台用户修改昵称';
            $ret_data['debug'] = $debug;
        }
        return json($ret_data);
    }
/*----------------------------------------------------------------------------*/
    // public function index()
    // {   
    //     $userModel = model('User');
    //     $param = $this->param;
    //     $keywords = !empty($param['keywords']) ? $param['keywords']: '';
    //     $page = !empty($param['page']) ? $param['page']: '';
    //     $limit = !empty($param['limit']) ? $param['limit']: '';    
    //     $data = $userModel->getDataList($keywords, $page, $limit);
    //     return resultArray(['data' => $data]);
    // }

    // public function read()
    // {   
    //     $userModel = model('User');
    //     $param = $this->param;
    //     $data = $userModel->getDataById($param['id']);
    //     if (!$data) {
    //         return resultArray(['error' => $userModel->getError()]);
    //     } 
    //     return resultArray(['data' => $data]);
    // }

    // public function save()
    // {
    //     $userModel = model('User');
    //     $param = $this->param;
    //     $data = $userModel->createData($param);
    //     if (!$data) {
    //         return resultArray(['error' => $userModel->getError()]);
    //     }
    //     return resultArray(['data' => '添加成功']);
    // }

    // public function update()
    // {
    //     $userModel = model('User');
    //     $param = $this->param;
    //     $data = $userModel->updateDataById($param, $param['id']);
    //     if (!$data) {
    //         return resultArray(['error' => $userModel->getError()]);
    //     } 
    //     return resultArray(['data' => '编辑成功']);
    // }

    // public function delete()
    // {
    //     $userModel = model('User');
    //     $param = $this->param;
    //     $data = $userModel->delDataById($param['id']);       
    //     if (!$data) {
    //         return resultArray(['error' => $userModel->getError()]);
    //     } 
    //     return resultArray(['data' => '删除成功']);    
    // }

    // public function deletes()
    // {
    //     $userModel = model('User');
    //     $param = $this->param;
    //     $data = $userModel->delDatas($param['ids']);  
    //     if (!$data) {
    //         return resultArray(['error' => $userModel->getError()]);
    //     } 
    //     return resultArray(['data' => '删除成功']); 
    // }

    // public function enables()
    // {
    //     $userModel = model('User');
    //     $param = $this->param;
    //     $data = $userModel->enableDatas($param['ids'], $param['status']);  
    //     if (!$data) {
    //         return resultArray(['error' => $userModel->getError()]);
    //     } 
    //     return resultArray(['data' => '操作成功']);         
    // }
    
}
 