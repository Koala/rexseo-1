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

// ADDON PARAMS
////////////////////////////////////////////////////////////////////////////////
$myself = 'rexseo';
$myroot = $REX['INCLUDE_PATH'].'/addons/'.$myself;

$Revision = '';
$REX['ADDON'][$myself]['VERSION'] = array
(
'VERSION'      => 1,
'MINORVERSION' => 2,
'SUBVERSION'   => preg_replace('/[^0-9]/','',"$Revision$")
);

$REX['ADDON']['rxid'][$myself]        = '750';
$REX['ADDON']['name'][$myself]        = 'RexSEO';
$REX['ADDON']['version'][$myself]     = implode('.', $REX['ADDON'][$myself]['VERSION']);
$REX['ADDON']['author'][$myself]      = 'Markus Staab, Wolfgang Huttegger, Dave Holloway, Jan Kristinus, jeandeluxe';
$REX['ADDON']['supportpage'][$myself] = 'forum.redaxo.de';
$REX['ADDON']['perm'][$myself]        = $myself.'[]';
$REX['PERM'][]                        = $myself.'[]';
$REX['ADDON'][$myself]['SUBPAGES']    = array (
  array ('',    'Einstellungen'),
  array ('help','Hilfe')
  );
$REX['ADDON'][$myself]['redmine_url'] = 'http://www.gn2-code.de/projects/rexseo';
$REX['ADDON'][$myself]['redmine_key'] = '2437c4f8172c5c6e0020a236b576d5128029451b';


// USER SETTINGS
////////////////////////////////////////////////////////////////////////////////
// --- DYN
$REX["ADDON"]["rexseo"]["settings"] = array (
  'rexseo_version' => '1.2.153',
  'first_run' => 0,
  'alert_setup' => 0,
  'install_subdir' => '',
  'url_whitespace_replace' => '-',
  'def_desc' => 
  array (
    0 => '',
    1 => '',
  ),
  'def_keys' => 
  array (
    0 => '',
    1 => '',
  ),
  'url_schema' => 'rexseo',
  'url_ending' => '.html',
  'homeurl' => 1,
  'homelang' => 0,
  'allow_articleid' => 0,
  'levenshtein' => 0,
  '301s' => 
  array (
  ),
  'title_schema' => '%B - %S',
  'rewrite_params' => 1,
  'params_starter' => '++',
  'robots' => 'User-agent: *
Disallow:',
  'expert_settings' => 1,
);
// --- /DYN


// FUNCTIONS
////////////////////////////////////////////////////////////////////////////////
function rexseo_fix_42x_links($params)
{
  global $REX;

  $subdir = $REX['ADDON']['rexseo']['settings']['install_subdir'];
  if($subdir=='')
  {
    $relpath     = '/redaxo/';
    $replacement = '/';
  }
  else
  {
    $relpath     = '/'.$subdir.'redaxo/';
    $replacement = '/'.$subdir;
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
require_once $REX['INCLUDE_PATH'].'/addons/rexseo/classes/class.rexseo.inc.php';

if ($REX['ADDON'][$myself]['settings']['enable_multidomain']==1)
{ 
  include $REX['INCLUDE_PATH'].'/addons/'.$myself.'/multidomain.inc.php';
  rexseo::startMultidomain();
}



if ($REX['MOD_REWRITE'] !== false)
{
  $levenshtein    = (bool) $REX['ADDON'][$myself]['settings']['levenshtein'];
  $rewrite_params = (bool) $REX['ADDON'][$myself]['settings']['rewrite_params'];

  require_once $myroot.'/classes/class.urlrewriter.inc.php';
  require_once $myroot.'/classes/class.rewrite_fullnames.inc.php';

  $rewriter = new myUrlRewriter($levenshtein,$rewrite_params);
  $rewriter->prepare();

  rex_register_extension('URL_REWRITE', array ($rewriter, 'rewrite'));

  if(count($REX['ADDON'][$myself]['settings']['301s'])>0)
  {
    require_once $myroot.'/functions/function.rexseo_redirects.inc.php';
    rex_register_extension('ADDONS_INCLUDED', 'rexseo_redirects');
  }

  if($REX['ADDON'][$myself]['settings']['allow_articleid']==1 && isset($_GET['article_id']))
  {
    require_once $myroot.'/functions/function.rexseo_redirects.inc.php';
    rex_register_extension('ADDONS_INCLUDED', 'rexseo_resolve_article_id_urls');
  }

  rex_register_extension('ART_TO_STARTPAGE', 'rexseo_clear_cache');

  // FIX TEXTILE/TINY LINKS @ REX < 4.3
  if(intval($REX['VERSION']) == 4 && intval($REX['SUBVERSION']) < 3)
  {
    rex_register_extension('GENERATE_FILTER', 'rexseo_fix_42x_links');
  }
}

include $REX['INCLUDE_PATH'].'/addons/'.$myself.'/controller.inc.php';

?>