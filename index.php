<?php
/**
 * LazyPHP4 - 面向API的轻框架
 * @license BSD
 * @author @Easy
 * @Email Easychen@gmail.com
 */

// 定义系统常量
define( 'DS' , DIRECTORY_SEPARATOR );
define( 'AROOT' , dirname( __FILE__ ) . DS  );
define('lazyphp4dev', 'app_lazyphp4');
// $_SERVER['is_demo'] = 1;
// 载入核心框架初始化脚本
require '_lp'.DS .'lp.init.php';
