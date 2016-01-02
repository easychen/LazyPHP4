<?php

// 检查并补全必须的常量
if( !defined('AROOT') ) die('NO AROOT!');
if( !defined('DS') ) define( 'DS' , DIRECTORY_SEPARATOR );

// 定义常用跟路径
define( 'FROOT' , dirname( __FILE__ ) . DS );

// 设置时区
@date_default_timezone_set('Asia/Chongqing');


// 载入composer autoload
require AROOT . 'vendor' . DS . 'autoload.php';

// 框架配置
require_once FROOT . 'lib' . DS . 'functions.php'; // 公用函数
require_once FROOT . 'config' . DS . 'exception.php'; // 公用函数
require_once FROOT . 'config' . DS . 'core.php'; // 核心配置

// 应用配置
require_once AROOT . 'lib' . DS . 'functions.php'; // 公用函数
require_once AROOT . 'config' . DS . 'database.php'; // 数据库配置
require_once AROOT . 'config' . DS . 'app.php'; // 应用配置
require_once AROOT . 'config' . DS . 'exception.php'; // 公用函数

header("Access-Control-Allow-Origin: ".c('api_allowed_domain'));
header("Access-Control-Allow-Headers: LP4-Request-Type");

// 初始化容器对象
try
{
    
    if( is_devmode() )
    {
        ini_set('display_errors',true);
        error_reporting(E_ALL);
    }

    $force_build = (!on_sae()) && is_devmode() && c('buildeverytime') ;
    load_route_file( $force_build );


}catch( PDOException $e )
{
    $error = get_error( 'DATABASE' ); 
    $error['message'] = $error['message']  . '- ' .$e->getMessage();
    $error['created'] = date("Y-m-d H:i:s");

    if( is_json_request() || c('api_server_only') )
        send_json( $error );
    elseif( is_ajax_request() )
        render_ajax( $error , 'info' );
    else 
        render_web( $error , 'info' );

}
catch(\Lazyphp\Core\RestException $e)
{
    $class_array = explode( '\\' , get_class( $e ) );
    $class = t(end( $class_array ));
    $prefix = strtoupper(rremove( $class , 'Exception' ));
    
    $error = get_error( $prefix ); 
    $error['message'] = $error['message']  . '- ' .$e->getMessage();
    $error['created'] = date("Y-m-d H:i:s");
    
    if( is_json_request() || c('api_server_only') )
        send_json( $error );
    elseif( is_ajax_request() )
        render_ajax( $error , 'info' );
    else 
        render_web( $error , 'info' );

}
catch(\Exception $e)
{
    $class_array = explode( '\\' , get_class( $e ) );
    $class = t(end( $class_array ));
    $prefix = strtoupper(rremove( $class , 'Exception' ));

    $error = get_error( $prefix );
    $error['message'] = $error['message']  . '- ' .$e->getMessage();
    $error['created'] = date("Y-m-d H:i:s");
    
    if( is_json_request() || c('api_server_only') )
        send_json( $error );
    elseif( is_ajax_request() )
        render_ajax( $error , 'info' );
    else 
        render_web( $error , 'info' );
}
