-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Mar 30, 2014 at 10:13 AM
-- Server version: 5.5.34
-- PHP Version: 5.5.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jobdeerlocal`
--

-- --------------------------------------------------------

--
-- Table structure for table `app`
--

CREATE TABLE `app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unistring` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `call_backurl` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unistring` (`unistring`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `app`
--

INSERT INTO `app` (`id`, `unistring`, `name`, `icon`, `call_backurl`) VALUES
(1, 'activity', '动态', 'feed', '');

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE `card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL COMMENT '动态内容',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `name` varchar(32) NOT NULL COMMENT '用户姓名',
  `avatar` varchar(255) NOT NULL COMMENT '用户头像',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `gid` int(11) NOT NULL DEFAULT '0',
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `comment_count` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `latest_comment_at` datetime NOT NULL COMMENT '最后评论时间',
  `latest_comment_id` int(11) NOT NULL COMMENT '最后评论ID',
  `source_card_id` int(1) NOT NULL DEFAULT '0' COMMENT '转发的卡片ID',
  `show_in_list` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否在卡片流中显示',
  PRIMARY KEY (`id`),
  KEY `create_at` (`create_at`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=122 ;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`id`, `text`, `uid`, `name`, `avatar`, `create_at`, `gid`, `public`, `comment_count`, `latest_comment_at`, `latest_comment_id`, `source_card_id`, `show_in_list`) VALUES
(1, 'gogogo', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-19 13:09:19', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(2, 'nothing will go', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-19 16:07:31', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(3, '中文发帖', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-19 16:08:26', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(4, '什么都没学到！', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-19 16:09:13', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(5, '好慢的样子？', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-19 16:15:30', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(6, '查看添加了状态动画的样子', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-19 16:19:56', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(7, '换成jQuery了', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-20 03:24:04', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(8, '分类啊分来', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-20 03:48:06', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(9, '接下来搞相对时间。这个地方是可以换行的。其实还可以加图片。问题是如果支持html，后端过滤怎么办。看看ZenPen吧？', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-20 04:09:11', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(10, '好困，我要去睡一会儿…… >..', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-20 08:07:35', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(11, '再来一发试试。', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-20 08:08:48', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(12, '所以就不能发布了么？', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-20 10:17:18', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(13, '现在OK了。', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-20 10:17:31', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(14, '接下来搞相对时间。这个地方是可以换行的。其实还可以加图片。问题是如果支持html，后端过滤怎么办。看看ZenPen吧？fdfdfdfdfdfdffdfdfdfdffdf', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-20 10:42:42', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(15, '加粗。<p>换行。</p><p><b>你要干啥事吗！</b></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-20 10:45:48', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(16, '<h1>fdfdfdfd&nbsp;</h1>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-20 10:46:44', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(17, 'fddfd&nbsp;<p><b>fddfdf</b></p><p><b>fdfdfdfdfdf</b></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-20 11:13:05', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(23, '很好，但是没有图片<b>不幸福</b>！', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-20 15:15:10', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(20, 'fdfdfdfdfd', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-20 12:17:11', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(21, '<h2>检查列表</h2><p></p><ul><li>早睡</li><li>少吃</li><li>多卖萌</li></ul>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-20 12:18:54', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(22, '<h1>标题</h1><h2>标题2</h2><p>正文</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-20 12:27:17', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(25, '<p>现在好了么。</p>谁知道呢。<p>gogogo。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-21 07:29:19', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(26, '<h2>全屏协作</h2><p><b>你看你看</b></p><p>你看你看你看你看你看你看</span></p><p>你看你看</p><p>你看你看</p><p>你看你看</p><p>你看你看</p><p>你看你看</p><p></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-21 09:18:43', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(30, '<p>必要的时候还可以把div也直接禁用了好了。&lt;html&gt;fdfd&lt;/html&gt;</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-21 09:27:30', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(27, '<p>f''dfdfdfd</p><p>分担分担辅导费地方</p><p>&nbsp;dfdfdfdf</p><p><b>fdfdfdfd</b>ffdfdfd</p><h2>fdfdfdfdf</h2><p></p><p>fdfdfdf</p><p>fdf<b>dfdfdf</b></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-21 09:23:08', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(28, '<p>那些span 哪儿来的呢</p><p>为什么呢</p><p>不存在</p><p></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-21 09:23:37', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(29, '<h1>明明啊</h1><p></p><p>可以啊&nbsp;</p><p>是不是可以把span给禁用掉？</p><p></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-21 09:24:36', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(31, '<h1>写什么</h1><p>这事一个问题</p><p>很大的问题</p><p>嗯。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-21 09:35:14', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(32, '<p>fdfdfd</p><p>fdfdfd</p><h1>fdfdfd</h1><p>离得还真远</p><p></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-21 09:37:02', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(33, '<p>好了？好了。</p><p><b>终于好了</b>。</p><p>加粗其实看不怎么见啊。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-21 09:42:44', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(35, '<p>fdfdfdf</p><p>fd</p><p>f</p><p>df</p><p>df</p><p>df</p><p>df</p><img src="uploads/1.png" alt=""><p>d</p><p>fd</p><p>fdfd</p><p>fdf</p><p>df</p><p>d</p><p>f</p><p></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-21 10:48:38', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(36, '<p>news</p><img src="uploads/1.png" alt=""><p>fdfdf</p><p>fdfdfdf</p><p>fdfdfd</p><p></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-21 10:49:42', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(37, '<p>中国年问</p><div class="mediumInsert" id="mediumInsert-0"><div class="mediumInsert-images"><img src="uploads/1.png" alt=""></div></div><p>测试</p><p>策划师</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-21 10:52:55', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(38, '<p>fdfdf</p><p>xiaotu</p><div class="mediumInsert small" id="mediumInsert-0"><div class="mediumInsert-images small"><img src="uploads/1.png" alt=""></div></div><p>xiaotu</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-21 10:55:09', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(39, '<p>不爽</p><div class="mediumInsert" id="mediumInsert-0"><div class="mediumInsert-images"><img src="uploads/1.png" alt=""></div></div><p></p><p>个各种的</p><p></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-21 11:07:10', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(40, '<p>为嘛CSS不对呢</p><div class="mediumInsert" id="mediumInsert-0"><div class="mediumInsert-images"><img src="uploads/1.png" alt=""></div></div><p>fddf</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-21 11:16:41', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(41, '<p>第一行第二行</p><div class="mediumInsert" id="mediumInsert-0"><div class="mediumInsert-images"><img src="uploads/1.png" alt=""></div></div><p>第三行</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-21 11:30:41', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(42, '<p>第一行<br>第二行</p><div class="mediumInsert" id="mediumInsert-0"><div class="mediumInsert-images"><img src="uploads/1.png" alt=""></div></div><p>第三行</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-21 11:31:30', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(43, '<p>xi现在开始测试小兔</p><div class="mediumInsert small" id="mediumInsert-0"><div class="mediumInsert-images small"><img src="uploads/1.png" alt=""></div></div><p>小图在哪里啊小图在哪里啊小图在哪里啊小图在哪里啊小图在哪里啊</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-21 11:38:25', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(44, '<p>写文字</p><blockquote>再写一点</blockquote>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-21 11:51:26', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(45, '<blockquote>文字写字</blockquote><p>其实还是在里边读起来更舒服</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-21 11:53:59', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(46, '<p>看完深夜食堂，饿了</p><div class="mediumInsert" id="mediumInsert-0"><div class="mediumInsert-images"><img src="uploads/1.png" alt=""></div></div><p><br></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-21 14:43:41', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(47, '<p>中文输入还是会出下问题？</p><div class="mediumInsert" id="mediumInsert-0"><div class="mediumInsert-images"><img src="/uploads/1.1395452287.png" alt=""></div></div><p>好萌 ~~&gt;_&lt;~~</p><div class="mediumInsert" id="mediumInsert-1"><div class="mediumInsert-images"><img src="/uploads/1.1395452378.png" alt=""></div></div><p>这个妹子也不错！</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-22 02:39:53', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(48, '&lt;?php\n\nfile_get_content( $a , $v )\n{\n    // 用起来太搞了。\n}', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-22 03:14:44', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(49, '<p>eree</p><pre>fddfdfdf</pre>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-22 03:28:19', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(50, '<pre>&lt;?php\nphpinfo();</pre><p><br></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-22 03:28:55', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(51, '<p>fdfdfdf</p><div class="mediumInsert" id="mediumInsert-0"><div class="mediumInsert-images"><img src="/uploads/1.1395457066.png" alt=""></div></div><p><br></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-22 03:58:15', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(52, '<p>写文章<br></p><p>这个东西写博客还是<b>不错</b>的。</p><blockquote>到现在也没弄清楚快捷键有哪几个。</blockquote><p><br></p><p>博文同步到Wordpress<br>因为长文章是可以修改的，所以转发不能只做标记。需要将内容也放入进来。这就是Tumblr的逻辑。</p><p>最后放个美女好了</p><div class="mediumInsert" id="mediumInsert-4"><div class="mediumInsert-images"><img src="/uploads/1.1395457476.png" alt=""></div></div><p><br></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-22 04:06:15', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(53, '<h1>测试全屏</h1><div class="mediumInsert" id="mediumInsert-0"><div class="mediumInsert-images"><img src="/uploads/1.1395457615.png" alt=""></div></div><p>果然左对齐才是最好的。</p><p><br></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-22 04:10:59', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(54, '<p>新版全屏太高大上了。</p><p>各种帅啊。<br></p><p>要不要添加点白噪音呢？</p><p>试试吧。<br>我喜欢这种书写环境。</p><p>快捷键。嗯。需要添加快捷键。另外还要定时暂存服务。用localstorage吧。</p><div class="mediumInsert" id="mediumInsert-4"><div class="mediumInsert-images"><img src="/uploads/1.1395459270.png" alt=""></div></div><p>惯例，最后放张美女。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-22 04:34:45', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(55, '<h1>支持实时文字缓冲了。</h1><p>即使文章没保存也没有关系哦。<br>不知道图片可以不？</p><div class="mediumInsert" id="mediumInsert-0"><div class="mediumInsert-images"><img src="/uploads/1.1395463334.png" alt=""></div></div><p>我去啊。图片为啥没存上？好吧，插入图片的瞬间没有键盘事件。我认了……</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-22 05:43:27', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(56, '<h1>编辑器把快捷键给吞掉了啊。</h1><p>得让它放出来才行。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-22 05:49:41', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(57, '<h1>编辑器把快捷键给吞掉了啊。</h1><p>为嘛还有？</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-22 05:50:22', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(58, '<p>文档这种东西。先是写出来。然后才是组织。<br>状态还是要2种。公开的和私有的。</p><p>私有文档的可见性：这部分的复杂度我想留给【工作区】自身去做隔离吧。</p><p>卡片的概念</p><p><ul><li>文章本身是散落的。我们把它称为一个卡片。</li><li>卡片本身可以添加评论、添加通知、进行指派和完成，这些通过应用来实现。</li><li>卡片和卡片之间进行组织。通过添加目录，索引，进行搜索来实现。</li><li>第三方工具可以进一步对卡片进行加工。添加必要的选项，metadata。</li><li>卡片可以分发。发布到微博、发布到博客、发布到Lofter。</li></ul><p><br></p></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-22 06:39:32', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(59, '<h1>书写台</h1><p>书写台的概念。</p><p><ul><li>大部分的工作都是文书工作。<br></li><li>而这里就是一个书写工具。</li><li>写好以后可以发送到各个地方。</li><li>同时它又是一个入口。</li><li>可以把别的内容包含进来，进行加工和分发出去。</li></ul></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-22 06:42:12', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(60, '<p>二次元图片。</p><div class="mediumInsert small" id="mediumInsert-0"><div class="mediumInsert-images small"><img src="/uploads/1.1395467546.png" alt=""></div></div><p>买二送一，自带Q版。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-22 06:52:43', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(61, '<p>快捷键<br></p><ul><li>全屏 ctrl+f<br></li><li>Head1 ctrl+1</li><li>Head2 ctrl+2</li><li>link ctrl+l</li></ul><blockquote>就这样吧。</blockquote><p>我的博客<a href="http://ftqq.com">方糖气球</a>。&nbsp;</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-22 08:05:02', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(62, '<p>好了。快捷键和图片效果搞定。</p><p>我去睡一会儿。</p><div class="mediumInsert" id="mediumInsert-1"><div class="mediumInsert-images"><img src="/uploads/1.1395477090.png" alt=""></div></div><p><br></p><p><br></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-22 09:31:33', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(63, '<p>新内容</p><p><br></p><div class="mediumInsert" id="mediumInsert-0"><div class="mediumInsert-images"><img src="/uploads/1.1395477156.png" alt=""></div></div><p><br></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-22 09:32:39', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(64, '<h1>自动保存机制</h1><p>很好。</p><div class="mediumInsert" id="mediumInsert-0"><div class="mediumInsert-images"><img src="/uploads/1.1395491850.png" alt=""></div></div><p>就用这张吧。饿了。订餐。2</p><p></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-22 13:38:56', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(65, '<p>OK，编辑器组件化完成。吃晚饭去。</p><p>全屏应该怎么写呢…… 对象传进来吧。得。</p><p>喵~</p><div class="mediumInsert" id="mediumInsert-2"><div class="mediumInsert-images"><img src="image/vdisk/2tgk2TQpPT3dzBj/IV7U" alt=""></div></div><p>汪~</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-22 14:29:53', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(66, '<p>Feed改名为Card啦。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-22 14:38:23', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(67, '<p>完全绑定。就是根本不需要保存，数据也不会丢失。</p><p>card需要封装成组件、同时提供对应的服务。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-22 15:00:10', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(68, '<h1>Card</h1><p>Card既可以是Feed流的一部分，也可以是看板List的一部分。还可以是文章本身。<br><p>所以书写台以Card书写为入口，先创造，再组织。</p><p>Card可以是一篇博文，Card可以是一个长微博。<br>Card可以是书的一部分，Card可以是TODO事项。</p><p><p><p>同样一张Card，放到不同的容器，就有了不同的功能。也被附加上了不同的数据。</p><p>容器决定了Card的可见性。<br>容器有两个维度。一个是Board 一个是List。（ 参考trello</p><p><br></p></p></p></p><div class="mediumInsert" id="mediumInsert-0"><div class="mediumInsert-images"><img src="/uploads/1.1395548848.png" alt=""></div></div><p><br></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-23 05:27:31', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(69, '<h1>以Card为中心的组织，以静心书写为核心的体验</h1><p>书写台以书写Card为入口，先创造，再组织。一旦心中有任何灵感，就立即写下来。而后可以对其进行加工和组织。&nbsp;<br></p><p>Card既可以是Feed流的一部分，也可以是看板List的一部分。还可以是文章本身。</p><p><p>Card可以是一篇博文，Card可以是一个长微博。Card可以是书的一部分，Card可以是TODO事项。&nbsp;</p></p><p>同样一张Card，放到不同的容器，就有了不同的功能。也被附加上了不同的数据。&nbsp;容器决定了Card的可见性。 容器有两个维度。一个是Board 一个是List。（ 参考trello</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-23 05:36:55', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(71, '<p>Not a TODO List&nbsp;</p><p>Just finish your job <b>RIGHT HERE</b></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-23 05:54:59', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(72, '<h1>A Card can be ...</h1><p></p><ul><li>一篇博文</li><li>一条微博</li><li>一封邮件</li><li>一本书中的一个章节</li><li>一个待办事项</li><li>一个看板中的一张小纸片</li><li>一幅画</li><li>一个清单</li></ul><p>一个世界。</p><p></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-23 06:16:12', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(73, '<p>修正了时区，现在应该正常了。没有美图了怎么办。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-23 13:20:56', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(74, '<p>卡片本身只需要保存自己的基本数据就可以了。</p><p>当卡片被放入容器时才需要补充容器的结构化信息。一个卡片被放入人才库，就需要补充人才库需要的必填字段；一个卡片被放入联系人，就需要补充联系人的相关字段。</p><p>卡片分发时也一样。分发到微博，就需要进行微博授权（过期检查）；分发的博客，就需要填写WordPress密码。以邮件形式发送，就需要填写邮件联系人。</p><p>不同的分区，会关联不同的卡片操作。这个操作是由分区安装的应用注册的。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-23 13:53:42', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(75, '<h1>卡片的私有和公有</h1><p>当卡片作为公开状态被发布时，会保持30秒的私有状态。发布者可以点击取消和立即发布。公开和私有状态一旦选择，就会被记忆，从而避免重复操作。不同的分区，公开、私有选项的记忆不同。</p><p>分区支持私有状态是为了方便切换工作状态。也是对私有卡片的，环境分类显示策略。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-23 13:56:46', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(76, '<h1>社区形态</h1><p>和微博那种分享型的社交网络不同，JobDeer更加注重内省。提供安全感和舒适感。让人觉得在这里做什么都很放心。而不用担心会不会随时被别人看到。</p><p>即时偶尔手抖，把私有内容发布出去，也有1分钟的错误修正时间。所以可以放心的记录各种心得、想法，进行工作辅助相关行为。</p><p>JobDeer的事件，往往不是由外部触发的（如社会事件）；而是由JobDeer的用户发起的。分享一篇文章，抄送到讨论区；建立一个合作项目，邀请人员加入。</p><p><br></p><p><br></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-23 14:10:41', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(77, '<p>卡片的Copy是一个很重要的功能。这样一部分被保存的卡片就可以成为模板。</p><p>在Dbox中被使用的List fork以及push的功能，也可以很好的处理协作工作流。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-23 14:42:05', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(78, '<h1>卡片的转发</h1><p>Reblog不是Retweet 。它是对内容的复制和修改。即时原文章没有了，Reblog的内容也是可见的。更适合用来组成自己的知识库。而标注转发来源则满足了原作者的成就感。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-23 14:44:10', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(90, '<p>这猫萌翻了</p><div class="mediumInsert small" id="mediumInsert-0"><div class="mediumInsert-images small"><img src="image/vdisk/2tgk2TQpQpc2bch/VOX0" alt=""></div></div><p>buy me a beer &nbsp;&gt;_&lt;</p><p>555</p><p><br></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-24 20:41:51', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(91, '<p>然后是随意书写的文字保存。这个应该没问题。因为都存到storage了。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-24 22:02:37', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(85, '<p>睡觉去了 miao2~</p><div class="mediumInsert" id="mediumInsert-0"><div class="mediumInsert-images"><img src="/uploads/1.1395594019.png" alt=""></div></div><p><br></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-24 01:00:22', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(86, '<p>fdfd</p><p><br></p><div class="mediumInsert" id="mediumInsert-1"><div class="mediumInsert-images"><img src="image/vdisk/2tgk2TQwZAehXmN/J685" alt=""></div></div><p><br></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-24 12:54:50', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(87, '<p>再修改一遍。</p><div class="mediumInsert small" id="mediumInsert-0"><div class="mediumInsert-images small"><img src="image/vdisk/2tgk2TQwYjTmq3f/G7U4" alt=""></div></div><p>挺好带图片的好像不错。</p><p>小兔看起来比较好。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-24 12:58:46', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(88, '<h1>接着要做的</h1><p><ul><li>删除模式<br></li><li>实时保存不支持图片的bug-改为保存raw html</li><li>添加ajax请求的过渡动画</li></ul></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-24 16:18:03', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(89, '<p>修改前和更新后，窗口的滚动定位效果。</p><p>这个搞定啦。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-24 18:04:26', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(92, '<p>修正了其他请求的数据通知。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-24 22:04:38', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(95, '<p>图片的放大动画效果已经被<b>去掉了</b>。需要找个时间加上来。</p><blockquote>因为事件绑定不可靠，经常报错来着。</blockquote>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-24 22:15:30', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(103, '<p>图片呢。</p><div class="mediumInsert" id="mediumInsert-0"><div class="mediumInsert-images"><img src="image/vdisk/2jjPiwfFjI982Zq0t1r/JXG2" alt=""></div></div><p>微盘好慢，还以为没戏了呢。</p>', 5, 'KingRecord', 'http://tp4.sinaimg.cn/2649767467/50/5625884373/1', '2014-03-25 17:56:01', 0, 1, 2, '2014-03-27 21:13:40', 17, 0, 1),
(97, '<p>更换bootstrap控件完成。感觉UI组做的东西不靠谱啊。还是<a href="http://mgcrea.github.io/angular-strap">angular-strap</a>更好。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-24 23:20:26', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(102, '<p>一百零一条微博。</p>', 5, 'KingRecord', 'http://tp4.sinaimg.cn/2649767467/50/5625884373/1', '2014-03-25 17:54:25', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(98, '<p>明天重点处理Follow相关的逻辑。开始支持两个帐号了。在这之前，要先把jSettings服务的问题处理掉。它同时从本地存储和服务器端获取数据。最关键是还写到reslove里边了。想办法解决吧。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-24 23:24:35', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(99, '<p>合并user和group两个请求为settings接口。为jSettings添加统一的promise。用户退出清空所有localstorage。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-25 09:58:38', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(104, '<p>这是一张私有卡片。修改后也是私有的。333</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-26 15:56:35', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(105, '<p>私有微博。改成公开了~</p>', 5, 'KingRecord', 'http://tp4.sinaimg.cn/2649767467/50/5625884373/1', '2014-03-26 16:52:20', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(106, '<p>今天添加评论功能。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-27 10:51:11', 0, 1, 8, '2014-03-28 13:34:31', 19, 0, 1),
(107, '<p>好累，不过进展速度还行。明天把评论回复做完，然后添加reblog功能吧。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-27 21:38:09', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 1),
(108, '<p>评论计数不应该读本地的，因为有可能载入不全。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-27 21:44:21', 0, 1, 1, '2014-03-28 10:39:36', 18, 0, 1),
(113, '<p>修复了两个bug</p><p><ul><li>修改卡片时，内容超出编辑区的问题。——通过clearfix来处理。<br></li><li>输入中文时，第一个文字出现字母的问题。<br></li></ul><p>同时页面滚动换用直接滚动了，不会出现横滚动条错位的错误啦。</p></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-29 10:05:08', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 1),
(114, '<p>修正了修改、转载卡片时，发布框可见性被覆盖的问题。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-29 10:32:35', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(115, '<p>雪菜好萌~&nbsp;</p><div class="mediumInsert" id="mediumInsert-0"><div class="mediumInsert-images"><img src="image/vdisk/2tgk2TPc7o9aeHr/SZ84" alt=""></div></div><p><br></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-29 11:02:03', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(116, '<p>所以说，JobDeer到底是什么？</p><p>战略上讲，它是一个职业社交网络。目标用户是所有用电脑和手机联网上班的人。<br>战术上讲，它是一个协同网络，它通过提供团队和跨团队的协同工具来制造粘度；同时又通过和工作、行业、兴趣相关的信息流来触发沟通和交互。</p><p>一个人的时候，你可以写卡片保存到笔记。这个时候，JobDeer就像evernote。<br>团队中的时候，你可以写卡片保存到看板。这个时候，JobDeer就像trello。<br>工作以外，你还可以发布卡片到自己的公共卡片流，这样关注的人就能看见，这个时候，JobDeer像Tumblr。</p><p>JobDeer还会定期增加针对某个行业的APP套件，比如招聘套件、开发者套件。这些打包好的APP将让整个团队极其客户可以轻松工作在一个工作区中。这个时候，JobDeer像Facebook。</p><p><br></p><p><br></p><p></p><p></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-29 12:25:47', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(117, '<p><strike>服务器端还需要做格式清理。</strike></p><p>客户端搞出来的问题，还是由客户端去处理吧。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-29 12:27:44', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(118, '<p>给你一张过去的CD</p><p>听听那时我们的爱情&nbsp;</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-29 16:54:12', 0, 1, 1, '2014-03-29 21:58:29', 20, 0, 1),
(119, '<p>修改小组。小组成员管理。小组卡片流。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-29 21:59:01', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(120, '<p>小组的名字很诡异，能不能换一个呢。</p><ol><li>分组<br></li><li>协作组<br></li><li>工作组</li><li><b>分区</b></li><li>工作区</li><li>办公间</li><li>办公区</li><li>协作圈</li><li>办公群</li><li>协作群</li></ol><p></p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-30 12:04:04', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1),
(121, '<p>修改了整体的页面结构，支持了子视图。<br>完成了 分区的添加、修改和删除。</p>', 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', '2014-03-30 15:21:55', 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '评论人ID',
  `name` varchar(32) NOT NULL COMMENT '评论人昵称',
  `avatar` varchar(255) NOT NULL COMMENT '评论人头像',
  `gender` varchar(1) NOT NULL COMMENT '评论人性别',
  `content` text NOT NULL COMMENT '评论内容',
  `public` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否只对贴主可见',
  `reply_id` int(11) NOT NULL DEFAULT '0' COMMENT '回复的评论ID',
  `reply_to_uid` int(11) NOT NULL COMMENT '回复对象的UID',
  `create_at` datetime NOT NULL COMMENT '评论创建时间',
  `type_id` tinyint(2) NOT NULL DEFAULT '1' COMMENT '评论类型',
  `object_id` int(11) NOT NULL COMMENT '被评论对象ID',
  `object_uid` int(11) NOT NULL COMMENT '被评论对象作者ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `uid`, `name`, `avatar`, `gender`, `content`, `public`, `reply_id`, `reply_to_uid`, `create_at`, `type_id`, `object_id`, `object_uid`) VALUES
(1, 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', 'm', '发布一条评论啊。', 0, 0, 0, '2014-03-27 16:18:28', 1, 106, 1),
(2, 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', 'm', '在回复一条', 0, 0, 0, '2014-03-27 18:00:10', 1, 106, 1),
(3, 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', 'm', '这条评论很长这条评论很长这条评论很长这条评论很长这条评论很长这条评论很长这条评论很长这条评论很长这条评论很长这条评论很长这条评论很长这条评论很长这条评论很长这条评论很长这条评论很长这条评论很长这条评论很长这条评论很长这条评论很长这条评论很长这条评论很长', 0, 0, 0, '2014-03-27 18:03:27', 1, 106, 1),
(15, 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', 'm', '好了。删除做完了。统计计数同步更新了。', 0, 0, 0, '2014-03-27 21:08:51', 1, 106, 1),
(16, 5, 'KingRecord', 'http://tp4.sinaimg.cn/2649767467/50/5625884373/1', 'm', '还好吧。明天再做评论回复吧。', 0, 0, 0, '2014-03-27 21:10:48', 1, 106, 1),
(13, 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', 'm', '再加一个新评论', 0, 0, 0, '2014-03-27 21:06:49', 1, 106, 1),
(8, 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', 'm', '雪菜好萌哇555', 0, 0, 0, '2014-03-27 18:13:50', 1, 103, 5),
(9, 5, 'KingRecord', 'http://tp4.sinaimg.cn/2649767467/50/5625884373/1', 'm', '现在是公有的啦。', 0, 0, 0, '2014-03-27 18:22:36', 1, 106, 1),
(17, 5, 'KingRecord', 'http://tp4.sinaimg.cn/2649767467/50/5625884373/1', 'm', 'prpr', 0, 0, 0, '2014-03-27 21:13:40', 1, 103, 5),
(18, 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', 'm', 'test', 0, 0, 0, '2014-03-28 10:39:36', 1, 108, 1),
(19, 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', 'm', '回复 @KingRecord: 回复试试。', 0, 9, 0, '2014-03-28 13:34:31', 1, 106, 1),
(20, 1, 'Easy', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', 'm', '小组创建做完了。', 0, 0, 0, '2014-03-29 21:58:29', 1, 118, 1);

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `follow_uid` int(11) NOT NULL COMMENT '关注用户ID',
  `follow_at` datetime NOT NULL COMMENT '关注时间',
  `show_card` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否显示对方卡片',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`show_card`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`id`, `uid`, `follow_uid`, `follow_at`, `show_card`) VALUES
(8, 5, 1, '2014-03-26 16:52:01', 1),
(16, 1, 5, '2014-03-30 11:22:39', 1);

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `admin_uids` text NOT NULL,
  `member_uids` text NOT NULL,
  `desp` text NOT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为私有',
  `create_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`id`, `name`, `admin_uids`, `member_uids`, `desp`, `private`, `create_at`) VALUES
