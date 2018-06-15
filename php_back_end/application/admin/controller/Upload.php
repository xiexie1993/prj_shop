<?php
// +----------------------------------------------------------------------
// | Description: 文件/图片上传 控制器
// +----------------------------------------------------------------------
// | Author: xiezhenbin <Xzbde163yx@163.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;

use think\Request;
use think\Controller;

class Upload extends Controller
{
    protected $top_path = 'imgserver1' ; //保存文件的顶级目录

    // protected $Secondary_path;//保存文件的次级目录

    // public function index()
    // {   
    
    //     header('Access-Control-Allow-Origin: *');
    //     header('Access-Control-Allow-Methods: POST');
    //     header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
    //     $file = request()->file('file');
    //     if (!$file) {
    //         return resultArray(['error' => '请上传文件']);
    //     }
    
    //     $info = $file->validate(['ext'=>'jpg,png,gif'])->move(ROOT_PATH . DS . 'uploads');
    //     if ($info) {
    //         return resultArray(['data' =>  'uploads'. DS .$info->getSaveName()]);
    //     }
    
    //     return resultArray(['error' =>  $file->getError()]);
    // }
    //  富文本编辑器 图片上传 Start-->
    public function upload_img()
        {
            if ($_FILES) {
                if (!$_FILES['file']['error'])
                {
                    //生成的文件名（时间戳，精确到毫秒）
                    // list($usec, $sec) = explode(" ", microtime());
                    // $name = ((float)$usec + (float)$sec) * 1000;
                    // $ext = explode('.', $_FILES['file']['name']);
                    // $filename = $name . '.' . $ext[1];
                    // $folder = date("Ymd");
                    // $targetDir = C('UPLOAD_PICTURE_URL') . $folder;
                    // $targetDir = $this->top_path.'/summernote/' . $folder;
                    $tmp_file_info = $_FILES['file'];
                    //获取文件信息 
                    // $filepath = $tmp_file_info['tmp_name'];
                    //计算文件 MD5 等信息
                    $filemd5hashsha1 = $this->filemd5hashsha1($tmp_file_info['tmp_name']);
                    //判断是否该文件已有
                    // 根据文件的MD5 和sha1
                    $findinfo =$this->findfile($filemd5hashsha1);
                    
                    if($findinfo)//已有文件
                    {
                        $file_save_path = $findinfo['path'];
                        
                    }
                    else
                    {
                        //没有保存文件 新增文件信息到文件信息表
                        $file_info = $this->tmpfilesave($tmp_file_info,$filemd5hashsha1,$this->top_path,'summernote');
                        //保存上传文件的信息
                        $this->recordingfileinfo($file_info);
                        $file_save_path = $file_info['savefilepath'];
                        
                    }
                    // $file_name      = $filepath['name'];//文件上传时的名字
                    //响应返回保存的文件路径
                    // $ret_data['name'] = $file_name;
                    // $ret_data['path'] = $file_save_path;
                    header("Access-Control-Allow-Origin: *"); // 允许任意域名发起的跨域请求  
                    header('Access-Control-Allow-Headers: X-Requested-With,X_Requested_With');  
                    // echo 'http://192.168.1.129:9999'.'/'.$file_save_path;
                    // echo 'http://'.$_SERVER['HTTP_HOST'].'/'.$file_save_path;
                    // echo 'http://192.168.1.110:9999/'.$file_save_path;
                    echo config('img_server').$file_save_path;
                    

                }
                else
                {
                    echo $message = 'Ooops!  Your upload triggered the following error:  ' . $_FILES['file']['error'];
                }
            }
        }
    // 富文本编辑器 图片上传 End-->

