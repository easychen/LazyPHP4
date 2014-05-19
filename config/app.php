<?php
$GLOBALS['lpconfig']['site_name'] = 'LazyRest';
$GLOBALS['lpconfig']['site_domain'] = 'lazyphp4.sinaapp.com';

if(!on_sae())
{
    $GLOBALS['lpconfig']['mode'] = 'dev';
}


$GLOBALS['lpconfig']['sendcloud_from'] = 'JobDeer互联网人才竞拍<no-replay@kuai.sendcloud.org>';
$GLOBALS['lpconfig']['sendcloud_url'] = 'https://sendcloud.sohu.com/webapi/mail.send.json';
$GLOBALS['lpconfig']['sendcloud_user'] = 'postmaster@kuai.sendcloud.org';
$GLOBALS['lpconfig']['sendcloud_key'] = '6Z06nHJ9';
$GLOBALS['lpconfig']['sendcloud_skey'] = '7uoOgT9snlp6';

$GLOBALS['lpconfig']['avos']=array(
    'seeker'=>array(
        'app_id'=>'h86quv4yzk5v8tcyk5f23wxj8n8kehxh9fkhcehdz711e161',
        'app_key'=>'usi4rmad6nkx761eglslirfk57mj44oikzzkgltrynuwu6f2',
        'push_expiration_interval'=>86400// 推送过期时间1天
    ),
    'recruiter'=>array
    (
        'app_id'=>'h86quv4yzk5v8tcyk5f23wxj8n8kehxh9fkhcehdz711e161',
        'app_key'=>'usi4rmad6nkx761eglslirfk57mj44oikzzkgltrynuwu6f2',
        'push_expiration_interval'=>86400// 推送过期时间1天
    )
);

