<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <!-- Required meta tags always come first -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
	<title><?=$data['title'] . ' | ' . c('site_name');?></title>
	
     <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="http://lib.sinaapp.com/js/bootstrap/3.0.0/css/bootstrap.min.css"/>

    <!-- <link rel="stylesheet" href="http://libs.useso.com/js/font-awesome/4.2.0/css/font-awesome.min.css"/> -->
    <link rel="stylesheet" href="/assets/css/stylish-portfolio.css"/>
    
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css"/>

	<link rel="stylesheet" type="text/css" href="/assets/css/app.css"/>

    <?php if( isset($data['css']) && is_array( $data['css'] ) ): ?>
        <?php foreach( $data['css'] as $cfile ): ?><link rel="stylesheet" type="text/css" href="/assets/css/<?=$cfile?>"/>
        <?php endforeach; ?>
	<?php endif; ?>

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>
  <body>
    <?php

    $header_file = dirname( __FILE__ ) . DS  . 'header.tpl.php'; 
    if( file_exists( $header_file ) ) include( $header_file );

    
    $mainfile = dirname( __FILE__ ) . DS . 'main' . DS . g('c') . '_' . g('a') . '.tpl.php';
    if( file_exists( $mainfile ) ) include( $mainfile );
    else echo "<div class='notice-box'>没有设置模板文件，如需获取JSON，请将Header的Content-Type设置为application/json</div>";


    $footer_file = dirname( __FILE__ ) . DS  . 'footer.tpl.php'; 
    if( file_exists( $footer_file ) ) include( $footer_file );
			
    ?>
  </body>
</html>