    // 【图片上传】
    public function img()
    {
        $tmp_file_info = $_FILES['file'];
        //获取文件信息 
        // $filepath = $tmp_file_info['tmp_name'];
        //计算文件 MD5 等信息
        $filemd5hashsha1 = $this->filemd5hashsha1($tmp_file_info['tmp_name']);
        //判断是否该文件已有
        // 根据文件的MD5 和sha1
        $findinfo =$this->findfile($filemd5hashsha1);

        if($findinfo)//已有文件
        {
            $file_save_path = $findinfo['path'];
            
        }
        else
        {
            //没有保存文件 新增文件信息到文件信息表
            $file_info = $this->tmpfilesave($tmp_file_info,$filemd5hashsha1,$this->top_path,'img');
            //保存上传文件的信息
            $this->recordingfileinfo($file_info);
            $file_save_path = $file_info['savefilepath'];
            
        }
        $file_name      = $tmp_file_info['name'];//文件上传时的名字
        //响应返回保存的文件路径
        if (1)//文件上传成功
        {
            $ret_data['status'] = 1;
            $ret_data['code'] = null;
            $ret_data['msg']  = null;

            $info['name'] = $file_name;
            $info['path'] = $file_save_path;
            $info['extension'] = $file_info['savefiletype'];
            $info['type'] = $file_info['type'];
            $info['size'] = $file_info['size'];
            $ret_data['data'] = $info;//文件信息
        }
        else//文件上传失败
        {
            $ret_data['status'] = 0;
            $ret_data['code'] = null;
            $ret_data['msg']  = "图片上传失败！";
            
            $info['name'] = $file_name;
            $ret_data['data'] = $info;//文件信息
        }
        
        if(config('api_debug_enabled')==1)//开启调试输出调试参数
        {
            $debug['file_info']= $file_info;
            $debug['title'] = '【文件上传】';
            $debug['param'] = $param;
            $ret_data['debug'] = $debug;
            $ret_data['debug']['_FILES'] = $_FILES;
        }
        return json($ret_data);
    }




    // 【图片上传】方法2
    public function img2()
    {
        $tmp_file_info = $_FILES['file'];
        //获取文件信息
        $filepath = $tmp_file_info['tmp_name'];
        $file_info = $this->filemd5hashsha1($filepath);

        $type=strrchr($tmp_file_info["name"],"."); //获取扩展名
        $savefilename = 'bwh'.$file_info['md5_hash'].time().$type;//md5hash+当前时间戳

        move_uploaded_file($tmp_file_info['tmp_name'],$savefilename);
        if(config('api_debug_enabled')==1)//开启调试输出调试参数
        {

            $debug['file_info']= $file_info;
            $debug['title'] = '【文件上传】';
            $debug['param'] = $param;
            $ret_data['debug'] = $debug;
            $ret_data['debug']['_FILES'] = $_FILES;
        }
        return json($ret_data);
    }

