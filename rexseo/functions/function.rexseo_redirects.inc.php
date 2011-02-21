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


function rexseo_redirects()
{
  global $REX;

  // USER DEFINIERTE WEITERLEITUNGEN
  //////////////////////////////////////////////////////////////////////////////
  if (isset($REX['ADDON']['rexseo']['301s']) && count($REX['ADDON']['rexseo']['301s'])>0)
  {
    $script_path = str_replace(' ', '%20', dirname($_SERVER['PHP_SELF']));
    $script_path = str_replace(DIRECTORY_SEPARATOR, '/', $script_path);
    $length = strlen($script_path);
    $path = substr($_SERVER['REQUEST_URI'], $length);

    $redirects = $REX['ADDON']['rexseo']['301s'];
    if(isset($redirects[$path]))
    {
      $art = $redirects[$path];
      $url = rex_getUrl($art['article_id'],$art['article_id']);
      header("HTTP/1.1 301");
      header('Location:'.$url);
      die();
    }
  }

  // ARTICLE_ID WEITERLEITUNGEN
  //////////////////////////////////////////////////////////////////////////////
  if(!$REX['REDAXO'])
  {
    if(isset($_GET['article_id']) && is_numeric($_GET['article_id']))
    {
      if ($REX['ADDON']['rexseo']['allow_articleid'] == 1)
      {
        $art_id = rex_request('article_id','int');
        $clang = rex_request('clang','int');

        $url = rex_getUrl($art_id,$clang);
        header("HTTP/1.1 301");
        header('Location:'.$url);
        die();
      }
      elseif ($REX['ADDON']['rexseo']['allow_articleid'] == 0)
      {
        $url = rex_getUrl($REX['NOTFOUND_ARTICLE_ID']);
        header("HTTP/1.1 301");
        header('Location:'.$url);
        die();
      }
    }
  }

}
?>