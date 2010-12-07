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


global $REX;

$Parser = new SimplePie();
//$Parser->set_cache_location($REX['INCLUDE_PATH'].'/generated/files');
$Parser->set_feed_url('http://www.gn2-code.de/projects/rexseo/issues.atom?key=2437c4f8172c5c6e0020a236b576d5128029451b');
$Parser->init();
$Parser->handle_content_type();

foreach($Parser->get_items(0,50) as $item)
{
  $date  = $item->get_date('d.m.Y H:i');
  $id    = $item->get_id();
  $title = $item->get_title();

  $title = str_replace('REXseo -','',$title);
  if(!strpos($REX['LANG'],'utf'))
  {
    $title = utf8_decode($title);
  }

  if (substr($title,0,8)!='Revision' && substr($title,-4,4)!='.zip')
  {
    echo '<div class="rexseo_ticket">';
    echo '<span class="rexseo_date">'.$date.'</span><a class="jsopenwin" target="_blank" href="'.$id.'">'.$title.'</a>';
    echo '</div>';
  }
}

unset($Parser);
