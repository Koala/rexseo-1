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



// USER DEFINED 301 REDIRECTS
//////////////////////////////////////////////////////////////////////////////
function rexseo_redirects()
{
  global $REX;

  $script_path = str_replace(' ', '%20', dirname($_SERVER['PHP_SELF']));
  $script_path = str_replace(DIRECTORY_SEPARATOR, '/', $script_path);
  $length = strlen($script_path);
  $path = substr($_SERVER['REQUEST_URI'], $length);

  $redirects = $REX['ADDON']['rexseo']['settings']['301s'];
  if(isset($redirects[$path]))
  {
    $art = $redirects[$path];
    $url = rex_getUrl($art['article_id'],$art['clang']);
    header("HTTP/1.1 301");
    header('Location:'.$url);
    die();
  }
}


// REDIRECT ARTICLE_ID URLS
//////////////////////////////////////////////////////////////////////////////
function rexseo_resolve_article_id_urls()
{
  global $REX;

  if(!$REX['REDAXO'])
  {
    $art_id = rex_request('article_id','int');
    $clang = rex_request('clang','int');

    $url = rex_getUrl($art_id,$clang);
    header("HTTP/1.1 301");
    header('Location:'.$url);
    die();
  }
}
?>