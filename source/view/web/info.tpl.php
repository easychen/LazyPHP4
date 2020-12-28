<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <!-- Required meta tags always come first -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
	<title><?='系统提示 | ' . c('site_name');?></title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="http://libs.useso.com/js/bootstrap/3.2.0/css/bootstrap.min.css"/>

    <link rel="stylesheet" href="http://libs.useso.com/js/font-awesome/4.2.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/assets/css/stylish-portfolio.css"/>
    
    <link href="http://fonts.useso.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css"/>

	<link rel="stylesheet" type="text/css" href="/assets/css/app.css"/>

    <?php if( isset($css) && is_array( $css ) ): ?>
        <?php foreach( $css as $cfile ): ?><link rel="stylesheet" type="text/css" href="/assets/css/<?=$cfile?>"/>
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
    ?>
    <div class="notice-box">
        <h2>系统提示</h2>
        <?=$message?>
    </div>
    <?php
    $footer_file = dirname( __FILE__ ) . DS  . 'footer.tpl.php'; 
    if( file_exists( $footer_file ) ) include( $footer_file );
			
    ?>
  </body>
</html>
