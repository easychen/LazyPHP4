LazyPHP4.6

[TOC]


# 更新日志

- 2020.12.28 调整目录结构，添加安装和开发命令（robo.li）

## 4.6 版本

- flightphp 更新
- 文档生成部分修正引用jquery时cdn失效的问题
- 方法头注释解析支持行尾空白格
- 添加 Nette Database Core ，通过 ndb() 方法全局引用，使用说明见 https://doc.nette.org/en/3.0/database-core
- 添加 robo 文件，支持安装、启动测试环境的命令

# LazyPHP3、LazyPHP4和LazyPHP4.5 

![](http://ww4.sinaimg.cn/large/40dfde6fjw1exdf1mk9erj20af0afmxw.jpg)

先介绍下LazyPHP各个版本的关系。LazyPHP一直是我的自用框架，所以很大程序上它都是随着我所认为的开发趋势一步步演进的。

LP3形成于新浪云时期，它专注于降低学习成本。通过反向封装面向对象为函数接口，甚至能帮助不了解面向对象的程序员写出强壮的程序。因为逻辑的简单性，在SAE相关项目上大量使用。

LP4则是我创业后为JobDeer相关项目的需求而设计的版本。作为一家移动互联网时代的创业公司，我们需要通过一套框架来支持网站和客户端。LP3还停留在ajax渲染的时代，所以我面向API对LP进行了重新设计。

以下是LP4的特性：

## 为API设计
在古代，PHP通常被视为HTML和Data之间的胶水，用来渲染和输出页面。当手机成为人类身体的一部分后，我们发现几乎所有的网站、产品都不可避免的遇到一个需求：多平台整合。

### API先行
如果说响应式布局还能在不同大小的浏览器上为混合式编程挽回一点局面的话，在现在这个APP风行的年代，为了兼容各种客户端（iOS、Android、电视、平板、汽车、手表），业务数据必须变成API接口。MVC的模式变异了，M被彻底分离为接口。PHP未来的核心，将是处理API。

### 相关功能
LP4就是在这样一个背景下设计的，所以比起3，它增加了很多API相关的功能

  - 整合flight，用于处理RestFul请求。
  - controller支持函数注释，可用于指定路由、验证输入参数、生成交互式文档
  - 为了能自动调整路由，提供了编译工具_build.php，用于生成meta文件和路由代码

具体起来呢，就这样：


```php
<?php
    /**
     * 文档分段信息
     * @ApiDescription(section="User", description="查看用户详细信息")
     * @ApiLazyRoute(uri="/user(/@id:[0-9]+",method="GET") 
     * @ApiParams(name="id", type="int", nullable=false, description="Uid", check="i|check_not_empty", cnname="用户ID")
     * @ApiReturn(type="object", sample="{'id':123}")
     */
    public function info($id)
    {
        if( !$user = db()->getData( "SELECT * FROM `user` WHERE `id` =:id LIMIT 1" , $id )->toLine() )
            throw new \Lazyphp\core\DataException("UID 对应的用户数据不存在");
        return send_result( $user );
    }
?>    
```
路由、输入检查和文档全部在注释中搞定，是不是很方便。

LP4的注释标记完全兼容[php-apidoc](https://github.com/calinrada/php-apidoc)，但是扩展了两个标记。

#### @ApiLazyRoute （ 新增
指定方法对应的路由。method和uri部分都遵守[flightPHP](http://flightphp.com/learn)的语法。LP做的事情只是把它拼接起来。

#### @ApiParams （ 扩展
添加了 check和cnname两个属性，用来为参数指定检查函数，以及提供字段的中文解释（在错误提示时有用），如果不需要可以不写。

注意：文档生成已经默认整合到编译工具_build.php中了，生成好的文档在docs目录下。


 
## 规范化

  - 引入了namespace和异常处理
  - 整合了PHPUnit和Behat测试框架
  - 整合了[Composer](https://getcomposer.org/)，支持自动加载
  - 整合了[Phinx](http://phinx.org/)，可对数据库版本进行管理 
  
## 自动化

 - 整合LazyRest，通过可视化界面生成常规的接口代码（TODO）  
 
 
# 手册和规范

## 安装
测试环境需要composer才能运行

### 安装composer
```
$ curl -sS https://getcomposer.org/installer | php
$ mv composer.phar /usr/local/bin/composer
```

### 安装LP4依赖
```
$ cd where/lp4/root
$ composer install
```

### 运行
如果你在不可写的环境（比如SAE）运行LP4，请在上传代码前运行 php _build.php 来生成自动路由。

## 迅捷函数
- function t( $str ) // trim
- function u( $str ) // urlencode
- function i( $str ) // intval
- function z( $str ) // strip_tags
- function v( $str ) // $_REQUEST[$str]
- function g( $str ) // $GLOBALS[$str]
- function ne( $str ) // not emptyy
- function dlog($log)  // 打印日志到文件

## 状态函数
- function is_devmode() // 开发模式
- function on_sae() // 是否运行于SAE


## 数据库相关函数 
- function s( $str ) // escape
- function db() // 返回数据库对象
- function get_data( $sql ) // 根据SQL返回数组
- function get_line( $sql ) // 根据SQL返回单行数据
- function get_var( $sql ) // 根据SQL返回值
- function run_sql( $sql ) // 运行SQL

由于LP4在框架外层做了catch，所以数据库异常会被拦截，并以json格式输出。

LP４还提供了对象方式的数据库操作，返回结果更可控。
```php
<?php
    db()->getData('SELECT * FROM `user`')->toArray(); // 返回数组 
    db()->getData('SELECT * FROM `user` WHERE `id` = :id' , $id )->toLine(); // 返回数组中的一行，参数绑定模式 
    db()->getData('SELECT COUNT(*) FROM `user`')->toVar(); // 返回具体数值 
    db()->getData('SELECT * FROM `user`')->toIndexedArray('id'); // 返回以ID字段为Key的数组 
    db()->getData('SELECT * FROM `user`')->toColumn('id'); // 返回ID字段值的一维数组 
?>
```

### LDO
其实LP4还提供了一个针对表进行数据查询的对象 LDO , 首先从数据表new一个Ldo对象，然后就可以用getXXX语法来查询了。因为支持Limit以后，我实在没搞定正则，所以现在还有ByNothing这种奇葩结构。

嘛，在做简单查询时很好用，getAllById这样的。

```php
<?php
// 根据查询的函数名称自动生成查询语句
$member = new \Lazyphp\Core\Ldo('member');
$member->getAllById('1')->toLine();
$member->getNameById('1')->toVar();
$member->getDataById(array('name','avatar') , 1)->toLine();
$member->getAllByArray(array('name'=>'easy'))->toLine();  
$member->findNameByNothing()->col('name');
$member->findNameByNothingLimit(array(2,5))->col('name'); 

?>
```



## Controller
和之前的版本一样，LP依然使用controller作为主入口。但访问路径从?a=&c=改为路由指定，因此，访问路径和controller名称以及method名称将不再有任何关联。
换句话说，你可以随意指定controller名称以及method名称，但注意其注释中的route不要重复，否则产生覆盖。


## 错误处理
在处理逻辑出错时可以直接抛出异常。
自带以下几类
```php
<?php
$GLOBALS['rest_errors']['ROUTE'] = array( 'code' => '10000' , 'message' => 'route error' );
$GLOBALS['rest_errors']['INPUT'] = array( 'code' => '10001' , 'message' => 'input error' );
$GLOBALS['rest_errors']['DATABASE'] = array( 'code' => '30001' , 'message' => 'database error' );
$GLOBALS['rest_errors']['DATA'] = array( 'code' => '40001' , 'message' => 'data error' );
?>
```
可在 _lp/lib/functions.php 文件尾部追加自己的错误类型。比如我们来添加一个时间异常。

第一步追加定义
```php
<?php
$GLOBALS['rest_errors']['TIME'] = array( 'code' => '888888' , 'message' => 'time system error' );
?>
```

然后就可以在controller的方法中抛出了
```
<?php
    public function abc()
    {
        if( true ) throw new \Lazyphp\core\timeException("这里填写具体的错误信息");
    }
?>
```
 
# LazyPHP4.5 
LazyPHP4.5是LazyPHP4之上的一个版本，它将LazyPHP3的模板系统重新加了回来。之所以有这个版本，是因为我发现做一些小项目时，我们并不需要那么纯粹的API和客户端分离。毕竟全平台应用会消耗大量的时间，很多活动页面和MVP直接用PHP模板渲染来得更快。

当然，我可以用回LP3.1，但是用惯了LP4中的一些功能后，就各种回不去了。这不是正好有点时间么，所以顺手给LP4加上了模板系统。

## LP4.5的修改

### LP4易用性优化

#### 异常配置分离成独立文件
在LP4中，定义错误类型时，我们需要去 ```_lp/lib/functions.php``` 文件尾部追加自己的错误类型。LP4.5中，将这部分直接分离成了配置文件，直接修改 ```/config/exception.php``` 即可。
 
#### 添加默认页面和默认路由
LP4对新手有个大坑，就是配置完全正确时，访问根目录会提示404。这是因为演示用路由是 ```/demo/times/``` ，所以访问根目录404是正确的。

为了不让大家再次掉到坑里去，LP4.5中添加了根目录的演示页面。

#### 将配置文件中的自动编译打开，方便调试
LP4刚安装完时每次修改完代码都要运行 ```php _build.php``` 才能生效，这是因为配置文件中的开关默认关了。考虑到刚装完必然是要进行开发调试，LP4.5将其默认打开了。

```
$GLOBALS['lpconfig']['buildeverytime'] = true;
```

### 模板系统的引入
LP4.5引入了之前LP3的模板系统，但是又不完全一样，所以这一段请大家仔细读读。

#### 智能渲染

LP4.5引入了智能渲染的概念，简单的说，就是同一个页面，你要JSON我就按JSON渲染；你要Ajax我就按Ajax渲染；你要Web页面我就按Web来渲染。

具体的判断是根据请求头来识别的，不多说直接上代码：

```
function is_ajax_request()
{
    $headers = apache_request_headers();
    return (isset( $headers['X-Requested-With'] ) && ( $headers['X-Requested-With'] == 'XMLHttpRequest' )) || (isset( $headers['x-requested-with'] ) && ($headers['x-requested-with'] == 'XMLHttpRequest' ));
}

function is_json_request()
{
    $headers = apache_request_headers();
    return (isset( $headers['Content-Type'] ) && ( clean_header($headers['Content-Type']) == 'application/json' ));
}
```

这样会带来一个非常大的好处，就是我们的API接口和Web页面完全统一起来了，不用再为API写专门的代码了。

同时这也会带来一个潜在的安全大坑，因为以前我们用render去处理$data时，是在服务器端渲染的；而现在API和Web统一后，很多信息会通过JSON显示出来。类似对User表SELECT *，然后把密码吐出来这种事千万不要去做。

#### 模板目录

##### 目录变更
模板目录还是view，但下边直接就是具体的Layout类型了，去掉了之前多余的layout目录。

##### 模板文件路径和扩展名变更
- 模板文件名从原来的 ```$controller/$action.tpl.html ``` ，改成了 ```$controller_$action.tpl.php``` ，主要是为了减少目录层级。
- 注意模板文件后缀从 ```*.tpl.html``` 改为了 ```*.tpl.php``` ，主要是为了代码高亮和防泄漏。

##### 静态文件目录变更
静态文件从static目录改放到了assets目录。

##### 模板内的数组格式变更 
因为使用模板直接渲染JSON对应的格式，所以多了一个data的维度。举个例子：
之前

``` 
$data['title'] = 'hi';
render( $data );
```

在模板里边直接用 $title就好。

现在

``` 
$data['title'] = 'hi';
send_result( $data );
```

在模板里边需要写成 $data['title']。因为send_result函数里，我们又包了一层：

```
function send_result( $data , $force_json = false )
{
    $ret['code'] = 0 ;
    $ret['message'] = '' ;
    $ret['data'] = $data ;
    
    if( is_json_request() || $force_json )
        return send_json( $ret );
    elseif( is_ajax_request() )
        return render_ajax( $ret , 'default' );
    else 
        return render_web( $ret , 'default' );
}
```


##### 其他调整

- 默认的Web布局从原来的两栏改为单栏。
- 更新Bootstrap到最新稳定版本3.3，同时还内置了Start Bootstrap的 ```Stylish Portfolio``` 模板，它是一个带侧栏菜单的Responsive模板，如果是给APP做Landing Page基本上直接改文字就可以了。
- 当然，国外的模板直接用不了的，所以还接地气的对CDN做了本土化，顺手把默认的背景图换成萌妹子了。

![](http://ww2.sinaimg.cn/large/40dfde6fjw1exdh5w35z7j20ay0ea41g.jpg)


