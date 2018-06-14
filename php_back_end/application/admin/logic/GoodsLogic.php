<?php
// +----------------------------------------------------------------------
// | Description: 后台 【 商品 】 逻辑的业务逻辑
// +----------------------------------------------------------------------
// | Author: xiezhenbin <Xzbde163yx@163.com>
// +----------------------------------------------------------------------

namespace app\admin\logic;


use think\Model;
use think\Db;

class GoodsLogic extends Model
{
    protected $logic_desc = '【 商品 】' ; //描述
    protected $logic_error_msg =array(); //错误信息
    protected $logic_debug_msg =array(); //调试信息

    // 第三方登录
    public function fn1($param)
    {

        $ret_data['status'] = 1; // 0 错误/失败； 1 正确/成功
        $ret_data['data'] = null;
        $ret_data['msg']  = $this->outmsg();
        $ret_data['code'] = null;
        if(config('api_debug_enabled')==1)//开启调试输出调试参数
        {
            $debug['title'] = $this->logic_desc .'第三方登录';
            $debug['param'] = $param;
            $debug['logic_error_msg'] = $this->logic_error_msg;
            $debug['logic_debug_msg'] = $this->logic_debug_msg;
            $ret_data['debug'] = $debug;
        }
        return $ret_data;
    }


    // 非第三方登录（用户名、邮箱名、手机号）
    public function fn($param)
    {
        // 
        // $this->logic_desc[] = '非第三方登录（用户名、邮箱名、手机号）';
        // 调用数据库模型查看用户是否能登录
        $map['identity_type'] = $param['identity_type'];
        $map['identifier']    = $param['identifier'];
        $map['credential']    = $param['credential'];
        $map['enable']        = 1;
        $map['status']        = 1;
        $objModel =  model('UserAuth');
        $model_ret = $objModel ->getOneData($map);
        if($model_ret!=false)
        {
            $need_param['identity_type'] = $model_ret['identity_type'];
            $need_param['identifier']    = $model_ret['identifier'];
            $need_param['credential']    = $model_ret['credential'];
            $need_param['uid']           = $model_ret['uid'];
            $base_info = $this->get_customer_info($need_param);

            $ret_data['status'] = 1; // 0 错误/失败； 1 正确/成功
            $ret_data['data'] = $base_info;
            $ret_data['msg']  = $this->outmsg();
            $ret_data['code'] = null;
        }
        else
        {
            $ret_data['status'] = 0; // 0 错误/失败； 1 正确/成功
            $ret_data['data'] = null;
            $ret_data['msg']  = $this->outmsg();
            $ret_data['code'] = null;
        }
        if(config('api_debug_enabled')==1)//开启调试输出调试参数
        {
            $debug['title'] = $this->logic_desc .'非第三方登录';
            $debug['param'] = $param;
            $debug['logic_error_msg'] = $this->logic_error_msg;
            $debug['logic_debug_msg'] = $this->logic_debug_msg;
            $debug['need_param'] = $need_param;
            $debug['model_ret'] = $model_ret;
            $debug['base_info'] = $base_info;
            $ret_data['debug'] = $debug;
        }
        return $ret_data;
    }




}