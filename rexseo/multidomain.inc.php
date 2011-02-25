<?php

/*
** MAMP-Konfiguration
* /etc/hosts
127.0.0.1       mydomain.de
127.0.0.1       mydomain.com
127.0.0.1       mysite.de       
127.0.0.1       myothersite.de   
 
* /Applications/MAMP/conf/apache/httpd.conf
NameVirtualHost mydomain.de
<VirtualHost mydomain.de> 
DocumentRoot "/Users/dh/Sites/redaxos/redaxo43"
ServerName mydomain.de
</VirtualHost> 

NameVirtualHost mydomain.com
<VirtualHost mydomain.com> 
DocumentRoot "/Users/dh/Sites/redaxos/redaxo43"
ServerName mydomain.com
</VirtualHost> 


NameVirtualHost mysite.de
<VirtualHost mysite.de> 
DocumentRoot "/Users/dh/Sites/redaxos/redaxo43"
ServerName mysite.de
</VirtualHost> 

NameVirtualHost myothersite.de
<VirtualHost myothersite.de> 
DocumentRoot "/Users/dh/Sites/redaxos/redaxo43"
ServerName myothersite.de
</VirtualHost> 
 */

$REX['ADDON']['rexseo']['settings']['multidomain'] = array(
  
  ## Multidomain-Typ A - 2 Domains, zwei Sprachen (.de=clang0 .com=clang1) 
  'mydomain.de' => array(
    'article_id'=>21,
    'clang' => 0,
    'langslug' => false,
    'shift' => true,
  ),
  'mydomain.com' => array(
    'article_id'=>21,
    'clang' => 1,
    'langslug' => false,
    'shift' => true,
  ),
  
  
  ## Multidomain-Typ B - zwei getrennte Seiten
  'mysite.de' => array(
    'article_id'=>25,
    'clang' => 0,
    'langslug' => true,
    'shift' => true,
  ),
  'myothersite.de' => array(
    'article_id'=>26,
    'clang' => 0,
    'langslug' => true,
    'shift' => true,
  ),
  
);
?>