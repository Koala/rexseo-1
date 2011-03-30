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

define('REXSEO_PATHLIST', $REX['INCLUDE_PATH'].'/generated/files/rexseo_pathlist.php');


class RexseoRewrite
{
  private $use_levenshtein;
  private $use_params_rewrite;


  /* constructor */
  function RexseoRewrite($use_levenshtein = false, $use_params_rewrite = false)
  {
    $this->use_levenshtein = $use_levenshtein;
    $this->use_params_rewrite = $use_params_rewrite;
  }


  /**
  * RESOLVE()
  *
  * resolve url to ARTICLE_ID & CLANG,
  * resolve rewritten params back to GET/REQUEST
  */
  function resolve()
  {
    global $REX, $REXSEO_URLS, $REXSEO_IDS;

    if(!file_exists(REXSEO_PATHLIST)) rexseo_generate_pathlist(array());
    require_once(REXSEO_PATHLIST);

    if(!$REX['REDAXO'])
    {
      $article_id      = -1;
      $clang           = $REX['CUR_CLANG'];
      $start_id        = $REX['START_ARTICLE_ID'];
      $notfound_id     = $REX['NOTFOUND_ARTICLE_ID'];

      $params_starter  = $REX['ADDON']['rexseo']['settings']['params_starter'];
      $install_subdir  = $REX['ADDON']['rexseo']['settings']['install_subdir'];
      $allow_articleid = $REX['ADDON']['rexseo']['settings']['allow_articleid'];
      $homelang        = $REX['ADDON']['rexseo']['settings']['homelang'];


      // IF NON_REWRITTEN URLS ALLOWED -> USE ARTICLE_ID FROM REQUEST
      if ($allow_articleid != 0 && isset($_GET['article_id']))
      {
        if($allow_articleid == 1)
        {
          $redirect = array('id'    =>rex_request('article_id','int'),
                            'clang' =>rex_request('clang','int',$clang),
                            'status'=>301);
          return self::redirect($redirect);
        }
        else
        {
          return self::setArticleId(rex_request('article_id','int'), rex_request('clang','int',$clang));
        }
      }


      // GET PATH RELATIVE TO INTALL_SUBDIR
      $length = strlen($install_subdir);
      $path = substr(ltrim($_SERVER['REQUEST_URI'],'/'), $length);


      // TAKE IMMEDIATE SHORTCUT TO STARTPAGE
      if (!$path || $path == '' || $path == 'index.php')
      {
        return self::setArticleId($start_id,$homelang);
      }


      // TRIM STANDARD PARAMS
      if(($pos = strpos($path, '?')) !== false)
        $path = substr($path, 0, $pos);


      // TRIM ANCHORS
      if(($pos = strpos($path, '#')) !== false)
        $path = substr($path, 0, $pos);


      // RESOLVE REWRITTEN PARAMS TO GET/REQUEST VARS
      if($this->use_params_rewrite && strstr($path,$params_starter.'/'))
      {
        $tmp = explode($params_starter.'/',$path);
        $path = $tmp[0];
        $vars = explode('/',$tmp[1]);
        for($c=0;$c<count($vars);$c+=2)
        {
          if($vars[$c]!='')
          {
            $_GET[$vars[$c]] = $vars[$c+1];
            $_REQUEST[$vars[$c]] = $vars[$c+1];
          }
        }
      }


      // RESOLVE URL VIA PATHLIST
      if(isset($REXSEO_URLS[$path]))
      {
        switch($REXSEO_URLS[$path]['status'])
        {
          case 301:
            $redirect = array('id'    => $REXSEO_URLS[$path]['id'],
                              'clang' => $REXSEO_URLS[$path]['clang'],
                              'status'=> 301);
            return self::redirect($redirect);
          default:
            return self::setArticleId($REXSEO_URLS[$path]['id'],$REXSEO_URLS[$path]['clang']);
        }
      }


      // CHECK CLOSEST URL MATCH VIA LEVENSHTEIN
      if($this->use_levenshtein)
      {
        foreach ($REXSEO_URLS as $url => $params)
        {
          $levenshtein[levenshtein($path, $url)] = $params['id'].'#'.$params['clang'];
        }

        ksort($levenshtein);
        $best = explode('#', array_shift($levenshtein));

        return self::setArticleId($best[0], $best[1]);
      }


      // STILL NO MATCH -> 404
      self::setArticleId($notfound_id,$clang);
    }
  }


  /**
  * REWRITE()
  *
  * rewrite URL
  * @param $params from EP URL_REWRITE
  */
  function rewrite($params)
  {
    // URL ALREADY SET BY OTHER EXTENSION
    if($params['subject'] != '')
    {
      return $params['subject'];
    }

    global $REX, $REXSEO_IDS;

    $id             = $params['id'];
    $name           = $params['name'];
    $clang          = $params['clang'];
    $subdir         = $REX['ADDON']['rexseo']['settings']['install_subdir'];

    // GET PARAMS STRING
    $urlparams = self::makeUrlParams($params);

    // GET URL FROM PATHLIST AND APPEND PARAMS
    $url = $REXSEO_IDS[$id][$clang]['url'].$urlparams;

    // DEAL WITH SUBDIR
    $subdir = !$REX['REDAXO'] ? '/'.$subdir  : '';
    if($subdir == '' && $url == '')
    {
      $url = ' ';
    }

    // INCLUDE SUBDIR BECASUSE rex_redirect() DOESN'T KNOW <base href="" />
    return $subdir.$url;
  }



