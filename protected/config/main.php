<?php

/**
 * Main configuration.
 * All properties can be overridden in mode_<mode>.php files
 */

return array(

	// Set yiiPath (relative to Environment.php)
	'yiiPath' => dirname(__FILE__) . '/../../../yii/framework/yii.php',
	'yiicPath' => dirname(__FILE__) . '/../../../yii/framework/yiic.php',
	'yiitPath' => dirname(__FILE__) . '/../../../yii/framework/yiit.php',

	// Set YII_DEBUG and YII_TRACE_LEVEL flags
	'yiiDebug' => true,
	'yiiTraceLevel' => 0,

	// Static function Yii::setPathOfAlias()
	'yiiSetPathOfAlias' => array(
		// uncomment the following to define a path alias
		//'local' => 'path/to/local-folder'
	),

	// This is the main Web application configuration. Any writable
	// CWebApplication properties can be configured here.
	'configWeb' => array(

		'basePath' => dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
		'homeUrl'=>'/TrackStarApplication/project',
		'name' => 'TrackStar Application',

		// Preloading 'log' component
		'preload' => array('log'),

		// Autoloading model and component classes
		'import' => array(
			'application.models.*',
			'application.components.*',
		),
		
        'modules'=>array(
	        // uncomment the following to enable the Gii tool
	        /*
	        'gii'=>array(
		        'class'=>'system.gii.GiiModule',
		        'password'=>'Enter Your Password Here',
		        // If removed, Gii defaults to localhost only. Edit carefully to taste.
		        'ipFilters'=>array('127.0.0.1','::1'),
	        ),
	        */
        ),
		
		// Application components
		'components' => array(
		
			'user' => array(
				// enable cookie-based authentication
				'allowAutoLogin' => true,
			),
			
            'authManager'=>array(
                'class'=>'CDbAuthManager',
                'connectionID'=>'db',
            ),
            
            'urlManager'=>array(
                'urlFormat'=>'path',
                'showScriptName'=>false,
                'rules'=>array(
                    'issues' => 'issue/index',
                    'issue/<id:\d+>/*' => 'issue/view',
                    'commentfeed'=>array('comment/feed', 'urlSuffix'=>'.xml', 'caseSensitive'=>false),
                    '<pid:\d+>/commentfeed'=>array('comment/feed', 'urlSuffix'=>'.xml', 'caseSensitive'=>false),
                ),
            ),
			
			// uncomment the following to enable URLs in path-format
			/*
			'urlManager'=>array(
				'urlFormat'=>'path',
				'rules'=>array(
					'<controller:\w+>/<id:\d+>'=>'<controller>/view',
					'<controller:\w+>/<action:\w+>/<id:\d+>'=>'<controller>/<action>',
					'<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
				),
			),
			*/

		    'db'=>array(
			    'connectionString' => 'sqlite:'.dirname(__FILE__).'/../data/testdrive.db',
		    ),
		    // uncomment the following to use a MySQL database
		    /*
		    'db'=>array(
			    'connectionString' => 'mysql:host=localhost;dbname=testdrive',
			    'emulatePrepare' => true,
			    'username' => 'root',
			    'password' => '',
			    'charset' => 'utf8',
		    ),
		    */

			// Error handler
			'errorHandler'=>array(
				// use 'site/error' action to display errors
				'errorAction'=>'site/error',
			),

		    'log'=>array(
			    'class'=>'CLogRouter',
			    'routes'=>array(
				    array(
					    'class'=>'CFileLogRoute',
					    'levels'=>'error, warning',
				    ),
				    // uncomment the following to show log messages on web pages
				    /*
				    array(
					    'class'=>'CWebLogRoute',
				    ),
				    */
			    ),
		    ),
		),
		
	    // application-level parameters that can be accessed
	    // using Yii::app()->params['paramName']
	    'params'=>array(
		    // this is used in contact page
		    'adminEmail'=>'webmaster@example.com',
	    ),
	),

	// This is the Console application configuration. Any writable
	// CConsoleApplication properties can be configured here.
    // Leave array empty if not used.
    // Use value 'inherit' to copy from generated configWeb.
	'configConsole' => array(

		'basePath' => dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
		'name' => 'My Console Application',

		// Preloading 'log' component
		'preload' => array('log'),

		// Autoloading model and component classes
		'import'=>'inherit',

		// Application componentshome
		'components'=>array(

			// Database
			'db'=>'inherit',

			// Application Log
			'log' => array(
				'class' => 'CLogRouter',
				'routes' => array(
					// Save log messages on file
					array(
						'class' => 'CFileLogRoute',
						'levels' => 'error, warning, trace, info',
					),
				),
			),

		),

	),

);
