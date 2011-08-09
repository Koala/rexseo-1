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

// OUTPUT
////////////////////////////////////////////////////////////////////////////////
header('Content-Type: text/plain; charset=UTF-8');

if($REX['ADDON']['rexseo']['settings']['robots'] != '')
{
  $out = $REX['ADDON']['rexseo']['settings']['robots'];
}
else
{
  $out = 'User-agent: *
  Disallow:';
}

$out .= "\n".'Sitemap: '.$REX['SERVER'].'sitemap.xml';

echo $out;
?>