  /**
  * REDIRECT()
  *
  * redirect request
  * @param $redirect   (array) params passed through from EP
  */
  private function redirect($redirect)
  {
    $status   = isset($redirect['status']) ? $redirect['status'] : 200;
    $location = self::rewrite(array('id'   => $redirect['id'],
                                    'clang'=> $redirect['clang']));

    while(@ob_end_clean());

    header('HTTP/1.1 '.$status);
    header('Location:'.$location);
    exit();
  }



  /**
  * SETARTICLEID()
  *
  * set ARTICLE_ID & CLANG in global var $REX
  * @param $art_id   article id
  * @param $clang_id language id
  */
  private function setArticleId($art_id, $clang_id = -1)
  {
    global $REX;
    $REX['ARTICLE_ID'] = $art_id;
    if($clang_id > -1)
      $REX['CUR_CLANG'] = $clang_id;
  }



  /**
  * MAKEURLPARAMS()
  *
  * Create params string for url
  * @param $EPparams   $params passed through from EP
  */
  private function makeUrlParams($EPparams)
  {
    global $REX;
    $divider        = $EPparams['divider'];
    $urlparams      = $EPparams['params'];
    $params_starter = $REX['ADDON']['rexseo']['settings']['params_starter'];

    if($this->use_params_rewrite)
    {
      // REWRITE PARAMS TO SEO FRIENDLY FORMAT
      $urlparams = str_replace(array($divider,'='),'/',$urlparams);
      $urlparams = $urlparams == '' ? '' : $params_starter.$urlparams.'/';
    }
    else
    {
      // STANDARD PARAMS STRING
      $urlparams = $urlparams == '' ? '' : '?'.$urlparams;
    }
    $urlparams = str_replace(array('/amp;','?&amp;'),array('/','?'),$urlparams);
    return $urlparams;
  }

}

// END OF CLASS -> OTHER FUNCTIONS
////////////////////////////////////////////////////////////////////////////////

/**
* regenerate pathlist on each extension point
*/
if ($REX['REDAXO'])
{
  $extension = 'rexseo_generate_pathlist';
  $extensionPoints = array(
    'CAT_ADDED',     'CAT_UPDATED',   'CAT_DELETED',
    'ART_ADDED',     'ART_UPDATED',   'ART_DELETED', 'ART_META_FORM_SECTION',
    'ART_TO_CAT',    'CAT_TO_ART',    'ART_TO_STARTPAGE',
    'CLANG_ADDED',   'CLANG_UPDATED', 'CLANG_DELETED',
    'ALL_GENERATED');

  foreach($extensionPoints as $extensionPoint)
  {
    rex_register_extension($extensionPoint, $extension);
  }
}


/**
* REXSEO_UNSET_PATHITEM()
*
* delete single article from path-arrays
*/
function rexseo_unset_pathitem($id=false)
{
  global $REXSEO_IDS, $REXSEO_URLS;

  if($id)
  {
    unset($REXSEO_IDS[$id]);

    foreach($REXSEO_URLS as $k => $v)
    {
      if($v['id']==$id)
      {
        unset($REXSEO_URLS[$k]);
        break;
      }
    }
  }
}


