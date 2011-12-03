<?php

/**
 * REXseo
 * Based on the URL-Rewrite Addon
 * @author dh[at]gn2-netwerk[dot]de Dave Holloway
 * @author markus.staab[at]redaxo[dot]de Markus Staab
 * @author code[at]rexdev[dot]de jeandeluxe
 * @package redaxo4.2
 * @version 1.3
 * @version svn:$Id: redmine_feeds.inc.php 160 2011-03-30 01:23:41Z jeandeluxe $
 */

global $REX;

$myself = 'rexseo';

$rc = new redmine_connect($REX['ADDON'][$myself]['redmine_url'],$REX['ADDON'][$myself]['redmine_key']);
echo $rc->getList(rex_request('chapter', 'string'));
?>