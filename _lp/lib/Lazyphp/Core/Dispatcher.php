<?php
namespace Lazyphp\Core;

class Dispatcher
{
    public static function execute($callback, array &$params = array()) {

        return is_array($callback) ?
            self::invokeMethod($callback, $params) :
            self::callFunction($callback, $params);
    }

    /**
     * Calls a function.
     *
     * @param string $func Name of function to call
     * @param array $params Function parameters
     * @return mixed Function results
     */
    public static function callFunction($func, array &$params = array()) {
        switch (count($params)) {
            case 0:
                return $func();
            case 1:
                return $func($params[0]);
            case 2:
                return $func($params[0], $params[1]);
            case 3:
                return $func($params[0], $params[1], $params[2]);
            case 4:
                return $func($params[0], $params[1], $params[2], $params[3]);
            case 5:
                return $func($params[0], $params[1], $params[2], $params[3], $params[4]);
            default:
                return call_user_func_array($func, $params);
        }
    }

    /**
     * Invokes a method.
     *
     * @param mixed $func Class method
     * @param array $params Class method parameters
     * @return mixed Function results
     */
    public static function invokeMethod($func, array &$params = array())
    {
        list($class, $method) = $func;
        $instance = new $class();

        $key = cmkey( $class, $method );
        if( isset($GLOBALS['meta'][$key]) )
        {
            $GLOBALS['meta_key'] = $key;
            // 获取方法所对应的Meta信息
            $meta = $GLOBALS['meta'][$key];
            if($meta['route'][0]['params'] != false)
                $route_parmas = array_slice($meta['route'][0]['params'], 0, count($params));
            else
                $route_parmas = array();
            if(isset($_SERVER['is_demo']) && $_SERVER['is_demo'] == 1)
            {
                response()
                    ->status(200)
                    ->header('Content-Type', 'application/json')
                    ->write($meta['Return'][0]['sample'])
                    ->send();
                // exit($meta['Return'][0]['sample']);
            }

            // 不管自动检查是否打开，先处理field_check
            if( isset( $meta['Params'] ) && is_array( $meta['Params'] ) )
            {
                foreach( $meta['Params'] as $item )
                {
                    if( isset( $item['name'] ) ) $item['name'] = ltrim($item['name'],'$');
                    if( isset( $item['cnname'] )) $item['cnname'] = trim($item['cnname'],'"');
                    $to_check[$item['name']] = $item;
                }
            }

            /*
            // 当自动检查打开时
            if( $meta['auto_type_check'] != 'false' && isset( $meta['table'][0]['names'] ) )
            {
                $names = array_map('strtolower',$meta['table'][0]['names']);
                $fields = $meta['table'][0]['fields'];
                // 检查输入变量，看哪些和数据库字段匹配
                foreach( $_REQUEST as $key => $value )
                {
                    // 当输入的变量名和数据库字段名匹配时
                    if( in_array( $name = strtolower(trim($key)) , $names ) )
                    {
                        // 根据数据库元信息向to_chceck补充信息
                        if(isset($fields[$name]))
                        {
                            // 当数据库中存在注释时，当做中文名，不存在时，使用英文名
                            $cnname = ne($fields[$name]['comment'])?$fields[$name]['comment']:$name;

                            if( !isset($to_check[$name]) )
                            {
                                $to_check[$name] = array
                                (
                                    'name' => $name,
                                    'cnname' => $cnname,
                                    'filters' => get_auto_check_filters($fields[$name])
                                );
                            }
                            else
                            {
                                // 当字段信息已经通过field_check指定，但未指定中文名时
                                if( !isset($to_check[$name]['cnname']) )
                                    $to_check[$name]['cnname'] = $cnname;
                            }

                        }
                    }
                }
            }
            */

            // 开始根据to_check数组，对输入项进行检查
            if( isset( $to_check ) && is_array( $to_check ) )
                foreach( $to_check as $item )
                {
                    if( isset($item['filters']) && is_array( $item['filters'] ) )
                    {
                        foreach( $item['filters'] as $check_function )
                        {
                            $tinfo = explode( '_' , $check_function );
                            $type = reset( $tinfo );
                            $type = strtolower(trim($type));
                            if( $type == 'check' )
                            {
                                // 当函数调用为false时直接输出错误信息
                                if( function_exists( $check_function ) )
                                {
                                    //echo $item['name']  . '~' . print_r( $meta['route'][0]['params'] , 1 );
                                    // 如果是路由器自带变量
                                    if( isset($meta['route'][0]['params']) && in_array( $item['name'] , $route_parmas ) )
                                        $vv = $params[array_search( $item['name'] , $route_parmas )]; // 按顺序从参数中获取
                                    else
                                        $vv = v($item['name']); // 按名字从REQUEST中获取

                                    //echo $item['name'] .'s vv=' . $vv;

                                    if(!call_user_func( $check_function , $vv ) )
                                    {
                                        // 抛出异常
                                        throw new InputException($item['cnname']."(" . $item['name'] . ")未提供或格式不正确 via ".$check_function);
                                    }
                                }

                            }
                            else
                            {
                                // filter
                                // 修改request数值
                                if( function_exists( $check_function ) )
                                {
                                    if( isset($meta['route'][0]['params']) && in_array( $item['name'] , $route_parmas ) )
                                    {
                                       $params[array_search( $item['name'] , $route_parmas )] =
                                       call_user_func( $check_function , $params[array_search( $item['name'] , $route_parmas )] );
                                    }
                                    elseif( isset( $_REQUEST[$item['name']] ) )
                                    {
                                        $_REQUEST[$item['name']] = call_user_func( $check_function , $_REQUEST[$item['name']] );

                                        //echo 'REQUEST[' . $item['name'] . ']='.$_REQUEST[$item['name']] .'\ED ';

                                    }
                                }





                            }
                        }
                    }

                    // 如果写入了参数绑定
                    // 注意这个地方是依赖于参数顺序的

                    // 如果在路由中
                    if(!in_array( $item['name'] , $route_parmas ))
                        if( isset($meta['binding'][$item['name']]) ) $params[] = v($item['name']);

                }

        }

        //print_r($params);
        return call_user_func_array(array( $instance , $method  ) , $params);

    }

}
