<?php
/**
 * This is project's console commands configuration for Robo task runner.
 *
 * @see http://robo.li/
 */
class RoboFile extends \Robo\Tasks
{
    /**
     * 初始化框架
     */
    public function init()
    {
        $this->_exec("composer install");
    }
    /**
     * 启动本地测试服务器
     */
    public function dev()
    {
        $this->_exec("php -S 0.0.0.0:8000 route.php");
    }

    /**
     * 编译
     */
    public function build()
    {
        $this->_exec("php _build.php");
    }


}