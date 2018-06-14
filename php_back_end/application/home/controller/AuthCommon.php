<?php
// +----------------------------------------------------------------------
// | Description: Api基础类，验证权限
// +----------------------------------------------------------------------
// | Author: xiezhenbin <Xzbde163yx@163.com>
// +----------------------------------------------------------------------

namespace app\home\controller;

use think\Request;
use think\Db;
use app\common\adapter\AuthAdapter;
use app\common\controller\Common;


class AuthCommon extends Common
{
    public function _initialize()
    {
        parent::_initialize();
        
        // 获取cookie
        $session_id = $_COOKIE['session_id'] ;
        $auth_key   = $_COOKIE['auth_key'];
        $cache = cache('auth_'.$auth_key);
        
        //判断是否开启登录校验
        if(config('api_login_verification')==1)
        {
            // 校验sessionid和authKey
            if (empty($session_id)||empty($auth_key)||empty($cache))
            {
                header('Content-Type:application/json; charset=utf-8');
                exit(json_encode(['status'=>0, 'msg'=>'登录已失效或未登录','code'=>1012]));
            }
            // 检查账号有效性
            $customer_info = $cache['customer_info'];
            $map['uid'] = $customer_info['uid'];
            $map['enable'] = 1;
            $map['status'] = 1;
            if (!Db::name('users')->where($map)->value('uid'))
            {
                header('Content-Type:application/json; charset=utf-8'); 
                exit(json_encode(['status'=>0, 'msg'=>'账号已被删除或禁用','code'=>1012]));
            }
        }
        
        // 更新缓存
        cache('auth_'.$auth_key, $cache, config('LOGIN_SESSION_VALID'));
        // $GLOBALS['userInfo'] = $userInfo;
/*------------------------------------------------------------------------------*/
    }
}
