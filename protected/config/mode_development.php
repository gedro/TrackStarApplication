<?php

/**
 * Development configuration
 * Usage:
 * - Local website
 * - Local DB
 * - Show all details on each error
 * - Gii module enabled
 */

return array(
	// Set YII_DEBUG and YII_TRACE_LEVEL flags
	'yiiDebug' => true,
	'yiiTraceLevel' => 3,

	// This is the specific Web application configuration for this mode.
	// Supplied config elements will be merged into the main config array.
	'configWeb' => array(

		// Modules
		'modules' => array(
			'gii' => array(
				'class' => 'system.gii.GiiModule',
				'password' => false,
			),
		),

		// Application components
		'components' => array(
			// Database
			'db' => array(
				'connectionString' => 'mysql:host=127.0.0.1;dbname=trackstar_dev',
				'enableParamLogging' => true,
			),

			// Application Log
			'log' => array(
				'class' => 'CLogRouter',
				'routes' => array(
					// Save log messages on file
					array(
						'class' => 'CFileLogRoute',
						'levels' => 'error, warning, trace, info',
					),
					// Show log messages on web pages
					array(
						'class' => 'CWebLogRoute',
						//'categories' => 'system.db.CDbCommand', //queries
						'levels' => 'error, warning, trace, info',
						//'showInFireBug' => true,
					),
				),
			),

		),

	),
	
	// This is the Console application configuration. Any writable
	// CConsoleApplication properties can be configured here.
    // Leave array empty if not used.
    // Use value 'inherit' to copy from generated configWeb.
	'configConsole' => array(
	),

);
