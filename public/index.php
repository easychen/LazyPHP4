<?php
/**
 * LazyPHP4 - 面向API的轻框架
 * @license BSD
 * @author @Easy
 * @Email Easychen@gmail.com 
 */

// 使用更深一层的 index，加强 Web 可访问目录的安全性

// 定义系统常量
define( 'DS' , DIRECTORY_SEPARATOR );
define( 'AROOT' , dirname( __FILE__ ) . DS . '..' . DS  );

// 载入核心框架初始化脚本
require '..' . DS . '_lp'.DS .'lp.init.php';