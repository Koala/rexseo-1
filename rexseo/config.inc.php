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

// ERROR_REPORTING
////////////////////////////////////////////////////////////////////////////////
/*ini_set('error_reporting', E_ALL);
ini_set('display_errors', 1);*/

// ADDON IDENTIFIER
////////////////////////////////////////////////////////////////////////////////
$myself = 'rexseo';

// ADDON VERSION
////////////////////////////////////////////////////////////////////////////////
$Revision = '';
$REX['ADDON'][$myself]['VERSION'] = array
(
  'VERSION'   => 'r'.preg_replace('/[^0-9]/','',"$Revision$")
);

// ADDON REX COMMONS
////////////////////////////////////////////////////////////////////////////////
$REX['ADDON']['rxid'][$myself]        = '750';
$REX['ADDON']['name'][$myself]        = 'RexSEO';
$REX['ADDON']['version'][$myself]     = implode('.', $REX['ADDON'][$myself]['VERSION']);
$REX['ADDON']['author'][$myself]      = 'Markus Staab, Wolfgang Huttegger, Dave Holloway, Jan Kristinus, jeandeluxe';
$REX['ADDON']['supportpage'][$myself] = 'forum.redaxo.de';
$REX['ADDON']['perm'][$myself]        = $myself.'[]';
$REX['PERM'][]                        = $myself.'[]';

// USER SETTINGS
////////////////////////////////////////////////////////////////////////////////
// --- DYN
$REX['ADDON']['rexseo']['def_desc']        = array (
  0 => '',
  1 => '',
);
$REX['ADDON']['rexseo']['def_keys']        = array (
  0 => '',
  1 => '',
);
$REX['ADDON']['rexseo']['robots']          = 'User-agent: *
Disallow:';
$REX['ADDON']['rexseo']['homeurl']         = 1;
$REX['ADDON']['rexseo']['homelang']        = 0;
$REX['ADDON']['rexseo']['allow_articleid'] = 2;
$REX['ADDON']['rexseo']['levenshtein']     = 0;
$REX['ADDON']['rexseo']['301s']            = '';
$REX['ADDON']['rexseo']['url_schema']      = 'rexseo';
$REX['ADDON']['rexseo']['url_ending']      = '.html';
$REX['ADDON']['rexseo']['expert_settings'] = 1;
$REX['ADDON']['rexseo']['alert_setup']     = 0;
$REX['ADDON']['rexseo']['first_run']       = 0;
$REX['ADDON']['rexseo']['rewrite_params']  = 1;
$REX['ADDON']['rexseo']['params_starter']  = '++';
$REX['ADDON']['rexseo']['title_schema']    = '%B - %S';
// --- /DYN

// STATIC/HIDDEN SETTINGS
////////////////////////////////////////////////////////////////////////////////
$REX['ADDON'][$myself]['whitespace_replace']  = '-';
$REX['ADDON'][$myself]['svn_version_notify']  = 0;
$REX['ADDON'][$myself]['no_breadcrumb_title'] = 0;

// SUBPAGE NAVIGATION
////////////////////////////////////////////////////////////////////////////////
$REX['ADDON'][$myself]['SUBPAGES'] = array (
  array ('',    'Einstellungen'),
  array ('help','Hilfe')
  );

// FUNCTIONS
////////////////////////////////////////////////////////////////////////////////
function urlrewriter_delete_pathlist($params)
{
  global $REX;
  @unlink($REX['INCLUDE_PATH'].'/generated/files/pathlist.php');
}

function rexseo_fix_42x_links($params)
{
  global $REX;

  $relpath = trim(substr($_SERVER['SCRIPT_NAME'], 0, strrpos($_SERVER['SCRIPT_NAME'], '/') + 1), '/');

  // http://www.php.net/manual/de/function.strrpos.php#80008
  if((false === strpos($relpath, '/')) OR (false === $pos = strlen($relpath) - strpos(strrev($relpath), strrev('/redaxo')) - strlen('/redaxo')))
  {
    $relpath = '/redaxo/';
    $replacement = '/';
  }
  else
  {
    $replacement = '/'.substr($relpath, 0, $pos).'/';
    $relpath = '/'.$relpath.'/';
  }

  // textile, tiny
  return str_replace(
    array('&quot;:'.$relpath, '"'.$relpath),
    array('&quot;:'.$replacement, '"'.$replacement),
    $params['subject']
  );
}

function rexseo_clear_cache()
{
  global $REX;
  rex_deleteDir($REX['INCLUDE_PATH'].'/generated', FALSE);
}

// MAIN
////////////////////////////////////////////////////////////////////////////////
require_once $REX['INCLUDE_PATH'].'/addons/rexseo/classes/class.rexseo_select.inc.php';
require_once $REX['INCLUDE_PATH'].'/addons/rexseo/classes/class.rexseo.inc.php';

if ($REX['MOD_REWRITE'] !== false)
{
  $levenshtein    = (bool) $REX['ADDON'][$myself]['levenshtein'];
  $rewrite_params = (bool) $REX['ADDON'][$myself]['rewrite_params'];
  $UrlRewriteBasedir = dirname(__FILE__);

  require_once $UrlRewriteBasedir.'/classes/class.urlrewriter.inc.php';
  require_once $UrlRewriteBasedir.'/classes/class.rewrite_fullnames.inc.php';
  require_once $UrlRewriteBasedir.'/functions/function.rexseo_redirects.inc.php';

  $rewriter = new myUrlRewriter($levenshtein,$rewrite_params);
  $rewriter->prepare();

  rex_register_extension('URL_REWRITE', array ($rewriter, 'rewrite'));
  rex_register_extension('ADDONS_INCLUDED', 'rexseo_redirects');
  rex_register_extension('ART_TO_STARTPAGE', 'rexseo_clear_cache');

  // FIX TEXTILE/TINY LINKS @ REX < 4.3
  if(intval($REX['VERSION']) == 4 && intval($REX['SUBVERSION']) < 3)
  {
    rex_register_extension('GENERATE_FILTER', 'rexseo_fix_42x_links');
  }
}

include $REX['INCLUDE_PATH'].'/addons/'.$myself.'/controller.inc.php';

?>