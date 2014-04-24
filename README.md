LazyPHP4
========

LazyPHP4 , a lightweight framework for php api developer

## Preview
非稳定版，正在不断调试和更新中。欢迎通过issue提供意见和建议。 

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

 
## 规范化

  - 引入了namespace和异常处理
  - 整合了PHPUnit和Behat测试框架
  - 整合了Composer，支持自动加载
  - 整合了Phnix，可对数据库版本进行管理 
  
## 自动化

 - 整合LazyRest，通过可视化界面生成常规的接口代码（TODO）  
 
## 优化

  - 数据库控件使用PDO，支持参数绑定。添加了输出函数，可以置顶返回数据的一行、一列或者以某字段为索引重构数值，代价是直接getData不再返回数组啦。 
 
# 手册和规范

## controller
和之前的版本一样，LP依然使用controller作为主入口。但访问路径从?a=&c=改为路由指定，因此，访问路径和controller名称以及method名称将不再有任何关联。



 
