<?php
require_once dirname(__FILE__) . '/../loader.php';

class functionTest extends PHPUnit_Framework_TestCase
{
    public function testCSignleValue()
    {
        $GLOBALS['lpconfig']['__testvalue'] = 'config_test';
        $this->assertEquals('config_test',c('__testvalue'));
    }

    public function testCArray()
    {
        $GLOBALS['lpconfig']['__testarray'] = array( 'easy' , 'hard' );
        $array = c('__testarray');
        $this->assertEquals('easy', $array[0] );
        $this->assertEquals('hard', $array[1] );
    }

    public function testV()
    {
        $_REQUEST['abc'] = 'abc';
        
        $this->assertEquals(v('abc'), 'abc' );
        $this->assertFalse(v('__not_exists'));   
    }

    public function testG()
    {
        $GLOBALS['__testarray'] = array( 'easy' , 'hard' );
        $array = g('__testarray');
        $this->assertEquals('easy', $array[0] );
        $this->assertEquals('hard', $array[1] );

        $GLOBALS['__testvalue'] = 'config_test';
        $this->assertEquals('config_test',g('__testvalue'));
    }
}