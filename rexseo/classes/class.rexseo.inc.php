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


class rexseo {


  function title($artID=null)
  {
    global $REX;
    $artID=intval($artID);
    if (!$artID)
    {
      $artID=$REX['ARTICLE_ID'];
    }

    $curart = OOArticle::getArticleById($artID);
    $parents = $curart->getParentTree();

    if ($curart->getValue('name') != $curart->getValue('catname'))
    {
      array_push($parents, $curart);
    }

    if (empty($parents))
    {
      $parents[0]=$curart;
    }
    else
    {
      $parents = array_reverse($parents);
    }

    // BREADCRUMB TITLE
    $B = '';
    foreach ($parents as $parent)
    {
      if (OOArticle::isValid($parent))
      {
        $B .= ' - '.$parent->getValue('name');
      }
      elseif (OOCategory::isValid($parent))
      {
        $B .= ' - '.$parent->getValue('catname');
      }
    }
    $B = trim($B);
    $B = trim($B,"-");
    $B = trim($B);

    // SIMPLE TITLE
    $N = $this->getValue('name');

    // SERVERNAME
    $S = $REX['SERVERNAME']!='' ? $REX['SERVERNAME'] : $_SERVER['HTTP_HOST'] ;

    // OVERRIDE: REXSEO TITLE
    if($this->getValue('art_rexseo_title')!='')
    {
      $B = $N = $this->getValue('art_rexseo_title');
    }
    
    $title = str_replace(array('%B','%N','%S'),array($B,$N,$S),$REX['ADDON']['rexseo']['settings']['title_schema']);

    $title = rexseo::htmlentities($title);

    return $title;
  }


  function keywords($artID=null) {
    global $REX;
    $artID=intval($artID); /* ONLY INTEGERS */
    if (!$artID) { $artID=$REX['ARTICLE_ID']; }


    $x = OOArticle::getArticleById($REX['START_ARTICLE_ID']);
    $keys = self::getMetaField($artID,"art_keywords",$REX['ADDON']['rexseo']['settings']['def_keys'][$REX['CUR_CLANG']]);


    $keys = str_replace("\r\n",' ',$keys);
    $keys = str_replace("\n",' ',$keys);
    $keys = str_replace("\r",' ',$keys);

    $keys = explode(',',$keys);
    $str = '';
    foreach ($keys as $key) {
      $key = trim($key);
      if ($key!="") {
        $str .= $key.',';
      }
    }
    $str = trim($str,',');
    $str = rexseo::htmlentities($str);
    return $str;
  }


  function description($artID=null) {
    global $REX;
    $artID=intval($artID); /* ONLY INTEGERS */
    if (!$artID) { $artID=$REX['ARTICLE_ID']; }


    $x = OOArticle::getArticleById($REX['START_ARTICLE_ID']);
    $desc = self::getMetaField($artID,"art_description",$REX['ADDON']['rexseo']['settings']['def_desc'][$REX['CUR_CLANG']]);


    $desc = str_replace("\r\n",' ',$desc);
    $desc = str_replace("\n",' ',$desc);
    $desc = str_replace("\r",' ',$desc);

    $str = trim($desc);
    $str = rexseo::htmlentities($str);

    return $str;
  }


  function canonical($artID=null) {
    global $REX;

    $artID = !$artID ? $REX['ARTICLE_ID'] : intval($artID);
    $canonical = ltrim(self::getMetaField($artID,'art_rexseo_canonicalurl',rex_getURL($artID,$REX['CUR_CLANG'])),'/');

    return $REX['PROTOCOL'].$_SERVER['HTTP_HOST'].'/'.$canonical;
  }

  function base()
  {
    global $REX;
    return $REX['PROTOCOL'].$_SERVER['HTTP_HOST'].'/'.$REX['ADDON']['rexseo']['settings']['install_subdir'];
  }


  function islatin() {
    global $REX;
    $pos = strpos($REX['LANG'], '_utf8');
    if ($pos === false) {
      return true;
    } else {
      return false;
    }
  }


  function htmlentities($str) {
    if (rexseo::islatin()) {
      return htmlentities($str,ENT_QUOTES);
    } else {
      return htmlentities($str,ENT_QUOTES,'UTF-8');
    }
  }


  function getMetaField($articleID,$metafield="file",$defval="",$loop="")
  {
    $meta = OOArticle::getArticleById($articleID);
    $value = '';

    if (($meta->getValue($metafield))!="")
    {   $value=$meta->getValue($metafield);
    }
    else
    {  if ($loop=="LOOP") {
        $cat = OOCategory::getCategoryById($articleID);

        if ($cat->getParent())
        {  $cat = $cat->getParent();

          $value=self::getMetaField($cat->getValue('id'),$metafield,$defval,$loop);
        }
      }
    }

    if ($value == '')
    {
      $value = $defval;
    }


    return $value;
  }

}
?>