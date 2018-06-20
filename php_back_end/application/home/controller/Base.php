<?php
// +----------------------------------------------------------------------
// | Description: 基础类，无需验证权限。
// +----------------------------------------------------------------------
// | Author: xiezhenbin <Xzbde163yx@163.com>
// +----------------------------------------------------------------------

namespace app\home\controller;

use com\verify\HonrayVerify;
use app\common\controller\Common;
use think\Request;

use app\home\logic\UsersLogic;
class Base extends Common
// class Base 
{

    protected $error_msg =array(); //错误信息
    protected $debug_msg =array(); //调试信息
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
            // echo '您正在非法访问!(__shop_qt)';
            $ret_data['status'] = 0;
            $ret_data['data'] = null;
            $ret_data['msg']  = "您正在非法访问!(__shop_qt)";
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
     * @param     [string]                   $identity_type [登录类型]
     */
    // 登录
    public function login()
    {
        $param = $this->param; //将收到的参数赋值
        // 判断是哪种登录
        // | 第三方应用名称（微信 微博等） 
        // |       mobile （手机）、 mailbox （邮箱）、 username （用户名）、
        // |       WeChat （微信）、 Alipay （支付宝）、 Weibo （微博）
        $identity_type = $param['identity_type'];//登录类型
        $need_params = $param;
        $param_filter =$this ->param_filter($param);//参数校验
        if($param_filter['status']==0)
        {
            // return json($param_filter);
            // return json($param_filter);
            $ret_data = $param_filter;
        }
        else
        {

            $UsersLogic = new UsersLogic();
            switch ($identity_type) {
                case 'username':
                    // username （用户名） 登录
                    $need_params['credential'] = user_md5($need_params['credential']);//密码进行md5加密
                    $logic_ret =$UsersLogic->no_third_party_login($need_params);
                    break;
                case 'mobile':
                    // mobile （手机号） 登录
                    $need_params['credential'] = user_md5($need_params['credential']);//密码进行md5加密
                    $logic_ret =$UsersLogic->no_third_party_login($need_params);
                    break;
                case 'mailbox':
                    // mailbox （邮箱） 登录
                    $need_params['credential'] = user_md5($need_params['credential']);//密码进行md5加密
                    $logic_ret =$UsersLogic->no_third_party_login($need_params);
                    break;
                case 'WeChat':
                    //  WeChat （微信） 登录
                    $logic_ret =$UsersLogic->third_party_login($need_params);
                    break;
                case 'Weibo':
                    // Weibo （微博） 登录
                    $logic_ret =$UsersLogic->third_party_login($need_params);
                    break;
                default:
                    # code...
                    //未知方式登录
                    $logic_ret = $UsersLogic->tillegal_login_mode($need_params);
                    break;
            }
            if(
                $logic_ret['status'] == 1
              )
            {
                $ret_data = $logic_ret;
                // 登录成功  返回身份标识数据
                // 根据uid 查询出用户信息
                
            }
            else
            {
                $ret_data['status'] = 0;
                $ret_data['msg']  = $this->outmsg();
                $ret_data['code'] = null;
            }
        }
        if(config('api_debug_enabled')==1)//开启调试输出调试参数
        {
            $debug['title'] = '【基础】前台台用户登录';
            $debug['param'] = $param;
            $debug['error_msg'] = $this->error_msg;
            $debug['debug_msg'] = $this->debug_msg;
            $debug['UsersLogic_msg'] = $logic_ret['msg'];
            $debug['UsersLogic_debug'] = $logic_ret['debug'];
            $ret_data['debug'] = $debug;
        }
        return json($ret_data);
    }



    public function register()
    {
        $param = $this->param; //将收到的参数赋值
        // 判断是哪种登录
        // | 第三方应用名称（微信 微博等） 
        // |       mobile （手机）、 mailbox （邮箱）、 username （用户名）、
        // |       WeChat （微信）、 Alipay （支付宝）、 Weibo （微博）
        $identity_type = $param['identity_type'];//登录类型
        $need_params   = $param;
        $param_filter =$this ->param_filter($param);//参数校验
        if($param_filter['status']==0)
        {
            // return json($param_filter);
            // return json($param_filter);
            $ret_data = $param_filter;
        }
        else
        {
            $UsersLogic    = new UsersLogic();
            switch ($identity_type) {
                case 'username':
                    // username （用户名） 
                    $need_params['credential'] = user_md5($need_params['credential']);//密码进行md5加密
                    $logic_ret =$UsersLogic->no_third_party_register($need_params);
                    break;
                case 'mobile':
                    // mobile （手机号）
                    $need_params['credential'] = user_md5($need_params['credential']);//密码进行md5加密
                    $logic_ret =$UsersLogic->no_third_party_register($need_params);
                    break;
                case 'mailbox':
                    // mailbox （邮箱） 
                    $need_params['credential'] = user_md5($need_params['credential']);//密码进行md5加密
                    $logic_ret =$UsersLogic->no_third_party_register($need_params);
                    break;
                case 'WeChat':
                    //  WeChat （微信） 
                    $logic_ret =$UsersLogic->third_party_register($need_params);
                    break;
                case 'Weibo':
                    // Weibo （微博） 
                    $logic_ret =$UsersLogic->third_party_register($need_params);
                    break;
                case 'Alipay':
                    // Alipay （支付宝） 
                    $logic_ret =$UsersLogic->third_party_register($need_params);
                    break;
                default:
                    # code...
                    //未知方式
                    $logic_ret = $UsersLogic->tillegal_register_mode($need_params);
                    break;
            }

            if(
                $logic_ret['status'] == 1
              )
            {
                $ret_data['status'] = 1;
            }
            else
            {
                $ret_data['status'] = 0;
            }
            
            $ret_data['data'] = $init_data;
            $ret_data['msg']  = $this->outmsg();
            $ret_data['code'] = null;
        }
        if(config('api_debug_enabled')==1)//开启调试输出调试参数
        {
            $debug['title'] = '【基础】前台台用户注册';
            $debug['param'] = $param;
            $debug['error_msg'] = $this->error_msg;
            $debug['debug_msg'] = $this->debug_msg;
            $debug['UsersLogic_msg'] = $logic_ret['msg'];
            $debug['UsersLogic_debug'] = $logic_ret['debug'];
            $debug['identity_type'] = $identity_type;
            $ret_data['debug'] = $debug;
            $this->debug_msg[] = $debug;
        }

        return json($ret_data);
    }




    public function logout()
    {
        // $param = $this->param;
        //获取cookie
        // $authKey   = $_COOKIE['authKey'];
        if(empty($_COOKIE['authKey']))
        {
            $ret_data['status'] = 0;
            $ret_data['data'] = null;
            $ret_data['msg']  = "参数为空";
            $ret_data['code'] = 1012; //参数为空时也返回 1012错误码
        }
        else
        { 
            // $cache = cache('Auth_'.$authKey);
            // if(empty($cache))
            // {
            //     // 记录操作日志 Start
            //     $OpLogModel = model('OperationLog');
            //     $log['username']    = '未知用户，请求退出';
            //     $log['content']     = "未知自动退出";
            //     $log['create_time'] = time();
            //     $OpLogModel->createData($log);
            //     // 记录操作日志 End
            //     cache('Auth_'.$authKey, null);
            //     // return resultArray(['data'=>'退出成功']);
            //     $ret_data['status'] = 1;
            //     $ret_data['data'] = null;
            //     $ret_data['msg']  = "早已退出!";
            //     $ret_data['code'] = null;
            // }
            // else
            // {
            //     // 记录操作日志 Start
            //     $OpLogModel = model('OperationLog');
            //     $userInfo   = $cache['userInfo'];
            //     $log['uid'] = $userInfo['id'];
            //     $log['username']    = $userInfo['username'];
            //     $log['content']     = "退出成功！";
            //     $log['create_time'] = time();
            //     $OpLogModel->createData($log);
            //     // 记录操作日志 End
            //     cache('Auth_'.$authKey, null);
            //     // return resultArray(['data'=>'退出成功']);
            //     $ret_data['status'] = 1;
            //     $ret_data['data'] = null;
            //     $ret_data['msg']  = "退出成功";
            //     $ret_data['code'] = null;
            // }
            // // cache('Auth_'.$param['authkey'], null);
        }
        if(config('api_debug_enabled')==1)//开启调试输出调试参数
        {
            $debug['title'] = '【 基础 】 前台用户登出';
            $ret_data['debug'] = $debug;
            $this->debug_msg[] = $debug;
        }
        return json($ret_data);
    }



    // 登录注册参数进行过滤筛选
    public function param_filter($param)
    {
        $identity_type = $param['identity_type'];//登录类型
        $need_params   = $param;
        if(
               $identity_type == 'username'
            || $identity_type == 'mobile'
            || $identity_type == 'mailbox'
          )
        {
            // username （用户名） 
            if(
                  $need_params['identifier'] != ''
                &&$need_params['credential'] != ''
                &&$need_params['identifier'] != null
                &&$need_params['credential'] != null
              )
            {
                $ret_data['status'] = 1;
                $ret_data['data'] = null;
                $ret_data['msg']  = null;
                $ret_data['code'] = null;
            }
            else
            {
                $ret_data['status'] = 0;
                $ret_data['data'] = null;
                $ret_data['msg']  = "参数非法!";
                $ret_data['code'] = null;
            }
        }
        elseif (
           $identity_type == 'WeChat'
        || $identity_type == 'Alipay'
        || $identity_type == 'Weibo'
               )
        {
            if(
                  $need_params['identifier'] != ''
                &&$need_params['credential'] != ''
                &&$need_params['identifier'] != null
                &&$need_params['credential'] != null
              )
            {
                $ret_data['status'] = 1;
                $ret_data['data'] = null;
                $ret_data['msg']  = null;
                $ret_data['code'] = null;
            }
            else
            {
                $ret_data['status'] = 0;
                $ret_data['data'] = null;
                $ret_data['msg']  = "参数非法!";
                $ret_data['code'] = null;
            }
        }
        else
        {
            $ret_data['status'] = 0;
            $ret_data['data'] = null;
            $ret_data['msg']  = "参数非法!";
            $ret_data['code'] = null;
        }

        if(config('api_debug_enabled')==1)//开启调试输出调试参数
        {
            $debug['title']    = '【 基础 】 登录注册参数进行过滤筛选';
            $debug['param']    = $param;
            $ret_data['debug'] = $debug;
            $this->debug_msg[] = $debug;
        }
        return $ret_data;
    }

    // 组合输出 提示语句
    public function outmsg()
    {
        $msg_str ='信息：';
        $param = $this->error_msg;
        foreach ($param as $key => $value)
        {
            if($value != null)
            {
                $msg_str = $msg_str.';'.$msg_str;
            }
        }
        $msg_str = $msg_str.'。';
        $ret_data = $msg_str;
        return $ret_data;
    }

}
 