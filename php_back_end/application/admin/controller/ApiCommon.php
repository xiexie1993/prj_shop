<?php
// +----------------------------------------------------------------------
// | Description: Api基础类，验证权限
// +----------------------------------------------------------------------
// | Author: xiezhenbin <Xzbde163yx@163.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

use think\Request;
use think\Db;
use app\common\adapter\AuthAdapter;
use app\common\controller\Common;


class ApiCommon extends Common
{
    public function _initialize()
    {
        parent::_initialize();
        
        // 获取cookie
        $sessionId = $_COOKIE['sessionId'] ;
        $authKey   = $_COOKIE['authKey'];
        $cache = cache('Auth_'.$authKey);
        
        //判断是否开启登录校验
        if(config('api_login_verification')==1)
        {
            // 校验sessionid和authKey
            if (empty($sessionId)||empty($authKey)||empty($cache))
            {
                header('Content-Type:application/json; charset=utf-8');
                exit(json_encode(['status'=>0, 'msg'=>'登录已失效或未登录','code'=>1012]));
            }
            // 检查账号有效性
            $userInfo = $cache['userInfo'];
            $map['id'] = $userInfo['id'];
            $map['status'] = 1;
            if (!Db::name('admin_user')->where($map)->value('id'))
            {
                header('Content-Type:application/json; charset=utf-8'); 
                exit(json_encode(['status'=>0, 'msg'=>'账号已被删除或禁用','code'=>1012]));
            }
        }
        
        // 更新缓存
        cache('Auth_'.$authKey, $cache, config('LOGIN_SESSION_VALID'));
        $GLOBALS['userInfo'] = $userInfo;
/*------------------------------------------------------------------------------*/
    }
}
