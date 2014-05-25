<?php
$GLOBALS['lpconfig']['site_name'] = '';
$GLOBALS['lpconfig']['site_domain'] = '';

if(!on_sae())
{
    $GLOBALS['lpconfig']['mode'] = 'dev';
}
$GLOBALS['lpconfig']['buildeverytime'] = false;