    // 【图片上传】方法一
    public function img1()
    {
        if ($_FILES["file"]["error"] > 0)
        {
            $ret_data['status'] =0;
            $ret_data['msg'] = $_FILES["file"]["error"];
        }
        else
        {
               $ret_data['data']['name'] = $_FILES["file"]["name"];
               $ret_data['data']['type'] = $_FILES["file"]["type"];
               $ret_data['data']['size'] = ($_FILES["file"]["size"] / 1024)."Kb";
               $ret_data['data']['tmp_name']= $_FILES["file"]["tmp_name"];
               //保存文件
              if (file_exists("public/uploads/" . $_FILES["file"]["name"]))
              {
                $ret_data['status'] =0;
                $ret_data['msg'] = $_FILES["file"]["name"] . " already exists. ";
              }
              else
              {
                    $ret_data['status'] =1;
                    move_uploaded_file($_FILES["file"]["tmp_name"],"public/uploads0/" . $_FILES["file"]["name"]);
                    $ret_data['data']['path']= "public/uploads/".$_FILES["file"]["name"];
              }
        }
        if(config('api_debug_enabled')==1)//开启调试输出调试参数
        {
            $debug['title'] = '【文件上传】';
            $debug['param'] = $param;
            $ret_data['debug'] = $debug;
            $ret_data['debug']['_FILES'] = $_FILES;
        }
        return json($ret_data);
    }

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    /**
     *  上传文件保存并改名 并输出
     *  @param  上传文件信息
     *  @param  文件保存的顶级目录
     *  
     */
    // public function savetmpfile($file_tmp_path,$top_path,$Secondary_path)
    public function tmpfilesave($file_tmp_info,$file_info,$top_path,$Secondary_path)
    {
        // $file_info = $this->filemd5hashsha1($file_tmp_info['tmp_name']);
        // $type=strrchr($file_tmp_info["name"],"."); //获取扩展名
        $pathinfo=pathinfo($file_tmp_info["name"], PATHINFO_EXTENSION); //获取扩展名
        // exit(json_encode($pathinfo));
        // $savefilename = 'bwh'.$file_info['md5_hash'].time().$type;//md5hash+当前时间戳
        $savefilename = 'shop'.$file_info['md5_hash'].time().'.'.$pathinfo;//md5hash+当前时间戳
        $savefilepath = $top_path.'/'.$Secondary_path.'/'.$savefilename;
        move_uploaded_file($file_tmp_info['tmp_name'],$savefilepath);
        $ret_data = $file_info;
        $ret_data['name'] = $file_tmp_info['name'];
        $ret_data['size'] = $file_tmp_info['size'];
        $ret_data['type'] = $file_tmp_info['type'];
        $ret_data['savefilename'] = $file_info;
        $ret_data['savefilename'] = $savefilename;
        $ret_data['savefilepath'] = $savefilepath;
        $ret_data['savefiletype'] = $pathinfo;
        
        return $ret_data;
    }


    /**
     * 生成文件的MD5 和sha1用来作为 识别两个文件是否一致
     *  
     */
    public function filemd5hashsha1($filepath)
    {
        // $debug['filepath']  = $filepath;
        // exit(json_encode($debug));
       $file_info['md5_hash']  = hash_file('md5',$filepath);
       $file_info['md5']       = md5_file($filepath);
       $file_info['sha1']      = sha1_file($filepath);//默认输出40 字符十六进制数
       return $file_info;
    }


    /**
     *
     * 保存上传文件的信息
     * @param $file_info  文件信息
     *  
     */
    public function recordingfileinfo($file_info)
    {
        $param['name']      = $file_info['name'];
        $param['savename']  = $file_info['savefilename'];
        $param['path']      = $file_info['savefilepath'];
        $param['extension'] = $file_info['savefiletype'];
        $param['type']      = $file_info['type'];
        $param['size']      = $file_info['size'];
        $param['md5']       = $file_info['md5'];
        $param['sha1']      = $file_info['sha1'];
        $param['md5_hash']  = $file_info['md5_hash'];
        // $param['create_time'] = $file_info[''];
        if(1)
        {
            $objModel = model('Upload');
            $param['create_time']  = time();
            $data = $objModel->createData($param);
            
               if (!$data)
            {
                $ret_data['msg']  = $objModel->getError();
            }
            else
            {

            }
        }
        if(config('api_debug_enabled')==1)//开启调试输出调试参数
        {
            $debug['title'] = '【上传文件】新增文件信息';
            $debug['param'] = $param;
            $ret_data['debug'] = $debug;
        }
        return json($ret_data);
    }

    /**
     *
     * 保存上传文件的信息
     * @param $file_info  文件信息
     *  
     */
    public function findfile($filemd5hashsha1)
    {
        $param['md5'] = $filemd5hashsha1['md5'];
        $param['sha1'] = $filemd5hashsha1['sha1'];
        $objModel = model('Upload');
        $data = $objModel->getOneData($param);
        if (!$data)
        {
            // $ret_data['msg']  = $objModel->getError();
            return false;
        }
        else
        {
            return $data;
        }
    }
/*----------------------------------------------------------------------------*/

