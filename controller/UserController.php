<?php
namespace Lazyphp\Controller;

class UserController extends LazyphpController
{
    public function __construct()
    {
        parent::__construct();
    }

    
    /**
     * 文档分段信息
     * @ApiDescription(section="User", description="查看用户详细信息")
     * @ApiLazyRoute(uri="/user/@id:[0-9]+",method="GET")
     * @ApiParams(name="id", type="int", nullable=false, description="Uid", check="i|check_not_empty", cnname="用户ID")
     * @ApiParams(name="mid", type="int", nullable=false, description="Uid", check="i|check_not_empty", cnname="用户ID")
     * @ApiReturn(type="object", sample="{'id':123}")
     */

    public function info($id)
    {
        //echo cnname('name');
        //echo "SELECT * FROM `user` LIMIT :id";
        

        if( !$user = db()->getData( "SELECT * FROM `user` WHERE `id` =:id LIMIT 1" , $id )->toLine() )
            throw new \Lazyphp\core\DataException("UID 对应的用户数据不存在");
        
        return send_result( $user );
    }



}