<?php 
namespace Lazyphp\Core {
Class RestException extends \Exception {}
Class RouteException extends \Lazyphp\Core\RestException {}
Class InputException extends \Lazyphp\Core\RestException {}
Class DatabaseException extends \Lazyphp\Core\RestException {}
Class DataException extends \Lazyphp\Core\RestException {}
}
namespace{
$GLOBALS['meta'] = array (
  '2dd8e287e9952bf15084ffaa05ea84bb' => 
  array (
    'Description' => 
    array (
      0 => 
      array (
        'section' => 'User',
        'description' => '查看用户详细信息',
      ),
    ),
    'LazyRoute' => 
    array (
      0 => 
      array (
        'route' => 'GET /user/@id:[0-9]+',
        'ApiMethod' => '(type="GET")',
        'ApiRoute' => '(name="/user/{id}")',
      ),
    ),
    'Params' => 
    array (
      0 => 
      array (
        'name' => 'id',
        'filters' => 
        array (
          0 => 'i',
          1 => 'check_not_empty',
        ),
        'cnname' => '用户ID',
      ),
      1 => 
      array (
        'name' => 'mid',
        'filters' => 
        array (
          0 => 'i',
          1 => 'check_not_empty',
        ),
        'cnname' => '用户ID',
      ),
    ),
    'Return' => 
    array (
      0 => 
      array (
        'type' => 'object',
        'sample' => '{\'id\':123}',
      ),
    ),
    'binding' => 
    array (
      'id' => 
      array (
        'name' => 'id',
      ),
    ),
    'route' => 
    array (
      0 => 
      array (
        'uri' => 'GET /user/@id:[0-9]+',
        'params' => 
        array (
          0 => 'id',
        ),
      ),
    ),
  ),
);
$app = new \Lazyphp\Core\Application();
$app->route('GET /user/@id:[0-9]+',array( 'Lazyphp\Controller\UserController','info'));
$app->run();
}
