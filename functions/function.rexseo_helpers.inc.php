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

if (!function_exists('rexseo_recursive_copy'))
{
  function rexseo_recursive_copy($source, $target, $makedir=TRUE, &$result=array(), $counter=1, $folderPermission='', $filePermission='')
  {
    global $REX;
    $folderPermission = (empty($folderPermission)) ? $REX['DIRPERM'] : $folderPermission;
    $filePermission = (empty($filePermission)) ? $REX['FILEPERM'] : $filePermission;

    // SCAN SOURCE DIR WHILE IGNORING  CERTAIN FILES
    $ignore = array('.DS_Store','.svn','.','..');
    $dirscan = array_diff(scandir($source), $ignore);

    // WALK THROUGH RESULT RECURSIVELY
    foreach($dirscan as $item)
    {

      // DO DIR STUFF
      if (is_dir($source.$item)) /* ITEM IS A DIR */
      {
        if(!is_dir($target.$item) && $makedir=TRUE) /* DIR NONEXISTANT IN TARGET */
        {
          if(mkdir($target.$item)) /* CREATE DIR IN TARGET */
          {
            if(chmod($source.$item,$folderPermission))
            {
            }
            else
            {
              echo rex_warning('Rechte für "'.$target.$item.'" konnten nicht gesetzt werden!');
            }
          }
          else
          {
            echo rex_warning('Das Verzeichnis '.$source.$item.' konnte nicht angelegt werden!');
          }
        }

        // RECURSION
        rexseo_recursive_copy($source.$item.'/', $target.$item.'/', $makedir, $result, $counter);
      }

      // DO FILE STUFF
      elseif (is_file($source.$item)) /* ITEM IS A FILE */
      {
        if (rex_is_writable($target)) /* CHECK WRITE PERMISSION */
        {
          if(is_file($target.$item)) /* FILE EXISTS IN TARGET */
          {
            $slug = date("d.m.y_H.i.s_");
            if(!rename($target.$item,$target.$slug.$item))
            {
              echo rex_warning('Datei "'.$target.$item.'" konnte nicht umbenannt werden!');
            }
            else
            {
              if(!copy($source.$item,$target.$item))
              {
                $result[$counter]['path'] = $target;
                $result[$counter]['item'] = $item;
                $result[$counter]['copystate'] = 0;
                echo rex_warning('Datei "'.$target.$item.'" konnte nicht geschrieben werden!');
              }
              else
              {
                $result[$counter]['path'] = $target;
                $result[$counter]['item'] = $item;
                if(chmod($target.$item,$filePermission))
                {
                  $result[$counter]['copystate'] = 1;
                  echo rex_info('Datei "'.$target.$item.'" wurde erfolgreich angelegt.');
                }
                else
                {
                  $result[$counter]['copystate'] = 0;
                  echo rex_warning('Rechte für "'.$target.$item.'" konnten nicht gesetzt werden!');
                }
              }
            }
          }
          else
          {
            if(!copy($source.$item,$target.$item))
            {
              $result[$counter]['path'] = $target;
              $result[$counter]['item'] = $item;
              $result[$counter]['copystate'] = 0;
              echo rex_warning('Datei "'.$target.$item.'" konnte nicht geschrieben werden!');
            }
            else
            {
              $result[$counter]['path'] = $target;
              $result[$counter]['item'] = $item;
              if(chmod($target.$item,$filePermission))
              {
                $result[$counter]['copystate'] = 1;
                echo rex_info('Datei "'.$target.$item.'" wurde erfolgreich angelegt.');
              }
              else
              {
                $result[$counter]['copystate'] = 0;
                echo rex_warning('Rechte für "'.$target.$item.'" konnten nicht gesetzt werden!');
              }
            }
          }
        }
        else
        {
          echo rex_warning('Keine Schreibrechte für das Verzeichnis "'.$target.'" !');
        }
      }
      $counter++;
    }
    return $result;
  }
}



/**
 * CONTENT PARSER FUNKTIONEN
 * @author rexdev.de
 * @package redaxo4.2
 * @version svn:$Id$
 */

