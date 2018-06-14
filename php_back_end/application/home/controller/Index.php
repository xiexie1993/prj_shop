<?php
// +----------------------------------------------------------------------
// | Description: 首页页面控制
// +----------------------------------------------------------------------
// | Author: xiezhenbin <Xzbde163yx@163.com>
// +----------------------------------------------------------------------

namespace app\home\controller;

use com\verify\HonrayVerify;
use app\common\controller\Common;
use think\Request;

// 首页页面
class Index extends Common
{
    protected $description = '【 首页 】' ; //描述
    protected $error_msg =array(); //错误信息
    protected $debug_msg =array(); //调试信息

    // 页面初始化数据
    public function index()
    {
        $param = $this->param; //将收到的参数赋值
        $banner_list = $this ->get_banner(); // 获取Banner数据
        // 组合数据
        $init_data['banner'] = $banner_list;
        if(
            $init_data['banner'] != null

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

        if(config('api_debug_enabled')==1)//开启调试输出调试参数
        {
            $debug['title'] = $this->description .'初始化输数据';
            $debug['param'] = $param;
            $debug['error_msg'] = $this->error_msg;
            $debug['debug_msg'] = $this->debug_msg;
            $ret_data['debug'] = $debug;
        }
        return json($ret_data);
        // 渲染模板输出
        // return $this->fetch('hello',['name'=>'thinkphp']);
        // return view('index',['name'=>'thinkphp']);
    }

    // 获取Banner数据
    public function get_banner()
    {
        // 
        $objModel = model('Banner');
        $map['status'] = 1;
        $alllist = $objModel->getDataList($map);
        if (!$alllist)
        {
            $this->error_msg[] = $objModel->getError();
            $ret_data = null;
        }
        else
        {
            // $this->error_msg[] = '测试';
            foreach ($alllist as $key => $value)
            {
                $alllist[$key]['banner_pic_url'] = config('img_server').$value['banner_pic'];
            }
            $ret_data = $alllist;
        }
        if(config('api_debug_enabled')==1)//开启调试输出调试参数
        {
            $debug['title']    = $this->description.'[===获取Banner数据函数===]';
            $debug['param']    = $param;
            $debug['ret_data'] = $ret_data;
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
