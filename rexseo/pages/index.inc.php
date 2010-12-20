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

// GET PARAMS, IDENTIFIER, ROOT DIR
////////////////////////////////////////////////////////////////////////////////
$myself        = rex_request('page', 'string');
$subpage       = rex_request('subpage', 'string');
$chapter       = rex_request('chapter', 'string');
$func          = rex_request('func', 'string');
$section_id    = rex_request('section_id', 'string');
$section_class = rex_request('section_class', 'string');
$highlight     = rex_request('highlight', 'string');
$myroot        = $REX['INCLUDE_PATH'].'/addons/'.$myself;

// BACKEND CSS
////////////////////////////////////////////////////////////////////////////////
$header = array(
'<link rel="stylesheet" type="text/css" href="index.php?rexseo_func=backend.css" media="screen, projection, print" />',
'<script type="text/javascript" src="index.php?rexseo_func=jquery.highlight-3.yui.js"></script>',
'<script type="text/javascript" src="index.php?rexseo_func=jquery.autogrow-textarea.js"></script>'
);

if ($REX['REDAXO']) {
  include_once $myroot.'/functions/function.rexdev_header_add.inc.php';
  rex_register_extension('PAGE_HEADER', 'rexdev_header_add',$header);
}

// INCLUDE CLASSES
////////////////////////////////////////////////////////////////////////////////
if(!class_exists('simplepie'))
{
  require_once $myroot.'/classes/class.simplepie.inc.php';
}

// INCLUDE FUNCTIONS
////////////////////////////////////////////////////////////////////////////////
require_once $myroot.'/functions/function.rexdev_incparse.inc.php';
require_once $myroot.'/functions/function.rexseo_recursive_copy.inc.php';
require_once $myroot.'/functions/function.a750_redmine_project_feed.inc.php';

// REX TOP
////////////////////////////////////////////////////////////////////////////////
require $REX['INCLUDE_PATH'] . '/layout/top.php';

// REX TITLE/NAVI
////////////////////////////////////////////////////////////////////////////////
rex_title('RexSEO <span class="addonversion">'.$REX['ADDON']['version'][$myself].'</span>', $REX['ADDON'][$myself]['SUBPAGES']);

// FIRST RUN HINWEISE
////////////////////////////////////////////////////////////////////////////////
if($REX['ADDON']['rexseo']['alert_setup'] == true && ( $subpage == 'settings' || !$subpage ))
{
  echo rex_warning('HINWEIS: Das Addon ist noch nicht einsatzbereit!<br /> Es m&uuml;ssen noch Anpassungen vorgenommen werden die im Kapitel <a href="index.php?page=rexseo&subpage=help&chapter=&func=alert_setup&highlight=Quickstart">Quickstart</a> der Hilfe beschrieben sind');

  // REDAXO INSTALL ORDNER ERMITTELN
  $path_diff = $REX['REDAXO'] ? array('index.php','redaxo'):array('index.php');
  $install_subdir = array_diff_assoc(array_reverse(explode(DIRECTORY_SEPARATOR,trim($_SERVER['SCRIPT_NAME'],DIRECTORY_SEPARATOR))),$path_diff);
  $REX['INSTALL_SUBDIR'] = count($install_subdir)>0 ? implode('/',array_reverse($install_subdir)).'/' :'';

  if($REX['INSTALL_SUBDIR']!='')
  {
    echo rex_warning('HINWEIS: Redaxo scheint in einem Unterordner installiert zu sein (./'.$REX['INSTALL_SUBDIR'].') - dieser muß in der .htaccess entsprechend <a href="index.php?page=rexseo&subpage=help&chapter=&func=alert_setup&highlight='.urlencode('Installation in Unterverzeichnissen:').'">eingetragen</a> werden!');
  }
}

// SET DEFAULT PAGE / INCLUDE SUBPAGE
////////////////////////////////////////////////////////////////////////////////
if(!$subpage)
{
  $subpage = 'settings';
}
require $REX['INCLUDE_PATH'] . '/addons/'.$myself.'/pages/'.$subpage.'.inc.php';

// JS SCRIPT FÜR LINKS IN NEUEN FENSTERN (per <a class="blank">)
////////////////////////////////////////////////////////////////////////////////
echo '
<script type="text/javascript">
// onload
window.onload = externalLinks;

// http://www.sitepoint.com/article/standards-compliant-world
function externalLinks()
{
 if (!document.getElementsByTagName) return;
 var anchors = document.getElementsByTagName("a");
 for (var i=0; i<anchors.length; i++)
 {
   var anchor = anchors[i];
   if (anchor.getAttribute("href"))
   {
     if (anchor.getAttribute("class") == "blank")
     {
     anchor.target = "_blank";
     }
   }
 }
}
</script>
';

// JQUERY HIGHLIGHT SCRIPT
////////////////////////////////////////////////////////////////////////////////
if($highlight)
{
  if($section_id)
  {
    $section = '#'.$section_id;
  }
  elseif($section_class)
  {
    $section = '.'.$section_class;
  }
  else
  {
    $section = '.rexseo';
  }

  echo '
  <script type="text/javascript">
  <!--
  (function($) {

  // http://johannburkard.de/blog/programming/javascript/highlight-javascript-text-higlighting-jquery-plugin.html
  $(document).ready(function() {
      $("'.$section.'").highlight("'.$highlight.'");
  });

  })(jQuery);
  //-->
  </script>
  ';
}

// REX BOTTOM
////////////////////////////////////////////////////////////////////////////////#highlight-plugin
require $REX['INCLUDE_PATH'] . '/layout/bottom.php';
