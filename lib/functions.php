<?php

function is_login()
{
	return     isset( $_SESSION['level'] ) 
			&& isset( $_SESSION['uid'] ) 
			&& ( $_SESSION['level'] > 0 ) 
			&& (intval( $_SESSION['uid']) > 0) ;
}

function is_admin()
{
	return is_login() && $_SESSION['level'] >= 9;
}

function check_login($notice = '此页面需要登入后才能访问')
{
	if( !is_login() )
	{
		send_error( null , $notice );
		exit;
	} 
	
}

function in_array_any($needles, $haystack) 
{
   return !!array_intersect($needles, $haystack);
}

function check_apikey( $key = null , $notice = '错误的APIKEY' )
{
	if( $key == null ) $key = t(v('api_key'));
	if( c('api_key') != $key )
	{
		send_error( null , $notice );
		exit;
	} 	
}


function uid()
{
	if( isset( $_SESSION['uid'] ) )
	return intval( $_SESSION['uid'] );
}



function atoken()
{
    return $_SESSION['weibo_token']['access_token'];
}

function mypost( $url , $data )
{
   $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    @curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 30);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data); 
    $response = curl_exec($ch);
    return $response;
}

function send_wechat( $acode , $openid , $string )
{
	$url = 'https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=' . $acode;
	$data['touser'] = $openid;
	$data['msgtype'] = 'text';
	$data['text']['content'] = $string;

	return mypost( $url , json_encode( $data , JSON_UNESCAPED_UNICODE ) );
}

function is_safe( $path )
{
	$prefix = realpath( AROOT . '/write/meta' );
	$real = realpath( $path );

	if(  $real && substr( $real , 0 , strlen( $prefix ) ) == $prefix )
	{
		return true;
	}
	else
	{
		return false;
	}
}




