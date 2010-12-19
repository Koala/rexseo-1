<?php

/**
 * REXseo
 * Based on the URL-Rewrite Addon
 * @author dh[at]gn2-netwerk[dot]de Dave Holloway
 * @author markus.staab[at]redaxo[dot]de Markus Staab
 * @author code[at]rexdev[dot]de jeandeluxe
 * @package redaxo4.2
 * @version 1.2
 * @version svn:$Id$
 */

if (rex_request('rexseo_func')!="") {
	$path = $REX['INCLUDE_PATH'].'/addons/'.$myself;

	switch (rex_request('rexseo_func')) {
		case "googlesitemap":
			include $path.'/extensions/googlesitemap.inc.php';
			die();
		break;

		case "robots":
			include $path.'/extensions/robots.inc.php';
			die();
		break;

		case "backend.css":
			header('Content-Type:text/css');
			echo file_get_contents($path.'/files/backend.css');
			die();
		break;

		case "jsopenwin.gif":
			header('Content-Type:image/gif');
			echo file_get_contents($path.'/files/jsopenwin.gif');
			die();
		break;

		case "jquery.highlight-3.yui.js":
			header('Content-Type:text/javascript');
			echo file_get_contents($path.'/files/jquery.highlight-3.yui.js');
			die();
		break;

		case "jquery.autogrow-textarea.js":
			header('Content-Type:text/javascript');
			echo file_get_contents($path.'/files/jquery.autogrow-textarea.js');
			die();
		break;

		default:
		break;
	}
}
