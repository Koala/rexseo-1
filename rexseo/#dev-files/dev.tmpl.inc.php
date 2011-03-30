<?php

/**
 * REXseo Testsuite VAR Viewer Template
 * @package redaxo4.2
 * @version 1.2
 * @version svn:$Id$
 */

/**
 * REXseo
 * Based on the URL-Rewrite Addon
 * @author dh[at]gn2-netwerk[dot]de Dave Holloway
 * @author markus.staab[at]redaxo[dot]de Markus Staab
 * @author code[at]rexdev[dot]de jeandeluxe
 * @package redaxo4.2
 * @version 1.3
 */ 

global $REX;
global $REXPATH;

$ooa = OOArticle::getArticleById($REX['ARTICLE_ID'],$REX['CUR_CLANG']);

// CSS / JS
////////////////////////////////////////////////////////////////////////////////
echo '<script src="redaxo/media/standard.js" type="text/javascript"></script>';

echo '<style type="text/css">';
include_once 'dev.css';
echo '</style>';


// BLOCK TOP
////////////////////////////////////////////////////////////////////////////////
$langswitch = $sep = '';
foreach($REX["CLANG"] as $cid => $cname)
{
  if($cid == $REX['CUR_CLANG'])
  {
    $langswitch .= $sep.'[<em>'.$cid.'</em>] ('.$cname.')';
  }
  else
  {
    $langswitch .= $sep.'<a href="'.rex_getUrl($REX['ARTICLE_ID'],$cid).'">['.$cid.'] ('.$cname.')</a>';
  }
  $sep = ' - ';
}

echo '
<div class="dev-block">
<h1 class="artikel">ARTICLE: [<em>'.$REX['ARTICLE_ID'].'</em>] CLANG: '.$langswitch.'</h1>
';


// METADATEN
////////////////////////////////////////////////////////////////////////////////
echo '
<div class="get">
<h2><a onclick="toggleElement(\'meta\');">RexSEO META</a></h2>
<ul id="meta" style="">
<li><b>RexSEO::title():</b> <em>'.RexSEO::title().'</em></li>
<li><b>art_rexseo_title:</b> <em>'.$ooa->getValue('art_rexseo_title').'</em></li>
<li><b>name:</b> <em>'.$ooa->getValue('name').'</em></li>
<li><b>RexSEO::keywords():</b> <em>'.RexSEO::keywords().'</em></li>
<li><b>art_keywords:</b> <em>'.$ooa->getValue('art_keywords').'</em></li>
<li><b>RexSEO::description():</b> <em>'.RexSEO::description().'</em></li>
<li><b>art_description:</b> <em>'.$ooa->getValue('art_description').'</em></li>
<li><b>RexSEO::canonical():</b> <em>'.RexSEO::canonical().'</em></li>
<li><b>art_rexseo_canonicalurl:</b> <em>'.$ooa->getValue('art_rexseo_canonicalurl').'</em></li>
</ul>
</div>
';


// $_SERVER
////////////////////////////////////////////////////////////////////////////////
$tmp = var_export($_SERVER, true);
echo '
<div class="server">
<h2><a onclick="toggleElement(\'server\');">$_SERVER</a></h2>
<pre id="server" style="display:none;">
'.$tmp.'
</pre>
</div>
';


// $_REQUEST
////////////////////////////////////////////////////////////////////////////////
$tmp = var_export($_REQUEST, true);
echo '
<div class="request">
<h2><a onclick="toggleElement(\'request\');">$_REQUEST</a></h2>
<pre id="request" style="display:none;">
'.$tmp.'
</pre>
</div>
';



// $_POST
////////////////////////////////////////////////////////////////////////////////
if($_POST)
{
  $tmp = var_export($_POST, true);
  echo '
  <div class="psot">
  <h2><a onclick="toggleElement(\'post\');">$_POST</a></h2>
  <pre id="post">
  '.$tmp.'
  </pre>
  </div>
  ';
}

// $_GET
////////////////////////////////////////////////////////////////////////////////
if($_GET)
{
  $tmp = var_export($_GET, true);
  echo '
  <div class="get">
  <h2><a onclick="toggleElement(\'get\');">$_GET</a></h2>
  <pre id="get">
  '.$tmp.'
  </pre>
  </div>
  ';
}

// $REXPATH
////////////////////////////////////////////////////////////////////////////////
if($REXPATH)
{
  $tmp = var_export($REXPATH, true);
  echo '
  <div class="get">
  <h2><a onclick="toggleElement(\'rexpath\');">$REXPATH</a></h2>
  <pre id="rexpath" style="display:none;">
  '.$tmp.'
  </pre>
  </div>
  ';
}

// $REX
////////////////////////////////////////////////////////////////////////////////
if($REX)
{
  $tmp = var_export($REX, true);
  echo '
  <div class="get">
  <h2><a onclick="toggleElement(\'rex\');">$REX</a></h2>
  <pre id="rex" style="display:none;">
  '.$tmp.'
  </pre>
  </div>
  ';
}

// BLOCK BOTTOM
////////////////////////////////////////////////////////////////////////////////
echo '
</div>
';
?>
