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

// ADDON IDENTIFIER
////////////////////////////////////////////////////////////////////////////////
$myself      = 'rexseo';
$myroot      = $REX['INCLUDE_PATH'].'/addons/'.$myself;

// INSTALL SETTINGS
////////////////////////////////////////////////////////////////////////////////
$htaccess    = rex_get_file_contents($REX['FRONTEND_PATH'].'/.htaccess');
$triggers    = array('x-mapp-php');
$matches     = array();
$autoinstall = true;

// CHECK OTHER CONDITIONS
////////////////////////////////////////////////////////////////////////////////
if (intval(PHP_VERSION) < 5)
{
  $REX['ADDON']['installmsg'][$myself] = 'Dieses Addon ben&ouml;tigt PHP 5!';
  $REX['ADDON']['install'][$myself] = 0;
}
else
{
  if (OOAddon::isInstalled('url_rewrite'))
  {
    $REX['ADDON']['installmsg'][$myself] = 'Bitte <a href="index.php?page=addon&addonname=url_rewrite&uninstall=1">deinstallieren</a> Sie url_rewrite. REXseo ersetzt die Funktionalit&auml;t des url_rewrite Addons.';
  }
  else
  {
    if (!OOAddon::isInstalled('metainfo'))
    {
      $REX['ADDON']['installmsg'][$myself] = 'Bitte <a href="index.php?page=addon&addonname=metainfo&install=1">installieren</a> Sie erst das metainfo Addon.';
    }
    else
    {
      if (!OOAddon::isAvailable('metainfo'))
      {
        $REX['ADDON']['installmsg'][$myself] = 'Bitte <a href="index.php?page=addon&addonname=metainfo&activate=1">aktivieren</a> Sie das metainfo Addon.';
      }
      else
      {
      // 4.3.x -> zusätzliches Feld "restrictions" (http://forum.redaxo.de/sutra80188.html#80188 -> erst ab metainfo r1871)
      //a62_add_field(   $title,                                        $name,                           $prior, $attributes, $type, $default, $params = null,                                                                       $validate = null, $restrictions = '')
        a62_add_field(   'RexSEO Einstellungen',                        'art_rexseo_legend',             100,    '',         12,     '',       '',                                                                                   '',               '');
        a62_add_field(   'Manuelle URL',                                'art_rexseo_url',                101,    '',          1,     '',       '',                                                                                   '',               '');
        a62_add_field(   'Manuelle Canonical URL',                      'art_rexseo_canonicalurl',       102,    '',          1,     '',       '',                                                                                   '',               '');
        a62_add_field(   'Page Title',                                  'art_rexseo_title',              103,    '',          1,     '',       '',                                                                                   '',               '');
        a62_add_field(   'Google Sitemap Priority',                     'art_rexseo_priority',           104,    '',          3,     '',       ':Automatisch berechnen|1.00:1.00|0.80:0.80|0.64:0.64|0.51:0.51|0.33:0.33|0.00:0.00', '',               '');

        // INSTALL/COPY .HTACCESS FILES
        ////////////////////////////////////////////////////////////////////////////////
        if ($htaccess)
        {
          foreach($triggers as $t)
          {
            if(strpos($htaccess,$t)!==false)
            {
              $autoinstall = false;
              $matches[] = $t;
            }
          }

          if($autoinstall)
          {
            require_once $myroot.'/functions/function.rexseo_helpers.inc.php';
            $source = $REX['INCLUDE_PATH'].'/addons/'.$myself.'/install/files/';
            $target = $REX['HTDOCS_PATH'];
            $result = rexseo_recursive_copy($source, $target);
          }
          else
          {
            $msg = 'RexSEO: Die original .htaccess Datei im Root Ordner enth&auml;lt potentiell kritische settings f&uuml;r den Serverbetrieb:<br>';
            foreach($matches as $m)
            {
              $msg .= '<em style="margin:4px 0 4px 10px;color:black;display:inline-block;">'.$m.'</em><br />';
            }
            $msg .= 'Die automatische Installation der .htaccess Dateien wurde deaktiviert,<br /> Details zur manuellen Installation siehe RexSEO Hilfe.';
            echo rex_warning($msg);
          }
        }

        $REX['ADDON']['install'][$myself] = 1;
      }
    }
  }
}
?>