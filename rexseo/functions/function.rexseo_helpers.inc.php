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

if (!function_exists('rexseo_recursive_copy'))
{
  function rexseo_recursive_copy($source, $target, $makedir=TRUE, &$result=array(), $counter=1,$folderPermission=0740, $filePermission=0710)
  {
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
                $result[$counter]['copystate'] = 1;
                echo rex_info('Datei "'.$target.$item.'" wurde erfolgreich angelegt.');
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
              $result[$counter]['copystate'] = 1;
              echo rex_info('Datei "'.$target.$item.'" wurde erfolgreich angelegt.');
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
    $install_subdir = array_diff_assoc(array_reverse(explode(DIRECTORY_SEPARATOR,trim($_SERVER['SCRIPT_NAME'],DIRECTORY_SEPARATOR))),$path_diff);
    $rexseo_subdir = count($install_subdir)>0 ? implode('/',array_reverse($install_subdir)).'/' :'';
    return $rexseo_subdir;
  }
}


?>