// INCLUDE PARSER FUNCTION
////////////////////////////////////////////////////////////////////////////////
if (!function_exists('rexseo_incparse'))
{
  function rexseo_incparse($root,$source,$parsemode,$return=false)
  {

    switch ($parsemode)
    {
      case 'textile':
      $source = $root.$source;
      $content = file_get_contents($source);
      $html = rexseo_textileparser($content,true);
      break;

      case 'txt':
      $source = $root.$source;
      $content = file_get_contents($source);
      $html =  '<pre class="plain">'.$content.'</pre>';
      break;

      case 'raw':
      $source = $root.$source;
      $content = file_get_contents($source);
      $html = $content;
      break;

      case 'php':
      $source = $root.$source;
      $html =  get_include_contents($source);
      break;



      case 'iframe':
      $html = '<iframe src="'.$source.'" width="99%" height="600px"></iframe>';
      break;

      case 'jsopenwin':
      $html = 'Externer link: <a href="'.$source.'">'.$source.'</a>
      <script language="JavaScript">
      <!--
      window.open(\''.$source.'\',\''.$source.'\');
      //-->
      </script>';
      break;

      case 'extlink':
      $html = 'Externer link: <a href="'.$source.'">'.$source.'</a>';
      break;
    }

    if($return)
    {
      return $html;
    }
    else
    {
      echo $html;
    }

  }
}

// TEXTILE PARSER FUNCTION
////////////////////////////////////////////////////////////////////////////////
if (!function_exists('rexseo_textileparser'))
{
  function rexseo_textileparser($textile,$return=false)
  {
    if(OOAddon::isAvailable("textile"))
    {
      global $REX;

      if($textile!='')
      {
        $textile = htmlspecialchars_decode($textile);
        $textile = str_replace("<br />","",$textile);
        $textile = str_replace("&#039;","'",$textile);
        if (strpos($REX['LANG'],'utf'))
        {
          $html = rex_a79_textile($textile);
        }
        else
        {
          $html =  utf8_decode(rex_a79_textile($textile));
        }
        $html = preg_replace('|<span class="caps">([^<]+)</span>|','\1',$html);

        if($return)
        {
          return $html;
        }
        else
        {
          echo $html;
        }
      }

    }
    else
    {
      $html = rex_warning('WARNUNG: Das <a href="index.php?page=addon">Textile Addon</a> ist nicht aktiviert! Der Text wird ungeparst angezeigt..');
      $html .= '<pre>'.$textile.'</pre>';

      if($return)
      {
        return $html;
      }
      else
      {
        echo $html;
      }
    }
  }
}

// ECHO TEXTILE FORMATED STRING
////////////////////////////////////////////////////////////////////////////////
if (!function_exists('echotextile'))
{
  function echotextile($msg) {
    global $REX;
    if(OOAddon::isAvailable("textile")) {
      if($msg!='') {
         $msg = str_replace("	","",$msg); // tabs entfernen
         if (strpos($REX['LANG'],'utf')) {
          echo rex_a79_textile($msg);
        } else {
          echo utf8_decode(rex_a79_textile($msg));
        }
      }
    } else {
      $fallback = rex_warning('WARNUNG: Das <a href="index.php?page=addon">Textile Addon</a> ist nicht aktiviert! Der Text wird ungeparst angezeigt..');
      $fallback .= '<pre>'.$msg.'</pre>';
      echo $fallback;
    }
  }
}


// http://php.net/manual/de/function.include.php
////////////////////////////////////////////////////////////////////////////////
if (!function_exists('get_include_contents'))
{
  function get_include_contents($filename) {
    if (is_file($filename)) {
      ob_start();
      include $filename;
      $contents = ob_get_contents();
      ob_end_clean();
      return $contents;
    }
    return false;
  }
}


// REDAXO INSTALL ORDNER ERMITTELN
////////////////////////////////////////////////////////////////////////////////
if (!function_exists('rexseo_subdir'))
{
  function rexseo_subdir()
  {
    global $REX;
    $path_diff = $REX['REDAXO'] ? array('index.php','redaxo'):array('index.php');
    $install_subdir = array_diff_assoc(array_reverse(explode('/',trim($_SERVER['SCRIPT_NAME'],'/'))),$path_diff);
    $rexseo_subdir = count($install_subdir)>0 ? implode('/',array_reverse($install_subdir)).'/' :'';
    return $rexseo_subdir;
  }
}


// PARAMS CAST FUNCTIONS
////////////////////////////////////////////////////////////////////////////////
function rexseo_nl_2_array($str)
{
  $arr = array_filter(preg_split("/\n|\r\n|\r/", $str));
  return is_array($arr) ? $arr : array($arr);
}

function rexseo_array_2_nl($arr)
{
  return count($arr)>0 ? implode(PHP_EOL,$arr) : '';
}

function rexseo_301_2_array($str)
{
  $arr = array();
  $tmp = array_filter(preg_split("/\n|\r\n|\r/", $str));
  foreach($tmp as $k => $v)
  {
    $a = explode(' ',trim($v));
    $arr[trim(ltrim($a[0],'/'))] = array('article_id'=>intval($a[1]),'clang'=>intval($a[2]));
  }
  return $arr;
}

function rexseo_301_2_string($arr)
{
  $str = '';
  foreach($arr as $k => $v)
  {
    $str .= $k.' '.$v['article_id'].' '.$v['clang'].PHP_EOL;
  }
  return $str;
}

function rexseo_batch_cast($request,$conf)
{
  if(is_array($request) && is_array($conf))
  {
    foreach($conf as $key => $cast)
    {
      switch($cast)
      {
        case 'unset':
          unset($request[$key]);
          break;

        case '301_2_array':
          $request[$key] = rexseo_301_2_array($request[$key]);
          break;

        case 'nl_2_array':
          $request[$key] = rexseo_nl_2_array($request[$key]);
          break;

        default:
          $request[$key] = rex_request($key,$cast);
      }
    }
    return $request;
  }
  else
  {
    trigger_error('wrong input type, array expected', E_USER_ERROR);
  }
}


// FIX INTERNAL LAINKAS FOR TINY/TEXTILE
////////////////////////////////////////////////////////////////////////////////
function rexseo_fix_42x_links($params)
{
  global $REX;

  $subdir = $REX['ADDON']['rexseo']['settings']['install_subdir'];
  if($subdir=='')
  {
    $relpath     = '/redaxo/';
    $replacement = '/';
  }
  else
  {
    $relpath     = '/'.$subdir.'redaxo/';
    $replacement = '/'.$subdir;
  }

  // textile, tiny
  return str_replace(
    array('&quot;:'.$relpath, '"'.$relpath),
    array('&quot;:'.$replacement, '"'.$replacement),
    $params['subject']
  );
}


// INJECT 301 URLS INTO REXSEO PATHLIST
function rexseo_inject_301($params)
{
  global $REX;
  $redirects = $REX['ADDON']['rexseo']['settings']['301s'];

  if(count($redirects)>0)
  {
    foreach($redirects as $url => $v)
    {
      if(!isset($params['subject']['REXSEO_URLS'][$url]))
      {
        $params['subject']['REXSEO_URLS'][$url] = array('id'    =>$v['article_id'],
                                                        'clang' =>$v['clang'],
                                                        'status'=>301);
      }
    }
  }

  return $params['subject'];
}