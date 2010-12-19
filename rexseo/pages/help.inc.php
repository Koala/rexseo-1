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

// GET PARAMS
////////////////////////////////////////////////////////////////////////////////
$myself      = rex_request('page', 'string');
$subpage     = rex_request('subpage', 'string');
$chapter     = rex_request('chapter', 'string');
$func        = rex_request('func', 'string');

// DISABLE SETUP NOTICE
////////////////////////////////////////////////////////////////////////////////
if ($func == "alert_setup")
{
  $content = '
$REX[\'ADDON\'][\'rexseo\'][\'def_desc\']        = \''.$REX['ADDON']['rexseo']['def_desc']       .'\';
$REX[\'ADDON\'][\'rexseo\'][\'def_keys\']        = \''.$REX['ADDON']['rexseo']['def_keys']       .'\';
$REX[\'ADDON\'][\'rexseo\'][\'robots\']          = \''.$REX['ADDON']['rexseo']['robots']         .'\';
$REX[\'ADDON\'][\'rexseo\'][\'homeurl\']         = '  .$REX['ADDON']['rexseo']['homeurl']        .';
$REX[\'ADDON\'][\'rexseo\'][\'homelang\']        = '  .$REX['ADDON']['rexseo']['homelang']       .';
$REX[\'ADDON\'][\'rexseo\'][\'allow_articleid\'] = '  .$REX['ADDON']['rexseo']['allow_articleid'].';
$REX[\'ADDON\'][\'rexseo\'][\'levenshtein\']     = '  .$REX['ADDON']['rexseo']['levenshtein']    .';
$REX[\'ADDON\'][\'rexseo\'][\'301s\']            = \''.$REX['ADDON']['rexseo']['301s']           .'\';
$REX[\'ADDON\'][\'rexseo\'][\'url_schema\']      = \''.$REX['ADDON']['rexseo']['url_schema']     .'\';
$REX[\'ADDON\'][\'rexseo\'][\'url_ending\']      = \''.$REX['ADDON']['rexseo']['url_ending']     .'\';
$REX[\'ADDON\'][\'rexseo\'][\'expert_settings\'] = '  .$REX['ADDON']['rexseo']['expert_settings'].';
$REX[\'ADDON\'][\'rexseo\'][\'alert_setup\']     = 0;
$REX[\'ADDON\'][\'rexseo\'][\'first_run\']       = '  .$REX['ADDON']['rexseo']['first_run']      .';
$REX[\'ADDON\'][\'rexseo\'][\'rewrite_params\']  = '  .$REX['ADDON']['rexseo']['rewrite_params'] .';
$REX[\'ADDON\'][\'rexseo\'][\'params_starter\']  = \''.$REX['ADDON']['rexseo']['params_starter'] .'\';
';

  $file = $REX['INCLUDE_PATH'].'/addons/rexseo/config.inc.php';
  rex_replace_dynamic_contents($file, $content);
}


// CHAPTER DEFS ('CHAPTER GET PARAM' => array('TITLE','SOURCE','PARSEMODE'))
////////////////////////////////////////////////////////////////////////////////
$chapterpages = array (
''            => array('Quickstart',                   'pages/help_quickstart.txt','textile'),
'settings'    => array('Einstellungen',                'pages/help_settings.txt','textile'),
'troubleshoot'=> array('Problemf&auml;lle & Sonstiges','pages/help_troubleshoot.txt','textile'),
'download'    => array('Downloads'                    ,'pages/redmine_feeds.inc.php','php'),
'changelog'   => array('Changelog'                    ,'pages/redmine_feeds.inc.php','php'),
'tickets'     => array('Tickets'                      ,'pages/redmine_feeds.inc.php','php'),
'forum'       => array('Forum'                        ,'http://gn2-code.de/projects/rexseo/boards','jsopenwin'),
'wiki'        => array('Wiki'                         ,'http://gn2-code.de/projects/rexseo/wiki','jsopenwin')
);

// BUILD CHAPTER NAVIGATION
////////////////////////////////////////////////////////////////////////////////
$chapternav = '';
foreach ($chapterpages as $chapterparam => $chapterprops)
{
  if ($chapter != $chapterparam) {
    $chapternav .= ' | <a href="?page='.$myself.'&subpage=help&chapter='.$chapterparam.'" class="chapter '.$chapterparam.' '.$chapterprops[2].'">'.$chapterprops[0].'</a>';
  } else {
    $chapternav .= ' | <span class="chapter '.$chapterparam.' '.$chapterprops[2].'">'.$chapterprops[0].'</span>';
  }
}
$chapternav = ltrim($chapternav, " | ");

// BUILD CHAPTER OUTPUT
////////////////////////////////////////////////////////////////////////////////
$addonroot = $REX['INCLUDE_PATH']. '/addons/'.$myself.'/';
$source    = $chapterpages[$chapter][1];
$parse     = $chapterpages[$chapter][2];

$html = rexdev_incparse($addonroot,$source,$parse,true);


// OUTPUT
////////////////////////////////////////////////////////////////////////////////
echo '
<div class="rex-addon-output">
  <h2 class="rex-hl2" style="font-size:1em">'.$chapternav.'</h2>
  <div class="rex-addon-content">
    <div class= "rexseo">
    '.$html.'
    </div>
  </div>
</div>';

?>