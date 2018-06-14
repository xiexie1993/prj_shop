<?php
// +----------------------------------------------------------------------
// | Description: 用户
// +----------------------------------------------------------------------
// | Author: xiezhenbin <Xzbde163yx@163.com>
// +----------------------------------------------------------------------

namespace app\admin\model;

use think\Db;
use app\admin\model\Common;
use com\verify\HonrayVerify;

class User extends Common 
{
    /**
     * 为了数据库的整洁，同时又不影响Model和Controller的名称
     * 我们约定每个模块的数据表都加上相同的前缀，比如微信模块用weixin作为数据表前缀
     */
    protected $name = 'admin_user';
    protected $createTime = 'create_time';
    protected $updateTime = false;
    protected $autoWriteTimestamp = true;
    protected $insert = [
        'status' => 1,
    ];

    /**
     * [login 登录]
     * @Author xiezhenbin
     * @DateTime  2017-12-15 22:21:08
     * @param     [string]                   $u_username [账号]
     * @param     [string]                   $u_pwd      [密码]
     * @return    [type]                               [description]
     */
    public function login($username, $password)
    {
        if (!$username) {
            $this->error = '帐号不能为空';
            return false;
        }
        if (!$password){
            $this->error = '密码不能为空';
            return false;
        }

        $map['username'] = $username;
        $userInfo = $this->where($map)->find();
        if (!$userInfo) {
            $this->error = '帐号不存在';
            return false;
        }
        if (user_md5($password) !== $userInfo['password']) {
            $this->error = '密码错误';
            return false;
        }
        if ($userInfo['status'] === 0) {
            $this->error = '帐号已被禁用';
            return false;
        }
        // 获取菜单和权限

        // 保存缓存        
        session_start();
        $info['userInfo'] = $userInfo;
        $info['sessionId'] = session_id();
        $authKey = user_md5($userInfo['username'].$userInfo['password'].$info['sessionId']);
        // $info['_AUTH_LIST_'] = $dataList['rulesList'];
        $info['authKey'] = $authKey;
        cache('Auth_'.$authKey, null);
        cache('Auth_'.$authKey, $info, config('LOGIN_SESSION_VALID'));

        // 返回信息
        $data['authKey']        = $authKey;
        $data['sessionId']      = $info['sessionId'];
        $data['user_info']      = $userInfo;
        // $data['authList']       = $dataList['rulesList'];
        // $data['menusList']      = $dataList['menusList'];
        return $data;
    }



    /**
     * 修改密码
     * @param  array   $param  [description]
     */
    public function setpwd($auth_key, $old_pwd, $new_pwd ,$pwd_confirm)
    {
        $cache = cache('Auth_'.$auth_key);
        if (!$cache) {
            $this->error = '请先进行登录';
            return false;
        }
        if ($new_pwd != $pwd_confirm) {
            $this->error = '两次密码不一致';
            return false;
        }
        if (!$old_pwd) {
            $this->error = '请输入旧密码';
            return false;
        }
        if (!$new_pwd) {
            $this->error = '请输入新密码';
            return false; 
        }
        if ($new_pwd == $old_pwd) {
            $this->error = '新旧密码不能一致';
            return false; 
        }

        $userInfo = $cache['userInfo'];
        $password = $this->where('id', $userInfo['id'])->value('password');
        if (user_md5($old_pwd) != $password) {
            $this->error = '原密码错误';
            return false; 
        }
        if (user_md5($new_pwd) == $password) {
            $this->error = '密码没改变';
            return false;
        }
        if ($this->where('id', $userInfo['id'])->setField('password', user_md5($new_pwd))) {
            $userInfo = $this->where('id', $userInfo['id'])->find();
            // 重新设置缓存
            session_start();
            $info['sessionId'] = session_id();
            $cache['userInfo'] = $userInfo;
            $cache['authKey'] = user_md5($userInfo['username'].$userInfo['password'].session_id());
            cache('Auth_'.$auth_key, null);
            cache('Auth_'.$cache['authKey'], $cache, config('LOGIN_SESSION_VALID'));
            // return $cache['authKey'];//把auth_key传回给前端
            // 返回信息
            $data['authKey']        = $cache['authKey']; //把auth_key传回给前端
            $data['sessionId']      = $info['sessionId'];
            $data['user_info']      = $userInfo;
            return  $data;
        }
        
        $this->error = '修改失败';
        return false;
    }


    /**
     * 修改昵称
     * @param  array   $param  [description]
     */
    public function setrealname($auth_key, $realname)
    {
        if ( $realname== null || $realname == "") 
        {
            $this->error = '参数为空或不符合规则';
            return false;
        }
        $cache = cache('Auth_'.$auth_key);
        $userInfo = $cache['userInfo'];
        if ($this->where('id', $userInfo['id'])->setField('realname', $realname))
        {
            $userInfo = $this->where('id', $userInfo['id'])->find();
            // 更新缓存中信息
            $cache['userInfo'] = $userInfo;
            // $cache['authKey'] = user_md5($userInfo['username'].$userInfo['password'].session_id());
            cache('Auth_'.$auth_key, null);
            cache('Auth_'.$cache['authKey'], $cache, config('LOGIN_SESSION_VALID'));
            // 返回信息
            $data['authKey']        = $cache['authKey']; //把auth_key传回给前端
            $data['sessionId']      = $cache['sessionId'];
            $data['user_info']      = $userInfo;
            return $data;
        }
        
        $this->error = '修改失败';
        return false;
    }
}