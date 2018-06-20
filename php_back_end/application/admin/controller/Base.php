<?php
// +----------------------------------------------------------------------
// | Description: 基础类，无需验证权限。
// +----------------------------------------------------------------------
// | Author: xiezhenbin <Xzbde163yx@163.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

use com\verify\HonrayVerify;
use app\common\controller\Common;
use think\Request;

class Base extends Common
{

    /**
     *  miss 路由：处理没有匹配到的路由规则
     *
     */
    public function miss()
    {
        if (Request::instance()->isOptions())
        {
            return ;
        }
        else 
        {
            // echo '您正在非法访问!(__shop_ht)';
            $ret_data['status'] = 0;
            $ret_data['data'] = null;
            $ret_data['msg']  = "您正在非法访问!(__shop_ht)";
            $ret_data['code'] = 1011;
            if(config('api_debug_enabled')==1)//开启调试输出调试参数
            {
                $debug['title'] = '访问到没有在路由表中的URL--miss';
                $debug['param'] = $this->param;
                $ret_data['debug'] = $debug;
            }
            return json($ret_data);
        }
    }


    /**
     * [login 登录]
     * @Author xiezhenbin
     * @DateTime  2017-12-15 22:21:08
     * @param     [string]                   $u_username [账号]
     * @param     [string]                   $u_pwd      [密码]
     * @return    [type]                               [description]
     */
    public function login()
    {   
        $userModel = model('User');
        $param = $this->param;
        $username = $param['user_name'];
        $password = $param['password'];
        $data = $userModel->login($username, $password);
        if (!$data)
        {
            $ret_data['status'] = 0;
            $ret_data['data'] = null;
            $ret_data['msg'] = $userModel->getError();
            $ret_data['code'] = null;
            // return resultArray(['error' => $userModel->getError()]);
        }
        else
        {
            // 发送简单的 cookie
            setcookie("authKey",$data['authKey']);
            setcookie("sessionId",$data['sessionId']);
            // 记录操作日志 Start
            $OpLogModel = model('OperationLog');
            $log['uid'] = $data['user_info']['id'];
            $log['username']    = $data['user_info']['username'];
            $log['content']     = "登录";
            $log['create_time'] = time();
            $OpLogModel->createData($log);
            // 记录操作日志 End
            //返回
            $ret_data['status'] = 1;
            $ret_data['data'] = $data;
            $ret_data['msg']  = null;
            $ret_data['code'] = null;
        }
        if(config('api_debug_enabled')==1)//开启调试输出调试参数
        {
            $debug['title'] = '【基础】后台用户登录';
            $debug['param'] = $param;
            $ret_data['debug'] = $debug;
        }
        return json($ret_data);
    }

    public function logout()
    {
        // $param = $this->param;
        //获取cookie
        $authKey   = $_COOKIE['authKey'];
        if(empty($_COOKIE['authKey']))
        {
            $ret_data['status'] = 0;
            $ret_data['data'] = null;
            $ret_data['msg']  = "参数为空";
            $ret_data['code'] = 1012; //参数为空时也返回 1012错误码
        }
        else
        { 
            $cache = cache('Auth_'.$authKey);
            if(empty($cache))
            {
                // 记录操作日志 Start
                $OpLogModel = model('OperationLog');
                $log['username']    = '未知用户，请求退出';
                $log['content']     = "未知自动退出";
                $log['create_time'] = time();
                $OpLogModel->createData($log);
                // 记录操作日志 End
                cache('Auth_'.$authKey, null);
                // return resultArray(['data'=>'退出成功']);
                $ret_data['status'] = 1;
                $ret_data['data'] = null;
                $ret_data['msg']  = "早已退出!";
                $ret_data['code'] = null;
            }
            else
            {
                // 记录操作日志 Start
                $OpLogModel = model('OperationLog');
                $userInfo   = $cache['userInfo'];
                $log['uid'] = $userInfo['id'];
                $log['username']    = $userInfo['username'];
                $log['content']     = "退出成功！";
                $log['create_time'] = time();
                $OpLogModel->createData($log);
                // 记录操作日志 End
                cache('Auth_'.$authKey, null);
                // return resultArray(['data'=>'退出成功']);
                $ret_data['status'] = 1;
                $ret_data['data'] = null;
                $ret_data['msg']  = "退出成功";
                $ret_data['code'] = null;
            }
            // cache('Auth_'.$param['authkey'], null);
        }
        if(config('api_debug_enabled')==1)//开启调试输出调试参数
        {
            $debug['title'] = '【基础】后台用户登出';
            $ret_data['debug'] = $debug;
        }
        return json($ret_data);
    }


/*--------------------------------------------------------------------------- */
/*
    public function login()
    {   
        $userModel = model('User');
        $param = $this->param;
        $username = $param['username'];
        $password = $param['password'];
        $verifyCode = !empty($param['verifyCode'])? $param['verifyCode']: '';
        $isRemember = !empty($param['isRemember'])? $param['isRemember']: '';
        $data = $userModel->login($username, $password, $verifyCode, $isRemember);
        if (!$data) {
            return resultArray(['error' => $userModel->getError()]);
        } 
        return resultArray(['data' => $data]);
    }

    public function relogin()
    {   
        $userModel = model('User');
        $param = $this->param;
        $data = decrypt($param['rememberKey']);
        $username = $data['username'];
        $password = $data['password'];

        $data = $userModel->login($username, $password, '', true, true);
        if (!$data) {
            return resultArray(['error' => $userModel->getError()]);
        } 
        return resultArray(['data' => $data]);
    }    

    public function logout()
    {
        $param = $this->param;
        cache('Auth_'.$param['authkey'], null);
        return resultArray(['data'=>'退出成功']);
    }

    public function getConfigs()
    {
        $systemConfig = cache('DB_CONFIG_DATA'); 
        if (!$systemConfig) {
            //获取所有系统配置
            $systemConfig = model('admin/SystemConfig')->getDataList();
            cache('DB_CONFIG_DATA', null);
            cache('DB_CONFIG_DATA', $systemConfig, 36000); //缓存配置
        }
        return resultArray(['data' => $systemConfig]);
    }

    public function getVerify()
    {
        $captcha = new HonrayVerify(config('captcha'));
        return $captcha->entry();
    }

    public function setInfo()
    {
        $userModel = model('User');
        $param = $this->param;
        $old_pwd = $param['old_pwd'];
        $new_pwd = $param['new_pwd'];
        $auth_key = $param['auth_key'];
        $data = $userModel->setInfo($auth_key, $old_pwd, $new_pwd);
        if (!$data) {
            return resultArray(['error' => $userModel->getError()]);
        } 
        return resultArray(['data' => $data]);
    }

    // miss 路由：处理没有匹配到的路由规则
    public function miss()
    {
        if (Request::instance()->isOptions()) {
            return ;
        } else {
            echo 'vuethink接口';
        }
    }
*/
}
 