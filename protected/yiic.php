<?php

// set environment
require_once(dirname(__FILE__) . '/extensions/yii-environment/Environment.php');
$env = new Environment(null, true); //determine mode by file

// run Yii app
$config = $env->configConsole;
require_once($env->yiicPath);

//$env->runYiiStatics();