    // public function img1()
    // {
    //     header('Access-Control-Allow-Origin: *');
    //     header('Access-Control-Allow-Methods: POST');
    //     header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
    //     // $request->file();
    //     // $file0 =Request::insance()->file();
    //     // $fileName = input('get.filename');
    //     // $file =request()->file($fileName);
    //    $test=  $this->genfileinfo('file');
    //      //  $file1 = request()->file('file');
    //      // $file2 = request()->file("file");
    //      // $file3 = request()->file();
    //      // $file = $Request->file();
    //     if(config('api_debug_enabled')==1)//开启调试输出调试参数
    //     {
    //         $debug['title'] = '【文件上传】';
    //         $debug['param'] = $param;
    //         $ret_data['debug'] = $debug;
    //         // $ret_data['debug']['file0'] = $file0;
    //         $ret_data['debug']['test'] = $test;
    //         // $ret_data['debug']['file'] = $file;
    //         // $ret_data['debug']['fileName'] = $fileName;
    //         // $ret_data['debug']['file1'] = $file1;
    //         // $ret_data['debug']['file2'] = $file2;
    //         // $ret_data['debug']['file3'] = $file3;
    //         $ret_data['debug']['_FILES'] = $_FILES;
    //     }
    //     return json($ret_data);
    // }

    // public function img0()
    // {

    //     // $_FILES["file"]
    //     // $_FILES["file"]["error"] 
    //     $param = $this->param;
    //     //根据GET的值 判断是从哪里上传的文件
    //     // header('Access-Control-Allow-Origin: *');
    //     // header('Access-Control-Allow-Methods: POST');
    //     // header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
    //     // $file = request()->file('file');
    //     // $file = request()->file();
    //     $filerequest = request();
    //     // $file = request();
    //     if (!$file)
    //     {
    //         $ret_data['status'] = 1;
    //         $ret_data['data']   = null;
    //         $ret_data['msg']    = '请上传文件';
    //         $ret_data['code']   = null;
    //     }
    //     else
    //     {
    //         /*
    //         switch ($param['act'])
    //         {
    //             case 'goods':
    //                 //保存文件
    //                 $file_path = 'uploads'.DS.'goods';
    //                 $info = $file->validate(['ext'=>'jpg,png,gif'])->move(ROOT_PATH . DS . $file_path);
    //                 // $info = $file->move(ROOT_PATH . DS . 'uploads');

    //                 break;
    //             default:
    //                 //保存文件
    //                 $file_path = 'uploads'.DS.'other';
    //                 // $info = $file->move(ROOT_PATH . DS . $file_path);
    //                 $info = $file->move(ROOT_PATH . DS . 'uploads');

    //                 // $info = $file->validate(['ext'=>'jpg,png,gif'])->move(ROOT_PATH . DS . 'uploads');
    //                 break;
    //         }
    //         //返回信息（成功-->文件访问路径  失败-->失败原因）
    //         if ($info)
    //         {
    //             $ret_data['status'] = 1;
    //             $ret_data['data']   = $file_path.DS.$info->getSaveName();
    //             $ret_data['msg']    = null;
    //             $ret_data['code']   = null;
    //             // return resultArray(['data' =>  'uploads'. DS .$info->getSaveName()]);
    //         }
    //         else
    //         {
    //             $ret_data['status'] = 1;
    //             $ret_data['data']   = null;
    //             $ret_data['msg']    = $file->getError();
    //             $ret_data['code']   = null;
    //         }
    //         */
    //     }
    //     if(config('api_debug_enabled')==1)//开启调试输出调试参数
    //     {
    //         $debug['title'] = '【文件上传】';
    //         $debug['param'] = $param;
    //         $ret_data['debug'] = $debug;
    //         $ret_data['debug']['file'] = $file;
    //         $ret_data['debug']['_FILES'] = $_FILES;
    //     }
    //     return json($ret_data);
    // }



}

