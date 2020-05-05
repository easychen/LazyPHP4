<?php
function table( $name )
{
    if( !isset( $GLOBALS['LP_LDO_'.$name] ) )
    {
        $GLOBALS['LP_LDO_'.$name] = new \Lazyphp\Core\Ldo($name);
    }

    return $GLOBALS['LP_LDO_'.$name];
}

function ndb( $dsn = null, $user = null, $password = null )
{
    if( $dsn === null )
    {
        $dsn = c('database','dsn');
        $user = c('database','user');
        $password = c('database','password');
    }
    
    $key = "_LP_NDB" . md5( $dsn.'.'.$user.'.'.$password );
    
    if( !isset( $GLOBALS[$key] ) )
    {
        $GLOBALS[$key] = new Nette\Database\Connection($dsn, $user, $password);
    }

    return $GLOBALS[$key];
}

function lp_throw( $type , $info , $args = null )
{
    if( !is_array( $args )) $args = [ $args ] ;
    $code = isset( c('error_type')[$type] ) ? c('error_type')[$type] : 99999;
    $message = '[' . $type . ']' . sprintf( $info , ...$args );
    throw new \Lazyphp\Core\LpException( $message , $code , $info , $args );
}

function lp_now()
{
    return date("Y-m-d H:i:s");
}

function lp_uid()
{
    return isset( $_SESSION['uid'] ) ? intval( $_SESSION['uid'] ) : 0;
}


