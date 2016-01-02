<?php
require_once dirname(__FILE__) . '/../loader.php';
require_once dirname(__FILE__) . '/../framework/dbtClass.php';


class  dbTest extends Lazyphp_Database_TestCase
{
    public function testUser()
    {
        //
        $this->assertTrue( true , 'message'); 
        /*
        $member = new \Lazyphp\Core\Ldo('member');
        print_r($member->getAllById('1')->toLine());
        print_r($member->getNameById('1')->toVar());
        print_r($member->getDataById(array('name','avatar') , 1)->toLine());
        print_r($member->findNameByNothing()->col('name')  );
        print_r($member->findNameByNothingLimit(array(2,5))->col('name')  );
        */
       //print_r( db()->getData("SELECT * FROM `user`")->toArray() );
    }





}
