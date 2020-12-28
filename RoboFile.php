<?php
/**
 * This is project's console commands configuration for Robo task runner.
 *
 * @see http://robo.li/
 */
class RoboFile extends \Robo\Tasks
{
    // define public methods as commands
    public function install()
    {
        $this->_exec("cd source && composer install");
    }

    public function dev()
    {
        $this->_exec("php -S 0.0.0.0:8088 route.php");
    }
}