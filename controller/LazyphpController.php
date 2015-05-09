<?php
namespace Lazyphp\Controller;

class LazyphpController
{
	public function __construct()
    {
        
    }


    public function index()
    {

    }
    
    /**
     * Demo接口
     * @ApiDescription(section="Demo", description="乘法接口")
     * @ApiLazyRoute(uri="/demo/times",method="GET")
     * @ApiParams(name="first", type="string", nullable=false, description="first", check="check_not_empty", cnname="第一个数")
     * @ApiParams(name="second", type="string", nullable=false, description="second", check="check_not_empty", cnname="第二个数")
     * @ApiReturn(type="object", sample="{'code': 0,'message': 'success'}")
     */
    public function demo($first,$second)
    {
        send_result(intval($first)*intval($second));
    }

}
