<?php
// +----------------------------------------------------------------------
// | Description: 谢振斌调试
// +----------------------------------------------------------------------
// | Author: xiezhenbin <Xzbde163yx@163.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;
use com\verify\HonrayVerify;
use app\common\controller\Common;
use think\Request;
class Xzb extends Common
{
    // 用户表的加密 方法 调试
    public function index()
    {
        // $password ="e10adc3949ba59abbe56e057f20f883e";
        $password ="123456";
        $jiami_h = user_md5($password);
        $debug['jiami_q'] = $password;
        $debug['jiami_h'] = $jiami_h;
        return json($debug);    
    }

    public function sessionpath()
    {
        
        $sessionpath = session_save_path();  
        if (strpos ($sessionpath, ";") !== FALSE)  
          $sessionpath = substr ($sessionpath, strpos ($sessionpath, ";")+1);  
        $debug['sessionpath'] = $sessionpath;
        return json($debug);    
    }

//获取当前session的保存路径  

}