(1, '方糖工作室', '-1-', '-1-', '个人工作相关', 1, '2014-03-30 12:23:19'),
(3, '方糖分区3', '-1-', '-1-', '测试用', 0, '2014-03-30 15:12:09');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'UID',
  `name` varchar(32) NOT NULL COMMENT '昵称',
  `realname` varchar(16) NOT NULL COMMENT '真名',
  `avatar` varchar(255) NOT NULL COMMENT '头像URL',
  `weibo_uid` bigint(20) NOT NULL COMMENT '微博UID',
  `gender` char(1) NOT NULL DEFAULT '-' COMMENT '性别',
  `level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员等级',
  `desp` varchar(255) NOT NULL COMMENT '个人简介',
  `create_at` datetime NOT NULL COMMENT '注册时间',
  `last_active_at` datetime NOT NULL COMMENT '最后活动时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `weibo_uid` (`weibo_uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `name`, `realname`, `avatar`, `weibo_uid`, `gender`, `level`, `desp`, `create_at`, `last_active_at`) VALUES
(1, 'Easy', '', 'http://tp4.sinaimg.cn/1088413295/50/5643623997/1', 1088413295, 'm', 1, '用心比创新更重要更重要更重要更重要更重要', '2014-03-15 18:21:46', '2014-03-15 18:21:46'),
(5, 'KingRecord', '', 'http://tp4.sinaimg.cn/2649767467/50/5625884373/1', 2649767467, 'm', 1, '专业吐槽，偶尔卖萌，follow有风险，转发需谨慎。', '2014-03-25 19:00:30', '2014-03-25 19:00:30');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '姓名',
  `email` varchar(32) NOT NULL COMMENT '邮件地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`) VALUES
(1, 'easy', 'easychen@gmail.com'),
(2, 'luofei', 'luofei614@qq.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_app`
--

CREATE TABLE `user_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `groupid` int(11) NOT NULL,
  `appid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user_app`
--

INSERT INTO `user_app` (`id`, `uid`, `groupid`, `appid`) VALUES
(1, 1, 1, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
