<?php
/**
 * REXseo
 * Based on the URL-Rewrite Addon
 * @author dh[at]gn2-netwerk[dot]de Dave Holloway
 * @author markus.staab[at]redaxo[dot]de Markus Staab
 * @author code[at]rexdev[dot]de jeandeluxe
 * @package redaxo4.2
 * @version 1.3
 * @version svn:$Id$
 */ 

// ADDON PARAMS
////////////////////////////////////////////////////////////////////////////////
$myself = 'rexseo';
$myroot = $REX['INCLUDE_PATH'].'/addons/'.$myself;

$Revision = '';
$REX['ADDON'][$myself]['VERSION'] = array
(
'VERSION'      => 1,
'MINORVERSION' => 3,
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
$REX['PROTOCOL'] = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off' ? 'https://' : 'http://';

// USER SETTINGS
////////////////////////////////////////////////////////////////////////////////
// --- DYN
$REX["ADDON"]["rexseo"]["settings"] = array (
  'rexseo_version' => $REX['ADDON']['version'][$myself],
  'first_run' => 1,
  'alert_setup' => 1,
  'install_subdir' => '',
  'url_whitespace_replace' => '-',
  'compress_pathlist' => 1,
  'def_desc' => 
  array (
    0 => '',
    1 => '',
    2 => '',
    3 => '',
    4 => '',
    5 => '',
    6 => '',
    7 => '',
    8 => '',
  ),
  'def_keys' => 
  array (
    0 => '',
    1 => '',
    2 => '',
    3 => '',
    4 => '',
    5 => '',
    6 => '',
    7 => '',
    8 => '',
  ),
  'title_schema' => '%B - %S',
  'url_schema' => 'rexseo',
  'url_ending' => '.html',
  'hide_langslug' => -1,
  'rewrite_params' => 0,
  'params_starter' => '++',
  'homeurl' => 1,
  'homelang' => 0,
  'urlencode' => 0,
  'allow_articleid' => 0,
  'levenshtein' => 0,
  '301s' => array (),
  'robots' => 'User-agent: *
Disallow:',
  'expert_settings' => 0,
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


// MAIN
////////////////////////////////////////////////////////////////////////////////
require_once $REX['INCLUDE_PATH'].'/addons/rexseo/classes/class.rexseo.inc.php';

if ($REX['MOD_REWRITE'] !== false)
{
  $levenshtein    = (bool) $REX['ADDON'][$myself]['settings']['levenshtein'];
  $rewrite_params = (bool) $REX['ADDON'][$myself]['settings']['rewrite_params'];

  require_once $myroot.'/classes/class.rexseo_rewrite.inc.php';

  $rewriter = new RexseoRewrite($levenshtein,$rewrite_params);
  $rewriter->resolve();

  rex_register_extension('URL_REWRITE', array ($rewriter, 'rewrite'));

  // FIX TEXTILE/TINY LINKS @ REX < 4.3
  if(intval($REX['VERSION']) == 4 && intval($REX['SUBVERSION']) < 3)
  {
    rex_register_extension('GENERATE_FILTER', 'rexseo_fix_42x_links');
  }

  // INJECT 301 URLS INTO REXSEO PATHLIST
  rex_register_extension('REXSEO_PATHLIST_CREATED','rexseo_inject_301');
  function rexseo_inject_301($params)
  {
    global $REX;
    $redirects = $REX['ADDON']['rexseo']['settings']['301s'];

    if(count($redirects)>0)
    {
      foreach($redirects as $url => $v)
      {
        if(!isset($params['subject']['REXSEO_URLS'][$url]))
        {
          $params['subject']['REXSEO_URLS'][$url] = array('id'    =>$v['article_id'],
                                                          'clang' =>$v['clang'],
                                                          'status'=>301);
        }
      }
    }

    return $params['subject'];
  }
}

include $REX['INCLUDE_PATH'].'/addons/'.$myself.'/controller.inc.php';

?>