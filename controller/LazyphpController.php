<?php
namespace Lazyphp\Controller;

class LazyphpController
{
	public function __construct()
    {
        
    }

    

    

    
    /**
     * 登出
     * @ApiDescription(section="Demo", description="系统提示")
     * @ApiLazyRoute(uri="/",method="GET")
     * @ApiReturn(type="object", sample="{'code': 0,'message': 'success'}")
     */
    public function index()
    {
        return send_result( ['msg'=>'index'] );
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
    
    
    

}
