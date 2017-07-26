<?php
$GLOBALS['lpconfig']['site_name'] = 'LazyPHP';
$GLOBALS['lpconfig']['site_domain'] = 'ftqq.com';

// 根据环境变量识别程序是否开放状态
if( isset( $_SERVER['Z_ENV_MODE'] ) && strtolower(trim($_SERVER['Z_ENV_MODE'])) == 'dev'  )
	$GLOBALS['lpconfig']['mode'] = 'dev';
else
	$GLOBALS['lpconfig']['mode'] = 'prd';

$GLOBALS['lpconfig']['mode'] = 'dev';

// 开发环境每次 build 路由
if( is_devmode() )
	$GLOBALS['lpconfig']['buildeverytime'] = true;
else
	$GLOBALS['lpconfig']['buildeverytime'] = false;

// 如果在 SAE 上，目录不可写，即使是开发模式，也不build 路由了
if( on_sae() )
	$GLOBALS['lpconfig']['buildeverytime'] = false;

$GLOBALS['lpconfig']['buildeverytime'] = false;


$GLOBALS['lpconfig']['api_server_only'] = true;

$GLOBALS['lpconfig']['api_key'] = '******';