/**
* REXSEO_GENERATE_PATHLIST()
*
* generiert die Pathlist, abhängig von Aktion
* @author markus.staab[at]redaxo[dot]de Markus Staab
* @package redaxo4.2
*/
function rexseo_generate_pathlist($params)
{
  global $REX, $REXSEO_IDS, $REXSEO_URLS;

  if(file_exists(REXSEO_PATHLIST))
  {
    require_once (REXSEO_PATHLIST);
  }

  $REXSEO_IDS  = !isset($REXSEO_IDS)  ? array() : $REXSEO_IDS;
  $REXSEO_URLS = !isset($REXSEO_URLS) ? array() : $REXSEO_URLS;

  if(!isset($params['extension_point']))
    $params['extension_point'] = '';

  $where = '';
  switch($params['extension_point'])
  {
    // ------- sprachabhängig, einen artikel aktualisieren
    case 'CAT_DELETED':
    case 'ART_DELETED':
      rexseo_unset_pathitem($params['id']);
      break;
    case 'CAT_ADDED':
    case 'CAT_UPDATED':
    case 'ART_ADDED':
    case 'ART_UPDATED':
    case 'ART_TO_CAT':
    case 'CAT_TO_ART':
    case 'ART_META_FORM_SECTION':
      $where = '(id='. $params['id'] .' AND clang='. $params['clang'] .') OR (path LIKE "%|'. $params['id'] .'|%" AND clang='. $params['clang'] .')';
      break;
    // ------- alles aktualisieren
    case 'CLANG_ADDED':
    case 'CLANG_UPDATED':
    case 'CLANG_DELETED':
    case 'ART_TO_STARTPAGE':
    case 'ALL_GENERATED':
    default:
      $REXSEO_IDS = $REXSEO_URLS = array();
      $where = '1=1';
      break;
  }

  if($where != '')
  {
    $db = new rex_sql();
    //$db->debugsql=true;

    // revision fix
    $db->setQuery('UPDATE '. $REX['TABLE_PREFIX'] .'article SET revision = 0 WHERE revision IS NULL;');
    $db->setQuery('UPDATE '. $REX['TABLE_PREFIX'] .'article_slice SET revision = 0 WHERE revision IS NULL;');

    $db->setQuery('SELECT `id`, `clang`, `path`, `startpage`,`art_rexseo_url` FROM '. $REX['TABLE_PREFIX'] .'article WHERE '. $where.' AND revision=0 OR revision=NULL');

    while($db->hasNext())
    {
      $pathname   = '';
      $id         = $db->getValue('id');
      $clang      = $db->getValue('clang');
      $path       = $db->getValue('path');
      $rexseo_url = $db->getValue('art_rexseo_url');

      // FALLS REXSEO URL -> ERSETZEN
      if ($rexseo_url != '')
      {
        $pathname = ltrim(trim($rexseo_url),'/'); // sanitize whitespaces & leading slash
        $pathname = urlencode($pathname);
        $pathname = str_replace('%2F','/',$pathname); // decode slahes..
        
      }
      // NORMALE URL ERZEUGUNG
      else
      {
        // LANG SLUG
        if (count($REX['CLANG']) > 1)
        {
          $pathname = $REX['CLANG'][$clang].'/';
        }

        // pfad über kategorien bauen
        $path = trim($path, '|');
        if($path != '')
        {
          $path = explode('|', $path);
          foreach ($path as $p)
          {
            $ooc = OOCategory::getCategoryById($p, $clang);
            $name = $ooc->getName();
            unset($ooc);

            $pathname = rex_rewriter_appendToPath($pathname, $name);
          }
        }

        $ooa = OOArticle::getArticleById($id, $clang);
        if($ooa->isStartArticle())
        {
          $ooc = $ooa->getCategory();
          $catname = $ooc->getName();
          unset($ooc);
          $pathname = rex_rewriter_appendToPath($pathname, $catname);
        }

        if($REX['ADDON']['rexseo']['settings']['url_schema'] == 'rexseo')
        {
          if(!$ooa->isStartArticle())
          {
          // eigentlicher artikel anhängen
          $name = $ooa->getName();
          unset($ooa);
          $pathname = rex_rewriter_appendToPath($pathname, $name);
          }
        }
        else
        {
          // eigentlicher artikel anhängen
          $name = $ooa->getName();
          unset($ooa);
          $pathname = rex_rewriter_appendToPath($pathname, $name);
        }

        // ALLGEMEINE URL ENDUNG
        $pathname = substr($pathname,0,strlen($pathname)-1).$REX['ADDON']['rexseo']['settings']['url_ending'];

        // STARTSEITEN URL FORMAT
        if($db->getValue('id')==$REX['START_ARTICLE_ID'] && $REX['ADDON']['rexseo']['settings']['homeurl'] == 1 && $db->getValue('clang') == $REX['ADDON']['rexseo']['settings']['homelang'])
        {
          $pathname = '';
        }

      }

      $REXSEO_IDS[$id][$clang] = array('url' => $pathname, 'status' => 200, 'params' => false);
      $REXSEO_URLS[$pathname]  = array('id'  => $id, 'clang' => $clang, 'status' => 200, 'params' => false);

      $db->next();
    }
  }

  // EXTENSION POINT
  $subject = array('REXSEO_IDS'=>$REXSEO_IDS,'REXSEO_URLS'=>$REXSEO_URLS);
  $subject = rex_register_extension_point('REXSEO_PATHLIST_CREATED',$subject);
  
  $REXSEO_IDS  = $subject['REXSEO_IDS'];
  $REXSEO_URLS = $subject['REXSEO_URLS'];

  rex_put_file_contents(REXSEO_PATHLIST, "<?php\n\$REXSEO_IDS = ". var_export($REXSEO_IDS, true) .";\n\$REXSEO_URLS = ". var_export($REXSEO_URLS, true) .";\n");
}

function rex_rewriter_appendToPath($path, $name)
{
  global $REX;

  if ($name != '')
  {
    $name = strtolower(rex_parse_article_name($name));
    $name = str_replace('+',$REX['ADDON']['rexseo']['settings']['url_whitespace_replace'],$name);
    $path .= $name.'/';
  }
  return $path;
}
?>