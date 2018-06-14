<?php
// +----------------------------------------------------------------------
// | Description: 系统配置
// +----------------------------------------------------------------------
// | Author: xiezhenbin <Xzbde163yx@163.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

class SystemConfigs extends ApiCommon
{
    public function save()
    {
        $configModel = model('SystemConfig');
        $param = $this->param;
        $data = $configModel->createData($param);
        if (!$data) {
            return resultArray(['error' => $configModel->getError()]);
        } 
        return resultArray(['data' => '添加成功']);	
    }
}
