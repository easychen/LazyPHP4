<?php
namespace Lazyphp\Controller;

class LazyphpController
{
	public function __construct()
    {
        
    }


    /**
     * 默认提示
     * @ApiDescription(section="Demo", description="默认提示")
     * @ApiLazyRoute(uri="/",method="GET")
     * @ApiReturn(type="object", sample="{'code': 0,'message': 'success'}")
     */
    public function index()
    {
        //return lp_throw( "UNKNOW" , "1233" );
        //return send_result( db()->getData("SHOW TABLES ")->toArray() );
        
        $data['title'] = $data['top_title'] = 'Version 4.6';
        return send_result( $data );
    }

    /**
     * 系统提示
     * @ApiDescription(section="Demo", description="系统提示")
     * @ApiLazyRoute(uri="/info",method="GET")
     * @ApiReturn(type="object", sample="{'code': 0,'message': 'success'}")
     */
    public function info()
    {
        //$data['notice'] = ;
        return send_error('SYSTEM','这里是信息提示页面');
    }

    /**
     * 系统提示
     * @ApiDescription(section="Demo", description="系统提示")
     * @ApiLazyRoute(uri="/postonly",method="POST")
     * @ApiReturn(type="object", sample="{'code': 0,'message': 'success'}")
     */
    public function post()
    {
        
        $data = ndb()->fetchAll("show tables");
        return send_result( $data );
        // $data['notice'] = ;
        // return send_error('SYSTEM','POST测试');
    }
    
    /**
     * Demo接口
     * @ApiDescription(section="Demo", description="乘法接口")
     * @ApiLazyRoute(uri="/demo/times",method="GET|POST")
     * @ApiParams(name="first", type="string", nullable=false, description="first", check="check_not_empty", cnname="第一个数")  
     * @ApiParams(name="second", type="string", nullable=false, description="second", check="check_not_empty", cnname="第二个数")
     * @ApiReturn(type="object", sample="{'code': 0,'message': 'success'}")
     */
    public function demo($first,$second)
    {
        return send_result(intval($first)*intval($second));
    }

}
