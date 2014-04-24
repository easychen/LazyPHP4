<?php
namespace Lazyphp\Core;
use \PDO as PDO;

class Database extends Object
{
    public function __construct( $dsn = null , $user = null , $password = null )
    {
        if( is_object( $dsn ) && strtolower(get_class( $dsn )) == 'pdo' )
        { 
            $this->pdo = $dsn; 
        }
        else
        {
            if( $dsn == null )
            {
                $dsn = c('database','dsn');
                $user = c('database','user');
                $password = c('database','pass');
            }
            $this->pdo = new PDO( $dsn , $user , $password );     
        }

        if( is_devmode() )
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $this->pdo->exec("SET NAMES '" . c('database','charset') . "';");
    }

    // get data to result set

    public function getData( $sql )
    {
        $args = func_get_args();
        array_unshift($args, 'getdata');
        return call_user_func_array(array($this, 'bindData'),$args );
    }

    


    public function runSql()
    {
        $args = func_get_args();
        array_unshift($args, 'runsql');
        return call_user_func_array(array($this, 'bindData'),$args );
    }

    /**
     * bindData 用于处理带绑定支持的SQL
     * 第一个参数为 TYPE ， 当 TYPE = getdata 时，产生返回内容。否则为执行语句。
     */
    protected function bindData()
    {
        $arg_num = func_num_args();
        $arg_num = $arg_num - 1;
        $args = func_get_args();
        $type = array_shift($args);

        if( $arg_num < 1 )
        {
            throw new PdoException("NO SQL PASSBY");
            return $this;    
        }
        else
        {
            if( $arg_num == 1 )
            {
                $this->result = $this->pdo->query( $args[0] );
                return $this;
            }
                
            else
            {
                // 绑定
                
                $sql = array_shift($args);
                if( $params = get_bind_params($sql) )
                {
                    $sth = $this->pdo->prepare( $sql );
                    $meta = $GLOBALS['meta'][$GLOBALS['meta_key']];
                    

                    foreach( $params as $param )
                    {
                        $value = array_shift( $args );
                        if(  isset($meta['table']) && $fields = $meta['table'][0]['fields'] && isset( $fields[$param] ) )
                        {
                            $sth->bindValue(':'.$param, $value , type2pdo($fields[$param]['type']));
                        }
                        else
                        {
                            $sth->bindValue(':'.$param, $value , PDO::PARAM_STR);
                        }
                    }
                    $sth->execute();
                    if( 'getdata' == $type )
                    {   
                        $this->result[] = $sth->fetchAll(PDO::FETCH_ASSOC|PDO::FETCH_GROUP);
                        /*
                        while( $ret = $sth->fetch(PDO::FETCH_ASSOC) )
                        {
                            $this->result[] = $ret;
                        }*/
                    }
                   
                    return $this;

                }
            }
        }

         return $this;
                
    }

    

    // export
    public function toLine()
    {
        return first($this->result);
    }

    public function toVar()
    {
        return first(first($this->result));
    }

    public function toArray()
    {
        return $this->result;
    }

    public function col( $name )
    {
        return $this->toColumn($name);
    }

    public function toColumn( $name )
    {
        if( !isset( $this->result ) || !is_array($this->result) ) return false;
        foreach( $this->result as $line )
            if( isset($line[$name]) ) $ret[] = $line[$name];

        return isset($ret)?$ret:false;
    }

    public function index( $name )
    {
        return $this->toIndexedArray($name);
    }

    public function toIndexedArray( $name )
    {
        if( !isset( $this->result ) || !is_array($this->result) ) return false;
        foreach( $this->result as $line )
            $ret[$line[$name]] = $line;

        return isset($ret)?$ret:false;
    }

    public function quote( $string )
    {
        return $this->pdo->quote( $string );
    }

    /**
    // chain
    public function table( $name )
    {
    $this->from = $name;
    return $this;
    }


    public function find( $sql = 'all' )
    {
    if( strtolower($sql) == all ) $sql = 1;
    $this->where[] = $sql;
    return $this;
    }
     */

}