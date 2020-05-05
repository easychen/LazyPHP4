<?php
$GLOBALS['lpconfig']['site_db'] = 'c2';
// 兼容SAE
if( on_sae() )
{
    $GLOBALS['lpconfig']['database'] = array
    (
        'adapter' => 'mysql',
        'host' => SAE_MYSQL_HOST_M,
        'name' => SAE_MYSQL_DB,
        'user' =>  SAE_MYSQL_USER ,
        'password' => SAE_MYSQL_PASS,
        'port' => SAE_MYSQL_PORT,
        'charset' => 'utf8mb4'
    );

    $GLOBALS['lpconfig']['database']['dsn'] = $GLOBALS['lpconfig']['database']['adapter']
                                              .':host=' . $GLOBALS['lpconfig']['database']['host']
                                              . ';port=' . $GLOBALS['lpconfig']['database']['port']
                                              . ';dbname=' . $GLOBALS['lpconfig']['database']['name']
                                              . ';charset=' . $GLOBALS['lpconfig']['database']['charset'];
}
else
{
    $GLOBALS['lpconfig']['database'] = array
    (
        'adapter' => 'mysql',
        'host' => '127.0.0.1',
        'name' => c('site_db'),
        'user' => 'root',
        'password' => '',
        'port' => 3306,
        'charset' => 'utf8mb4'
    );

    $GLOBALS['lpconfig']['database']['dsn'] = $GLOBALS['lpconfig']['database']['adapter']
                                              .':host=' . $GLOBALS['lpconfig']['database']['host']
                                              . ';port=' . $GLOBALS['lpconfig']['database']['port']
                                              . ';dbname=' . $GLOBALS['lpconfig']['database']['name']
                                              . ';charset=' . $GLOBALS['lpconfig']['database']['charset'];
}

$GLOBALS['lpconfig']['database_dev'] = array
    (
        'adapter' => 'mysql',
        'host' => '127.0.0.1',
        'name' => c('site_db'),
        'user' => 'root',
        'password' => '',
        'port' => 3306,
        'charset' => 'utf8mb4'
    );

$GLOBALS['lpconfig']['database_dev']['dsn'] = $GLOBALS['lpconfig']['database_dev']['adapter']
                                          .':host=' . $GLOBALS['lpconfig']['database_dev']['host']
                                          . ';port=' . $GLOBALS['lpconfig']['database_dev']['port']
                                          . ';dbname=' . $GLOBALS['lpconfig']['database_dev']['name']
                                          . ';charset=' . $GLOBALS['lpconfig']['database_dev']['charset'];


