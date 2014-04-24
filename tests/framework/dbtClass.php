<?php
require_once dirname(__FILE__) . '/../loader.php';

class Lazyphp_Database_TestCase extends PHPUnit_Extensions_Database_TestCase
{
    public static function setUpBeforeClass()
    {
        //echo c('database_dev','dsn');
        $pdo = new PDO(c('database_dev','dsn'),c('database_dev','user'),c('database_dev','password'));
        $db =  new \Lazyphp\Core\Database($pdo);
        
        // 
        if($tables = $db->getData("SHOW TABLES")->toArray())
            foreach( $tables as $table )
               if($tablenames = array_values($table))
                    foreach( $tablenames as $tablename )
                        $db->runSql("DROP TABLES `{$tablename}`") ;
        
        // add fresh data
        load_data_from_file( TROOT . 'data' . DS . 'dev.sql' , $pdo );

    }

    
    public function getPdo()
    {
        return $this->pdo = new PDO(c('database_dev','dsn'),c('database_dev','user'),c('database_dev','password'));
    }
    /**
     * @return PHPUnit_Extensions_Database_DB_IDatabaseConnection
     */
    public function getConnection()
    {
        
        return $this->createDefaultDBConnection($this->getPdo()); 
    }

    public function getDataSet()
    {
        $this->ds = new PHPUnit_Extensions_Database_DataSet_QueryDataSet($this->getConnection());
        return $this->ds;
    } 


}