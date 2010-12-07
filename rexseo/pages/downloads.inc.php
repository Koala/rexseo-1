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
$Parser->set_feed_url('http://www.gn2-code.de/projects/rexseo/activity.atom?key=4372f934b085621f0878e4d8d2dc8b1a4c3fd9dc');
$Parser->init();
$Parser->handle_content_type();


foreach($Parser->get_items(0,20) as $item)
{
  $date  = $item->get_date('d.m.Y H:i');
  $id    = $item->get_id();
  $title = $item->get_title();

  $title = str_replace('REXseo -','',$title);
  if(!strpos($REX['LANG'],'utf'))
  {
    $title = utf8_decode($title);
  }

  if (substr($title,-4,4)=='.zip')
  {
    echo '<div class="rexseo_ticket">';
    echo '<span class="rexseo_date">'.$date.'</span><a class="" href="'.$id.'">'.$title.'</a>';
    echo '</div>';
  }
}

echo '<div class="rexseo_ticket">';
echo '<span class="rexseo_date">Downloadseite:</span><a class="jsopenwin" target="_blank" href="http://www.gn2-code.de/projects/rexseo/files">http://www.gn2-code.de/projects/rexseo/files</a>';
echo '</div>';

unset($Parser);
