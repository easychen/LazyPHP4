LazyPHP4
========

LazyPHP4 , a lightweight framework for php api developer 

## 为API设计
在古代，PHP通常被视为HTML和Data之间的胶水，用来渲染和输出页面。当手机成为人类身体的一部分后，我们发现几乎所有的网站、产品都不可避免的遇到一个需求：多平台整合。

### API先行
如果说响应式布局还能在不同大小的浏览器上为混合式编程挽回一点局面的话，在现在这个APP风行的年代，为了兼容各种客户端（iOS、Android、电视、平板、汽车、手表），业务数据必须变成API接口。MVC的模式变异了，M被彻底分离为接口。PHP未来的核心，将是处理API。

### 相关功能
LP4就是在这样一个背景下设计的，所以比起3，它增加了很多API相关的功能

  - 整合flight，用于处理RestFul请求。
  - controller支持函数注释，可用于指定路由、验证输入参数、生成交互式文档
  - 为了能自动调整路由，提供了编译工具_build.php，用于生成meta文件和路由代码
 
 
## 规范化

  - 引入了namespace和异常处理
  - 整合了PHPUnit和Behat测试框架
  - 整合了Composer，支持自动加载
  - 整合了Phnix，可对数据库版本进行管理 
