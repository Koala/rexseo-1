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

// ADDON IDENTIFIER & ROOT DIR
////////////////////////////////////////////////////////////////////////////////
$myself = 'rexseo';
$myroot = $REX['INCLUDE_PATH'].'/addons/'.$myself.'/';

// LOCAL INCLUDES
////////////////////////////////////////////////////////////////////////////////
require_once $myroot.'/functions/function.rexdev_incparse.inc.php';

// HELP CONTENT
////////////////////////////////////////////////////////////////////////////////
$help_includes = array (
''            => array('Quickstart',                   'pages/help_quickstart.txt','textile'),
'settings'    => array('Einstellungen',                'pages/help_settings.txt','textile'),
'troubleshoot'=> array('Problemf&auml;lle & Sonstiges','pages/help_troubleshoot.txt','textile')
);



// OUTPUT
////////////////////////////////////////////////////////////////////////////////
foreach($help_includes as $key => $def)
{
  echo '
  <div class="rex-addon-output" style="overflow:auto">
    <h2 class="rex-hl2" style="font-size:1em">'.$def[0].' <span style="color: gray; font-style: normal; font-weight: normal;">( '.$def[1].' )</span></h2>
    <div class="rex-addon-content">
      <div class="rexseo">
        '.rexdev_incparse($myroot,$def[1],$def[2],true).'
      </div>
    </div>
  </div>';
}
