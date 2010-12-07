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
$myself = 'rexseo';
$myroot = $REX['INCLUDE_PATH'].'/addons/'.$myself;

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
      // 4.3.x -> zus�zliches Feld "restrictions" (http://forum.redaxo.de/sutra80188.html#80188 -> erst ab metainfo r1871)
      //a62_add_field(   $title,                                        $name,                 $prior, $attributes, $type, $default, $params = null,                                                                       $validate = null, $restrictions = '')
        a62_add_field(   'RexSEO Einstellungen',                        'art_rexseo_legend',   100,    '',         12,     '',       '',                                                                                   '',               '');
        a62_add_field(   'Eigene URL (ohne vorangefuertem / )',         'art_rexseo_url',      101,    '',          1,     '',       '',                                                                                   '',               '');
        a62_add_field(   'Title',                                       'art_rexseo_title',    102,    '',          1,     '',       '',                                                                                   '',               '');
        a62_add_field(   'Priority (Google Sitemap)',                   'art_rexseo_priority', 103,    '',          3,     '',       ':Automatisch berechnen|1.00:1.00|0.80:0.80|0.64:0.64|0.51:0.51|0.33:0.33|0.00:0.00', '',               '');

        // INSTALL/COPY .HTACCESS FILES
        require_once $myroot.'/functions/function.rexseo_recursive_copy.inc.php';
        $source = $REX['INCLUDE_PATH'].'/addons/'.$myself.'/install/files/';
        $target = $REX['HTDOCS_PATH'];
        $result = rexseo_recursive_copy($source, $target);

        $REX['ADDON']['install'][$myself] = 1;
      }
    }
  }
}
