<?php 
namespace Lazyphp\Core {
Class RestException extends \Exception {}
Class RouteException extends \Lazyphp\Core\RestException {}
Class InputException extends \Lazyphp\Core\RestException {}
Class DatabaseException extends \Lazyphp\Core\RestException {}
Class DataException extends \Lazyphp\Core\RestException {}
Class AuthException extends \Lazyphp\Core\RestException {}
Class TmplateException extends \Lazyphp\Core\RestException {}
Class RpwtException extends \Lazyphp\Core\RestException {}
}
namespace{
$GLOBALS['meta'] = array (
  '70c907e8750f400eb470132e210b44cb' => 
  array (
    'Description' => 
    array (
      0 => 
      array (
        'section' => 'Demo',
        'description' => '默认提示',
      ),
    ),
    'LazyRoute' => 
    array (
      0 => 
      array (
        'route' => 'GET /',
        'ApiMethod' => '(type="GET")',
        'ApiRoute' => '(name="/")',
      ),
    ),
    'Return' => 
    array (
      0 => 
      array (
        'type' => 'object',
        'sample' => '{\'code\': 0,\'message\': \'success\'}',
      ),
    ),
    'binding' => false,
    'route' => 
    array (
      0 => 
      array (
        'uri' => 'GET /',
        'params' => false,
      ),
    ),
  ),
  '039a3032e1bca4289db765365162086a' => 
  array (
    'Description' => 
    array (
      0 => 
      array (
        'section' => 'Demo',
        'description' => '系统提示',
      ),
    ),
    'LazyRoute' => 
    array (
      0 => 
      array (
        'route' => 'GET /info',
        'ApiMethod' => '(type="GET")',
        'ApiRoute' => '(name="/info")',
      ),
    ),
    'Return' => 
    array (
      0 => 
      array (
        'type' => 'object',
        'sample' => '{\'code\': 0,\'message\': \'success\'}',
      ),
    ),
    'binding' => false,
    'route' => 
    array (
      0 => 
      array (
        'uri' => 'GET /info',
        'params' => false,
      ),
    ),
  ),
  'eb12852dde30c86f2681120ef5001954' => 
  array (
    'Description' => 
    array (
      0 => 
      array (
        'section' => 'Demo',
        'description' => '乘法接口',
      ),
    ),
    'LazyRoute' => 
    array (
      0 => 
      array (
        'route' => 'GET /demo/times',
        'ApiMethod' => '(type="GET")',
        'ApiRoute' => '(name="/demo/times")',
      ),
    ),
    'Params' => 
    array (
      0 => 
      array (
        'name' => 'first',
        'filters' => 
        array (
          0 => 'check_not_empty',
        ),
        'cnname' => '第一个数',
      ),
      1 => 
      array (
        'name' => 'second',
        'filters' => 
        array (
          0 => 'check_not_empty',
        ),
        'cnname' => '第二个数',
      ),
    ),
    'Return' => 
    array (
      0 => 
      array (
        'type' => 'object',
        'sample' => '{\'code\': 0,\'message\': \'success\'}',
      ),
    ),
    'binding' => 
    array (
      'first' => 
      array (
        'name' => 'first',
      ),
      'second' => 
      array (
        'name' => 'second',
      ),
    ),
    'route' => 
    array (
      0 => 
      array (
        'uri' => 'GET /demo/times',
        'params' => false,
      ),
    ),
  ),
);
$app = new \Lazyphp\Core\Application();
$app->route('GET /',array( 'Lazyphp\Controller\LazyphpController','index'));
$app->route('GET /info',array( 'Lazyphp\Controller\LazyphpController','info'));
$app->route('GET /demo/times',array( 'Lazyphp\Controller\LazyphpController','demo'));
$app->run();
}
