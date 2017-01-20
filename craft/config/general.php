<?php

/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here.
 * You can see a list of the default settings in craft/app/etc/config/defaults/general.php
 */

return array(
  '*' => array(
	       'extraAllowedFileExtensions' => 'eps',
         'siteUrl' => 'PRODUCTION URL',
         'enableCsrfProtection' => true,
         'omitScriptNameInUrls' => true,
         'cpTrigger' => 'admin',
         'environmentVariables' => array(
           'basePath' => '',
           'baseUrl'  => 'PRODUCTION URL',
        )
	),
	'test.web' => array(
	    'devMode' => true,
      'siteUrl' => 'DEV URL',
      'environmentVariables' => array(
        'basePath' => '',
        'baseUrl'  => 'DEV URL',
      )
	)
);
