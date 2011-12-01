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


class rexseo_select extends rex_select {
	
	
	/*
	 * addOption(); falls latin/iso verwendet wird, werden UTF8-zeichen dekodiert.
	 * 
	 */
	function addOption($key='',$value='') {
		global $REX;
		
				
		if(!strpos($REX['LANG'],'utf'))	{
			$key = utf8_decode($key);
			$value = utf8_decode($value);
		}
		return parent::addOption($key,$value);
	}
	
}

?>