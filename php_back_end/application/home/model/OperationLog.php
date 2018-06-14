<?php
// +----------------------------------------------------------------------
// | Description: 操作日志 模型 增删查改
// +----------------------------------------------------------------------
// | Author: xiezhenbin <Xzbde163yx@163.com>
// +----------------------------------------------------------------------

namespace app\home\model;

use think\Db;
use app\home\model\Common;

class OperationLog extends Common 
{


    /**
     * 为了数据库的整洁，同时又不影响Model和Controller的名称
     * 我们约定每个模块的数据表都加上相同的前缀，比如微信模块用weixin作为数据表前缀
     */
    protected $name = 'admin_operation_log';
    /**
     * [getDataList 获取列表]
     * @Author xiezhenbin
     * @DateTime  2017-12-15 22:21:08
     * @param   
     * @return    [type]                               [description]
     */
    public function getDataList($map)
    {
        // 获取
        // $map['status'] = 1;
        $info = $this->where($map)->order('update_time desc')->select();
        // 返回信息
        $data = $info;
        return $data;
    }


    /**
     * [getDataList 获取特定某一数据]
     * @Author xiezhenbin
     * @DateTime  2017-12-15 22:21:08
     * @param   
     * @return    [type]                               [description]
     */
    public function getOneData($map)
    {
        $info = $this->where($map)->find();
        // 返回信息
        if (!$info) {
            $this->error = '查询出错';
            return false;
        }
        $data = $info;
        return $data;
    }

    /**
     * [增加]
     * @xiezhenbin
     * @DateTime  2017-12-17 00:42:43
     * @return    [array]                         
     */
    public function createData($param)
    {
        try {
            // 过滤数组中的非数据表字段数据
            $data = $this->data($param)->allowField(true)->save();
            return true;
            // return $data;//成功 $data的值为 1
        }
        catch(\Exception $e)
        {
            $this->rollback();
            $this->error = '添加失败';
            return false;
        }
        return $data;
    }

}