## Redaxo Database Dump Version 4
## Prefix rex_
## charset utf-8

DROP TABLE IF EXISTS `rex_21_answer`;
CREATE TABLE `rex_21_answer` (
  `answer_id` int(10) NOT NULL AUTO_INCREMENT,
  `bug_id` int(10) NOT NULL,
  `rex_user_id` int(10) NOT NULL,
  `description` text NOT NULL,
  `createdate` int(11) NOT NULL,
  `delete` int(1) NOT NULL,
  PRIMARY KEY (`answer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `rex_21_bug_report`;
CREATE TABLE `rex_21_bug_report` (
  `bug_id` int(10) NOT NULL AUTO_INCREMENT,
  `category_id` int(10) NOT NULL,
  `rex_user_id` int(10) NOT NULL,
  `status_id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `article_id` int(5) NOT NULL,
  `description` text NOT NULL,
  `createdate` int(11) NOT NULL,
  `updatedate` int(11) NOT NULL,
  `email_sent` int(1) NOT NULL,
  PRIMARY KEY (`bug_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `rex_21_category`;
CREATE TABLE `rex_21_category` (
  `category_id` int(10) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `rex_21_status`;
CREATE TABLE `rex_21_status` (
  `status_id` int(10) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(255) NOT NULL,
  `status_color` varchar(7) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `rex_21_status` WRITE;
/*!40000 ALTER TABLE `rex_21_status` DISABLE KEYS */;
INSERT INTO `rex_21_status` VALUES 
  (1,'Fehler gefunden','#f8c2c2');
/*!40000 ALTER TABLE `rex_21_status` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_21_user`;
CREATE TABLE `rex_21_user` (
  `rex_user_id` int(10) NOT NULL AUTO_INCREMENT,
  `posting` int(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`rex_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `rex_375_archive`;
CREATE TABLE `rex_375_archive` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `clang` tinyint(4) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `htmlbody` text NOT NULL,
  `textbody` text NOT NULL,
  `format` varchar(10) NOT NULL DEFAULT '',
  `recipients` text NOT NULL,
  `groupname` varchar(255) NOT NULL DEFAULT '',
  `gid` smallint(4) unsigned NOT NULL DEFAULT '0',
  `setupdate` int(11) NOT NULL DEFAULT '0',
  `sentdate` int(11) NOT NULL DEFAULT '0',
  `sentby` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `setupdate` (`setupdate`,`clang`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `rex_375_user`;
CREATE TABLE `rex_375_user` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `title` tinyint(4) NOT NULL DEFAULT '0',
  `clang` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `article_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `send_group` smallint(4) unsigned NOT NULL DEFAULT '0',
  `createdate` int(11) NOT NULL DEFAULT '0',
  `updatedate` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(16) NOT NULL DEFAULT '',
  `key` varchar(6) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `rex_375_user2group`;
CREATE TABLE `rex_375_user2group` (
  `uid` smallint(4) unsigned NOT NULL,
  `gid` smallint(4) unsigned NOT NULL,
  UNIQUE KEY `uid` (`uid`,`gid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `rex_545_assets`;
CREATE TABLE `rex_545_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(4) CHARACTER SET ascii NOT NULL,
  `shortcut` varchar(255) CHARACTER SET ascii NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) CHARACTER SET ascii NOT NULL,
  `code` text,
  `textile` text,
  `width` smallint(4) NOT NULL DEFAULT '300',
  `height` smallint(4) DEFAULT NULL,
  `top` smallint(4) NOT NULL DEFAULT '20',
  `left` smallint(4) NOT NULL DEFAULT '20',
  `options` varchar(255) CHARACTER SET ascii DEFAULT NULL,
  `perm` varchar(32) CHARACTER SET ascii DEFAULT NULL,
  `call` varchar(32) CHARACTER SET ascii DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

LOCK TABLES `rex_545_assets` WRITE;
/*!40000 ALTER TABLE `rex_545_assets` DISABLE KEYS */;
INSERT INTO `rex_545_assets` VALUES 
  (1,'tmpl','textile','Textile Reference','','<!-- textile-hilfe-intern -->\r\n  <h1 class=\"helptopic\">Textile Hilfe</h1>\r\n  <h3>1. Onboard Referenz:</h3> \r\n  <div class=\"a79_help_overview\">\r\n  <h3 class=\"a79\">Anleitung/Hinweise</h3>\r\n  <table style=\"width: 95%\">\r\n    <colgroup>\r\n      <col width=\"45%\" />\r\n      <col width=\"45%\" />\r\n    </colgroup>\r\n  \r\n    <thead>\r\n      <tr>\r\n        <th colspan=\"2\"><a href=\"#\" id=\"fid-Atildeberschriften\" onclick=\"toggleChapter(\'Atildeberschriften\'); return false;\">Überschriften</a></th>\r\n      </tr>\r\n    </thead>\r\n  \r\n    <tbody id=\"Atildeberschriften\" style=\"display:none;\">\r\n      <tr>\r\n        <th>Eingabe</th>\r\n        <th>Vorschau</th>\r\n      </tr>\r\n   <tr>\r\n        <td>h1. Überschrift 1</td>\r\n        <td><h1>Überschrift 1</h1></td>\r\n      </tr>\r\n      <tr>\r\n        <td>h2. Überschrift 2</td>\r\n        <td><h2>Überschrift 2</h2></td>\r\n      </tr>\r\n      <tr>\r\n        <td>h3. Überschrift 3</td>\r\n        <td><h3>Überschrift 3</h3></td>\r\n      </tr>\r\n      <tr>\r\n        <td>h4. Überschrift 4</td>\r\n        <td><h4>Überschrift 4</h4></td>\r\n      </tr>\r\n      <tr>\r\n        <td>h5. Überschrift 5</td>\r\n        <td><h5>Überschrift 5</h5></td>\r\n      </tr>\r\n      <tr>\r\n        <td>h6. Überschrift 6</td>\r\n        <td><h6>Überschrift 6</h6></td>\r\n      </tr>\r\n      </tbody>\r\n    <thead>\r\n      <tr>\r\n        <th colspan=\"2\"><a href=\"#\" id=\"fid-Textformatierungen\" onclick=\"toggleChapter(\'Textformatierungen\'); return false;\">Textformatierungen</a></th>\r\n      </tr>\r\n    </thead>\r\n  \r\n    <tbody id=\"Textformatierungen\" style=\"display:none;\">\r\n      <tr>\r\n        <th>Eingabe</th>\r\n        <th>Vorschau</th>\r\n      </tr>\r\n   <tr>\r\n        <td>_kursiv_</td>\r\n        <td><p><em>kursiv</em></p></td>\r\n      </tr>\r\n      <tr>\r\n        <td>*fett*</td>\r\n        <td><p><strong>fett</strong></p></td>\r\n      </tr>\r\n      <tr>\r\n        <td>__kursiv__</td>\r\n        <td><p><i>kursiv</i></p></td>\r\n      </tr>\r\n      <tr>\r\n        <td>**fett**</td>\r\n        <td><p><b>fett</b></p></td>\r\n      </tr>\r\n      <tr>\r\n        <td>bq. Zitat</td>\r\n        <td><blockquote><p>Zitat</p></blockquote></td>\r\n      </tr>\r\n      <tr>\r\n        <td>??Quelle/Autor??</td>\r\n        <td><p><cite>Quelle/Autor</cite></p></td>\r\n      </tr>\r\n      <tr>\r\n        <td>-durchgestrichen-</td>\r\n        <td><p><del>durchgestrichen</del></p></td>\r\n      </tr>\r\n      <tr>\r\n        <td>+eingefügt+</td>\r\n        <td><p><ins>eingefügt</ins></p></td>\r\n      </tr>\r\n      <tr>\r\n        <td>^hochgestellt^</td>\r\n        <td><p><sup>hochgestellt</sup></p></td>\r\n      </tr>\r\n      <tr>\r\n        <td>~tiefgestellt~</td>\r\n        <td><p><sub>tiefgestellt</sub></p></td>\r\n      </tr>\r\n      <tr>\r\n        <td>@&lt;?php echo &quot;Hi&quot;; ?&gt;@</td>\r\n        <td><p><code>&lt;?php echo &quot;Hi&quot;; ?&gt;</code></p></td>\r\n      </tr>\r\n      </tbody>\r\n    <thead>\r\n      <tr>\r\n        <th colspan=\"2\"><a href=\"#\" id =\"fid-LinksAnker\" onclick=\"toggleChapter(\'LinksAnker\'); return false;\">Links/Anker</a></th>\r\n      </tr>\r\n    </thead>\r\n  \r\n    <tbody id=\"LinksAnker\" style=\"display:none;\">\r\n      <tr>\r\n        <th>Eingabe</th>\r\n        <th>Vorschau</th>\r\n      </tr>\r\n   <tr>\r\n        <td> Link (intern): zum &quot;Impressum&quot;:redaxø://5 </td>\r\n        <td><p>Link (intern): zum <a href=\"/\">Impressum</a></p></td>\r\n      </tr>\r\n      <tr>\r\n        <td>Link (intern) mit Anker: &quot;zu unseren AGBs&quot;:index.php?article_id=7#AGB</td>\r\n        <td><p>Link (intern) mit Anker: <a href=\"/info/kontaktformular.html\">zu unseren <span class=\"caps\">AGB</span>s</a></p></td>\r\n      </tr>\r\n      <tr>\r\n        <td>Link (extern): &quot;zur REDAXO Dokumentation&quot;:http://doku.redaxo.de</td>\r\n        <td><p>Link (extern): <a href=\"http://doku.redaxo.de\">zur <span class=\"caps\">REDAXO</span> Dokumentation</a></p></td>\r\n      </tr>\r\n      <tr>\r\n        <td>Link (extern) mit Anker: &quot;zu unserem Parnter&quot;:http://www..redaxo.de#news</td>\r\n        <td><p>Link (extern) mit Anker: <a href=\"http://www..redaxo.de#news\">zu unserem Parnter</a></p></td>\r\n      </tr>\r\n      <tr>\r\n        <td>Anker definieren:<br />\r\n        <br />\r\n      p(#Impressum). Hier steht das Impressum</td>\r\n        <td><p>Anker definieren:</p>\r\n          <p id=\"Impressum\">Hier steht das Impressum</p></td>\r\n      </tr>\r\n      </tbody>\r\n    <thead>\r\n      <tr>\r\n        <th colspan=\"2\"><a href=\"#\" id =\"fid-FuAtildenoten\" onclick=\"toggleChapter(\'FuAtildenoten\'); return false;\">Fußnoten</a></th>\r\n      </tr>\r\n    </thead>\r\n  \r\n    <tbody id=\"FuAtildenoten\" style=\"display:none;\">\r\n      <tr>\r\n        <th>Eingabe</th>\r\n        <th>Vorschau</th>\r\n      </tr>\r\n   <tr>\r\n        <td>AJAX[1] ..</td>\r\n        <td><p><span class=\"caps\">AJAX</span><sup class=\"footnote\"><a href=\"#fn2783296414991e77b729a2\">1</a></sup> ..</p></td>\r\n      </tr>\r\n      <tr>\r\n        <td>fn1. Asynchronous JavaScript and XML</td>\r\n        <td><p id=\"fn2783296414991e77b729a2\" class=\"footnote\"><sup>1</sup> Asynchronous JavaScript and <span class=\"caps\">XML</span></p></td>\r\n      </tr>\r\n      </tbody>\r\n    <thead>\r\n      <tr>\r\n        <th colspan=\"2\"><a href=\"#\" id =\"fid-Listen\" onclick=\"toggleChapter(\'Listen\'); return false;\">Listen</a></th>\r\n      </tr>\r\n    </thead>\r\n  \r\n    <tbody id=\"Listen\" style=\"display:none;\">\r\n      <tr>\r\n        <th>Eingabe</th>\r\n        <th>Vorschau</th>\r\n      </tr>\r\n   <tr>\r\n        <td>Nummerierte-Liste:<br />\r\n    # redaxo.de<br />\r\n    # forum.redaxo.de</td>\r\n                    <td>Nummerierte-Liste:\r\n      <ol>\r\n        <li>redaxo.de</li>\r\n        <li>forum.redaxo.de</li>\r\n      </ol></td>\r\n                  </tr>\r\n                  <tr>\r\n                    <td>Aufzählungs-Liste:<br />\r\n    * redaxo.de<br />\r\n    * forum.redaxo.de</td>\r\n                    <td>Aufzählungs-Liste:\r\n      <ul>\r\n        <li>redaxo.de</li>\r\n        <li>forum.redaxo.de</li>\r\n      </ul></td>\r\n      </tr>\r\n      </tbody>\r\n    <thead>\r\n      <tr>\r\n        <th colspan=\"2\"><a href=\"#\" id =\"fid-Tabellen\" onclick=\"toggleChapter(\'Tabellen\'); return false;\">Tabellen</a></th>\r\n      </tr>\r\n    </thead>\r\n  \r\n    <tbody id=\"Tabellen\" style=\"display:none;\">\r\n      <tr>\r\n        <th>Eingabe</th>\r\n        <th>Vorschau</th>\r\n      </tr>\r\n   <tr>\r\n        <td>|_. Id|_. Name|<br />\r\n  |1|Peter|</td>\r\n                  <td><table>\r\n      <tr>\r\n        <th>Id</th>\r\n        <th>Name</th>\r\n      </tr>\r\n      <tr>\r\n        <td>1</td>\r\n        <td>Peter</td>\r\n      </tr>\r\n    </table></td>\r\n      </tr>\r\n      <tr>\r\n        <td>|www.redaxo.de|35|<br />\r\n  |doku.redaxo.de|32|<br />\r\n  |wiki.redaxo.de|12|</td>\r\n        <td><table>\r\n      <tr>\r\n        <td>www.redaxo.de</td>\r\n        <td>35</td>\r\n      </tr>\r\n      <tr>\r\n        <td>doku.redaxo.de</td>\r\n        <td>32</td>\r\n      </tr>\r\n      <tr>\r\n        <td>wiki.redaxo.de</td>\r\n        <td>12</td>\r\n      </tr>\r\n    </table></td>\r\n      </tr>\r\n      </tbody></table></div>\r\n  <!-- /textile-hilfe-intern -->\r\n  \r\n          <h3>2. Externe Referenzen:</h3>\r\n<a href=\"#\" onclick =\"RexHELPViewer(\'http://hobix.com/textile/quick.html\');\">Hobix Quick</a> (RexHELP Viewer)<br />\r\n<a href=\"#\" onclick =\"RexHELPViewer(\'http://hobix.com/textile/\');\">Hobix Full</a> (RexHELP Viewer)<br />\r\n<a href=\"#\" onclick =\"RexHELPViewer(\'http://thresholdstate.com/articles/4312/the-textile-reference-manual\');\">Thresholdstate Reference</a> (RexHELP Viewer)<br />\r\n<a href=\"#\" onclick =\"RexHELPViewer(\'http://textile.thresholdstate.com/\');\">Thresholdstate Online Tester</a> (RexHELP Viewer)<br />','',400,300,0,50,'','? | B',''),
  (2,'tmpl','front-nav','Frontend Navigation','','<h1 class=\"navi\">Frontend Navigation</h1>\r\n<?php\r\n\r\n// navigation generator erstellen\r\n$nav = rex_navigation::factory();\r\n\r\n// ---------- HEAD NAVI\r\n\r\n// Beginne in der Wurzelkategorie\r\n// 1 Ebene Tief\r\n// Nicht aufklappen (hier egal da nur 1 Ebene)\r\n// Offline ausblenden\r\n\r\n$category_id = 0;\r\n$depth = 3;\r\n$open = true;\r\n$ignore_offlines = true;\r\n\r\necho $nav->get($category_id, $depth, $open, $ignore_offlines);\r\n\r\n?>','',400,300,0,0,'','W | B',''),
  (3,'tmpl','be-sitemap','Backend Sitemap','','<h1 class=\"navi\">be_sitemap</h1>\r\n\r\n<?php\r\n\r\nif(!OOAddon::isAvailable(\'be_sitemap\'))\r\n{  	\r\n  echo \'Addon be_sitemap nicht installiert/akitv!\';\r\n}\r\nelse\r\n{\r\n  require_once $REX[\'INCLUDE_PATH\'].\"/addons/be_sitemap/be_sitemap/config.class.php\";\r\n  \r\n  $a202_encoding = \"utf8\";\r\n\r\n  echo \'<div id=\"besitemap\">\'.$n;\r\n  foreach($REX[\'CLANG\'] as $clkey => $clang)\r\n  {\r\n    #echo (\"$clang <br />\");\r\n    #echo be_sitemap($clkey);\r\n    $cache = get_be_sitemap_cache_202($clkey);\r\n    if($cache == false)\r\n    { #noch keine cachefile vorhanden\r\n      echo \'<a href=\"index.php?page=be_sitemap&page2=rewrite_cache\">cache-Datei neu erzeugen</a>\'.\"\\n\";\r\n    }\r\n    else\r\n    {\r\n      echo $cache;\r\n    }\r\n    unset($cache);\r\n  }\r\n  echo \'</div>\'.$n;\r\n  \r\n}\r\n\r\n?>\r\n','',500,250,0,50,'','? | B',''),
  (4,'tmpl','tdlx_resize','Modul Textile Deluxe : Resize Modi','','<h1 class=\"helptopic\">Resize Beispiele: </h1>\r\n<p> \r\n<input type=text size=3 value=\"\" disabled> Breite X \r\n<input type=text size=3 value=\"\" disabled> Höhe = \r\n<strong>Kein Resize</strong><br /> \r\n<input type=text size=3 value=\"\" disabled> Breite X \r\n<input type=text size=3 value=\"120\" disabled> Höhe = \r\n<strong>120px Höhe, egal welche Breite sich ergibt</strong><br /> \r\n<input type=text size=3 value=\"160\" disabled> Breite X \r\n<input type=text size=3 value=\"\" disabled> Höhe = \r\n<strong>160px Breite, egal welche Höhe sich ergibt</strong><br /> \r\n<input type=text size=3 value=\"160\" disabled> Breite X \r\n<input type=text size=3 value=\"120\" disabled> Höhe = \r\n<strong>Resize auf max. 160px Breite bei max. 120px Höhe</strong><br /> \r\n</p> ','',455,100,0,0,'','? | B',''),
  (5,'tmpl','image_resize','Image Resize 1.1','','  <h1 class=\"helptopic\">Image Resize Addon (Version 1.1)</h1>\r\n\r\n    <h3>Features:</h3>\r\n\r\n<p>Makes resize of images on the fly, with extra cache of resized images so performance loss is extremly small.</p>\r\n\r\n<h3>Usage:</h3>\r\n<p>call an image that way <b>index.php?rex_resize=100w__imagefile</b>\r\n to resize the imagefile to a width of 100px</p>\r\n\r\n<h3>Methods:</h3>\r\n<p>\r\nw = width       (max width)<br />\r\nh = height      (max height)<br />\r\nc = crop        (cut image part to certain length and height)<br />\r\na = automatic   (longest side will be used)\r\n</p>\r\n\r\n<h3>Default-Filters:</h3>\r\n<p>\r\nblur<br />\r\nbrand<br />\r\nsepia<br />\r\nsharpen\r\n</p>\r\n\r\n<h3>Examples:</h3>\r\n<p>\r\nresize image to a length of 100px and calculate heigt to match ratio<br />\r\n<b>index.php?rex_resize=100w__imagefile</b>\r\n\r\n<br /><br />\r\nresize image to a height of 150px and calculate width to match ratio<br />\r\n<b>index.php?rex_resize=150h__imagefile</b>\r\n\r\n<br /><br />\r\nresize image on the longest side to 200px and calculate the other side to match ratio<br />\r\n<b>index.php?rex_resize=200a__imagefile</b>\r\n\r\n<br /><br />\r\nresize image to a width of 100px and a heigt of 200px<br />\r\n<b>index.php?rex_resize=100w__200h__imagefile</b>\r\n\r\n<br /><br />\r\nresize inner image part to a width of 100px and a heigt of 200px<br />\r\n<b>index.php?rex_resize=100c__200h__imagefile</b>\r\n\r\n<br /><br />\r\nresize inner image part to a width of 100px and a heigt of 200px with an offset of 50px<br />\r\n<b>index.php?rex_resize=100c__200h__50o__imagefile</b>\r\n\r\n<br /><br />\r\nresize inner image part to a width of 100px and a heigt of 200px with an offset of -150px<br />\r\n<b>index.php?rex_resize=100c__200h__-150o__imagefile</b>\r\n\r\n<br /><br />\r\nadd filter/s: here blur and sepia<br />\r\n<b>index.php?rex_resize=200a__imagefile&amp;rex_filter[]=blur&amp;rex_filter[]=sepia</b>\r\n\r\n</p> ','',500,400,0,0,'','? | B',''),
  (6,'tmpl','canteen','Deathstar Centeen','','<object width=\"480\" height=\"385\"><param name=\"movie\" value=\"http://www.youtube.com/v/hp69rg6Hdlo?fs=1&amp;hl=de_DE\"></param><param name=\"allowFullScreen\" value=\"true\"></param><param name=\"allowscriptaccess\" value=\"always\"></param><embed src=\"http://www.youtube.com/v/hp69rg6Hdlo?fs=1&amp;hl=de_DE\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" width=\"480\" height=\"385\"></embed></object>','',480,385,0,0,'|nopadding|','? | B',''),
  (7,'tmpl','foo','Textile Test','','','<!-- Block Modifiers -->\r\n\r\nh1. heading 1\r\n\r\nh2. heading 2\r\n\r\nh3. heading 3\r\n\r\nh4. heading 4\r\n\r\nh5. heading 5\r\n\r\nh6. heading 6\r\n\r\np.. Lorem *strong text* is **italic text** dummy ??some citation?? text -deleted text- of the +inserted text+ printing ^superscript^ and ~subscript~ typesetting industry. @some code@ Lorem %(bob)span% Ipsum ==notextile area== has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type h1 specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nbq. A block quotation.\r\n\r\nbq.:http://thresholdstate.com/ A cited quotation.\r\n\r\nbc. <script>\r\n// a Javascript example\r\nalert(\"Hello World\");\r\n</script>\r\n\r\n<!-- Lists -->\r\n\r\n# Item one\r\n# Item two\r\n# Item three\r\n## Item three one\r\n## Item three two\r\n## Item three three\r\n\r\n* Item one\r\n* Item two\r\n* Item three\r\n** Item three one\r\n** Item three two\r\n** Item three three\r\n\r\n<!-- property blocks: -->\r\n\r\nh1{color:green;}. heading 1 with %{font-style:italic}inline% CSS\r\n\r\n\r\n* interner Redaxo link: \"blah\":redaxo://123\r\n* @ Redaxo: \"http://www.redaxo.de/180-0-addon-details.html?addon_id=720\":http://www.redaxo.de/180-0-addon-details.html?addon_id=720\r\n* SVN Versionen: \"http://svn.rexdev.de/redmine/projects/addon-template/activity\":http://svn.rexdev.de/redmine/projects/addon-template/activity\r\n',400,300,0,0,'','? | B',''),
  (8,'tmpl','dupe','','','','',0,0,0,0,'','? | B',''),
  (9,'tmpl','dupe','','','','',0,0,0,0,'','? | B',''),
  (13,'bkmk','rexdev','rexdev Homepage','http://rexdev.de','','',400,300,0,0,'|fullscreen|','? | B',''),
  (14,'bkmk','mp','Rex Linkmap','index.php?page=linkmap&opener_input_field=LINK_1&clang=0&category_id=1','','',630,630,0,0,'','? | B',''),
  (15,'bkmk','nourl','nourl','','','',0,0,0,0,'','? | B',''),
  (16,'tmpl','sleight','Sleightofhand Vorstellung','','<object width=\"400\" height=\"300\"><param name=\"allowfullscreen\" value=\"true\" /><param name=\"allowscriptaccess\" value=\"always\" /><param name=\"movie\" value=\"http://vimeo.com/moogaloop.swf?clip_id=7799009&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=1&amp;color=00ADEF&amp;fullscreen=1&amp;autoplay=0&amp;loop=0\" /><embed src=\"http://vimeo.com/moogaloop.swf?clip_id=7799009&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=1&amp;color=00ADEF&amp;fullscreen=1&amp;autoplay=0&amp;loop=0\" type=\"application/x-shockwave-flash\" allowfullscreen=\"true\" allowscriptaccess=\"always\" width=\"400\" height=\"300\"></embed></object>','',400,300,0,0,'|nopadding|','',''),
  (17,'tmpl','rexseo-vid','Rexvideo: RexSEO','','<object width=\"853\" height=\"505\"><param name=\"movie\" value=\"http://www.youtube.com/v/NUBcLQOB4cA?fs=1&amp;hl=de_DE&amp;rel=0&amp;hd=1\"></param><param name=\"allowFullScreen\" value=\"true\"></param><param name=\"allowscriptaccess\" value=\"always\"></param><embed src=\"http://www.youtube.com/v/NUBcLQOB4cA?fs=1&amp;hl=de_DE&amp;rel=0&amp;hd=1\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" width=\"853\" height=\"505\"></embed></object>','',853,505,0,0,'|nopadding|','',''),
  (18,'bkmk','rex-latest','Neue Forumseinträge','http://forum.redaxo.de/search.php?search_id=newposts','','',0,0,0,0,'|fullscreen|','','');
/*!40000 ALTER TABLE `rex_545_assets` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_545_bookmarks`;
CREATE TABLE `rex_545_bookmarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shortcut` varchar(255) CHARACTER SET ascii NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT 'http://',
  `width` smallint(4) NOT NULL DEFAULT '300',
  `height` smallint(4) NOT NULL DEFAULT '400',
  `top` smallint(4) NOT NULL DEFAULT '20',
  `left` smallint(4) NOT NULL DEFAULT '20',
  `fullscreen` tinyint(1) NOT NULL DEFAULT '0',
  `options` varchar(255) CHARACTER SET ascii NOT NULL,
  `perm` varchar(32) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `rex_587_keywords`;
CREATE TABLE `rex_587_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) NOT NULL,
  `soundex` varchar(255) NOT NULL,
  `metaphone` varchar(255) NOT NULL,
  `colognephone` varchar(255) NOT NULL,
  `clang` int(11) NOT NULL DEFAULT '-1',
  `count` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword` (`keyword`,`clang`)
) ENGINE=MyISAM AUTO_INCREMENT=367 DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `rex_587_searchcache`;
CREATE TABLE `rex_587_searchcache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` char(32) NOT NULL,
  `returnarray` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `rex_587_searchcacheindex_ids`;
CREATE TABLE `rex_587_searchcacheindex_ids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `index_id` int(11) DEFAULT NULL,
  `cache_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `rex_587_searchindex`;
CREATE TABLE `rex_587_searchindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) DEFAULT NULL,
  `catid` int(11) DEFAULT NULL,
  `ftable` varchar(255) DEFAULT NULL,
  `fcolumn` varchar(255) DEFAULT NULL,
  `texttype` varchar(255) NOT NULL,
  `clang` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `fileext` varchar(255) DEFAULT NULL,
  `plaintext` text NOT NULL,
  `unchangedtext` text NOT NULL,
  `teaser` text NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `plaintext` (`plaintext`),
  FULLTEXT KEY `unchangedtext` (`unchangedtext`),
  FULLTEXT KEY `plaintext_2` (`plaintext`,`unchangedtext`)
) ENGINE=MyISAM AUTO_INCREMENT=647 DEFAULT CHARSET=utf8;

LOCK TABLES `rex_587_searchindex` WRITE;
/*!40000 ALTER TABLE `rex_587_searchindex` DISABLE KEYS */;
INSERT INTO `rex_587_searchindex` VALUES 
  (582,1,0,'rex_article','','article',0,'','','Internet Professionell lobt REDAXO \r\n &#8220;Mit kaum einer anderen Redaktionssoftware ist es so mühelos möglich, wirklich valide und barrierefreie Websites zu erstellen. Gerade die extreme Anpassungsfähigkeit an die verschiedenen Bedürfnisse ist eine der großen Stärken dieses Redaktionssystems.&#8221; \r\n &#8220;Dank des Cachings und des insgesamt sehr schlanken Cores (1,5 MB) sind REDAXO -Websites normalerweise sehr schnell. Im Vergleich zu anderen Content-Management-Systemen beeindruckt bei REDAXO vor allem die Flexibilität und Anpassungsfähigkeit.&#8221;','<div class=\"txt-img\">	<h1>Internet Professionell lobt <span class=\"caps\">REDAXO</span></h1>\r\n\r\n	<p>&#8220;Mit kaum einer anderen Redaktionssoftware ist es so mühelos möglich, wirklich valide und barrierefreie Websites zu erstellen. Gerade die extreme Anpassungsfähigkeit an die verschiedenen Bedürfnisse ist eine der großen Stärken dieses Redaktionssystems.&#8221;</p>\r\n\r\n	<p>&#8220;Dank des Cachings und des insgesamt sehr schlanken Cores (1,5 MB) sind <span class=\"caps\">REDAXO</span>-Websites normalerweise sehr schnell. Im Vergleich zu anderen Content-Management-Systemen beeindruckt bei <span class=\"caps\">REDAXO</span> vor allem die Flexibilität und Anpassungsfähigkeit.&#8221;</p></div>','Internet Professionell lobt REDAXO &#8220;Mit kaum einer anderen Redaktionssoftware ist es so mühelos möglich, wirklich valide und barrierefreie Websites zu erstellen. Gerade die extreme '),
  (20,2,0,'rex_article','','article',0,'','','An dieser Stelle mÖchten wir auch einmal Danke fÜr die vielen Anregungen, Kritiken, Ideen, Bugmeldungen, WÜnsche usw. sagen: Das REDAXO Team \r\n Jan Kristinus \r\n www.yakamara.de \r\n Markus Staab \r\n www.redaxo.de \r\n Thomas Blum \r\n www.blumbeet.com','<div class=\"txt-img\">	<p>An dieser Stelle mÖchten wir auch einmal Danke fÜr die vielen Anregungen, Kritiken, Ideen, Bugmeldungen, WÜnsche usw. sagen:</p></div><h1>Das REDAXO Team</h1><div class=\"team\"><div class=\"floatLeft\"><img src=\"../files/jan.gif\" title=\"Jan Kristinus\" alt=\"Jan Kristinus\" /></div>	<p>Jan Kristinus<br />\r\n<a href=\"http://www.yakamara.de\">www.yakamara.de</a></p></div><div class=\"team\"><div class=\"floatLeft\"><img src=\"../files/markus.gif\" title=\"Markus Staab\" alt=\"Markus Staab\" /></div>	<p>Markus Staab<br />\r\n<a href=\"http://www.redaxo.de\">www.redaxo.de</a></p></div><div class=\"team\"><div class=\"floatLeft\"><img src=\"../files/thomas.gif\" title=\"Thomas Blum\" alt=\"Thomas Blum\" /></div>	<p>Thomas Blum<br />\r\n<a href=\"http://www.blumbeet.com\">www.blumbeet.com</a></p></div>','An dieser Stelle mÖchten wir auch einmal Danke fÜr die vielen Anregungen, Kritiken, Ideen, Bugmeldungen, WÜnsche usw. sagen: Das REDAXO Team Jan Kristinus www.yakamara.de Markus Staab www.redaxo.de â¦'),
  (21,4,0,'rex_article','','article',0,'','','Erste Schritte \r\n Auf den folgenden Seiten erfahren Sie mehr Über die Installation von REDAXO auf dem Webserver Ihrer Wahl. ÜberprÜfen Sie vor Beginn die Systemvoraussetzungen fÜr Ihr Webpaket und lernen Sie mehr Über die ersten Schritte mit einem flexiblen Content-Management-System. Links zu REDAXO \r\n redaxo.de | http://www.redaxo.de \r\nAktuelle Informationen zu den aktuellen Versionen, die Basis-Intallation und Updates erhalten Sie auf der offiziellen REDAXO -Website. ...mehr \r\n doku.redaxo.de | http://doku.redaxo.de \r\nDie Online-Dokumentation von REDAXO \r\nDie Dokumentation ist in acht Teile gegliedert um so den Redakteur, dem Einsteiger und dem Profi die geeigneten Anlaufstellen zu bieten. Danke Dagmar &#8211; dag. ...mehr \r\n wiki.redaxo.de | http://wiki.redaxo.de \r\nIm Wiki stehen Ideen und konkrete Beispiele mit Beschreibungen, ohne PrÜfung seitens der Entwickler. Danke Sven &#8211; koala. ...mehr \r\n forum.redaxo.de | http://forum.redaxo.de \r\nEine der ersten Anlaufstellen fÜr Support, Fragen, Tipps und &#8220;Insider-Wissen&#8221; ist das Forum zu REDAXO . Danke Community. ...mehr','<h1>Erste Schritte</h1><div class=\"txt-img\">	<p>Auf den folgenden Seiten erfahren Sie mehr Über die Installation von <span class=\"caps\">REDAXO</span> auf dem Webserver Ihrer Wahl. ÜberprÜfen Sie vor Beginn die Systemvoraussetzungen fÜr Ihr Webpaket und lernen Sie mehr Über die ersten Schritte mit einem flexiblen Content-Management-System.</p></div><h2>Links zu REDAXO</h2><div class=\"txt-img\"><div class=\"team\"><div class=\"floatLeft\"><img src=\"../files/rex.gif\" title=\"REDAXO\" alt=\"REDAXO\" /></div>	<p><strong>redaxo.de</strong> | <a href=\"http://www.redaxo.de\">http://www.redaxo.de</a> <br />\r\nAktuelle Informationen zu den aktuellen Versionen, die Basis-Intallation und Updates erhalten Sie auf der offiziellen <span class=\"caps\">REDAXO</span>-Website. <a href=\"redaxo/erste-schritte/redaxo.html\" class=\"more\"> ...mehr</a></p></div></div><div class=\"txt-img\"><div class=\"team\"><div class=\"floatLeft\"><img src=\"../files/doku.gif\" title=\"Doku\" alt=\"Doku\" /></div>	<p><strong>doku.redaxo.de</strong> | <a href=\"http://doku.redaxo.de\">http://doku.redaxo.de</a> <br />\r\nDie Online-Dokumentation von <span class=\"caps\">REDAXO</span> <br />\r\nDie Dokumentation ist in acht Teile gegliedert um so den Redakteur, dem Einsteiger und dem Profi die geeigneten Anlaufstellen zu bieten. Danke Dagmar &#8211; dag. <a href=\"redaxo/erste-schritte/doku.html\" class=\"more\"> ...mehr</a></p></div></div><div class=\"txt-img\"><div class=\"team\"><div class=\"floatLeft\"><img src=\"../files/wiki.gif\" title=\"Wiki\" alt=\"Wiki\" /></div>	<p><strong>wiki.redaxo.de</strong> | <a href=\"http://wiki.redaxo.de\">http://wiki.redaxo.de</a> <br />\r\nIm Wiki stehen Ideen und konkrete Beispiele mit Beschreibungen, ohne PrÜfung seitens der Entwickler. Danke Sven &#8211; koala. <a href=\"redaxo/erste-schritte/wiki.html\" class=\"more\"> ...mehr</a></p></div></div><div class=\"txt-img\"><div class=\"team\"><div class=\"floatLeft\"><img src=\"../files/forum.gif\" title=\"Forum\" alt=\"Forum\" /></div>	<p><strong>forum.redaxo.de</strong> | <a href=\"http://forum.redaxo.de\">http://forum.redaxo.de</a> <br />\r\nEine der ersten Anlaufstellen fÜr Support, Fragen, Tipps und &#8220;Insider-Wissen&#8221; ist das Forum zu <span class=\"caps\">REDAXO</span>. Danke Community. <a href=\"redaxo/erste-schritte/forum.html\" class=\"more\"> ...mehr</a></p></div></div>','Erste Schritte Auf den folgenden Seiten erfahren Sie mehr Über die Installation von REDAXO auf dem Webserver Ihrer Wahl. ÜberprÜfen Sie vor Beginn die Systemvoraussetzungen fÜr Ihr Webpaket und â¦'),
  (22,5,0,'rex_article','','article',0,'','','FAQ Was ist das Besondere an REDAXO? Was sollte einen dazu bewegen, REDAXO zu nutzen? Wann wird der Einsatz von REDAXO empfohlen? Wie viele InternetprÄsentationen wurden bereits mit REDAXO erstellt? Welche Kenntnisse brauche ich, um mit REDAXO arbeiten zu kÖnnen?','<h1>FAQ</h1><a href=\"redaxo/faq/was-ist-das-besondere-an-redaxo.html\" class=\"faq\">Was ist das Besondere an REDAXO?</a><br /><a href=\"redaxo/faq/was-sollte-einen-dazu-bewegen-redaxo-zu-nutzen.html\" class=\"faq\">Was sollte einen dazu bewegen, REDAXO zu nutzen?</a><br /><a href=\"redaxo/faq/wann-wird-der-einsatz-von-redaxo-empfohlen.html\" class=\"faq\">Wann wird der Einsatz von REDAXO empfohlen?</a><br /><a href=\"redaxo/faq/wie-viele-internetpraesentationen-wurden-bereits-mit-redaxo-erstellt.html\" class=\"faq\">Wie viele InternetprÄsentationen wurden bereits mit REDAXO erstellt?</a><br /><a href=\"redaxo/faq/welche-kenntnisse-brauche-ich-um-mit-redaxo-arbeiten-zu-koennen.html\" class=\"faq\">Welche Kenntnisse brauche ich, um mit REDAXO arbeiten zu kÖnnen?</a><br />','FAQ Was ist das Besondere an REDAXO? Was sollte einen dazu bewegen, REDAXO zu nutzen? Wann wird der Einsatz von REDAXO empfohlen? Wie viele InternetprÄsentationen wurden bereits mit REDAXO erstellt? â¦'),
  (23,6,0,'rex_article','','article',0,'','','Nehmen Sie Kontakt auf \r\n REDAXO \r\nc/o Yakamara Media GmbH &amp; Co. KG \r\nAnsprechpartner: Jan Kristinus \r\nWandersmannstraSSe 68 \r\n65205 Wiesbaden \r\nTel.: 0611-504.599.21 \r\nTel.: 0611-504.599.30 \r\n www.redaxo.de \r\n www.yakamara.de \r\n REDAXO Agenturen auf redaxo.de \r\n www.redaxo.de \r\n Fotos \r\n www.photocase.com','<h1>Nehmen Sie Kontakt auf</h1><div class=\"txt-img\">	<p><strong><span class=\"caps\">REDAXO</span></strong><br />\r\nc/o Yakamara Media GmbH &amp; Co. KG<br />\r\nAnsprechpartner: Jan Kristinus<br />\r\nWandersmannstraSSe 68<br />\r\n65205 Wiesbaden<br />\r\nTel.: 0611-504.599.21<br />\r\nTel.: 0611-504.599.30<br />\r\n<a href=\"http://www.redaxo.de\">www.redaxo.de</a><br />\r\n<a href=\"http://www.yakamara.de\">www.yakamara.de</a></p>\r\n\r\n	<p><strong><span class=\"caps\">REDAXO</span> Agenturen auf redaxo.de</strong><br />\r\n<a href=\"http://www.redaxo.de/242-0-agenturensupport.html\">www.redaxo.de</a></p>\r\n\r\n	<p><strong>Fotos</strong><br />\r\n<a href=\"http://www.photocase.com\">www.photocase.com</a></p></div>','Nehmen Sie Kontakt auf REDAXO c/o Yakamara Media GmbH &amp; Co. KG Ansprechpartner: Jan Kristinus WandersmannstraSSe 68 65205 Wiesbaden Tel.: 0611-504.599.21 Tel.: 0611-504.599.30 www.redaxo.de â¦'),
  (24,8,3,'rex_article','','article',0,'','','Was ist REDAXO \r\n Was ist REDAXO \r\n REDAXO ist ein Content Management System fÜr individuelle, vielfÄltige und flexible Web-LÖsungen. \r\n Merkmale: \r\n \r\n Trennung von Inhalt und Layout mittels Templates \r\n Die Verwaltung von mehrsprachigen Webseiten ist gegeben \r\n Der Inhalt setzt sich aus verschiedenen Modulen zusammen \r\n Keine Grenzen bei der Erstellung von Modulen \r\n SystemunabhÄngiges sowie plattformÜbergreifendes Arbeiten Über den Webbrowser \r\n Linkmanagement \r\n Keine EinschrÄnkungen bei der Entwicklung von barrierefreiem Webdesign \r\n Aufnahme von Metadaten fÜr Suchmaschinen mÖglich \r\n Suchfunktionen kÖnnen integriert werden \r\n Rechteverteilung sind mÖglich \r\n Medienverwaltung Über Medienpool ( HTML , XML , PDF , MP3, DOC , JPEG , GIF etc.) \r\n Import / Export Funktion ermÖglicht Projektsicherung \r\n Einbindung von Erweiterungen/Addons fÜr unterschiedlichste Funktionen, auf der REDAXO -Website gibt es zahlreiche Addons zum Download \r\n REDAXO passt sich dem eigenen Wissensstand an \r\n REDAXO basiert auf PHP / MySQL','<h1>Was ist REDAXO</h1><div class=\"txt-img\">	<h2>Was ist <span class=\"caps\">REDAXO</span></h2>\r\n\r\n	<p><span class=\"caps\">REDAXO</span> ist ein Content Management System fÜr individuelle, vielfÄltige und flexible Web-LÖsungen.</p>\r\n\r\n	<h2>Merkmale:</h2>\r\n\r\n	<ul>\r\n		<li>Trennung von Inhalt und Layout mittels Templates</li>\r\n		<li>Die Verwaltung von mehrsprachigen Webseiten ist gegeben</li>\r\n		<li>Der Inhalt setzt sich aus verschiedenen Modulen zusammen</li>\r\n		<li>Keine Grenzen bei der Erstellung von Modulen</li>\r\n		<li>SystemunabhÄngiges sowie plattformÜbergreifendes Arbeiten Über den Webbrowser</li>\r\n		<li>Linkmanagement</li>\r\n		<li>Keine EinschrÄnkungen bei der Entwicklung von barrierefreiem Webdesign</li>\r\n		<li>Aufnahme von Metadaten fÜr Suchmaschinen mÖglich</li>\r\n		<li>Suchfunktionen kÖnnen integriert werden</li>\r\n		<li>Rechteverteilung sind mÖglich</li>\r\n		<li>Medienverwaltung Über Medienpool (<span class=\"caps\">HTML</span>, <span class=\"caps\">XML</span>, <span class=\"caps\">PDF</span>, MP3, <span class=\"caps\">DOC</span>, <span class=\"caps\">JPEG</span>, <span class=\"caps\">GIF</span> etc.)</li>\r\n		<li>Import / Export Funktion ermÖglicht Projektsicherung</li>\r\n		<li>Einbindung von Erweiterungen/Addons fÜr unterschiedlichste Funktionen, auf der <span class=\"caps\">REDAXO</span>-Website gibt es zahlreiche Addons zum Download</li>\r\n		<li><span class=\"caps\">REDAXO</span> passt sich dem eigenen Wissensstand an</li>\r\n		<li><span class=\"caps\">REDAXO</span> basiert auf <span class=\"caps\">PHP</span> / MySQL</li>\r\n	</ul></div>','Was ist REDAXO Was ist REDAXO REDAXO ist ein Content Management System fÜr individuelle, vielfÄltige und flexible Web-LÖsungen. Merkmale: Trennung von Inhalt und Layout mittels Templates Die â¦'),
  (25,9,3,'rex_article','','article',0,'','','FÜr wen ist REDAXO \r\n FÜr wen ist REDAXO \r\n REDAXO ist fÜr alle, die Websites erstellen, und fÜr Nutzer, die mittels einer erstellten REDAXO -Website Inhalte verwalten. \r\n FÜr Webdesigner und Administratoren &#8211; Erstellung und Gestaltung des Systems \r\n REDAXO ist kein Plug+Play-System! REDAXO ist fÜr individuelle LÖsungen gedacht, daher sind Kenntnisse von HTML und CSS unabdingbar, und Grundkenntnisse in PHP sollten ebenfalls vorhanden sein. REDAXO lÄsst sich sehr einfach installieren; Anpassungen sind leicht zu realisieren. \r\n Der grÖSSte Vorteil von REDAXO liegt in der FlexibilitÄt. Die Ausgabe von REDAXO ist komplett beeinflussbar, das heiSSt: Mittels HTML und CSS lassen sich alle denkbaren Designs umsetzen. Ebenso kann man ohne weiteres barrierefreie Websites realisieren. \r\n FÜr Redakteure &#8211; Verwaltung von Inhalten \r\n Redakteure brauchen zur Bedienung von REDAXO keine besonderen Kenntnisse. Der Schulungsaufwand ist auch fÜr unerfahrene Nutzer gering. Die Struktur ist klar und Übersichtlich aufgebaut, ohne erschlagende FunktionsfÜlle. Der Administrator kann dem Redakteur die MÖglichkeiten und Rechte zur Hand geben, mit denen er alle gewÜnschten Inhalte und Einstellungen vornehmen kann, ohne Gefahr zu laufen, die Seite zu zerstÖren.','<h1>FÜr wen ist REDAXO</h1><div class=\"txt-img\">	<h2>FÜr wen ist <span class=\"caps\">REDAXO</span></h2>\r\n\r\n	<p><span class=\"caps\">REDAXO</span> ist fÜr alle, die Websites erstellen, und fÜr Nutzer, die mittels einer erstellten <span class=\"caps\">REDAXO</span>-Website Inhalte verwalten.</p>\r\n\r\n	<h2>FÜr Webdesigner und Administratoren &#8211; Erstellung und Gestaltung des Systems</h2>\r\n\r\n	<p><span class=\"caps\">REDAXO</span> ist kein Plug+Play-System! <span class=\"caps\">REDAXO</span> ist fÜr individuelle LÖsungen gedacht, daher sind Kenntnisse von <span class=\"caps\">HTML</span> und <span class=\"caps\">CSS</span> unabdingbar, und Grundkenntnisse in <span class=\"caps\">PHP</span> sollten ebenfalls vorhanden sein. <span class=\"caps\">REDAXO</span> lÄsst sich sehr einfach installieren; Anpassungen sind leicht zu realisieren.</p>\r\n\r\n	<p>Der grÖSSte Vorteil von <span class=\"caps\">REDAXO</span> liegt in der FlexibilitÄt. Die Ausgabe von <span class=\"caps\">REDAXO</span> ist komplett beeinflussbar, das heiSSt: Mittels <span class=\"caps\">HTML</span> und <span class=\"caps\">CSS</span> lassen sich alle denkbaren Designs umsetzen. Ebenso kann man ohne weiteres barrierefreie Websites realisieren.</p>\r\n\r\n	<h2>FÜr Redakteure &#8211; Verwaltung von Inhalten</h2>\r\n\r\n	<p>Redakteure brauchen zur Bedienung von <span class=\"caps\">REDAXO</span> keine besonderen Kenntnisse. Der Schulungsaufwand ist auch fÜr unerfahrene Nutzer gering. Die Struktur ist klar und Übersichtlich aufgebaut, ohne erschlagende FunktionsfÜlle. Der Administrator kann dem Redakteur die MÖglichkeiten und Rechte zur Hand geben, mit denen er alle gewÜnschten Inhalte und Einstellungen vornehmen kann, ohne Gefahr zu laufen, die Seite zu zerstÖren.</p></div>','FÜr wen ist REDAXO FÜr wen ist REDAXO REDAXO ist fÜr alle, die Websites erstellen, und fÜr Nutzer, die mittels einer erstellten REDAXO -Website Inhalte verwalten. FÜr Webdesigner und â¦'),
  (26,10,3,'rex_article','','article',0,'','','Features \r\n Frei gestaltbar \r\n Mittels HTML /CSS und Templates lassen sich alle denkbaren Designs umsetzen &#8211; selbst die AdministrationsoberflÄche (Backend). Die Ausgabe von REDAXO ist komplett beeinflussbar. \r\n Suchmaschinenfreundlich \r\n Durch URL -Rewriting, individuelle Meta-Infos und freie Templategestaltung ist die Optimierung fÜr Suchmaschinen gewÄhrleistet. \r\n Barrierearm und BITV -konform \r\n REDAXO erfÜllt alle Grundvoraussetzungen, die fÜr eine barrierefreie und BITV -konforme Website notwendig sind. Das Frontend kann der jeweilige Ersteller der Seiten barrierearm gestalten. Das Backend ist ebenfalls barrierearm ausgelegt und kann Über Accesskeys per Tastatur bedient werden. \r\n Mehrsprachigkeit und UTF8 \r\n Mit REDAXO kÖnnen auch mehrsprachige Websites mit exotischen ZeichensÄtzen angeboten werden. Die UnterstÜtzung von UTF8 erleichtert die Sprachverwaltung &#8211; egal, ob englisch, italienisch, franzÖsisch, eine Sprache aus dem osteuropÄischen oder asiatischen Sprachraum. \r\n Zukunftssicher fÜr Monitor, PDA , Handy &#8230; \r\n Da die Ausgabe von REDAXO komplett beeinflussbar ist, kann die Website auch fÜr alternative GerÄte maSSgeschneidert werden. \r\n Module und Addons \r\n Erweiterungen kÖnnen als Module/Addons zum Einsatz kommen. Wie alle guten Content Management Systeme unterstÜtzt auch REDAXO benutzerdefinierte Erweiterungen. \r\n Benutzerverwaltung \r\n Es kÖnnen ausgefeilte Benutzerrechte vergeben werden. \r\n Modularer Aufbau der Inhalte \r\n Die Inhalte einer Seite werden modular aus verschiedenen BlÖcken zusammengesetzt, die man vergleichsweise leicht selbst programmieren kann &#8211; z.B. Überschrift, Text, Bildergalerie, Formular &#8230; Dies ermÖglicht eine auSSergewÖhnlich flexible Erstellung des Inhalts. \r\n Erhalt der Design-Vorgaben \r\n Inhalte und PrÄsentation werden getrennt voneinander gespeichert. Folglich wird der gesamte Inhalt aller Redakteure in einem Design konsistent ausgegeben. \r\n StandortunabhÄngige Pflege der Seiten \r\n REDAXO funktioniert auf jedem Rechner der mit dem Internet verbunden ist. Seiten kÖnnen von jedem Ort und zu jeder Zeit Über einen Browser bearbeitet werden. \r\n Textinhalte editieren \r\n Dem Redakteur kÖnnen zum Editieren der Inhalte verschiedene MÖglichkeiten zur VerfÜgung gestellt werden &#8211; von festen Texteingabefeldern Über den Textile-Editor bis hin zu Wysiwyg-Editoren wie TinyMCE.','<h1>Features</h1><div class=\"txt-img\">	<h2>Frei gestaltbar</h2>\r\n\r\n	<p>Mittels <span class=\"caps\">HTML</span>/CSS und Templates lassen sich alle denkbaren Designs umsetzen &#8211; selbst die AdministrationsoberflÄche (Backend). Die Ausgabe von <span class=\"caps\">REDAXO</span> ist komplett beeinflussbar. </p>\r\n\r\n	<h2>Suchmaschinenfreundlich</h2>\r\n\r\n	<p>Durch <span class=\"caps\">URL</span>-Rewriting, individuelle Meta-Infos und freie Templategestaltung ist die Optimierung fÜr Suchmaschinen gewÄhrleistet.</p>\r\n\r\n	<h2>Barrierearm und <span class=\"caps\">BITV</span>-konform</h2>\r\n\r\n	<p><span class=\"caps\">REDAXO</span> erfÜllt alle Grundvoraussetzungen, die fÜr eine barrierefreie und <span class=\"caps\">BITV</span>-konforme Website notwendig sind. Das Frontend kann der jeweilige Ersteller der Seiten barrierearm gestalten. Das Backend ist ebenfalls barrierearm ausgelegt und kann Über Accesskeys per Tastatur bedient werden.</p>\r\n\r\n	<h2>Mehrsprachigkeit und UTF8</h2>\r\n\r\n	<p>Mit <span class=\"caps\">REDAXO</span> kÖnnen auch mehrsprachige Websites mit exotischen ZeichensÄtzen angeboten werden. Die UnterstÜtzung von UTF8 erleichtert die Sprachverwaltung &#8211; egal, ob englisch, italienisch, franzÖsisch, eine Sprache aus dem osteuropÄischen oder asiatischen Sprachraum. </p>\r\n\r\n	<h2>Zukunftssicher fÜr Monitor, <span class=\"caps\">PDA</span>, Handy &#8230;</h2>\r\n\r\n	<p>Da die Ausgabe von <span class=\"caps\">REDAXO</span> komplett beeinflussbar ist, kann die Website auch fÜr alternative GerÄte maSSgeschneidert werden.</p>\r\n\r\n	<h2>Module und Addons</h2>\r\n\r\n	<p>Erweiterungen kÖnnen als Module/Addons zum Einsatz kommen. Wie alle guten Content Management Systeme unterstÜtzt auch <span class=\"caps\">REDAXO</span> benutzerdefinierte Erweiterungen.</p>\r\n\r\n	<h2>Benutzerverwaltung</h2>\r\n\r\n	<p>Es kÖnnen ausgefeilte Benutzerrechte vergeben werden.</p>\r\n\r\n	<h2>Modularer Aufbau der Inhalte</h2>\r\n\r\n	<p>Die Inhalte einer Seite werden modular aus verschiedenen BlÖcken zusammengesetzt, die man vergleichsweise leicht selbst programmieren kann &#8211; z.B. Überschrift, Text, Bildergalerie, Formular &#8230; Dies ermÖglicht eine auSSergewÖhnlich flexible Erstellung des Inhalts.</p>\r\n\r\n	<h2>Erhalt der Design-Vorgaben</h2>\r\n\r\n	<p>Inhalte und PrÄsentation werden getrennt voneinander gespeichert. Folglich wird der gesamte Inhalt aller Redakteure in einem Design konsistent ausgegeben.</p>\r\n\r\n	<h2>StandortunabhÄngige Pflege der Seiten</h2>\r\n\r\n	<p><span class=\"caps\">REDAXO</span> funktioniert auf jedem Rechner der mit dem Internet verbunden ist. Seiten kÖnnen von jedem Ort und zu jeder Zeit Über einen Browser bearbeitet werden.</p>\r\n\r\n	<h2>Textinhalte editieren</h2>\r\n\r\n	<p>Dem Redakteur kÖnnen zum Editieren der Inhalte verschiedene MÖglichkeiten zur VerfÜgung gestellt werden &#8211; von festen Texteingabefeldern Über den Textile-Editor bis hin zu Wysiwyg-Editoren wie TinyMCE.</p></div>','Features Frei gestaltbar Mittels HTML /CSS und Templates lassen sich alle denkbaren Designs umsetzen &#8211; selbst die AdministrationsoberflÄche (Backend). Die Ausgabe von REDAXO ist komplett â¦'),
  (27,11,3,'rex_article','','article',0,'','','Screenshots \r\n \r\n Kategorieansicht: Kategorienamen editieren \r\n Inhaltsansicht: Editiermodus \r\n \r\n Inhaltsansicht: Einfachen Text editieren \r\n Medienpool zur Verwaltung von Dateien/Bildern \r\n \r\n Benutzerverwaltung \r\n Modulansicht','<h1>Screenshots</h1><script type=\"text/javascript\">\r\nvar GB_ROOT_DIR = \"files/\";\r\n</script>\r\n<script type=\"text/javascript\" src=\"files/ajs.js\"></script>\r\n<script type=\"text/javascript\" src=\"files/ajs_fx.js\"></script>\r\n<script type=\"text/javascript\" src=\"files/gb_scripts.js\"></script>\r\n<link href=\"files/gb_styles.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n\r\n\r\n<div class=\"galerie\">\r\n\r\n<div class=\"image\"><a href=\"..//files/screenshot_kategorie_edit.png\" rel=\"gb_imageset[galerie0]\"><img src=\"..//index.php?rex_resize=250a__screenshot_kategorie_edit.png\" title=\"Kategorieansicht: Kategorienamen editieren\" alt=\"Kategorieansicht: Kategorienamen editieren\" /></a><p>Kategorieansicht: Kategorienamen editieren</p></div><div class=\"image\"><a href=\"..//files/screenshot_content.png\" rel=\"gb_imageset[galerie0]\"><img src=\"..//index.php?rex_resize=250a__screenshot_content.png\" title=\"Inhaltsansicht: Editiermodus\" alt=\"Inhaltsansicht: Editiermodus\" /></a><p>Inhaltsansicht: Editiermodus</p></div><div class=\"clearer\"></div><div class=\"image\"><a href=\"..//files/screenshot_content_edit.png\" rel=\"gb_imageset[galerie0]\"><img src=\"..//index.php?rex_resize=250a__screenshot_content_edit.png\" title=\"Inhaltsansicht: Einfachen Text editieren\" alt=\"Inhaltsansicht: Einfachen Text editieren\" /></a><p>Inhaltsansicht: Einfachen Text editieren</p></div><div class=\"image\"><a href=\"..//files/screenshot_medienpool.png\" rel=\"gb_imageset[galerie0]\"><img src=\"..//index.php?rex_resize=250a__screenshot_medienpool.png\" title=\"Medienpool zur Verwaltung von Dateien/Bildern\" alt=\"Medienpool zur Verwaltung von Dateien/Bildern\" /></a><p>Medienpool zur Verwaltung von Dateien/Bildern</p></div><div class=\"clearer\"></div><div class=\"image\"><a href=\"..//files/screenshot_benutzerverwaltu.png\" rel=\"gb_imageset[galerie0]\"><img src=\"..//index.php?rex_resize=250a__screenshot_benutzerverwaltu.png\" title=\"Benutzerverwaltung\" alt=\"Benutzerverwaltung\" /></a><p>Benutzerverwaltung</p></div><div class=\"image\"><a href=\"..//files/screenshot_module.png\" rel=\"gb_imageset[galerie0]\"><img src=\"..//index.php?rex_resize=250a__screenshot_module.png\" title=\"Modulansicht\" alt=\"Modulansicht\" /></a><p>Modulansicht</p></div><div class=\"clearer\"></div></div>','Screenshots Kategorieansicht: Kategorienamen editieren Inhaltsansicht: Editiermodus Inhaltsansicht: Einfachen Text editieren Medienpool zur Verwaltung von Dateien/Bildern Benutzerverwaltung â¦'),
  (28,12,4,'rex_article','','article',0,'','','doku.redaxo.de | http://doku.redaxo.de \r\nDie Online-Dokumentation von REDAXO \r\nDie Dokumentation ist in acht Teile gegliedert um so den Redakteur, dem Einsteiger und dem Profi die geeigneten Anlaufstellen zu bieten. Danke Dagmar &#8211; dag.','<div class=\"team\"><div class=\"floatLeft\"><img src=\"../files/doku.gif\" title=\"Doku\" alt=\"Doku\" /></div>	<p><strong>doku.redaxo.de</strong> | <a href=\"http://doku.redaxo.de\">http://doku.redaxo.de</a><br />\r\nDie Online-Dokumentation von <span class=\"caps\">REDAXO</span><br />\r\nDie Dokumentation ist in acht Teile gegliedert um so den Redakteur, dem Einsteiger und dem Profi die geeigneten Anlaufstellen zu bieten. Danke Dagmar &#8211; dag.</p></div>','doku.redaxo.de | http://doku.redaxo.de Die Online-Dokumentation von REDAXO Die Dokumentation ist in acht Teile gegliedert um so den Redakteur, dem Einsteiger und dem Profi die geeigneten Anlaufstellen â¦'),
  (29,13,4,'rex_article','','article',0,'','','wiki.redaxo.de | http://wiki.redaxo.de \r\nIm Wiki stehen Ideen und konkrete Beispiele mit Beschreibungen, ohne PrÜfung seitens der Entwickler. Danke Sven &#8211; koala.','<div class=\"team\"><div class=\"floatLeft\"><img src=\"../files/wiki.gif\" title=\"Wiki\" alt=\"Wiki\" /></div>	<p><strong>wiki.redaxo.de</strong> | <a href=\"http://wiki.redaxo.de\">http://wiki.redaxo.de</a><br />\r\nIm Wiki stehen Ideen und konkrete Beispiele mit Beschreibungen, ohne PrÜfung seitens der Entwickler. Danke Sven &#8211; koala.</p></div>','wiki.redaxo.de | http://wiki.redaxo.de Im Wiki stehen Ideen und konkrete Beispiele mit Beschreibungen, ohne PrÜfung seitens der Entwickler. Danke Sven &#8211; koala. '),
  (30,14,4,'rex_article','','article',0,'','','forum.redaxo.de | http://forum.redaxo.de \r\nEine der ersten Anlaufstellen fÜr Support, Fragen, Tipps und &#8220;Insider-Wissen&#8221; ist das Forum zu REDAXO . Danke Community.','<div class=\"team\"><div class=\"floatLeft\"><img src=\"../files/forum.gif\" title=\"Forum\" alt=\"Forum\" /></div>	<p><strong>forum.redaxo.de</strong> | <a href=\"http://forum.redaxo.de\">http://forum.redaxo.de</a><br />\r\nEine der ersten Anlaufstellen fÜr Support, Fragen, Tipps und &#8220;Insider-Wissen&#8221; ist das Forum zu <span class=\"caps\">REDAXO</span>. Danke Community.</p></div>','forum.redaxo.de | http://forum.redaxo.de Eine der ersten Anlaufstellen fÜr Support, Fragen, Tipps und &#8220;Insider-Wissen&#8221; ist das Forum zu REDAXO . Danke Community. '),
  (31,15,5,'rex_article','','article',0,'','','FAQ Was ist das Besondere an REDAXO? \r\n REDAXO unterscheidet sich von anderen Systemen auf den ersten Blick durch sein sehr schlicht gehaltenes und auf grafische Dekoration verzichtendes Backend. So finden sich auch weniger technikorientierte Anwender schnell in den Funktionen zurecht. Der Administrator kann je nach Bedarf einzelne Funktionen zu- oder abschalten. Dadurch ist REDAXO selbst fÜr Netzauftritte mit wenigen Seiten einsetzbar, ohne durch seine FunktionsfÜlle den eigentlichen Seiteninhalt zu dominieren. (Quelle: Wikipedia) \r\n zurÜck','<h1>FAQ</h1><h2>Was ist das Besondere an REDAXO?</h2><div class=\"txt-img\">	<p><span class=\"caps\">REDAXO</span> unterscheidet sich von anderen Systemen auf den ersten Blick durch sein sehr schlicht gehaltenes und auf grafische Dekoration verzichtendes Backend. So finden sich auch weniger technikorientierte Anwender schnell in den Funktionen zurecht. Der Administrator kann je nach Bedarf einzelne Funktionen zu- oder abschalten. Dadurch ist <span class=\"caps\">REDAXO</span> selbst fÜr Netzauftritte mit wenigen Seiten einsetzbar, ohne durch seine FunktionsfÜlle den eigentlichen Seiteninhalt zu dominieren. (Quelle: Wikipedia)</p>\r\n\r\n	<p><a href=\"?article_id=5\">zurÜck</a></p></div>','FAQ Was ist das Besondere an REDAXO? REDAXO unterscheidet sich von anderen Systemen auf den ersten Blick durch sein sehr schlicht gehaltenes und auf grafische Dekoration verzichtendes Backend. So â¦'),
  (32,16,4,'rex_article','','article',0,'','','redaxo.de | http://www.redaxo.de \r\nAktuelle Informationen zu den aktuellen Versionen, die Basis-Intallation und Updates erhalten Sie auf der offiziellen REDAXO -Website.','<div class=\"team\"><div class=\"floatLeft\"><img src=\"../files/rex.gif\" title=\"REDAXO\" alt=\"REDAXO\" /></div>	<p><strong>redaxo.de</strong> | <a href=\"http://www.redaxo.de\">http://www.redaxo.de</a><br />\r\nAktuelle Informationen zu den aktuellen Versionen, die Basis-Intallation und Updates erhalten Sie auf der offiziellen <span class=\"caps\">REDAXO</span>-Website.</p></div>','redaxo.de | http://www.redaxo.de Aktuelle Informationen zu den aktuellen Versionen, die Basis-Intallation und Updates erhalten Sie auf der offiziellen REDAXO -Website. '),
  (33,17,5,'rex_article','','article',0,'','','FAQ Was sollte einen dazu bewegen, REDAXO zu nutzen? \r\n Zitat aus dem Forum: \"Die nette Community und der gute Support. ;-) \" \r\n zurÜck','<h1>FAQ</h1><h2>Was sollte einen dazu bewegen, REDAXO zu nutzen?</h2><div class=\"txt-img\">	<p>Zitat aus dem Forum: \"Die nette Community und der gute Support. ;-) \"</p>\r\n\r\n	<p><a href=\"?article_id=5\">zurÜck</a></p></div>','FAQ Was sollte einen dazu bewegen, REDAXO zu nutzen? Zitat aus dem Forum: \"Die nette Community und der gute Support. ;-) \" zurÜck '),
  (34,18,5,'rex_article','','article',0,'','','FAQ Wann wird der Einsatz von REDAXO empfohlen? \r\n Die Praxis hat gezeigt, dass REDAXO fÜr Webauftritte bis ca. 3000 Seiten ohne Probleme oder GeschwindigkeitseinbuSSen einsetzbar ist. Je nach Konzept der Website und den Seiteninhalten kÖnnen es bei optimaler Planung aber auch mehr werden. (Quelle: Wikipedia) \r\n zurÜck','<h1>FAQ</h1><h2>Wann wird der Einsatz von REDAXO empfohlen?</h2><div class=\"txt-img\">	<p>Die Praxis hat gezeigt, dass <span class=\"caps\">REDAXO</span> fÜr Webauftritte bis ca. 3000 Seiten ohne Probleme oder GeschwindigkeitseinbuSSen einsetzbar ist. Je nach Konzept der Website und den Seiteninhalten kÖnnen es bei optimaler Planung aber auch mehr werden. (Quelle: Wikipedia)</p>\r\n\r\n	<p><a href=\"?article_id=5\">zurÜck</a></p></div>','FAQ Wann wird der Einsatz von REDAXO empfohlen? Die Praxis hat gezeigt, dass REDAXO fÜr Webauftritte bis ca. 3000 Seiten ohne Probleme oder GeschwindigkeitseinbuSSen einsetzbar ist. Je nach Konzept â¦'),
  (35,19,5,'rex_article','','article',0,'','','FAQ Wie viele InternetprÄsentationen wurden bereits mit REDAXO erstellt? \r\n Es gibt ca. 950 gelistete Referenzen auf der REDAXO -Seite (Stand MÄrz 2009). Man kann jedoch davon ausgehen, daSS die wirkliche Anzahl ein vielfaches davon ist. \r\n zurÜck','<h1>FAQ</h1><h2>Wie viele InternetprÄsentationen wurden bereits mit REDAXO erstellt?</h2><div class=\"txt-img\">	<p>Es gibt ca. 950 gelistete Referenzen auf der <span class=\"caps\">REDAXO</span>-Seite (Stand MÄrz 2009). Man kann jedoch davon ausgehen, daSS die wirkliche Anzahl ein vielfaches davon ist.</p>\r\n\r\n	<p><a href=\"?article_id=5\">zurÜck</a></p></div>','FAQ Wie viele InternetprÄsentationen wurden bereits mit REDAXO erstellt? Es gibt ca. 950 gelistete Referenzen auf der REDAXO -Seite (Stand MÄrz 2009). Man kann jedoch davon ausgehen, daSS die â¦'),
  (36,20,5,'rex_article','','article',0,'','','FAQ Welche Kenntnisse brauche ich, um mit REDAXO arbeiten zu kÖnnen? \r\n REDAXO basiert auf PHP und Mysql. Kenntnisse in dieser Sprache und im Umgang mit der Datenbank sind zwar zu empfehlen, aber nicht unbedingt erforderlich. Anhand der Demo-Versionen kann man bereits eigene Webseiten erstellen und dabei lernen, das System zu nutzen. \r\n zurÜck','<h1>FAQ</h1><h2>Welche Kenntnisse brauche ich, um mit REDAXO arbeiten zu kÖnnen?</h2><div class=\"txt-img\">	<p><span class=\"caps\">REDAXO</span> basiert auf <span class=\"caps\">PHP</span> und Mysql. Kenntnisse in dieser Sprache und im Umgang mit der Datenbank sind zwar zu empfehlen, aber nicht unbedingt erforderlich. Anhand der Demo-Versionen kann man bereits eigene Webseiten erstellen und dabei lernen, das System zu nutzen.</p>\r\n\r\n	<p><a href=\"?article_id=5\">zurÜck</a></p></div>','FAQ Welche Kenntnisse brauche ich, um mit REDAXO arbeiten zu kÖnnen? REDAXO basiert auf PHP und Mysql. Kenntnisse in dieser Sprache und im Umgang mit der Datenbank sind zwar zu empfehlen, aber nicht â¦'),
  (38,1,0,'rex_article','','article',1,'','','','',' '),
  (39,2,0,'rex_article','','article',1,'','','','',' '),
  (40,3,0,'rex_article','','article',1,'','','','',' '),
  (41,4,0,'rex_article','','article',1,'','','','',' '),
  (42,5,0,'rex_article','','article',1,'','','','',' '),
  (43,6,0,'rex_article','','article',1,'','','','',' '),
  (45,8,3,'rex_article','','article',1,'','','','',' '),
  (46,9,3,'rex_article','','article',1,'','','','',' '),
  (47,10,3,'rex_article','','article',1,'','','','',' '),
  (48,11,3,'rex_article','','article',1,'','','','',' '),
  (49,14,4,'rex_article','','article',1,'','','','',' '),
  (50,16,4,'rex_article','','article',1,'','','','',' '),
  (51,12,4,'rex_article','','article',1,'','','','',' '),
  (52,13,4,'rex_article','','article',1,'','','','',' '),
  (53,15,5,'rex_article','','article',1,'','','','',' '),
  (54,17,5,'rex_article','','article',1,'','','','',' '),
  (55,18,5,'rex_article','','article',1,'','','','',' '),
  (56,19,5,'rex_article','','article',1,'','','','',' '),
  (57,20,5,'rex_article','','article',1,'','','','',' '),
  (185,23,26,'rex_article','','article',0,'','','RexSEo Test Formular: \r\n \r\n * Vorname \r\n \r\n \r\n \r\n * Nachname \r\n \r\n \r\n \r\n * Email \r\n \r\n \r\n \r\n * Nachricht \r\n \r\n \r\n \r\n \r\n \r\n normalartikel-level2','<div id=\"rex-xform\" class=\"xform\"><form action=\"/redaxo/de/rexseo-tests/xform-test.html\" method=\"post\" id=\"form_formular\" enctype=\"multipart/form-data\"><p style=\"display:none;\"><input type=\"hidden\" name=\"article_id\" value=\"23\" /><input type=\"hidden\" name=\"clang\" value=\"0\" /><input type=\"hidden\" name=\"FORM[formular][formularsend]\" value=\"1\" /></p>\r\n			<fieldset class=\"rexseo-test-formular\" >\r\n			<legend>RexSEo Test Formular:</legend>\r\n			<p class=\"formtext formlabel-vorname\">\r\n				<label class=\"text \" for=\"el_1\" >* Vorname</label>\r\n				<input type=\"text\" class=\"text \" name=\"FORM[formular][el_1]\" id=\"el_1\" value=\"\" />\r\n			</p>\r\n			<p class=\"formtext formlabel-name\">\r\n				<label class=\"text \" for=\"el_3\" >* Nachname</label>\r\n				<input type=\"text\" class=\"text \" name=\"FORM[formular][el_3]\" id=\"el_3\" value=\"\" />\r\n			</p>\r\n			<p class=\"formtext formlabel-usr_email\">\r\n				<label class=\"text \" for=\"el_5\" >* Email</label>\r\n				<input type=\"text\" class=\"text \" name=\"FORM[formular][el_5]\" id=\"el_5\" value=\"\" />\r\n			</p>\r\n		<p class=\"formtextarea\">\r\n			<label class=\"textarea \" for=\"el_7\" >* Nachricht</label>\r\n			<textarea class=\"textarea \" name=\"FORM[formular][el_7]\" id=\"el_7\" cols=\"80\" rows=\"10\"></textarea>\r\n		</p>\r\n				<p class=\"formsubmit formlabel-submit\">\r\n				<input type=\"submit\" class=\"submit \" name=\"FORM[formular][el_12]\" id=\"el_12\" value=\"Anfrage abschicken\" />\r\n				</p></fieldset></form>\r\n			</div><a href=\"/redaxo/de/rexseo-tests/xform-test/normalartikel-level2.html\" class=\"faq\">normalartikel-level2</a><br />','RexSEo Test Formular: * Vorname * Nachname * Email * Nachricht normalartikel-level2 '),
  (186,24,23,'rex_article','','article',0,'','','','',' '),
  (188,26,0,'rex_article','','article',0,'','','','',' '),
  (184,22,21,'rex_article','','article',0,'','','$_REQUEST: \r\narray(6) {\r\n [\"page\"]=>\r\n string(9) \"structure\"\r\n [\"category_id\"]=>\r\n string(1) \"0\"\r\n [\"edit_id\"]=>\r\n string(2) \"26\"\r\n [\"function\"]=>\r\n string(6) \"status\"\r\n [\"clang\"]=>\r\n string(1) \"0\"\r\n [\"PHPSESSID\"]=>\r\n string(32) \"0c0884e7fc18db6f701316809819f2dc\"\r\n}','<h1>$_REQUEST:</h1><pre>array(6) {\r\n  [\"page\"]=>\r\n  string(9) \"structure\"\r\n  [\"category_id\"]=>\r\n  string(1) \"0\"\r\n  [\"edit_id\"]=>\r\n  string(2) \"26\"\r\n  [\"function\"]=>\r\n  string(6) \"status\"\r\n  [\"clang\"]=>\r\n  string(1) \"0\"\r\n  [\"PHPSESSID\"]=>\r\n  string(32) \"0c0884e7fc18db6f701316809819f2dc\"\r\n}\r\n</pre>','$_REQUEST: array(6) { [\"page\"]=> string(9) \"structure\" [\"category_id\"]=> string(1) \"0\" [\"edit_id\"]=> string(2) \"26\" [\"function\"]=> string(6) \"status\" [\"clang\"]=> string(1) \"0\" [\"PHPSESSID\"]=> '),
  (478,27,26,'rex_article','','article',0,'','','Metadaten-Test Startartikel \r\n Weitere Artikel: Metadaten-Test-Normalartikel','<div class=\"team\">	<h1>Metadaten-Test Startartikel</h1>\r\n\r\n	<p>Weitere Artikel:</p></div><a href=\"/redaxo/de/rexseo-tests/metadaten-test/metadaten-test-normalartikel.html\" class=\"faq\">Metadaten-Test-Normalartikel</a><br />','Metadaten-Test Startartikel Weitere Artikel: Metadaten-Test-Normalartikel '),
  (479,28,27,'rex_article','','article',0,'','','Metadaten-Test Normalartikel','<div class=\"team\">	<h1>Metadaten-Test Normalartikel</h1></div>','Metadaten-Test Normalartikel '),
  (640,25,0,'rex_article','','article',0,'','',404,'<h1>404</h1><PHP\r\n\r\nvar_dump($_REQUEST);\r\n\r\n?>','404 '),
  (646,21,26,'rex_article','','article',0,'','','Textile links \r\n redaxo markup sans params \r\n &quot;redaxo markup sans params&quot;:redaxø://22\r\n \r\n redaxo markup + params \r\n &quot;redaxo markup + params&quot;:redaxø://22?foo=bar&amp;blah=33\r\n \r\n index.php markup + params \r\n &quot;index.php markup + params&quot;:index.php?article_id=22&amp;foo=bar&amp;blah=33\r\n rex_getUrl \r\n \r\n.rex_getUrl(22,0,array(\"foo\"=>\"bar\",\"blah\"=>33)).\r\n \r\n rex_getUrl startartikel mit params \r\n \r\n.rex_getUrl($REX[\"START_ARTICLE_ID\"],0,array(\"foo\"=>\"bar\",\"blah\"=>33)).\r\n \r\n rex_getUrl startartikel sans params \r\n \r\n.rex_getUrl($REX[\"START_ARTICLE_ID\"],0).','<div class=\"team\">	<h1>Textile links</h1>\r\n\r\n	<h3><a href=\"de/rexseo-tests/parameter/zielseite.html\">redaxo markup sans params</a></h3>\r\n\r\n<pre><code>&quot;redaxo markup sans params&quot;:redaxø://22\r\n</code></pre>\r\n\r\n	<h3><a href=\"de/rexseo-tests/parameter/zielseite.html?foo=bar&amp;blah=33\">redaxo markup + params</a></h3>\r\n\r\n<pre><code>&quot;redaxo markup + params&quot;:redaxø://22?foo=bar&amp;blah=33\r\n</code></pre>\r\n\r\n	<h3><a href=\"index.php?article_id=22&amp;foo=bar&amp;blah=33\">index.php markup + params</a></h3>\r\n\r\n<pre><code>&quot;index.php markup + params&quot;:index.php?article_id=22&amp;foo=bar&amp;blah=33\r\n</code></pre></div><h1>rex_getUrl</h1><h3>\r\n<a href=\"/redaxo/de/rexseo-tests/parameter/zielseite.html++/foo/bar/blah/33/\">\r\n.rex_getUrl(22,0,array(\"foo\"=>\"bar\",\"blah\"=>33)).\r\n</a>\r\n</h3><h1>rex_getUrl startartikel mit params</h1><h3>\r\n<a href=\"/redaxo/++/foo/bar/blah/33/\">\r\n.rex_getUrl($REX[\"START_ARTICLE_ID\"],0,array(\"foo\"=>\"bar\",\"blah\"=>33)).\r\n</a>\r\n</h3><h1>rex_getUrl startartikel sans params</h1><h3>\r\n<a href=\"/redaxo/\">\r\n.rex_getUrl($REX[\"START_ARTICLE_ID\"],0).\r\n</a>\r\n</h3>','Textile links redaxo markup sans params &quot;redaxo markup sans params&quot;:redaxø://22 redaxo markup + params &quot;redaxo markup + params&quot;:redaxø://22?foo=bar&amp;blah=33 index.php markup + ');
/*!40000 ALTER TABLE `rex_587_searchindex` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_62_params`;
CREATE TABLE `rex_62_params` (
  `field_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `prior` int(10) unsigned NOT NULL,
  `attributes` text NOT NULL,
  `type` int(10) unsigned DEFAULT NULL,
  `default` varchar(255) NOT NULL,
  `params` text,
  `validate` text,
  `restrictions` text NOT NULL,
  `createuser` varchar(255) NOT NULL,
  `createdate` int(11) NOT NULL,
  `updateuser` varchar(255) NOT NULL,
  `updatedate` int(11) NOT NULL,
  PRIMARY KEY (`field_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

LOCK TABLES `rex_62_params` WRITE;
/*!40000 ALTER TABLE `rex_62_params` DISABLE KEYS */;
INSERT INTO `rex_62_params` VALUES 
  (1,'translate:pool_file_description','med_description',1,'',2,'','','','','admin',1189343866,'admin',1189344596),
  (2,'translate:pool_file_copyright','med_copyright',2,'',1,'','','','','admin',1189343877,'admin',1189344617),
  (3,'translate:online_from','art_online_from',1,'',10,'','','','','admin',1189344934,'admin',1189344934),
  (4,'translate:online_to','art_online_to',2,'',10,'','','','','admin',1189344947,'admin',1189344947),
  (5,'translate:description','art_description',3,'',2,'','','','','admin',1189345025,'admin',1189345025),
  (6,'translate:keywords','art_keywords',4,'',2,'','','','','admin',1189345068,'admin',1189345068),
  (7,'translate:metadata_image','art_file',5,'',6,'','','','','admin',1189345109,'admin',1189345109),
  (8,'translate:teaser','art_teaser',6,'',5,'','','','','admin',1189345182,'admin',1189345182),
  (9,'translate:header_article_type','art_type_id',7,'size=1',3,'','Standard|Zugriff f?r alle','','','admin',1191963797,'admin',1191964038),
  (24,'Google Sitemap Priority','art_rexseo_priority',11,'',3,'',':Automatisch berechnen|1.00:1.00|0.80:0.80|0.64:0.64|0.51:0.51|0.33:0.33|0.00:0.00','','','j3ff3',1296649158,'j3ff3',1296649158),
  (25,'Manuelle Canonical URL','art_rexseo_canonicalurl',12,'',1,'','','','','j3ff3',1296652252,'j3ff3',1296652252),
  (23,'Page Title','art_rexseo_title',10,'',1,'','','','','j3ff3',1296649158,'j3ff3',1296649158),
  (20,'RexSEO Einstellungen','art_rexseo_legend',8,'',12,'','','','','j3ff3',1296649158,'j3ff3',1296649158),
  (21,'Manuelle URL','art_rexseo_url',9,'',1,'','','','','j3ff3',1296649158,'j3ff3',1296649158);
/*!40000 ALTER TABLE `rex_62_params` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_62_type`;
CREATE TABLE `rex_62_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `dbtype` varchar(255) NOT NULL,
  `dblength` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

LOCK TABLES `rex_62_type` WRITE;
/*!40000 ALTER TABLE `rex_62_type` DISABLE KEYS */;
INSERT INTO `rex_62_type` VALUES 
  (1,'text','text',0),
  (2,'textarea','text',0),
  (3,'select','varchar',255),
  (4,'radio','varchar',255),
  (5,'checkbox','varchar',255),
  (10,'date','text',0),
  (13,'time','text',0),
  (11,'datetime','text',0),
  (12,'legend','text',0),
  (6,'REX_MEDIA_BUTTON','varchar',255),
  (7,'REX_MEDIALIST_BUTTON','text',0),
  (8,'REX_LINK_BUTTON','varchar',255),
  (9,'REX_LINKLIST_BUTTON','text',0);
/*!40000 ALTER TABLE `rex_62_type` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_630_cronjobs`;
CREATE TABLE `rex_630_cronjobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `parameters` text,
  `interval` varchar(255) DEFAULT NULL,
  `nexttime` int(11) DEFAULT '0',
  `environment` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createdate` int(11) NOT NULL,
  `createuser` varchar(255) NOT NULL,
  `updatedate` int(11) NOT NULL,
  `updateuser` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `rex_630_cronjobs` WRITE;
/*!40000 ALTER TABLE `rex_630_cronjobs` DISABLE KEYS */;
INSERT INTO `rex_630_cronjobs` VALUES 
  (1,'Artikel-Status','rex_cronjob_article_status','a:0:{}','|1|d|',1290121200,'|0|1|',1,1280343116,'j3ff3',1280343141,'j3ff3'),
  (2,'Tabellen-Optimierung','rex_cronjob_optimize_tables','a:0:{}','|1|d|',1290121200,'|0|1|',1,1280343123,'j3ff3',1280343149,'j3ff3');
/*!40000 ALTER TABLE `rex_630_cronjobs` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_679_type_effects`;
CREATE TABLE `rex_679_type_effects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `effect` varchar(255) NOT NULL,
  `parameters` text NOT NULL,
  `prior` int(11) NOT NULL,
  `updatedate` int(11) NOT NULL,
  `updateuser` varchar(255) NOT NULL,
  `createdate` int(11) NOT NULL,
  `createuser` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

LOCK TABLES `rex_679_type_effects` WRITE;
/*!40000 ALTER TABLE `rex_679_type_effects` DISABLE KEYS */;
INSERT INTO `rex_679_type_effects` VALUES 
  (1,1,'resize','a:6:{s:15:\"rex_effect_crop\";a:5:{s:21:\"rex_effect_crop_width\";s:0:\"\";s:22:\"rex_effect_crop_height\";s:0:\"\";s:28:\"rex_effect_crop_offset_width\";s:0:\"\";s:29:\"rex_effect_crop_offset_height\";s:0:\"\";s:24:\"rex_effect_crop_position\";s:13:\"middle_center\";}s:22:\"rex_effect_filter_blur\";a:3:{s:29:\"rex_effect_filter_blur_amount\";s:2:\"80\";s:29:\"rex_effect_filter_blur_radius\";s:1:\"8\";s:32:\"rex_effect_filter_blur_threshold\";s:1:\"3\";}s:25:\"rex_effect_filter_sharpen\";a:3:{s:32:\"rex_effect_filter_sharpen_amount\";s:2:\"80\";s:32:\"rex_effect_filter_sharpen_radius\";s:3:\"0.5\";s:35:\"rex_effect_filter_sharpen_threshold\";s:1:\"3\";}s:15:\"rex_effect_flip\";a:1:{s:20:\"rex_effect_flip_flip\";s:1:\"X\";}s:23:\"rex_effect_insert_image\";a:5:{s:34:\"rex_effect_insert_image_brandimage\";s:0:\"\";s:28:\"rex_effect_insert_image_hpos\";s:5:\"right\";s:28:\"rex_effect_insert_image_vpos\";s:6:\"bottom\";s:33:\"rex_effect_insert_image_padding_x\";s:3:\"-10\";s:33:\"rex_effect_insert_image_padding_y\";s:3:\"-10\";}s:17:\"rex_effect_resize\";a:4:{s:23:\"rex_effect_resize_width\";s:3:\"200\";s:24:\"rex_effect_resize_height\";s:3:\"200\";s:23:\"rex_effect_resize_style\";s:7:\"maximum\";s:31:\"rex_effect_resize_allow_enlarge\";s:11:\"not_enlarge\";}}',1,0,'',0,''),
  (2,2,'resize','a:6:{s:15:\"rex_effect_crop\";a:5:{s:21:\"rex_effect_crop_width\";s:0:\"\";s:22:\"rex_effect_crop_height\";s:0:\"\";s:28:\"rex_effect_crop_offset_width\";s:0:\"\";s:29:\"rex_effect_crop_offset_height\";s:0:\"\";s:24:\"rex_effect_crop_position\";s:13:\"middle_center\";}s:22:\"rex_effect_filter_blur\";a:3:{s:29:\"rex_effect_filter_blur_amount\";s:2:\"80\";s:29:\"rex_effect_filter_blur_radius\";s:1:\"8\";s:32:\"rex_effect_filter_blur_threshold\";s:1:\"3\";}s:25:\"rex_effect_filter_sharpen\";a:3:{s:32:\"rex_effect_filter_sharpen_amount\";s:2:\"80\";s:32:\"rex_effect_filter_sharpen_radius\";s:3:\"0.5\";s:35:\"rex_effect_filter_sharpen_threshold\";s:1:\"3\";}s:15:\"rex_effect_flip\";a:1:{s:20:\"rex_effect_flip_flip\";s:1:\"X\";}s:23:\"rex_effect_insert_image\";a:5:{s:34:\"rex_effect_insert_image_brandimage\";s:0:\"\";s:28:\"rex_effect_insert_image_hpos\";s:5:\"right\";s:28:\"rex_effect_insert_image_vpos\";s:6:\"bottom\";s:33:\"rex_effect_insert_image_padding_x\";s:3:\"-10\";s:33:\"rex_effect_insert_image_padding_y\";s:3:\"-10\";}s:17:\"rex_effect_resize\";a:4:{s:23:\"rex_effect_resize_width\";s:3:\"600\";s:24:\"rex_effect_resize_height\";s:3:\"600\";s:23:\"rex_effect_resize_style\";s:7:\"maximum\";s:31:\"rex_effect_resize_allow_enlarge\";s:11:\"not_enlarge\";}}',1,0,'',0,''),
  (3,3,'resize','a:6:{s:15:\"rex_effect_crop\";a:5:{s:21:\"rex_effect_crop_width\";s:0:\"\";s:22:\"rex_effect_crop_height\";s:0:\"\";s:28:\"rex_effect_crop_offset_width\";s:0:\"\";s:29:\"rex_effect_crop_offset_height\";s:0:\"\";s:24:\"rex_effect_crop_position\";s:13:\"middle_center\";}s:22:\"rex_effect_filter_blur\";a:3:{s:29:\"rex_effect_filter_blur_amount\";s:2:\"80\";s:29:\"rex_effect_filter_blur_radius\";s:1:\"8\";s:32:\"rex_effect_filter_blur_threshold\";s:1:\"3\";}s:25:\"rex_effect_filter_sharpen\";a:3:{s:32:\"rex_effect_filter_sharpen_amount\";s:2:\"80\";s:32:\"rex_effect_filter_sharpen_radius\";s:3:\"0.5\";s:35:\"rex_effect_filter_sharpen_threshold\";s:1:\"3\";}s:15:\"rex_effect_flip\";a:1:{s:20:\"rex_effect_flip_flip\";s:1:\"X\";}s:23:\"rex_effect_insert_image\";a:5:{s:34:\"rex_effect_insert_image_brandimage\";s:0:\"\";s:28:\"rex_effect_insert_image_hpos\";s:5:\"right\";s:28:\"rex_effect_insert_image_vpos\";s:6:\"bottom\";s:33:\"rex_effect_insert_image_padding_x\";s:3:\"-10\";s:33:\"rex_effect_insert_image_padding_y\";s:3:\"-10\";}s:17:\"rex_effect_resize\";a:4:{s:23:\"rex_effect_resize_width\";s:2:\"80\";s:24:\"rex_effect_resize_height\";s:2:\"80\";s:23:\"rex_effect_resize_style\";s:7:\"maximum\";s:31:\"rex_effect_resize_allow_enlarge\";s:11:\"not_enlarge\";}}',1,0,'',0,''),
  (4,4,'resize','a:6:{s:15:\"rex_effect_crop\";a:5:{s:21:\"rex_effect_crop_width\";s:0:\"\";s:22:\"rex_effect_crop_height\";s:0:\"\";s:28:\"rex_effect_crop_offset_width\";s:0:\"\";s:29:\"rex_effect_crop_offset_height\";s:0:\"\";s:24:\"rex_effect_crop_position\";s:13:\"middle_center\";}s:22:\"rex_effect_filter_blur\";a:3:{s:29:\"rex_effect_filter_blur_amount\";s:2:\"80\";s:29:\"rex_effect_filter_blur_radius\";s:1:\"8\";s:32:\"rex_effect_filter_blur_threshold\";s:1:\"3\";}s:25:\"rex_effect_filter_sharpen\";a:3:{s:32:\"rex_effect_filter_sharpen_amount\";s:2:\"80\";s:32:\"rex_effect_filter_sharpen_radius\";s:3:\"0.5\";s:35:\"rex_effect_filter_sharpen_threshold\";s:1:\"3\";}s:15:\"rex_effect_flip\";a:1:{s:20:\"rex_effect_flip_flip\";s:1:\"X\";}s:23:\"rex_effect_insert_image\";a:5:{s:34:\"rex_effect_insert_image_brandimage\";s:0:\"\";s:28:\"rex_effect_insert_image_hpos\";s:5:\"right\";s:28:\"rex_effect_insert_image_vpos\";s:6:\"bottom\";s:33:\"rex_effect_insert_image_padding_x\";s:3:\"-10\";s:33:\"rex_effect_insert_image_padding_y\";s:3:\"-10\";}s:17:\"rex_effect_resize\";a:4:{s:23:\"rex_effect_resize_width\";s:3:\"246\";s:24:\"rex_effect_resize_height\";s:3:\"246\";s:23:\"rex_effect_resize_style\";s:7:\"maximum\";s:31:\"rex_effect_resize_allow_enlarge\";s:11:\"not_enlarge\";}}',1,0,'',0,''),
  (5,5,'resize','a:6:{s:15:\"rex_effect_crop\";a:5:{s:21:\"rex_effect_crop_width\";s:0:\"\";s:22:\"rex_effect_crop_height\";s:0:\"\";s:28:\"rex_effect_crop_offset_width\";s:0:\"\";s:29:\"rex_effect_crop_offset_height\";s:0:\"\";s:24:\"rex_effect_crop_position\";s:13:\"middle_center\";}s:22:\"rex_effect_filter_blur\";a:3:{s:29:\"rex_effect_filter_blur_amount\";s:2:\"80\";s:29:\"rex_effect_filter_blur_radius\";s:1:\"8\";s:32:\"rex_effect_filter_blur_threshold\";s:1:\"3\";}s:25:\"rex_effect_filter_sharpen\";a:3:{s:32:\"rex_effect_filter_sharpen_amount\";s:2:\"80\";s:32:\"rex_effect_filter_sharpen_radius\";s:3:\"0.5\";s:35:\"rex_effect_filter_sharpen_threshold\";s:1:\"3\";}s:15:\"rex_effect_flip\";a:1:{s:20:\"rex_effect_flip_flip\";s:1:\"X\";}s:23:\"rex_effect_insert_image\";a:5:{s:34:\"rex_effect_insert_image_brandimage\";s:0:\"\";s:28:\"rex_effect_insert_image_hpos\";s:5:\"right\";s:28:\"rex_effect_insert_image_vpos\";s:6:\"bottom\";s:33:\"rex_effect_insert_image_padding_x\";s:3:\"-10\";s:33:\"rex_effect_insert_image_padding_y\";s:3:\"-10\";}s:17:\"rex_effect_resize\";a:4:{s:23:\"rex_effect_resize_width\";s:3:\"246\";s:24:\"rex_effect_resize_height\";s:3:\"246\";s:23:\"rex_effect_resize_style\";s:7:\"maximum\";s:31:\"rex_effect_resize_allow_enlarge\";s:11:\"not_enlarge\";}}',1,0,'',0,''),
  (6,6,'resize','a:6:{s:15:\"rex_effect_crop\";a:5:{s:21:\"rex_effect_crop_width\";s:0:\"\";s:22:\"rex_effect_crop_height\";s:0:\"\";s:28:\"rex_effect_crop_offset_width\";s:0:\"\";s:29:\"rex_effect_crop_offset_height\";s:0:\"\";s:24:\"rex_effect_crop_position\";s:13:\"middle_center\";}s:22:\"rex_effect_filter_blur\";a:3:{s:29:\"rex_effect_filter_blur_amount\";s:2:\"80\";s:29:\"rex_effect_filter_blur_radius\";s:1:\"8\";s:32:\"rex_effect_filter_blur_threshold\";s:1:\"3\";}s:25:\"rex_effect_filter_sharpen\";a:3:{s:32:\"rex_effect_filter_sharpen_amount\";s:2:\"80\";s:32:\"rex_effect_filter_sharpen_radius\";s:3:\"0.5\";s:35:\"rex_effect_filter_sharpen_threshold\";s:1:\"3\";}s:15:\"rex_effect_flip\";a:1:{s:20:\"rex_effect_flip_flip\";s:1:\"X\";}s:23:\"rex_effect_insert_image\";a:5:{s:34:\"rex_effect_insert_image_brandimage\";s:0:\"\";s:28:\"rex_effect_insert_image_hpos\";s:5:\"right\";s:28:\"rex_effect_insert_image_vpos\";s:6:\"bottom\";s:33:\"rex_effect_insert_image_padding_x\";s:3:\"-10\";s:33:\"rex_effect_insert_image_padding_y\";s:3:\"-10\";}s:17:\"rex_effect_resize\";a:4:{s:23:\"rex_effect_resize_width\";s:3:\"250\";s:24:\"rex_effect_resize_height\";s:0:\"\";s:23:\"rex_effect_resize_style\";s:7:\"maximum\";s:31:\"rex_effect_resize_allow_enlarge\";s:11:\"not_enlarge\";}}',1,0,'',0,''),
  (7,7,'filter_apng','a:7:{s:15:\"rex_effect_crop\";a:5:{s:21:\"rex_effect_crop_width\";s:0:\"\";s:22:\"rex_effect_crop_height\";s:0:\"\";s:28:\"rex_effect_crop_offset_width\";s:0:\"\";s:29:\"rex_effect_crop_offset_height\";s:0:\"\";s:24:\"rex_effect_crop_position\";s:13:\"middle_center\";}s:22:\"rex_effect_filter_apng\";a:1:{s:27:\"rex_effect_filter_apng_rgba\";s:13:\"127,200,27,63\";}s:22:\"rex_effect_filter_blur\";a:3:{s:29:\"rex_effect_filter_blur_amount\";s:2:\"80\";s:29:\"rex_effect_filter_blur_radius\";s:1:\"8\";s:32:\"rex_effect_filter_blur_threshold\";s:1:\"3\";}s:25:\"rex_effect_filter_sharpen\";a:3:{s:32:\"rex_effect_filter_sharpen_amount\";s:2:\"80\";s:32:\"rex_effect_filter_sharpen_radius\";s:3:\"0.5\";s:35:\"rex_effect_filter_sharpen_threshold\";s:1:\"3\";}s:15:\"rex_effect_flip\";a:1:{s:20:\"rex_effect_flip_flip\";s:1:\"X\";}s:23:\"rex_effect_insert_image\";a:5:{s:34:\"rex_effect_insert_image_brandimage\";s:0:\"\";s:28:\"rex_effect_insert_image_hpos\";s:5:\"right\";s:28:\"rex_effect_insert_image_vpos\";s:6:\"bottom\";s:33:\"rex_effect_insert_image_padding_x\";s:3:\"-10\";s:33:\"rex_effect_insert_image_padding_y\";s:3:\"-10\";}s:17:\"rex_effect_resize\";a:4:{s:23:\"rex_effect_resize_width\";s:0:\"\";s:24:\"rex_effect_resize_height\";s:0:\"\";s:23:\"rex_effect_resize_style\";s:7:\"maximum\";s:31:\"rex_effect_resize_allow_enlarge\";s:7:\"enlarge\";}}',1,1288576593,'j3ff3',1288574351,'j3ff3'),
  (8,8,'rex_resize','a:7:{s:15:\"rex_effect_crop\";a:5:{s:21:\"rex_effect_crop_width\";s:0:\"\";s:22:\"rex_effect_crop_height\";s:0:\"\";s:28:\"rex_effect_crop_offset_width\";s:0:\"\";s:29:\"rex_effect_crop_offset_height\";s:0:\"\";s:24:\"rex_effect_crop_position\";s:13:\"middle_center\";}s:22:\"rex_effect_filter_blur\";a:3:{s:29:\"rex_effect_filter_blur_amount\";s:2:\"80\";s:29:\"rex_effect_filter_blur_radius\";s:1:\"8\";s:32:\"rex_effect_filter_blur_threshold\";s:1:\"3\";}s:25:\"rex_effect_filter_sharpen\";a:3:{s:32:\"rex_effect_filter_sharpen_amount\";s:2:\"80\";s:32:\"rex_effect_filter_sharpen_radius\";s:3:\"0.5\";s:35:\"rex_effect_filter_sharpen_threshold\";s:1:\"3\";}s:15:\"rex_effect_flip\";a:1:{s:20:\"rex_effect_flip_flip\";s:1:\"X\";}s:23:\"rex_effect_insert_image\";a:5:{s:34:\"rex_effect_insert_image_brandimage\";s:0:\"\";s:28:\"rex_effect_insert_image_hpos\";s:5:\"right\";s:28:\"rex_effect_insert_image_vpos\";s:6:\"bottom\";s:33:\"rex_effect_insert_image_padding_x\";s:3:\"-10\";s:33:\"rex_effect_insert_image_padding_y\";s:3:\"-10\";}s:17:\"rex_effect_resize\";a:4:{s:23:\"rex_effect_resize_width\";s:0:\"\";s:24:\"rex_effect_resize_height\";s:0:\"\";s:23:\"rex_effect_resize_style\";s:7:\"maximum\";s:31:\"rex_effect_resize_allow_enlarge\";s:7:\"enlarge\";}s:21:\"rex_effect_rex_resize\";a:1:{s:26:\"rex_effect_rex_resize_rgba\";s:14:\"127,127,127,63\";}}',1,1289404964,'j3ff3',1289404964,'j3ff3'),
  (11,10,'filter_sepia','a:6:{s:15:\"rex_effect_crop\";a:5:{s:21:\"rex_effect_crop_width\";s:0:\"\";s:22:\"rex_effect_crop_height\";s:0:\"\";s:28:\"rex_effect_crop_offset_width\";s:0:\"\";s:29:\"rex_effect_crop_offset_height\";s:0:\"\";s:24:\"rex_effect_crop_position\";s:13:\"middle_center\";}s:22:\"rex_effect_filter_blur\";a:3:{s:29:\"rex_effect_filter_blur_amount\";s:2:\"80\";s:29:\"rex_effect_filter_blur_radius\";s:1:\"8\";s:32:\"rex_effect_filter_blur_threshold\";s:1:\"3\";}s:25:\"rex_effect_filter_sharpen\";a:3:{s:32:\"rex_effect_filter_sharpen_amount\";s:2:\"80\";s:32:\"rex_effect_filter_sharpen_radius\";s:3:\"0.5\";s:35:\"rex_effect_filter_sharpen_threshold\";s:1:\"3\";}s:15:\"rex_effect_flip\";a:1:{s:20:\"rex_effect_flip_flip\";s:1:\"X\";}s:23:\"rex_effect_insert_image\";a:5:{s:34:\"rex_effect_insert_image_brandimage\";s:0:\"\";s:28:\"rex_effect_insert_image_hpos\";s:5:\"right\";s:28:\"rex_effect_insert_image_vpos\";s:6:\"bottom\";s:33:\"rex_effect_insert_image_padding_x\";s:3:\"-10\";s:33:\"rex_effect_insert_image_padding_y\";s:3:\"-10\";}s:17:\"rex_effect_resize\";a:4:{s:23:\"rex_effect_resize_width\";s:0:\"\";s:24:\"rex_effect_resize_height\";s:0:\"\";s:23:\"rex_effect_resize_style\";s:7:\"maximum\";s:31:\"rex_effect_resize_allow_enlarge\";s:7:\"enlarge\";}}',1,1289489552,'j3ff3',1289489552,'j3ff3'),
  (20,11,'roundcorners','a:9:{s:15:\"rex_effect_crop\";a:6:{s:21:\"rex_effect_crop_width\";s:0:\"\";s:22:\"rex_effect_crop_height\";s:0:\"\";s:28:\"rex_effect_crop_offset_width\";s:0:\"\";s:29:\"rex_effect_crop_offset_height\";s:0:\"\";s:20:\"rex_effect_crop_hpos\";s:6:\"center\";s:20:\"rex_effect_crop_vpos\";s:6:\"middle\";}s:22:\"rex_effect_filter_blur\";a:3:{s:29:\"rex_effect_filter_blur_amount\";s:2:\"80\";s:29:\"rex_effect_filter_blur_radius\";s:1:\"8\";s:32:\"rex_effect_filter_blur_threshold\";s:1:\"3\";}s:25:\"rex_effect_filter_sharpen\";a:3:{s:32:\"rex_effect_filter_sharpen_amount\";s:2:\"80\";s:32:\"rex_effect_filter_sharpen_radius\";s:3:\"0.5\";s:35:\"rex_effect_filter_sharpen_threshold\";s:1:\"3\";}s:15:\"rex_effect_flip\";a:1:{s:20:\"rex_effect_flip_flip\";s:1:\"X\";}s:23:\"rex_effect_insert_image\";a:5:{s:34:\"rex_effect_insert_image_brandimage\";s:0:\"\";s:28:\"rex_effect_insert_image_hpos\";s:4:\"left\";s:28:\"rex_effect_insert_image_vpos\";s:3:\"top\";s:33:\"rex_effect_insert_image_padding_x\";s:3:\"-10\";s:33:\"rex_effect_insert_image_padding_y\";s:3:\"-10\";}s:17:\"rex_effect_mirror\";a:5:{s:24:\"rex_effect_mirror_height\";s:0:\"\";s:33:\"rex_effect_mirror_set_transparent\";s:7:\"colored\";s:22:\"rex_effect_mirror_bg_r\";s:0:\"\";s:22:\"rex_effect_mirror_bg_g\";s:0:\"\";s:22:\"rex_effect_mirror_bg_b\";s:0:\"\";}s:17:\"rex_effect_resize\";a:4:{s:23:\"rex_effect_resize_width\";s:0:\"\";s:24:\"rex_effect_resize_height\";s:0:\"\";s:23:\"rex_effect_resize_style\";s:7:\"maximum\";s:31:\"rex_effect_resize_allow_enlarge\";s:7:\"enlarge\";}s:23:\"rex_effect_roundcorners\";a:4:{s:30:\"rex_effect_roundcorners_radius\";s:2:\"20\";s:36:\"rex_effect_roundcorners_transparency\";s:3:\"127\";s:29:\"rex_effect_roundcorners_color\";s:6:\"ffffff\";s:34:\"rex_effect_roundcorners_conversion\";s:27:\"JPG->PNG @ transparency 127\";}s:20:\"rex_effect_workspace\";a:8:{s:26:\"rex_effect_workspace_width\";s:0:\"\";s:27:\"rex_effect_workspace_height\";s:0:\"\";s:25:\"rex_effect_workspace_hpos\";s:4:\"left\";s:25:\"rex_effect_workspace_vpos\";s:3:\"top\";s:36:\"rex_effect_workspace_set_transparent\";s:7:\"colored\";s:25:\"rex_effect_workspace_bg_r\";s:0:\"\";s:25:\"rex_effect_workspace_bg_g\";s:0:\"\";s:25:\"rex_effect_workspace_bg_b\";s:0:\"\";}}',1,1298512444,'j3ff3',1298512357,'j3ff3'),
  (25,9,'background','a:10:{s:21:\"rex_effect_background\";a:16:{s:24:\"rex_effect_background_sh\";s:9:\"rectangle\";s:23:\"rex_effect_background_o\";s:8:\"top-left\";s:24:\"rex_effect_background_si\";s:5:\"right\";s:24:\"rex_effect_background_aa\";s:1:\"0\";s:23:\"rex_effect_background_f\";s:3:\"png\";s:23:\"rex_effect_background_r\";s:2:\"20\";s:23:\"rex_effect_background_w\";s:3:\"400\";s:23:\"rex_effect_background_h\";s:3:\"300\";s:25:\"rex_effect_background_fgc\";s:6:\"2ba3e3\";s:25:\"rex_effect_background_fgo\";s:2:\"50\";s:25:\"rex_effect_background_bgc\";s:6:\"ff0000\";s:25:\"rex_effect_background_bgo\";s:1:\"0\";s:24:\"rex_effect_background_bw\";s:1:\"1\";s:24:\"rex_effect_background_bc\";s:6:\"000000\";s:24:\"rex_effect_background_bo\";s:3:\"100\";s:24:\"rex_effect_background_tc\";s:6:\"FFFFFF\";}s:15:\"rex_effect_crop\";a:6:{s:21:\"rex_effect_crop_width\";s:0:\"\";s:22:\"rex_effect_crop_height\";s:0:\"\";s:28:\"rex_effect_crop_offset_width\";s:0:\"\";s:29:\"rex_effect_crop_offset_height\";s:0:\"\";s:20:\"rex_effect_crop_hpos\";s:6:\"center\";s:20:\"rex_effect_crop_vpos\";s:6:\"middle\";}s:22:\"rex_effect_filter_blur\";a:3:{s:29:\"rex_effect_filter_blur_amount\";s:2:\"80\";s:29:\"rex_effect_filter_blur_radius\";s:1:\"8\";s:32:\"rex_effect_filter_blur_threshold\";s:1:\"3\";}s:25:\"rex_effect_filter_sharpen\";a:3:{s:32:\"rex_effect_filter_sharpen_amount\";s:2:\"80\";s:32:\"rex_effect_filter_sharpen_radius\";s:3:\"0.5\";s:35:\"rex_effect_filter_sharpen_threshold\";s:1:\"3\";}s:15:\"rex_effect_flip\";a:1:{s:20:\"rex_effect_flip_flip\";s:1:\"X\";}s:23:\"rex_effect_insert_image\";a:5:{s:34:\"rex_effect_insert_image_brandimage\";s:0:\"\";s:28:\"rex_effect_insert_image_hpos\";s:4:\"left\";s:28:\"rex_effect_insert_image_vpos\";s:3:\"top\";s:33:\"rex_effect_insert_image_padding_x\";s:3:\"-10\";s:33:\"rex_effect_insert_image_padding_y\";s:3:\"-10\";}s:17:\"rex_effect_mirror\";a:5:{s:24:\"rex_effect_mirror_height\";s:0:\"\";s:33:\"rex_effect_mirror_set_transparent\";s:7:\"colored\";s:22:\"rex_effect_mirror_bg_r\";s:0:\"\";s:22:\"rex_effect_mirror_bg_g\";s:0:\"\";s:22:\"rex_effect_mirror_bg_b\";s:0:\"\";}s:17:\"rex_effect_resize\";a:4:{s:23:\"rex_effect_resize_width\";s:0:\"\";s:24:\"rex_effect_resize_height\";s:0:\"\";s:23:\"rex_effect_resize_style\";s:7:\"maximum\";s:31:\"rex_effect_resize_allow_enlarge\";s:7:\"enlarge\";}s:23:\"rex_effect_roundcorners\";a:4:{s:30:\"rex_effect_roundcorners_radius\";s:2:\"20\";s:36:\"rex_effect_roundcorners_transparency\";s:3:\"127\";s:29:\"rex_effect_roundcorners_color\";s:6:\"ffffff\";s:34:\"rex_effect_roundcorners_conversion\";s:4:\"none\";}s:20:\"rex_effect_workspace\";a:8:{s:26:\"rex_effect_workspace_width\";s:0:\"\";s:27:\"rex_effect_workspace_height\";s:0:\"\";s:25:\"rex_effect_workspace_hpos\";s:4:\"left\";s:25:\"rex_effect_workspace_vpos\";s:3:\"top\";s:36:\"rex_effect_workspace_set_transparent\";s:7:\"colored\";s:25:\"rex_effect_workspace_bg_r\";s:0:\"\";s:25:\"rex_effect_workspace_bg_g\";s:0:\"\";s:25:\"rex_effect_workspace_bg_b\";s:0:\"\";}}',1,1298729774,'j3ff3',1298678449,'j3ff3');
/*!40000 ALTER TABLE `rex_679_type_effects` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_679_types`;
CREATE TABLE `rex_679_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

LOCK TABLES `rex_679_types` WRITE;
/*!40000 ALTER TABLE `rex_679_types` DISABLE KEYS */;
INSERT INTO `rex_679_types` VALUES 
  (1,1,'rex_mediapool_detail','Zur Darstellung von Bildern in der Detailansicht im Medienpool'),
  (2,1,'rex_mediapool_maximized','Zur Darstellung von Bildern im Medienpool wenn maximiert'),
  (3,1,'rex_mediapool_preview','Zur Darstellung der Vorschaubilder im Medienpool'),
  (4,1,'rex_mediabutton_preview','Zur Darstellung der Vorschaubilder in REX_MEDIA_BUTTON[]s'),
  (5,1,'rex_medialistbutton_preview','Zur Darstellung der Vorschaubilder in REX_MEDIALIST_BUTTON[]s'),
  (6,1,'gallery_overview','Zur Anzeige der Screenshot-Gallerie'),
  (10,0,'sepia','nur sepia filter'),
  (9,0,'test',''),
  (11,0,'rounded','');
/*!40000 ALTER TABLE `rex_679_types` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_720_addon_template`;
CREATE TABLE `rex_720_addon_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_1` varchar(255) NOT NULL,
  `field_2` varchar(255) NOT NULL,
  `field_3` varchar(255) NOT NULL,
  `field_4` varchar(255) NOT NULL,
  `field_5` varchar(255) NOT NULL,
  `field_6` varchar(255) NOT NULL,
  `field_7` varchar(255) NOT NULL,
  `field_8` varchar(255) NOT NULL,
  `field_9` varchar(255) NOT NULL,
  `field_10` varchar(255) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `rex_720_addon_template` WRITE;
/*!40000 ALTER TABLE `rex_720_addon_template` DISABLE KEYS */;
INSERT INTO `rex_720_addon_template` VALUES 
  (1,'Erster..','..Datensatz..',0,'|1|blau|','|1|',0,'','','',''),
  (2,'','',1,'','',0,'','','',''),
  (3,'','','evtl','','',0,'','','','');
/*!40000 ALTER TABLE `rex_720_addon_template` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_720_db_manager`;
CREATE TABLE `rex_720_db_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_1` varchar(255) NOT NULL,
  `field_2` varchar(255) NOT NULL,
  `field_3` varchar(255) NOT NULL,
  `field_4` varchar(255) NOT NULL,
  `field_5` varchar(255) NOT NULL,
  `field_6` varchar(255) NOT NULL,
  `field_7` varchar(255) NOT NULL,
  `field_8` varchar(255) NOT NULL,
  `field_9` varchar(255) NOT NULL,
  `field_10` varchar(255) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `rex_720_db_manager` WRITE;
/*!40000 ALTER TABLE `rex_720_db_manager` DISABLE KEYS */;
INSERT INTO `rex_720_db_manager` VALUES 
  (1,'Erster..','..Datensatz..','evtl','|1|blau|','|1|',0,'','','','');
/*!40000 ALTER TABLE `rex_720_db_manager` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_720_urlreplace`;
CREATE TABLE `rex_720_urlreplace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_1` varchar(255) NOT NULL,
  `field_2` varchar(255) NOT NULL,
  `field_3` varchar(255) NOT NULL,
  `field_4` varchar(255) NOT NULL,
  `field_5` varchar(255) NOT NULL,
  `field_6` varchar(255) NOT NULL,
  `field_7` varchar(255) NOT NULL,
  `field_8` varchar(255) NOT NULL,
  `field_9` varchar(255) NOT NULL,
  `field_10` varchar(255) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `rex_720_urlreplace` WRITE;
/*!40000 ALTER TABLE `rex_720_urlreplace` DISABLE KEYS */;
INSERT INTO `rex_720_urlreplace` VALUES 
  (1,'Erster..','..Datensatz..','evtl','|1|blau|','|1|',0,'','','','');
/*!40000 ALTER TABLE `rex_720_urlreplace` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_746_rules`;
CREATE TABLE `rex_746_rules` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL,
  `clang` int(11) DEFAULT NULL,
  `target_intern` int(11) DEFAULT NULL,
  `target_extern` varchar(255) NOT NULL,
  `method` int(1) NOT NULL,
  `ignore` tinyint(1) NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `aid` (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `rex_746_rules` WRITE;
/*!40000 ALTER TABLE `rex_746_rules` DISABLE KEYS */;
INSERT INTO `rex_746_rules` VALUES 
  (1,6,0,0,'http://rexdev.de',0,0),
  (2,1,0,20,'',0,0);
/*!40000 ALTER TABLE `rex_746_rules` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_777_intrusions`;
CREATE TABLE `rex_777_intrusions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `value` text NOT NULL,
  `page` varchar(255) NOT NULL,
  `tags` varchar(128) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `impact` int(11) unsigned NOT NULL,
  `origin` varchar(15) NOT NULL,
  `created` datetime NOT NULL,
  `sticky` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=309 DEFAULT CHARSET=utf8 COMMENT='tableversion:2';

LOCK TABLES `rex_777_intrusions` WRITE;
/*!40000 ALTER TABLE `rex_777_intrusions` DISABLE KEYS */;
INSERT INTO `rex_777_intrusions` VALUES 
  (1,'REQUEST.test','\\\"><script>eval(window.name)</script>','/faq.html?test=%22%3E%3Cscript%3Eeval(window.name)%3C/script%3E','xss, csrf, id, rfe, lfi, sqli','91.201.66.131',36,'127.0.0.1','2010-10-29 15:21:51',1,'xxx'),
  (307,'REQUEST.img_rewrite','{100a__screenshot_content_edit.png}/','/bilder/%7B100a__screenshot_content_edit.png%7D/','xss, csrf, id, rfe, lfi','127.0.0.1',7,'127.0.0.1','2010-11-17 12:29:38',0,''),
  (308,'GET.img_rewrite','{100a__screenshot_content_edit.png}/','/bilder/%7B100a__screenshot_content_edit.png%7D/','xss, csrf, id, rfe, lfi','127.0.0.1',7,'127.0.0.1','2010-11-17 12:29:39',0,'');
/*!40000 ALTER TABLE `rex_777_intrusions` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_822_heatmap`;
CREATE TABLE `rex_822_heatmap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `x` smallint(4) unsigned NOT NULL,
  `y` smallint(4) unsigned NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location` (`location`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

LOCK TABLES `rex_822_heatmap` WRITE;
/*!40000 ALTER TABLE `rex_822_heatmap` DISABLE KEYS */;
INSERT INTO `rex_822_heatmap` VALUES 
  (1,521,484,1),
  (2,480,65,1),
  (3,438,629,1),
  (4,592,448,1),
  (5,544,51,6),
  (6,560,68,6),
  (7,334,83,6),
  (8,634,404,6),
  (9,581,64,6),
  (10,393,66,6),
  (11,649,491,6),
  (12,536,195,1),
  (13,891,691,1),
  (14,267,548,1),
  (15,736,373,1),
  (16,734,434,1),
  (17,614,434,1),
  (18,527,435,1),
  (19,575,442,1),
  (20,611,444,1),
  (21,611,444,1),
  (22,596,526,1),
  (23,596,526,1),
  (24,670,642,1),
  (25,657,599,1),
  (26,615,716,1),
  (27,628,669,1),
  (28,637,705,1),
  (29,626,606,1),
  (30,632,471,1),
  (31,527,672,1),
  (32,548,436,1),
  (33,537,472,1),
  (34,546,467,1),
  (35,636,595,1),
  (36,551,629,1),
  (37,635,512,1),
  (38,556,475,1),
  (39,537,564,1),
  (40,444,523,1),
  (41,197,401,1),
  (42,170,424,1),
  (43,170,424,1),
  (44,170,424,1),
  (45,154,473,1),
  (46,603,537,1),
  (47,540,510,1),
  (48,638,436,1),
  (49,602,461,1),
  (50,382,211,1),
  (51,573,633,1),
  (52,583,497,1),
  (53,631,468,1),
  (54,626,622,1),
  (55,626,622,1),
  (56,581,636,1),
  (57,484,512,1),
  (58,639,664,1),
  (59,647,668,1),
  (60,583,605,1),
  (61,548,675,1),
  (62,546,547,1),
  (63,558,581,1),
  (64,675,442,1),
  (65,599,523,1),
  (66,252,438,1),
  (67,107,470,1),
  (68,549,537,1),
  (69,557,599,1),
  (70,643,394,1),
  (71,639,430,1),
  (72,577,540,1),
  (73,415,581,1),
  (74,188,610,1),
  (75,600,111,1),
  (76,452,502,1),
  (77,637,491,1),
  (78,632,489,1),
  (79,632,489,1),
  (80,362,54,1),
  (81,483,450,1),
  (82,1056,287,1),
  (83,450,64,1),
  (84,406,64,1),
  (85,128,551,1),
  (86,558,40,1),
  (87,624,305,1),
  (88,747,377,1),
  (89,786,473,1),
  (90,220,82,1),
  (91,183,88,1),
  (92,505,64,1),
  (93,314,64,1),
  (94,246,287,1),
  (95,155,438,1),
  (96,456,69,1),
  (97,345,81,1),
  (98,545,79,1),
  (99,853,219,1),
  (100,381,98,1),
  (101,501,62,1),
  (102,406,46,1),
  (103,148,462,1),
  (104,952,384,1),
  (105,67,717,1),
  (106,202,549,1),
  (107,627,574,1),
  (108,641,501,1),
  (109,1224,430,1),
  (110,423,683,1),
  (111,262,677,1),
  (112,731,556,1),
  (113,829,1060,1),
  (114,369,258,1),
  (115,356,232,4),
  (116,358,319,3),
  (117,432,16,11),
  (118,179,970,11);
/*!40000 ALTER TABLE `rex_822_heatmap` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_856_onelogin_urls`;
CREATE TABLE `rex_856_onelogin_urls` (
  `url_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`url_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `rex_856_onelogin_users`;
CREATE TABLE `rex_856_onelogin_users` (
  `uid` int(11) NOT NULL,
  `user` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pass` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `rex__375_group`;
CREATE TABLE `rex__375_group` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `createdate` int(11) NOT NULL DEFAULT '0',
  `updatedate` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `rex_action`;
CREATE TABLE `rex_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `preview` text NOT NULL,
  `presave` text NOT NULL,
  `postsave` text NOT NULL,
  `previewmode` tinyint(4) NOT NULL DEFAULT '0',
  `presavemode` tinyint(4) NOT NULL DEFAULT '0',
  `postsavemode` tinyint(4) NOT NULL DEFAULT '0',
  `createuser` varchar(255) NOT NULL,
  `createdate` int(11) NOT NULL DEFAULT '0',
  `updateuser` varchar(255) NOT NULL,
  `updatedate` int(11) NOT NULL DEFAULT '0',
  `revision` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `rex_article`;
CREATE TABLE `rex_article` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL DEFAULT '0',
  `re_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `catname` varchar(255) NOT NULL,
  `catprior` int(11) NOT NULL DEFAULT '0',
  `attributes` text NOT NULL,
  `startpage` tinyint(1) NOT NULL DEFAULT '0',
  `prior` int(11) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `createdate` int(11) NOT NULL DEFAULT '0',
  `updatedate` int(11) NOT NULL DEFAULT '0',
  `template_id` int(11) NOT NULL DEFAULT '0',
  `clang` int(11) NOT NULL DEFAULT '0',
  `createuser` varchar(255) NOT NULL,
  `updateuser` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `url` text NOT NULL,
  `revision` int(11) DEFAULT NULL,
  `art_online_from` text,
  `art_online_to` text,
  `art_description` text,
  `art_keywords` text,
  `art_file` varchar(255) DEFAULT NULL,
  `art_teaser` varchar(255) DEFAULT NULL,
  `art_type_id` varchar(255) DEFAULT NULL,
  `art_rexseo_legend` text,
  `art_rexseo_url` text,
  `art_rexseo_title` text,
  `art_rexseo_priority` varchar(255) DEFAULT '',
  `art_rexseo_canonicalurl` text,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

LOCK TABLES `rex_article` WRITE;
/*!40000 ALTER TABLE `rex_article` DISABLE KEYS */;
INSERT INTO `rex_article` VALUES 
  (1,1,0,'Home','Home',3,'',1,1,'|',1,1192226202,1277378346,1,0,'admin','j3ff3','','',0,'','','','','','','','','','','',''),
  (2,2,0,'Team','Team',4,'',1,1,'|',1,1192226377,1276300368,1,0,'admin','j3ff3','','',0,'','','','','','','','','','','',''),
  (3,3,0,'System','System',5,'',1,1,'|',1,1174487175,1181732593,1,0,'admin','admin','','',0,'','','','','','','','','','','',''),
  (4,4,0,'Erste Schritte','Erste Schritte',6,'',1,1,'|',1,1174487184,1237973283,1,0,'admin','admin','','',0,'','','','','','','','','','','',''),
  (5,5,0,'FAQ','FAQ',7,'',1,1,'|',1,1237372127,1237970781,1,0,'admin','admin','','',0,'','','','','','','','','','','',''),
  (6,6,0,'Kontakt / Impressum','Kontakt / Impressum',8,'',1,1,'|',1,1174487203,1249248736,1,0,'admin','admin','','',0,'','','','','','','','','','','',''),
  (8,8,3,'Was ist REDAXO','Was ist REDAXO',1,'',1,1,'|3|',1,1174488327,1237975038,1,0,'admin','admin','','',0,'','','','','','','','','','','',''),
  (9,9,3,'Für wen ist REDAXO','Für wen ist REDAXO',2,'',1,1,'|3|',1,1174488348,1237975175,1,0,'admin','admin','','',0,'','','','','','','','','','','',''),
  (10,10,3,'Features','Features',3,'',1,1,'|3|',1,1174489132,1237975465,1,0,'admin','admin','','',0,'','','','','','','','','','','',''),
  (11,11,3,'Screenshots','Screenshots',4,'',1,1,'|3|',1,1174489141,1237383922,1,0,'admin','admin','','',0,'','','','','','','','','','','',''),
  (12,12,4,'Doku','Doku',2,'',1,1,'|4|',1,1174489168,1237973900,1,0,'admin','admin','','',0,'','','','','','','','','','','',''),
  (13,13,4,'Wiki','Wiki',3,'',1,1,'|4|',1,1174489174,1237973233,1,0,'admin','admin','','',0,'','','','','','','','','','','',''),
  (14,14,4,'Forum','Forum',4,'',1,1,'|4|',1,1174489181,1237973953,1,0,'admin','admin','','',0,'','','','','','','','','','','',''),
  (15,15,5,'Was ist das Besondere an REDAXO?','FAQ',0,'',0,2,'|5|',1,1174489216,1237975651,1,0,'admin','admin','','',0,'','','','','','','','','','','',''),
  (16,16,4,'REDAXO','REDAXO',1,'',1,1,'|4|',1,1179325162,1237973876,1,0,'admin','admin','','',0,'','','','','','','','','','','',''),
  (17,17,5,'Was sollte einen dazu bewegen, REDAXO zu nutzen?','FAQ',0,'',0,3,'|5|',1,1189527244,1237970781,1,0,'admin','admin','','',0,'','','','','','','','','','','',''),
  (18,18,5,'Wann wird der Einsatz von REDAXO empfohlen?','FAQ',0,'',0,4,'|5|',1,1189527313,1237975927,1,0,'admin','admin','','',0,'','','','','','','','','','','',''),
  (19,19,5,'Wie viele Internetpräsentationen wurden bereits mit REDAXO erstellt?','FAQ',0,'',0,5,'|5|',1,1189527360,1237976010,1,0,'admin','admin','','',0,'','','','','','','','','','','',''),
  (20,20,5,'Welche Kenntnisse brauche ich, um mit REDAXO arbeiten zu können?','FAQ',0,'',0,6,'|5|',1,1189527486,1237973721,1,0,'admin','admin','','',0,'','','','','','','','','','','',''),
  (21,1,0,'Home','Home',3,'',1,1,'|',1,1276175435,1192234473,1,1,'j3ff3','admin','','',0,'','','','','','','','','','','',''),
  (22,2,0,'Team','Team',4,'',1,1,'|',1,1276175436,1249248693,1,1,'j3ff3','admin','','',0,'','','','','','','','','','','',''),
  (23,3,0,'System','System',5,'',1,1,'|',1,1276175437,1181732593,1,1,'j3ff3','admin','','',0,'','','','','','','','','','','',''),
  (24,4,0,'Erste Schritte','Erste Schritte',6,'',1,1,'|',1,1276175438,1237973283,1,1,'j3ff3','admin','','',0,'','','','','','','','','','','',''),
  (25,5,0,'FAQ','FAQ',7,'',1,1,'|',1,1276175439,1237970781,1,1,'j3ff3','admin','','',0,'','','','','','','','','','','',''),
  (26,6,0,'Kontakt / Impressum','Kontakt / Impressum',8,'',1,1,'|',1,1276175440,1249248736,1,1,'j3ff3','admin','','',0,'','','','','','','','','','','',''),
  (27,8,3,'Was ist REDAXO','Was ist REDAXO',1,'',1,1,'|3|',1,1276175449,1237975038,1,1,'j3ff3','admin','','',0,'','','','','','','','','','','',''),
  (28,9,3,'Für wen ist REDAXO','Für wen ist REDAXO',2,'',1,1,'|3|',1,1276175450,1237975175,1,1,'j3ff3','admin','','',0,'','','','','','','','','','','',''),
  (29,10,3,'Features','Features',3,'',1,1,'|3|',1,1276175451,1237975465,1,1,'j3ff3','admin','','',0,'','','','','','','','','','','',''),
  (30,11,3,'Screenshots','Screenshots',4,'',1,1,'|3|',1,1276175452,1237383922,1,1,'j3ff3','admin','','',0,'','','','','','','','','','','',''),
  (31,12,4,'Doku','Doku',2,'',1,1,'|4|',1,1276175458,1237973900,1,1,'j3ff3','admin','','',0,'','','','','','','','','','','',''),
  (32,13,4,'Wiki','Wiki',3,'',1,1,'|4|',1,1276175459,1237973233,1,1,'j3ff3','admin','','',0,'','','','','','','','','','','',''),
  (33,14,4,'Forum','Forum',4,'',1,1,'|4|',1,1276175460,1237973953,1,1,'j3ff3','admin','','',0,'','','','','','','','','','','',''),
  (34,15,5,'Was ist das Besondere an REDAXO?','FAQ',0,'',0,2,'|5|',1,1174489216,1276175465,1,1,'admin','j3ff3','','',0,'','','','','','','','','','','',''),
  (35,16,4,'REDAXO','REDAXO',1,'',1,1,'|4|',1,1276175457,1237973876,1,1,'j3ff3','admin','','',0,'','','','','','','','','','','',''),
  (36,17,5,'Was sollte einen dazu bewegen, REDAXO zu nutzen?','FAQ',0,'',0,3,'|5|',1,1189527244,1276175466,1,1,'admin','j3ff3','','',0,'','','','','','','','','','','',''),
  (37,18,5,'Wann wird der Einsatz von REDAXO empfohlen?','FAQ',0,'',0,4,'|5|',1,1189527313,1276175469,1,1,'admin','j3ff3','','',0,'','','','','','','','','','','',''),
  (38,19,5,'Wie viele Internetpräsentationen wurden bereits mit REDAXO erstellt?','FAQ',0,'',0,5,'|5|',1,1189527360,1276175469,1,1,'admin','j3ff3','','',0,'','','','','','','','','','','',''),
  (39,20,5,'Welche Kenntnisse brauche ich, um mit REDAXO arbeiten zu können?','FAQ',0,'',0,6,'|5|',1,1189527486,1276175470,1,1,'admin','j3ff3','','',0,'','','','','','','','','','','',''),
  (40,21,26,'Parameter-Test (Startseite)','Parameter',2,'',1,1,'|26|',1,1276190630,1277406733,1,0,'j3ff3','j3ff3','','',0,'','','','','','','','','','','',''),
  (41,21,26,'cat-lvl-1','cat-lvl-1',2,'',1,1,'|26|',0,1276190626,1276190626,0,1,'j3ff3','j3ff3','','',0,'','','','','','','','','','','',''),
  (42,22,21,'Zielseite','Parameter',0,'',0,2,'|26|21|',1,1276190713,1277404526,1,0,'j3ff3','j3ff3','','',0,'','','','','','','','','','','',''),
  (43,22,21,'Art2-L1','cat-lvl-1',0,'',0,2,'|26|21|',0,1276190713,1276190713,1,1,'j3ff3','j3ff3','','',0,'','','','','','','','','','','',''),
  (44,23,26,'xform blah','Xform',1,'',1,1,'|26|',1,1276190739,1297828590,1,0,'j3ff3','j3ff3','','',0,'','','','','','||','Standard','','','','',''),
  (45,23,26,'cat-lvl-2','cat-lvl-2',1,'',1,1,'|26|',0,1276190731,1276190731,0,1,'j3ff3','j3ff3','','',0,'','','','','','','','','','','',''),
  (46,24,23,'normalartikel-level2','Xform',0,'',0,2,'|26|23|',1,1276190766,1277404518,1,0,'j3ff3','j3ff3','','',0,'','','','','','','','','','','',''),
  (47,24,23,'Art2-L2','cat-lvl-2',0,'',0,2,'|26|23|',0,1276190766,1276190766,1,1,'j3ff3','j3ff3','','',0,'','','','','','','','','','','',''),
  (48,25,0,'error 404','error 404',0,'',0,1,'|',1,1276296357,1295516946,1,0,'j3ff3','j3ff3','','',0,'','','','','','','','','','','',''),
  (49,25,0,'fehlerseite','fehlerseite',0,'',0,1,'|',0,1276296357,1276743241,1,1,'j3ff3','j3ff3','','',0,'','','','','','','','','','','',''),
  (50,26,0,'RexSEO Tests','RexSEO Tests',1,'',1,1,'|',1,1276790564,1276790624,1,0,'j3ff3','j3ff3','','',0,'','','','','','','','','','','',''),
  (51,26,0,'RexSEO Tests','RexSEO Tests',1,'',1,1,'|',0,1276790487,1276790487,1,1,'j3ff3','j3ff3','','',0,'','','','','','','','','','','',''),
  (52,27,26,'Metadaten-Test-Startartikel','Metadaten',3,'',1,1,'|26|',1,1277031714,1277404535,1,0,'j3ff3','j3ff3','','',0,'','','','','','','','','','','',''),
  (53,27,26,'Metadaten-Test','Metadaten-Test',3,'',1,1,'|26|',0,1277031710,1277031710,1,1,'j3ff3','j3ff3','','',0,'','','','','','','','','','','',''),
  (54,28,27,'Metadaten-Test-Normalartikel','Metadaten',0,'',0,2,'|26|27|',1,1277034563,1298352099,1,0,'j3ff3','j3ff3','','',0,'','','','','','||','Standard','','','manueller page-title rexseo einstellungen','',''),
  (55,28,27,'Metadaten-Test-Normalartikel','Metadaten-Test',0,'',0,2,'|26|27|',0,1277034563,1277034563,1,1,'j3ff3','j3ff3','','',0,'','','','','','','','','','','',''),
  (56,29,33,'rex_resize plugin','rex_resize plugin',1,'',1,2,'|33|',0,1298352466,1298674388,1,0,'j3ff3','j3ff3','','',0,'','','','','','','','','','','',''),
  (57,29,33,'image manager tests','image manager tests',1,'',1,2,'|33|',0,1292932821,1298352427,1,1,'j3ff3','j3ff3','','',0,'','','','','','','','','','','',''),
  (58,30,0,'tests','',0,'',0,2,'|',0,1295357280,1296737721,1,0,'j3ff3','j3ff3','','',0,'','','','','','','','','','','',''),
  (59,30,0,'tests','',0,'',0,2,'|',0,1295357280,1295357280,1,1,'j3ff3','j3ff3','','',0,'','','','','','','','','','','',''),
  (60,31,26,'textile + tiny','textile + tiny',4,'',1,1,'|26|',1,1298342385,1298344966,1,0,'j3ff3','j3ff3','','',0,'','','','','','','','','','','',''),
  (61,31,26,'textile + tiny','textile + tiny',4,'',1,1,'|26|',0,1298342382,1298342382,1,1,'j3ff3','j3ff3','','',0,'','','','','','','','','','','',''),
  (62,32,27,'eigene url test','Metadaten',0,'',0,3,'|26|27|',1,1298352152,1298352234,1,0,'j3ff3','j3ff3','','',0,'','','','','','||','Standard','','manuelle/url.html','','',''),
  (63,32,27,'eigene url test','Metadaten-Test',0,'',0,3,'|26|27|',0,1298352152,1298352152,1,1,'j3ff3','j3ff3','','',0,'','','','','','','','','','','',''),
  (64,33,0,'ImageManager Tests','ImageManager Tests',2,'',1,1,'|',1,1298352409,1298678930,1,0,'j3ff3','j3ff3','','',0,'','','','','','','','','','','',''),
  (65,33,0,'ImageManager Tests','ImageManager Tests',2,'',1,1,'|',0,1298352409,1298352409,1,1,'j3ff3','j3ff3','','',0,'','','','','','','','','','','','');
/*!40000 ALTER TABLE `rex_article` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_article_slice`;
CREATE TABLE `rex_article_slice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clang` int(11) NOT NULL DEFAULT '0',
  `ctype` int(11) NOT NULL DEFAULT '0',
  `re_article_slice_id` int(11) NOT NULL DEFAULT '0',
  `value1` text,
  `value2` text,
  `value3` text,
  `value4` text,
  `value5` text,
  `value6` text,
  `value7` text,
  `value8` text,
  `value9` text,
  `value10` text,
  `value11` text,
  `value12` text,
  `value13` text,
  `value14` text,
  `value15` text,
  `value16` text,
  `value17` text,
  `value18` text,
  `value19` text,
  `value20` text,
  `file1` varchar(255) DEFAULT NULL,
  `file2` varchar(255) DEFAULT NULL,
  `file3` varchar(255) DEFAULT NULL,
  `file4` varchar(255) DEFAULT NULL,
  `file5` varchar(255) DEFAULT NULL,
  `file6` varchar(255) DEFAULT NULL,
  `file7` varchar(255) DEFAULT NULL,
  `file8` varchar(255) DEFAULT NULL,
  `file9` varchar(255) DEFAULT NULL,
  `file10` varchar(255) DEFAULT NULL,
  `filelist1` text,
  `filelist2` text,
  `filelist3` text,
  `filelist4` text,
  `filelist5` text,
  `filelist6` text,
  `filelist7` text,
  `filelist8` text,
  `filelist9` text,
  `filelist10` text,
  `link1` varchar(10) DEFAULT NULL,
  `link2` varchar(10) DEFAULT NULL,
  `link3` varchar(10) DEFAULT NULL,
  `link4` varchar(10) DEFAULT NULL,
  `link5` varchar(10) DEFAULT NULL,
  `link6` varchar(10) DEFAULT NULL,
  `link7` varchar(10) DEFAULT NULL,
  `link8` varchar(10) DEFAULT NULL,
  `link9` varchar(10) DEFAULT NULL,
  `link10` varchar(10) DEFAULT NULL,
  `linklist1` text,
  `linklist2` text,
  `linklist3` text,
  `linklist4` text,
  `linklist5` text,
  `linklist6` text,
  `linklist7` text,
  `linklist8` text,
  `linklist9` text,
  `linklist10` text,
  `php` text,
  `html` text,
  `article_id` int(11) NOT NULL DEFAULT '0',
  `modultyp_id` int(11) NOT NULL DEFAULT '0',
  `createdate` int(11) NOT NULL DEFAULT '0',
  `updatedate` int(11) NOT NULL DEFAULT '0',
  `createuser` varchar(255) NOT NULL,
  `updateuser` varchar(255) NOT NULL,
  `next_article_slice_id` int(11) DEFAULT NULL,
  `revision` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`re_article_slice_id`,`article_id`,`modultyp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

LOCK TABLES `rex_article_slice` WRITE;
/*!40000 ALTER TABLE `rex_article_slice` DISABLE KEYS */;
INSERT INTO `rex_article_slice` VALUES 
  (1,0,1,0,'h1. Internet Professionell lobt REDAXO\r\n\r\n\"Mit kaum einer anderen Redaktionssoftware ist es so mühelos möglich, wirklich valide und barrierefreie Websites zu erstellen. Gerade die extreme Anpassungsfähigkeit an die verschiedenen Bedürfnisse ist eine der großen Stärken dieses Redaktionssystems.\"\r\n\r\n\"Dank des Cachings und des insgesamt sehr schlanken Cores (1,5 MB) sind REDAXO-Websites normalerweise sehr schnell. Im Vergleich zu anderen Content-Management-Systemen beeindruckt bei REDAXO vor allem die Flexibilität und Anpassungsfähigkeit.\"','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',1,3,1181732140,1277378346,'admin','j3ff3',0,0),
  (2,0,1,0,'An dieser Stelle möchten wir auch einmal Danke für die vielen Anregungen, Kritiken, Ideen, Bugmeldungen, Wünsche usw. sagen:','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',2,3,1181732193,0,'admin','',0,0),
  (3,0,1,2,'Das REDAXO Team','h1','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',2,1,1181732232,1237973316,'admin','admin',0,0),
  (4,0,1,3,'Jan Kristinus\r\n\"www.yakamara.de\":http://www.yakamara.de','Jan Kristinus','','','','','','','l','','','','','','','','','','','','jan.gif','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',2,2,1181732266,1237372210,'admin','admin',0,0),
  (5,0,1,4,'Markus Staab\r\n\"www.redaxo.de\":http://www.redaxo.de','Markus Staab','','','','','','','l','','','','','','','','','','','','markus.gif','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',2,2,1181732302,1237372201,'admin','admin',0,0),
  (7,0,1,5,'Thomas Blum\r\n\"www.blumbeet.com\":http://www.blumbeet.com','Thomas Blum','','','','','','','l','','','','','','','','','','','','thomas.gif','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',2,2,1181732370,1237372223,'admin','admin',0,0),
  (12,0,1,0,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',8,'','','','','','','','','','','','','','','','','','','','','',3,8,1181732593,0,'admin','',0,0),
  (13,0,1,0,'Was ist REDAXO','h1','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',8,1,1181732633,1237973407,'admin','admin',0,0),
  (15,0,1,13,'h2. Was ist REDAXO\r\n\r\nREDAXO ist ein Content Management System für individuelle, vielfältige und flexible Web-Lösungen.\r\n\r\nh2. Merkmale:\r\n\r\n* Trennung von Inhalt und Layout mittels Templates\r\n* Die Verwaltung von mehrsprachigen Webseiten ist gegeben\r\n* Der Inhalt setzt sich aus verschiedenen Modulen zusammen\r\n* Keine Grenzen bei der Erstellung von Modulen\r\n* Systemunabhängiges sowie plattformübergreifendes Arbeiten über den Webbrowser\r\n* Linkmanagement\r\n* Keine Einschränkungen bei der Entwicklung von barrierefreiem Webdesign\r\n* Aufnahme von Metadaten für Suchmaschinen möglich\r\n* Suchfunktionen können integriert werden\r\n* Rechteverteilung sind möglich\r\n* Medienverwaltung über Medienpool (HTML, XML, PDF, MP3, DOC, JPEG, GIF etc.)\r\n* Import / Export Funktion ermöglicht Projektsicherung\r\n* Einbindung von Erweiterungen/Addons für unterschiedlichste Funktionen, auf der REDAXO-Website gibt es zahlreiche Addons zum Download\r\n* REDAXO passt sich dem eigenen Wissensstand an\r\n* REDAXO basiert auf PHP / MySQL ','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',8,3,1181734163,1237975038,'admin','admin',0,0),
  (53,0,1,54,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','screenshot_kategorie_edit.png,screenshot_content.png,screenshot_content_edit.png,screenshot_medienpool.png,screenshot_benutzerverwaltu.png,screenshot_module.png','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',11,9,1192189262,1237383922,'admin','admin',0,0),
  (16,0,1,0,'Für wen ist REDAXO','h1','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',9,1,1181734367,1237973439,'admin','admin',0,0),
  (17,0,1,16,'h2. Für wen ist REDAXO\r\n\r\nREDAXO ist für alle, die Websites erstellen, und für Nutzer, die mittels einer erstellten REDAXO-Website Inhalte verwalten.\r\n\r\nh2. Für Webdesigner und Administratoren - Erstellung und Gestaltung des Systems\r\n\r\nREDAXO ist kein Plug+Play-System! REDAXO ist für individuelle Lösungen gedacht, daher sind Kenntnisse von HTML und CSS unabdingbar, und Grundkenntnisse in PHP sollten ebenfalls vorhanden sein. REDAXO lässt sich sehr einfach installieren; Anpassungen sind leicht zu realisieren.\r\n\r\nDer größte Vorteil von REDAXO liegt in der Flexibilität. Die Ausgabe von REDAXO ist komplett beeinflussbar, das heißt: Mittels HTML und CSS lassen sich alle denkbaren Designs umsetzen. Ebenso kann man ohne weiteres barrierefreie Websites realisieren.\r\n\r\nh2. Für Redakteure - Verwaltung von Inhalten\r\n\r\nRedakteure brauchen zur Bedienung von REDAXO keine besonderen Kenntnisse. Der Schulungsaufwand ist auch für unerfahrene Nutzer gering. Die Struktur ist klar und übersichtlich aufgebaut, ohne erschlagende Funktionsfülle. Der Administrator kann dem Redakteur die Möglichkeiten und Rechte zur Hand geben, mit denen er alle gewünschten Inhalte und Einstellungen vornehmen kann, ohne Gefahr zu laufen, die Seite zu zerstören.\r\n','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',9,3,1181734432,1237975175,'admin','admin',0,0),
  (18,0,1,0,'Features','h1','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',10,1,1181734555,0,'admin','',0,0),
  (19,0,1,18,'h2. Frei gestaltbar\r\n\r\nMittels HTML/CSS und Templates lassen sich alle denkbaren Designs umsetzen - selbst die Administrationsoberfläche (Backend). Die Ausgabe von REDAXO ist komplett beeinflussbar. \r\n\r\nh2. Suchmaschinenfreundlich\r\n\r\nDurch URL-Rewriting, individuelle Meta-Infos und freie Templategestaltung ist die Optimierung für Suchmaschinen gewährleistet.\r\n\r\nh2. Barrierearm und BITV-konform\r\n\r\nREDAXO erfüllt alle Grundvoraussetzungen, die für eine barrierefreie und BITV-konforme Website notwendig sind. Das Frontend kann der jeweilige Ersteller der Seiten barrierearm gestalten. Das Backend ist ebenfalls barrierearm ausgelegt und kann über Accesskeys per Tastatur bedient werden.\r\n\r\nh2. Mehrsprachigkeit und UTF8\r\n\r\nMit REDAXO können auch mehrsprachige Websites mit exotischen Zeichensätzen angeboten werden. Die Unterstützung von UTF8 erleichtert die Sprachverwaltung - egal, ob englisch, italienisch, französisch, eine Sprache aus dem osteuropäischen oder asiatischen Sprachraum. \r\n\r\nh2. Zukunftssicher für Monitor, PDA, Handy ...\r\n\r\nDa die Ausgabe von REDAXO komplett beeinflussbar ist, kann die Website auch für alternative Geräte maßgeschneidert werden.\r\n\r\nh2. Module und Addons\r\n\r\nErweiterungen können als Module/Addons zum Einsatz kommen. Wie alle guten Content Management Systeme unterstützt auch REDAXO benutzerdefinierte Erweiterungen.\r\n\r\nh2. Benutzerverwaltung\r\n\r\nEs können ausgefeilte Benutzerrechte vergeben werden.\r\n\r\nh2. Modularer Aufbau der Inhalte\r\n\r\nDie Inhalte einer Seite werden modular aus verschiedenen Blöcken zusammengesetzt, die man vergleichsweise leicht selbst programmieren kann - z.B. Überschrift, Text, Bildergalerie, Formular ... Dies ermöglicht eine außergewöhnlich flexible Erstellung des Inhalts.\r\n\r\nh2. Erhalt der Design-Vorgaben\r\n\r\nInhalte und Präsentation werden getrennt voneinander gespeichert. Folglich wird der gesamte Inhalt aller Redakteure in einem Design konsistent ausgegeben.\r\n\r\nh2. Standortunabhängige Pflege der Seiten\r\n\r\nREDAXO funktioniert auf jedem Rechner der mit dem Internet verbunden ist. Seiten können von jedem Ort und zu jeder Zeit über einen Browser bearbeitet werden.\r\n\r\nh2. Textinhalte editieren\r\n\r\nDem Redakteur können zum Editieren der Inhalte verschiedene Möglichkeiten zur Verfügung gestellt werden - von festen Texteingabefeldern über den Textile-Editor bis hin zu Wysiwyg-Editoren wie TinyMCE.\r\n','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',10,3,1181734964,1237975465,'admin','admin',0,0),
  (20,0,1,0,'*redaxo.de* | \"http://www.redaxo.de\":http://www.redaxo.de\r\nAktuelle Informationen zu den aktuellen Versionen, die Basis-Intallation und Updates erhalten Sie auf der offiziellen REDAXO-Website.','REDAXO','','','','','','','l','','','','','','','','','','','','rex.gif','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',16,2,1181735049,1237973876,'admin','admin',0,0),
  (21,0,1,0,'*doku.redaxo.de* | \"http://doku.redaxo.de\":http://doku.redaxo.de\r\nDie Online-Dokumentation von REDAXO\r\nDie Dokumentation ist in acht Teile gegliedert um so den Redakteur, dem Einsteiger und dem Profi die geeigneten Anlaufstellen zu bieten. Danke Dagmar - dag.\r\n','Doku','','','','','','','l','','','','','','','','','','','','doku.gif','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',12,2,1181735096,1237973900,'admin','admin',0,0),
  (22,0,1,0,'*wiki.redaxo.de* | \"http://wiki.redaxo.de\":http://wiki.redaxo.de\r\nIm Wiki stehen Ideen und konkrete Beispiele mit Beschreibungen, ohne Prüfung seitens der Entwickler. Danke Sven - koala.','Wiki','','','','','','','l','','','','','','','','','','','','wiki.gif','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',13,2,1181735145,1237973233,'admin','admin',0,0),
  (23,0,1,0,'*forum.redaxo.de* | \"http://forum.redaxo.de\":http://forum.redaxo.de\r\nEine der ersten Anlaufstellen für Support, Fragen, Tipps und \"Insider-Wissen\" ist das Forum zu REDAXO. Danke Community.','Forum','','','','','','','l','','','','','','','','','','','','forum.gif','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',14,2,1181735243,1237973953,'admin','admin',0,0),
  (24,0,1,26,5,100,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',4,6,1181735295,0,'admin','',0,0),
  (26,0,1,28,'Links zu REDAXO','h2','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',4,1,1181735334,1237973268,'admin','admin',0,0),
  (29,0,1,0,'Erste Schritte','h1','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',4,1,1181735397,0,'admin','',0,0),
  (30,0,1,0,'Nehmen Sie Kontakt auf','h1','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',6,1,1181735435,0,'admin','',0,0),
  (35,0,1,30,'*REDAXO*\r\nc/o Yakamara Media GmbH & Co. KG\r\nAnsprechpartner: Jan Kristinus\r\nWandersmannstraße 68\r\n65205 Wiesbaden\r\nTel.: 0611-504.599.21\r\nTel.: 0611-504.599.30\r\n\"www.redaxo.de\":http://www.redaxo.de\r\n\"www.yakamara.de\":http://www.yakamara.de\r\n\r\n*REDAXO Agenturen auf redaxo.de*\r\n\"www.redaxo.de\":http://www.redaxo.de/242-0-agenturensupport.html\r\n\r\n*Fotos*\r\n\"www.photocase.com\":http://www.photocase.com\r\n','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',6,3,1189526604,1249248736,'admin','admin',0,0),
  (28,0,1,29,'Auf den folgenden Seiten erfahren Sie mehr über die Installation von REDAXO auf dem Webserver Ihrer Wahl. Überprüfen Sie vor Beginn die Systemvoraussetzungen für Ihr Webpaket und lernen Sie mehr über die ersten Schritte mit einem flexiblen Content-Management-System.','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',4,3,1181735372,1237973283,'admin','admin',0,0),
  (37,0,1,0,'FAQ','h1','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',5,1,1189526791,0,'admin','',0,0),
  (38,0,1,36,'REDAXO unterscheidet sich von anderen Systemen auf den ersten Blick durch sein sehr schlicht gehaltenes und auf grafische Dekoration verzichtendes Backend. So finden sich auch weniger technikorientierte Anwender schnell in den Funktionen zurecht. Der Administrator kann je nach Bedarf einzelne Funktionen zu- oder abschalten. Dadurch ist REDAXO selbst für Netzauftritte mit wenigen Seiten einsetzbar, ohne durch seine Funktionsfülle den eigentlichen Seiteninhalt zu dominieren. (Quelle: Wikipedia)\r\n\r\n\"zurück\":?article_id=5','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',15,3,1189526847,1237975651,'admin','admin',0,0),
  (34,0,1,37,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',5,5,1181737408,0,'admin','',0,0),
  (36,0,1,40,'Was ist das Besondere an REDAXO?','h2','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',15,1,1189526739,1237973559,'admin','admin',0,0),
  (40,0,1,0,'FAQ','h1','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',15,1,1189527221,0,'admin','',0,0),
  (41,0,1,0,'FAQ','h1','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',17,1,1189527244,1189527244,'admin','admin',0,0),
  (42,0,1,41,'Was sollte einen dazu bewegen, REDAXO zu nutzen?','h2','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',17,1,1189527244,1189527273,'admin','admin',0,0),
  (43,0,1,42,'Zitat aus dem Forum: Die nette Community und der gute Support. ;-) \r\n\r\n\"zurück\":?article_id=5','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',17,3,1189527244,1189527289,'admin','admin',0,0),
  (44,0,1,0,'FAQ','h1','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',18,1,1189527313,1189527313,'admin','admin',0,0),
  (45,0,1,44,'Wann wird der Einsatz von REDAXO empfohlen?','h2','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',18,1,1189527313,1237973644,'admin','admin',0,0),
  (46,0,1,45,'Die Praxis hat gezeigt, dass REDAXO für Webauftritte bis ca. 3000 Seiten ohne Probleme oder Geschwindigkeitseinbußen einsetzbar ist. Je nach Konzept der Website und den Seiteninhalten können es bei optimaler Planung aber auch mehr werden. (Quelle: Wikipedia)\r\n\r\n\"zurück\":?article_id=5','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',18,3,1189527313,1237975927,'admin','admin',0,0),
  (47,0,1,0,'FAQ','h1','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',19,1,1189527360,1189527360,'admin','admin',0,0),
  (48,0,1,47,'Wie viele Internetpräsentationen wurden bereits mit REDAXO erstellt?','h2','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',19,1,1189527360,1237973660,'admin','admin',0,0),
  (49,0,1,48,'Es gibt ca. 950 gelistete Referenzen auf der REDAXO-Seite (Stand März 2009). Man kann jedoch davon ausgehen, daß die wirkliche Anzahl ein vielfaches davon ist.\r\n\r\n\"zurück\":?article_id=5','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',19,3,1189527360,1237976010,'admin','admin',0,0),
  (50,0,1,0,'FAQ','h1','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',20,1,1189527486,1189527486,'admin','admin',0,0),
  (51,0,1,50,'Welche Kenntnisse brauche ich, um mit REDAXO arbeiten zu können?','h2','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',20,1,1189527486,1237973713,'admin','admin',0,0),
  (52,0,1,51,'REDAXO basiert auf PHP und Mysql. Kenntnisse in dieser Sprache und im Umgang mit der Datenbank sind zwar zu empfehlen, aber nicht unbedingt erforderlich. Anhand der Demo-Versionen kann man bereits eigene Webseiten erstellen und dabei lernen, das System zu nutzen.\r\n\r\n\"zurück\":?article_id=5','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',20,3,1189527486,1237973721,'admin','admin',0,0),
  (54,0,1,0,'Screenshots','h1','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',11,1,1192189506,0,'admin','',0,0),
  (55,1,1,0,'An dieser Stelle möchten wir auch einmal Danke für die vielen Anregungen, Kritiken, Ideen, Bugmeldungen, Wünsche usw. sagen:','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',2,3,1276175381,1276175381,'j3ff3','j3ff3',0,0),
  (56,1,1,55,'Das REDAXO Team','h1','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',2,1,1276175381,1276175381,'j3ff3','j3ff3',0,0),
  (57,1,1,56,'Jan Kristinus\r\n\"www.yakamara.de\":http://www.yakamara.de','Jan Kristinus','','','','','','','l','','','','','','','','','','','','jan.gif','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',2,2,1276175381,1276175381,'j3ff3','j3ff3',0,0),
  (58,1,1,57,'Markus Staab\r\n\"www.redaxo.de\":http://www.redaxo.de','Markus Staab','','','','','','','l','','','','','','','','','','','','markus.gif','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',2,2,1276175381,1276175381,'j3ff3','j3ff3',0,0),
  (59,1,1,58,'Thomas Blum\r\n\"www.blumbeet.com\":http://www.blumbeet.com','Thomas Blum','','','','','','','l','','','','','','','','','','','','thomas.gif','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',2,2,1276175381,1276175381,'j3ff3','j3ff3',0,0),
  (60,1,1,0,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',8,'','','','','','','','','','','','','','','','','','','','','',3,8,1276175403,1276175403,'j3ff3','j3ff3',0,0),
  (61,1,1,0,'Was ist REDAXO','h1','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',8,1,1276175428,1276175428,'j3ff3','j3ff3',0,0),
  (62,1,1,61,'h2. Was ist REDAXO\r\n\r\nREDAXO ist ein Content Management System für individuelle, vielfältige und flexible Web-Lösungen.\r\n\r\nh2. Merkmale:\r\n\r\n* Trennung von Inhalt und Layout mittels Templates\r\n* Die Verwaltung von mehrsprachigen Webseiten ist gegeben\r\n* Der Inhalt setzt sich aus verschiedenen Modulen zusammen\r\n* Keine Grenzen bei der Erstellung von Modulen\r\n* Systemunabhängiges sowie plattformübergreifendes Arbeiten über den Webbrowser\r\n* Linkmanagement\r\n* Keine Einschränkungen bei der Entwicklung von barrierefreiem Webdesign\r\n* Aufnahme von Metadaten für Suchmaschinen möglich\r\n* Suchfunktionen können integriert werden\r\n* Rechteverteilung sind möglich\r\n* Medienverwaltung über Medienpool (HTML, XML, PDF, MP3, DOC, JPEG, GIF etc.)\r\n* Import / Export Funktion ermöglicht Projektsicherung\r\n* Einbindung von Erweiterungen/Addons für unterschiedlichste Funktionen, auf der REDAXO-Website gibt es zahlreiche Addons zum Download\r\n* REDAXO passt sich dem eigenen Wissensstand an\r\n* REDAXO basiert auf PHP / MySQL ','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',8,3,1276175428,1276175428,'j3ff3','j3ff3',0,0),
  (63,1,1,0,'Nehmen Sie Kontakt auf','h1','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',6,1,1276175488,1276175488,'j3ff3','j3ff3',0,0),
  (64,1,1,63,'*REDAXO*\r\nc/o Yakamara Media GmbH & Co. KG\r\nAnsprechpartner: Jan Kristinus\r\nWandersmannstraße 68\r\n65205 Wiesbaden\r\nTel.: 0611-504.599.21\r\nTel.: 0611-504.599.30\r\n\"www.redaxo.de\":http://www.redaxo.de\r\n\"www.yakamara.de\":http://www.yakamara.de\r\n\r\n*REDAXO Agenturen auf redaxo.de*\r\n\"www.redaxo.de\":http://www.redaxo.de/242-0-agenturensupport.html\r\n\r\n*Fotos*\r\n\"www.photocase.com\":http://www.photocase.com\r\n','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',6,3,1276175488,1276175488,'j3ff3','j3ff3',0,0),
  (65,1,1,0,'h1. Internet Professionell lobt REDAXO\r\n\r\n\"Mit kaum einer anderen Redaktionssoftware ist es so mühelos möglich, wirklich valide und barrierefreie Websites zu erstellen. Gerade die extreme Anpassungsfähigkeit an die verschiedenen Bedürfnisse ist eine der großen Stärken dieses Redaktionssystems.\"\r\n\r\n\"Dank des Cachings und des insgesamt sehr schlanken Cores (1,5 MB) sind REDAXO-Websites normalerweise sehr schnell. Im Vergleich zu anderen Content-Management-Systemen beeindruckt bei REDAXO vor allem die Flexibilität und Anpassungsfähigkeit.\"','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',1,3,1276175504,1276175504,'j3ff3','j3ff3',0,0),
  (67,0,1,72,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',23,5,1276191000,1276191000,'j3ff3','j3ff3',0,0),
  (115,0,1,0,404,'h1','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',25,1,1277404798,1277404798,'j3ff3','j3ff3',0,1),
  (69,0,1,120,404,'h1','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',25,1,1276296380,1276296380,'j3ff3','j3ff3',0,0),
  (70,0,1,0,'arbeitsversion','h1','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',2,1,1276300368,1276300368,'j3ff3','j3ff3',0,1),
  (72,0,1,0,1,'','fieldset|RexSEo Test Formular:|rexseo-test-formular\r\n\r\nselectplus|gender|Geschlecht *|Frau=w;Herr=m;Frau=w;Herr=m|[no_db]|m|0|2|onchange>>>alert(this.value);###class>>>foobar\r\n\r\ntext|vorname|* Vorname|Ihr Vorname|\r\nvalidate|notEmpty|vorname|Bitte geben Sie Ihren Vornamen an.\r\n\r\ntext|name|* Nachname|Ihr Nachname|\r\nvalidate|notEmpty|name|Bitte geben Sie Ihren Nachnamen an.\r\n\r\ntext|usr_email|* Email|Ihre Email-Adresse\r\nvalidate|email|usr_email|Bitte geben Sie Ihre Email-Adresse an. \r\n\r\ntextarea|nachricht|* Nachricht|Notiz..|\r\nvalidate|notEmpty|nachricht|Das Feld Nachricht ist leer - Möchten Sie uns nichts mitteilen?\r\nvalidate|strip_html|nachricht|*SPAM*\r\n\r\ntextplus|usr_name|Nachname|Ihr Nachname..|[no_db]|onchange>>>alert(this.value);\r\n\r\nrecaptcha|\r\n\r\nonclick_clear_value|vorname,name,usr_email,nachricht|auto\r\n\r\nmailto|$REX[\'ERROR_EMAIL\']\r\n\r\nmailfrom|usr_email\r\n\r\ndatestamp|datum|format(Y-m-d)|no_db\r\n\r\nsubmit|submit|Anfrage abschicken|no_db ','RexSEO XForm Test','\"###vorname### ###name###\" ###usr_email###\r\nschrob am ###datum###:\r\n\r\n###nachricht###','THX !!!',1,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',23,10,1276731635,1297828590,'j3ff3','j3ff3',0,0),
  (73,0,1,0,'XFORM TEst Arbeitsversion.. (kein Formular)','','','','','','','','l','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',23,2,1276739773,1276739773,'j3ff3','j3ff3',0,1),
  (74,0,1,0,'$_REQUEST:','h1','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',22,1,1276744477,1276745558,'j3ff3','j3ff3',0,0),
  (76,0,1,74,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','<?php\r\necho \'<pre>\';\r\nvar_dump($_REQUEST);\r\necho \'</pre>\';\r\n?>','',22,11,1276745440,1276745507,'j3ff3','j3ff3',0,0),
  (108,0,1,0,'h1. Textile links\r\n\r\nh3. \"redaxo markup sans params\":redaxo://22\r\n\r\nbc. \"redaxo markup sans params\":redaxø://22\r\n\r\nh3. \"redaxo markup + params\":redaxo://22?foo=bar&blah=33\r\n\r\nbc. \"redaxo markup + params\":redaxø://22?foo=bar&blah=33\r\n\r\nh3. \"index.php markup + params\":index.php?article_id=22&foo=bar&blah=33\r\n\r\nbc. \"index.php markup + params\":index.php?article_id=22&foo=bar&blah=33','','','','','','','','l','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',21,2,1277224336,1277406733,'j3ff3','j3ff3',0,1),
  (91,0,1,0,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',23,'','','','','','','','','','','','','','','','','','','','','',26,8,1276790624,1276790624,'j3ff3','j3ff3',0,1),
  (109,0,1,108,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','<?php\r\n\r\necho \'<h1>rex_getUrl</h1>\';\r\n\r\necho \'<h3>\r\n<a href=\"\'.rex_getUrl(22,0,array(\"foo\"=>\"bar\",\"blah\"=>33)).\'\">\r\n.rex_getUrl(22,0,array(\"foo\"=>\"bar\",\"blah\"=>33)).\r\n</a>\r\n</h3>\';\r\n\r\necho \'<h1>rex_getUrl startartikel mit params</h1>\';\r\n\r\necho \'<h3>\r\n<a href=\"\'.rex_getUrl($REX[\"START_ARTICLE_ID\"],0,array(\"foo\"=>\"bar\",\"blah\"=>33)).\'\">\r\n.rex_getUrl($REX[\"START_ARTICLE_ID\"],0,array(\"foo\"=>\"bar\",\"blah\"=>33)).\r\n</a>\r\n</h3>\';\r\n\r\necho \'<h1>rex_getUrl startartikel sans params</h1>\';\r\n\r\necho \'<h3>\r\n<a href=\"\'.rex_getUrl($REX[\"START_ARTICLE_ID\"],0).\'\">\r\n.rex_getUrl($REX[\"START_ARTICLE_ID\"],0).\r\n</a>\r\n</h3>\';\r\n\r\n?>','',21,11,1277224336,1277402302,'j3ff3','j3ff3',0,1),
  (92,0,1,0,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',23,'','','','','','','','','','','','','','','','','','','','','',26,8,1276790631,1276790631,'j3ff3','j3ff3',0,0),
  (93,0,1,0,'h1. Metadaten-Test Startartikel\r\n\r\nWeitere Artikel:','','','','','','','','l','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',27,2,1277031796,1277035409,'j3ff3','j3ff3',0,0),
  (94,0,1,0,'h1. Metadaten-Test','','','','','','','','l','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',27,2,1277032564,1277032564,'j3ff3','j3ff3',0,1),
  (95,0,1,93,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',27,5,1277034890,1277034890,'j3ff3','j3ff3',0,0),
  (96,0,1,0,'h1. Metadaten-Test Normalartikel','','','','','','','','l','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',28,2,1277035450,1277035450,'j3ff3','j3ff3',0,0),
  (118,0,1,117,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','<?php\r\n\r\necho \'<h1>rex_getUrl</h1>\';\r\n\r\necho \'<h3>\r\n<a href=\"\'.rex_getUrl(22,0,array(\"foo\"=>\"bar\",\"blah\"=>33)).\'\">\r\n.rex_getUrl(22,0,array(\"foo\"=>\"bar\",\"blah\"=>33)).\r\n</a>\r\n</h3>\';\r\n\r\necho \'<h1>rex_getUrl startartikel mit params</h1>\';\r\n\r\necho \'<h3>\r\n<a href=\"\'.rex_getUrl($REX[\"START_ARTICLE_ID\"],0,array(\"foo\"=>\"bar\",\"blah\"=>33)).\'\">\r\n.rex_getUrl($REX[\"START_ARTICLE_ID\"],0,array(\"foo\"=>\"bar\",\"blah\"=>33)).\r\n</a>\r\n</h3>\';\r\n\r\necho \'<h1>rex_getUrl startartikel sans params</h1>\';\r\n\r\necho \'<h3>\r\n<a href=\"\'.rex_getUrl($REX[\"START_ARTICLE_ID\"],0).\'\">\r\n.rex_getUrl($REX[\"START_ARTICLE_ID\"],0).\r\n</a>\r\n</h3>\';\r\n\r\n?>','',21,11,1277406741,1277406741,'j3ff3','j3ff3',0,0),
  (116,0,1,115,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','<PHP\r\n\r\nvar_dump($_REQUEST);\r\n\r\n?>','',25,11,1277404798,1277404798,'j3ff3','j3ff3',0,1),
  (114,0,1,69,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','<PHP\r\n\r\nvar_dump($_REQUEST);\r\n\r\n?>','',25,11,1277404794,1277404794,'j3ff3','j3ff3',0,0),
  (117,0,1,0,'h1. Textile links\r\n\r\nh3. \"redaxo markup sans params\":redaxo://22\r\n\r\nbc. \"redaxo markup sans params\":redaxø://22\r\n\r\nh3. \"redaxo markup + params\":redaxo://22?foo=bar&blah=33\r\n\r\nbc. \"redaxo markup + params\":redaxø://22?foo=bar&blah=33\r\n\r\nh3. \"index.php markup + params\":index.php?article_id=22&foo=bar&blah=33\r\n\r\nbc. \"index.php markup + params\":index.php?article_id=22&foo=bar&blah=33','','','','','','','','l','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',21,2,1277406741,1277406741,'j3ff3','j3ff3',0,0),
  (119,0,1,0,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','<?php\r\n\r\necho \'\r\n<ul>\r\n\r\n<li><h4>index.php?rex_img_type=rex_mediapool_detail&rex_img_file=screenshot_content_edit.png</h4></li>\r\n<li>src=\"index.php?rex_img_type=rex_mediapool_detail&rex_img_file=screenshot_content_edit.png\"</li>\r\n<li><img src=\"index.php?rex_img_type=rex_mediapool_detail&rex_img_file=screenshot_content_edit.png\" /></li>\r\n\r\n<li><h4>index.php?rex_resize=100a__screenshot_content_edit.png</h4></li>\r\n<li>src=\"index.php?rex_resize=100a__screenshot_content_edit.png\"</li>\r\n<li><img src=\"index.php?rex_resize=100a__screenshot_content_edit.png\" /></li>\r\n\r\n<li>index.php?rex_img_type=rex_mediapool_preview&rex_img_file=start_teaser.jpg:::</li>\r\n<li><a href=\"index.php?rex_img_type=rex_mediapool_preview&rex_img_file=start_teaser.jpg\"/>href=\"index.php?rex_img_type=rex_mediapool_preview&rex_img_file=start_teaser.jpg\"</a></li>\r\n<li><hr /></li>\r\n\r\n<li><h4>index.php?rex_resize=100a__screenshot_content_edit.png</h4></li>\r\n<li><a href=\"index.php?rex_resize=100a__screenshot_content_edit.png\">href=\"index.php?rex_resize=100a__screenshot_content_edit.png\"</a></li>\r\n<li><hr /></li>\r\n\r\n<li><h4>index.php?rex_resize=100a__screenshot_content_edit.png</h4></li>\r\n<li><a href=\"index.php?rex_resize=100c__200h__screenshot_content_edit.png\">href=\"index.php?rex_resize=100c__200h__screenshot_content_edit.png\"</a></li>\r\n<li><hr /></li>\r\n\r\n<li><h4>index.php?rex_resize=100c__200h__start_teaser.jpg&rex_filter[]=sharpen&rex_filter[]=brand</h4></li>\r\n<li><a href=\"index.php?rex_resize=100c__200h__start_teaser.jpg&rex_filter[]=sharpen&rex_filter[]=brand\">href=\"index.php?rex_resize=100c__200h__start_teaser.jpg&rex_filter[]=sharpen&rex_filter[]=brand\"</a></li>\r\n<li><img src=\"index.php?rex_resize=100c__200h__start_teaser.jpg&rex_filter[]=sharpen&rex_filter[]=brand\" /></li>\r\n</ul>\r\n\';\r\n\r\n?>','',29,11,1292932849,1292932849,'j3ff3','j3ff3',0,0),
  (120,0,1,0,'foo[^bar^] REDAXO[^®^]','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',25,3,1292952404,1292955235,'j3ff3','j3ff3','',0),
  (122,0,1,0,'default text_input','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',30,14,1296736644,1296737721,'j3ff3','j3ff3','',0),
  (124,0,1,123,'\"im tests\":redaxo://29 ','','','','','','','','l','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',31,2,1298344966,1298344966,'j3ff3','j3ff3','',0),
  (125,0,1,0,'artikel hat eigene (manuelle) rexseo url..','','','','','','','','l','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',32,2,1298352234,1298352234,'j3ff3','j3ff3','',0),
  (123,0,1,0,'<p>asdfkjh <a href=\"redaxo://29\" title=\"image manager tests\">sjhdf</a> <a href=\"redaxo://30\" title=\"tests\">oiwuer</a></p>','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',31,15,1298342484,1298344922,'j3ff3','j3ff3','',0),
  (127,0,1,0,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',33,16,1298678930,1298678930,'j3ff3','j3ff3','',0);
/*!40000 ALTER TABLE `rex_article_slice` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_bookmarks`;
CREATE TABLE `rex_bookmarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `clang` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

LOCK TABLES `rex_bookmarks` WRITE;
/*!40000 ALTER TABLE `rex_bookmarks` DISABLE KEYS */;
INSERT INTO `rex_bookmarks` VALUES 
  (1,29,0),
  (2,25,0),
  (3,26,0),
  (4,23,0),
  (5,21,0),
  (6,27,0),
  (7,9,0),
  (8,11,0);
/*!40000 ALTER TABLE `rex_bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_clang`;
CREATE TABLE `rex_clang` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `revision` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `rex_clang` WRITE;
/*!40000 ALTER TABLE `rex_clang` DISABLE KEYS */;
INSERT INTO `rex_clang` VALUES 
  (0,'de',0),
  (1,'en',0);
/*!40000 ALTER TABLE `rex_clang` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_em_field`;
CREATE TABLE `rex_em_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) NOT NULL,
  `prio` varchar(255) NOT NULL,
  `type_id` varchar(255) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `f1` text NOT NULL,
  `f2` text NOT NULL,
  `f3` text NOT NULL,
  `f4` text NOT NULL,
  `f5` text NOT NULL,
  `f6` text NOT NULL,
  `f7` text NOT NULL,
  `f8` text NOT NULL,
  `f9` text NOT NULL,
  `list_hidden` tinyint(4) NOT NULL,
  `search` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `rex_em_relation`;
CREATE TABLE `rex_em_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_table` varchar(255) NOT NULL,
  `source_name` varchar(255) NOT NULL,
  `source_id` int(11) NOT NULL,
  `target_table` varchar(255) NOT NULL,
  `target_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `rex_em_table`;
CREATE TABLE `rex_em_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `list_amount` int(11) unsigned NOT NULL DEFAULT '50',
  `prio` varchar(255) NOT NULL,
  `search` tinyint(4) NOT NULL,
  `hidden` tinyint(4) NOT NULL,
  `export` tinyint(4) NOT NULL,
  `import` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `rex_file`;
CREATE TABLE `rex_file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `re_file_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `attributes` text NOT NULL,
  `filetype` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `originalname` varchar(255) NOT NULL,
  `filesize` varchar(255) NOT NULL,
  `width` int(11) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `createdate` int(11) NOT NULL DEFAULT '0',
  `updatedate` int(11) NOT NULL DEFAULT '0',
  `createuser` varchar(255) NOT NULL,
  `updateuser` varchar(255) NOT NULL,
  `revision` int(11) DEFAULT NULL,
  `med_description` text,
  `med_copyright` text,
  PRIMARY KEY (`file_id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

LOCK TABLES `rex_file` WRITE;
/*!40000 ALTER TABLE `rex_file` DISABLE KEYS */;
INSERT INTO `rex_file` VALUES 
  (1,0,1,'','text/css','main.css','main.css',3869,0,0,'main.css',1174923001,1174923001,'admin','admin',0,'',''),
  (2,0,1,'','text/css','navigation.css','navigation.css',3970,0,0,'navigation.css',1174923036,1174923036,'admin','admin',0,'',''),
  (3,0,1,'','text/css','content.css','/Applications/MAMP/tmp/php/phpFvKVpk',4724,0,0,'content.css',1174923063,1192194986,'admin','admin',0,'',''),
  (4,0,1,'','text/css','start.css','start.css',1326,0,0,'start.css',1174923094,1174923094,'admin','admin',0,'',''),
  (5,0,1,'','text/css','default.css','default.css',1512,0,0,'default.css',1174923116,1174923116,'admin','admin',0,'',''),
  (6,0,2,'','image/jpeg','start_teaser.jpg','start_teaser.jpg',39416,630,217,'Teaser Startseite',1174923162,1174923162,'admin','admin',0,'',''),
  (7,0,2,'','image/jpeg','main_teaser.jpg','main_teaser.jpg',41139,630,220,'Teaser Inhaltsseiten',1174923186,1174923186,'admin','admin',0,'',''),
  (8,0,2,'','image/gif','bg_nav.gif','bg_nav.gif',929,208,217,'Hintergrund Navigation vertikal',1174923222,1174923222,'admin','admin',0,'',''),
  (9,0,2,'','image/gif','bg_unav.gif','bg_unav.gif',6494,208,172,'Hintergrund unterhalb Navigation',1174923278,1174923278,'admin','admin',0,'',''),
  (10,0,2,'','image/gif','bg_header.gif','bg_header.gif',3656,630,137,'Hintergrund Header',1174923312,1174923312,'admin','admin',0,'',''),
  (11,0,2,'','image/gif','linie_start_block.gif','linie_start_block.gif',11484,313,245,'Hintergrund content start',1174923339,1174923412,'admin','admin',0,'',''),
  (13,0,2,'','image/gif','linie_main_block.gif','linie_main_block.gif',744,3,211,'Hintergrund content default (Linie)',1174923478,1174923478,'admin','admin',0,'',''),
  (14,0,2,'','image/gif','start_bg_header.gif','/tmp/phpJrzxKl',7846,630,137,'Header Start',1174923513,1174923537,'admin','admin',0,'',''),
  (15,0,2,'','image/gif','redaxo_logo_klein.gif','redaxo_logo_klein.gif',4478,220,80,'Logo (Inhaltsseiten)',1174923597,1174923597,'admin','admin',0,'',''),
  (17,0,2,'','image/gif','button.gif','button.gif',132,20,60,'Rollover Buttons',1174923632,1174923632,'admin','admin',0,'',''),
  (18,0,4,'','image/gif','jan.gif','jan.gif',2730,79,79,'Jan',1176638716,1176638716,'admin','admin',0,'',''),
  (19,0,4,'','image/gif','markus.gif','markus.gif',2798,79,79,'Markus',1176638729,1176638729,'admin','admin',0,'',''),
  (21,0,4,'','image/gif','thomas.gif','thomas.gif',2806,79,79,'Thomas',1176638759,1176638759,'admin','admin',0,'',''),
  (22,0,4,'','image/gif','team-bild.gif','team-bild.gif',680,79,79,'Platzhalter',1176638776,1176638776,'admin','admin',0,'',''),
  (23,0,5,'','image/gif','rex.gif','rex.gif',1804,79,79,'Redaxo',1176744752,1176744752,'admin','admin',0,'',''),
  (24,0,5,'','image/gif','doku.gif','doku.gif',1705,79,79,'Doku',1176744910,1176744910,'admin','admin',0,'',''),
  (25,0,5,'','image/gif','wiki.gif','wiki.gif',1669,79,79,'Wiki',1176745021,1176745021,'admin','admin',0,'',''),
  (26,0,5,'','image/gif','forum.gif','forum.gif',1721,79,79,'Forum',1176745122,1176745122,'admin','admin',0,'',''),
  (27,0,6,'','application/x-javascript','ajs_fx.js','AJS_fx.js',3192,0,0,'',1192187888,1192187888,'admin','admin',0,'',''),
  (28,0,6,'','application/x-javascript','ajs.js','AJS.js',10396,0,0,'',1192187893,1192187893,'admin','admin',0,'',''),
  (29,0,6,'','image/gif','g_close.gif','g_close.gif',541,25,30,'',1192187899,1192187899,'admin','admin',0,'',''),
  (30,0,6,'','application/x-javascript','gb_scripts.js','gb_scripts.js',11908,0,0,'',1192187904,1192187904,'admin','admin',0,'',''),
  (31,0,6,'','text/css','gb_styles.css','gb_styles.css',2574,0,0,'',1192187913,1192187913,'admin','admin',0,'',''),
  (32,0,6,'','image/gif','header_bg.gif','header_bg.gif',1188,223,35,'',1192187921,1192187921,'admin','admin',0,'',''),
  (33,0,6,'','image/gif','indicator.gif','indicator.gif',8238,100,100,'',1192187947,1192187947,'admin','admin',0,'',''),
  (34,0,6,'','text/html','loader_frame.html','loader_frame.html',2084,0,0,'',1192187952,1192187952,'admin','admin',0,'',''),
  (35,0,6,'','image/gif','next.gif','next.gif',528,25,30,'',1192187958,1192187958,'admin','admin',0,'',''),
  (36,0,6,'','image/gif','prev.gif','prev.gif',525,25,30,'',1192187961,1192187961,'admin','admin',0,'',''),
  (37,0,6,'','image/gif','w_close.gif','w_close.gif',74,11,11,'',1192187964,1192187964,'admin','admin',0,'',''),
  (38,0,7,'','image/png','screenshot_benutzerverwaltu.png','screenshot_benutzerverwaltu.png',105370,980,650,'Benutzerverwaltung',1192189157,1237382442,'admin','admin',0,'',''),
  (39,0,7,'','image/png','screenshot_content_edit.png','screenshot_content_edit.png',71997,980,650,'Inhaltsansicht: Einfachen Text editieren',1192189169,1237382479,'admin','admin',0,'',''),
  (40,0,7,'','image/png','screenshot_content.png','screenshot_content.png',86971,980,650,'Inhaltsansicht: Editiermodus',1192189174,1237382467,'admin','admin',0,'',''),
  (41,0,7,'','image/png','screenshot_kategorie_edit.png','screenshot_kategorie_edit.png',80826,980,650,'Kategorieansicht: Kategorienamen editieren',1192189180,1237382144,'admin','admin',0,'',''),
  (42,0,7,'','image/png','screenshot_medienpool.png','screenshot_medienpool.png',116370,980,650,'Medienpool zur Verwaltung von Dateien/Bildern',1192189189,1237382405,'admin','admin',0,'',''),
  (44,0,7,'','image/png','screenshot_module.png','screenshot_module.png',96277,980,650,'Modulansicht',1192189197,1237382426,'admin','admin',0,'',''),
  (45,0,0,'','image/jpeg','12022011466.jpg','12022011466.jpg',2366834,1944,2592,'',1297564713,1297564713,'j3ff3','j3ff3','','',''),
  (46,0,0,'','image/jpeg','jochberg_pano_14543x2125.jpg','jochberg_pano_14543x2125.jpg',8552015,14543,2125,'',1297680559,1297680559,'j3ff3','j3ff3','','','');
/*!40000 ALTER TABLE `rex_file` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_file_category`;
CREATE TABLE `rex_file_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `re_id` int(11) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL,
  `createdate` int(11) NOT NULL DEFAULT '0',
  `updatedate` int(11) NOT NULL DEFAULT '0',
  `createuser` varchar(255) NOT NULL,
  `updateuser` varchar(255) NOT NULL,
  `attributes` text NOT NULL,
  `revision` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

LOCK TABLES `rex_file_category` WRITE;
/*!40000 ALTER TABLE `rex_file_category` DISABLE KEYS */;
INSERT INTO `rex_file_category` VALUES 
  (1,'Layout - css',0,'|',1174332637,1174922965,'admin','admin','',0),
  (2,'Layout - images',0,'|',1174922935,1174922954,'admin','admin','',0),
  (3,'Inhalt - images',0,'|',1176638683,1176638683,'admin','admin','',0),
  (4,'Team',3,'|3|',1176638698,1176638698,'admin','admin','',0),
  (5,'Schritte',3,'|3|',1176744700,1189871809,'admin','admin','',0),
  (6,'Bildgalerie',1,'|1|',1192187620,1192187620,'admin','admin','',0),
  (7,'Screenshots',3,'|3|',1192189139,1192189139,'admin','admin','',0);
/*!40000 ALTER TABLE `rex_file_category` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_module`;
CREATE TABLE `rex_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `ausgabe` text NOT NULL,
  `eingabe` text NOT NULL,
  `createuser` varchar(255) NOT NULL,
  `updateuser` varchar(255) NOT NULL,
  `createdate` int(11) NOT NULL DEFAULT '0',
  `updatedate` int(11) NOT NULL DEFAULT '0',
  `attributes` text NOT NULL,
  `revision` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

LOCK TABLES `rex_module` WRITE;
/*!40000 ALTER TABLE `rex_module` DISABLE KEYS */;
INSERT INTO `rex_module` VALUES 
  (1,'01 - Headline',0,'<REX_VALUE[2]>REX_VALUE[1]</REX_VALUE[2]>','&Uuml;berschrift:<br />\r\n<input type=\"text\" size=\"50\" name=\"VALUE[1]\" value=\"REX_VALUE[1]\" />\r\n<select name=\"VALUE[2]\" >\r\n<?php\r\nforeach (array(\"h1\",\"h2\",\"h3\",\"h4\",\"h5\",\"h6\") as $value) {\r\n	echo \'<option value=\"\'.$value.\'\" \';\r\n	\r\n	if ( \"REX_VALUE[2]\"==\"$value\" ) {\r\n		echo \'selected=\"selected\" \';\r\n	}\r\n	echo \'>\'.$value.\'</option>\';\r\n}\r\n?>\r\n</select>','admin','j3ff3',1181731562,1292954028,'',0),
  (2,'01 - Text und/oder Bild [textile]',0,'<?php\r\n\r\nif(OOAddon::isAvailable(\'textile\'))\r\n{\r\n  echo \'<div class=\"team\">\';\r\n\r\n  //  Ausrichtung des Bildes \r\n  if (\"REX_VALUE[9]\" == \"l\") $float = \"floatLeft\";\r\n  if (\"REX_VALUE[9]\" == \"r\") $float = \"floatRight\";\r\n\r\n  //  Wenn Bild eingefuegt wurde, Code schreiben \r\n  $file = \"\";\r\n  if (\"REX_FILE[1]\" != \"\") $file = \'<div class=\"\'.$float.\'\"><img src=\"\'.$REX[\'HTDOCS_PATH\'].\'files/REX_FILE[1]\" title=\"\'.\"REX_VALUE[2]\".\'\" alt=\"\'.\"REX_VALUE[2]\".\'\" /></div>\';\r\n\r\n  $textile = \'\';\r\n  if(REX_IS_VALUE[1])\r\n  {\r\n    $textile = htmlspecialchars_decode(\"REX_VALUE[1]\");\r\n    $textile = str_replace(\"<br />\",\"\",$textile);\r\n    $textile = rex_a79_textile($textile);\r\n    $textile = str_replace(\"###\",\"&#x20;\",$textile);\r\n  } \r\n  print $file.$textile;\r\n\r\n  echo \'</div>\';\r\n}\r\nelse\r\n{\r\n  echo rex_warning(\'Dieses Modul benötigt das \"textile\" Addon!\');\r\n}\r\n\r\n?>','<?php\r\n\r\necho \'Template-ID: <<\'.$this->getTemplateId().\'>>\';\r\n\r\nif(OOAddon::isAvailable(\'textile\'))\r\n{\r\n?>\r\n\r\n<strong>Fliesstext</strong>:<br />\r\n<textarea name=\"VALUE[1]\" cols=\"80\" rows=\"10\" class=\"inp100\">REX_HTML_VALUE[1]</textarea>\r\n\r\n<?php\r\n\r\nif(OOAddon::isAvailable(\'markitup\'))\r\n{\r\na287_markitup::markitup(\r\n  \'textarea.inp100\'\r\n  );\r\n}\r\n?>\r\n\r\n\r\n<strong>Artikelfoto</strong>:<br />\r\nREX_MEDIA_BUTTON[1]\r\n<?\r\nif (\"REX_FILE[1]\" != \"\") {\r\n        echo \"<br /><strong>Vorschau</strong>:<br />\";\r\n	echo \"<img src=\".$REX[\'HTDOCS_PATH\'].\"/files/REX_FILE[1]><br />\";\r\n}\r\n?>\r\n\r\n<br />\r\n<strong>Title des Fotos</strong>:<br />\r\n<input type=\"text\" name=\"VALUE[2]\" value=\"REX_VALUE[2]\" size=\"80\" class=\"inp100\" />\r\n<br /><br />\r\n\r\n<strong>Ausrichtung des Artikelfotos</strong>:<br />\r\n<select name=\"VALUE[9]\" class=\"inp100\">\r\n	<option value=\'l\' <?php if (\"REX_VALUE[9]\" == \'l\') echo \'selected\'; ?>>links vom Text</option>\r\n</select><br />\r\n<br />\r\n<br />\r\n\r\n<?php\r\nrex_a79_help_overview(); \r\n\r\n}\r\nelse\r\n{\r\n  echo rex_warning(\'Dieses Modul benötigt das \"textile\" Addon!\');\r\n}\r\n\r\n?>','admin','j3ff3',1181731594,1295516970,'',0),
  (3,'01 - Text [textile]',0,'<?php\r\n\r\nif(OOAddon::isAvailable(\'textile\'))\r\n{\r\n  // Fliesstext \r\n  $textile = \'\';\r\n  if(REX_IS_VALUE[1])\r\n  {\r\n    $textile = htmlspecialchars_decode(\"REX_VALUE[1]\");\r\n    $textile = str_replace(\"<br />\",\"\",$textile);\r\n    $textile = rex_a79_textile($textile);\r\n    //$textile = str_replace(\"###\",\"&#x20;\",$textile);\r\n    print \'<div class=\"txt-img\">\'. $textile . \'</div>\';\r\n  } \r\n}\r\nelse\r\n{\r\n  echo rex_warning(\'Dieses Modul benötigt das \"textile\" Addon!\');\r\n}\r\n\r\n?>','<?php\r\n\r\nif(OOAddon::isAvailable(\'textile\'))\r\n{\r\n?>\r\n\r\n<strong>Fliesstext</strong>:<br />\r\n<textarea name=\"VALUE[1]\" cols=\"80\" rows=\"10\" class=\"inp100\">REX_HTML_VALUE[1]</textarea>\r\n<?php\r\nif(OOAddon::isAvailable(\'markitup\'))\r\n{\r\n  a287_markitup::markitup(\'textarea.inp100\');\r\n}\r\n?>\r\n<br />\r\n<?php\r\n\r\nrex_a79_help_overview(); \r\n\r\n}else\r\n{\r\n  echo rex_warning(\'Dieses Modul benötigt das \"textile\" Addon!\');\r\n}\r\n\r\n?>','admin','j3ff3',1181731625,1292954024,'',0),
  (5,'05 - Artikelliste',0,'<?php\r\n\r\n$cat = OOCategory::getCategoryById($this->getValue(\"category_id\"));\r\n$article = $cat->getArticles();\r\n\r\nif (is_array($article)) \r\n{\r\n  foreach ($article as $var) \r\n  {\r\n    $articleId = $var->getId();\r\n    $articleName = $var->getName();\r\n    $articleDescription = $var->getDescription();\r\n    if (!$var->isStartpage()) \r\n    {\r\n      echo \'<a href=\"\'.rex_getUrl($articleId).\'\" class=\"faq\">\'.$articleName.\'</a><br />\';\r\n    }\r\n  }\r\n}\r\n\r\n?>','','admin','j3ff3',1181731691,1292954028,'',0),
  (6,'05 - Kategorienliste',0,'<?php\r\n\r\n$cat = OOCategory :: getCategoryById($this->getValue(\'category_id\'));\r\n$cats = $cat->getChildren();\r\n\r\n$itemsPerSide = \"REX_VALUE[1]\";\r\n$wordsPerArticle = \"REX_VALUE[2]\";\r\n\r\nif (is_array($cats))\r\n{\r\n  $i = 0;\r\n  foreach ($cats as $cat)\r\n  {\r\n    $i += 1;\r\n    if ($i <= $itemsPerSide)\r\n    {\r\n      if ($cat->isOnline())\r\n      {\r\n\r\n        $catId = $cat->getId();\r\n        $catName = $cat->getName();\r\n        $article = $cat->getArticles();\r\n\r\n        if (is_array($article))\r\n        {\r\n          foreach ($article as $var)\r\n          {\r\n            $articleId = $var->getId();\r\n            $articleName = $var->getName();\r\n            $art = new rex_article($articleId);\r\n            $articleContent = $art->getArticle();\r\n\r\n            $articleContent = trim($articleContent);\r\n            $articleContent = str_replace(\'</p>\', \' </p>\', $articleContent);\r\n            $articleContent = str_replace(\'<br />\', \' <br />\', $articleContent);\r\n\r\n            $articlePPath = $REX[\'MEDIAFOLDER\'] . \'files/\' . $var->getValue(\'file\');\r\n\r\n            $output = \'\';\r\n            $words = explode(\' \', $articleContent);\r\n            $wordsCount = count($words);\r\n\r\n            if ($wordsCount < $wordsPerArticle)\r\n              $wEnd = $wordsCount;\r\n            else\r\n              $wEnd = $wordsPerArticle;\r\n\r\n            for ($w = 0; $w < $wEnd; $w++)\r\n            {\r\n              $output .= $words[$w] . \' \';\r\n            }\r\n\r\n            $output = trim($output);\r\n\r\n            $isCloseParagraph = substr($output, -4);\r\n            $isCloseDiv = substr($output, -10);\r\n            $link = \'<a href=\"\' . rex_getUrl($articleId) . \'\" class=\"more\"> ...mehr</a>\';\r\n            $newString = $link . \'</p>\';\r\n\r\n            if ($isCloseParagraph == \'</p>\')\r\n            {\r\n              $output = substr_replace($output, $newString, -4);\r\n            }\r\n            elseif ($isCloseDiv == \'</p></div>\')\r\n            {\r\n              $output = substr_replace($output, $newString.\'</div>\', -10);\r\n            }\r\n            else\r\n            {\r\n              $output .= $newString;\r\n            }\r\n\r\n            // print \'<h2>\'.$articleName.\'</h2>\';\r\n            print \'<div class=\"txt-img\">\' . $output . \'</div>\';\r\n\r\n          }\r\n        }\r\n      }\r\n    }\r\n  }\r\n}\r\n?>','<?php\r\n\r\n//---MODULE BY----------------------\r\n//-- Wegener IT\r\n//-- Mattias Beckmann\r\n//-- www.wegener-it.de\r\n//----------------------------------\r\n\r\n?>\r\n\r\n<strong>Anzahl der Artikel pro Seite</strong><br />\r\n<input name=\"VALUE[1]\" value=\"REX_VALUE[1]\" class=\"inp100\" />\r\n\r\n<br /><br />\r\n<strong>Anzahl der Wörter pro Artikel</strong><br />\r\n<input name=\"VALUE[2]\" value=\"REX_VALUE[2]\" class=\"inp100\" />\r\n\r\n<br />','admin','j3ff3',1181731741,1292954028,'',0),
  (8,'04 - Artikelweiterleitung',0,'<?php\r\n\r\nif($REX[\'REDAXO\']!=1 && REX_ARTICLE_ID != REX_LINK_ID[1])\r\n{\r\n  if ( REX_LINK_ID[1] != 0) \r\n  {\r\n   rex_redirect(REX_LINK_ID[1], $REX[\'CUR_CLANG\']);\r\n  }\r\n}else\r\n{\r\n  echo \"Weiterleitung zu <a href=\'index.php?page=content&article_id=REX_LINK_ID[1]&mode=edit\'>Artikel           REX_LINK[1]</a>\";\r\n}\r\n\r\n?>','Artikel, zu dem Weitergeleitet werden soll:<br /><br />\r\nREX_LINK_BUTTON[1]','admin','j3ff3',1181731807,1292954028,'',0),
  (9,'03 - Bildgalerie',0,'<?php\r\n\r\nif (!isset($REX[\'MODULE_BILDGALERIE_ID\'])) $REX[\'MODULE_BILDGALERIE_ID\'] = 0;\r\nelse $REX[\'MODULE_BILDGALERIE_ID\']++;\r\n\r\nif ($REX[\'MODULE_BILDGALERIE_ID\']==0)\r\n{\r\n?>\r\n<script type=\"text/javascript\">\r\nvar GB_ROOT_DIR = \"files/\";\r\n</script>\r\n<script type=\"text/javascript\" src=\"files/ajs.js\"></script>\r\n<script type=\"text/javascript\" src=\"files/ajs_fx.js\"></script>\r\n<script type=\"text/javascript\" src=\"files/gb_scripts.js\"></script>\r\n<link href=\"files/gb_styles.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n\r\n<?php\r\n}\r\n?>\r\n\r\n<div class=\"galerie\">\r\n\r\n<?php\r\n\r\n$pics_string = \"REX_MEDIALIST[1]\";\r\nif($pics_string != \'\')\r\n{\r\n  $i = 1;\r\n  $pics = explode(\',\',$pics_string);\r\n\r\n  foreach($pics as $pic)\r\n  {\r\n    echo \'<div class=\"image\">\';\r\n\r\n    $title = \'\';\r\n    if ($file = OOMedia::getMediaByFileName($pic)) $title = $file->getTitle();\r\n\r\n    echo \'<a href=\"\'.$REX[\'HTDOCS_PATH\'].\'/files/\'.$pic.\'\" rel=\"gb_imageset[galerie\'.$REX[\'MODULE_BILDGALERIE_ID\'].\']\"><img src=\"\'.$REX[\'HTDOCS_PATH\'].\'/index.php?rex_resize=250a__\'.$pic.\'\" title=\"\'.$title.\'\" alt=\"\'.$title.\'\" /></a>\';\r\n\r\n    echo \'<p>\'.$title.\'</p>\';\r\n    echo \'</div>\';\r\n\r\n    if($i % 2 == 0)\r\n      echo \'<div class=\"clearer\"></div>\';\r\n\r\n    $i++;  \r\n  }\r\n}\r\n\r\n?></div>','Bitte Bilder auswählen:\r\n<br />REX_MEDIALIST_BUTTON[1]\r\n<br /><br />','admin','j3ff3',1192188185,1292954028,'',0),
  (10,'rex - X-Form',0,'<?php\r\n\r\n// MODUL OUT - XO FORM\r\n// v0.16\r\n//--------------------------------------------------------------------------------\r\n\r\n$xform = new rex_xform;\r\nif (\"REX_VALUE[7]\" == 1) $xform->setDebug(TRUE);\r\n$form_data = \'REX_VALUE[3]\';\r\n$form_data = trim(str_replace(\"<br />\",\"\",rex_xform::unhtmlentities($form_data)));\r\n$xform->setFormData($form_data);\r\n$xform->setRedaxoVars(REX_ARTICLE_ID,REX_CLANG_ID); \r\n\r\n// Action/en\r\nif (\"REX_VALUE[10]\" != \"\") $xform->setGetdata(true); // Datein vorher auslesen ?\r\n$xform->setObjectparams(\"answertext\",\"REX_VALUE[6]\"); // Antworttext\r\n$xform->setObjectparams(\"main_table\",\"REX_VALUE[8]\"); // für db speicherungen und unique abfragen\r\n$xform->setObjectparams(\"form_type\",\"REX_VALUE[1]\"); // Aktion einstellen - Nihcts, Speichern, E-Mail, beides ? - form_typ\r\n// E-Mail Action\r\n$xform->setObjectparams(\"mail_subject\",\"REX_VALUE[4]\"); // Mailsubject\r\n$xform->setObjectparams(\"mail_body\",str_replace(\"<br />\",\"\",rex_xform::unhtmlentities(\'REX_VALUE[5]\'))); // Mailsubject\r\n$xform->setObjectparams(\"mail_to\",$REX[\'ERROR_EMAIL\']); // Mail to\r\nif (\"REX_VALUE[2]\" != \"\") $xform->setObjectparams(\"mail_from\",\"REX_VALUE[2]\"); // Mail from\r\nelse $xform->setObjectparams(\"mail_from\",$REX[\'ERROR_EMAIL\']); // Mail from\r\n\r\n// Individuelle Einstellungen\r\n?>REX_PHP_VALUE[9]<?php\r\n\r\n// Ausgabe\r\necho $xform->getForm();\r\n\r\n?>','<?php\r\n\r\n// MODUL IN - XO FORM\r\n// v0.18\r\n// --------------------------------------------------------------------------------\r\n\r\n?>\r\n\r\n<style>\r\nul.xform {\r\n  width:650px;\r\n  float:none;\r\n}</style>\r\n\r\n<br />DebugModus:\r\n<?php\r\n\r\n$dbg = new rex_select();\r\n$dbg->setName(\"VALUE[7]\");\r\n$dbg->setSize(1);\r\n$dbg->setStyle(\"width:100px;\");\r\n$dbg->addOption(\"inakiv\",\"0\");\r\n$dbg->addOption(\"Aktiv\",\"1\");\r\n$dbg->setSelected(\"REX_VALUE[7]\");\r\necho $dbg->get();\r\n\r\n?>\r\n\r\n<br /><br />Formularbeschreibung:\r\n<br /><textarea name=\"VALUE[3]\" style=\"width:90%;height:180px;\">REX_VALUE[3]</textarea>\r\n\r\n<?php rex_xform::showHelp(); ?>\r\n\r\n<br /><br /><b>Danksagung:</b>\r\n<br /><textarea name=\"VALUE[6]\" style=\"width:90%;height:100px;\">REX_VALUE[6]</textarea>\r\n\r\n<br /><br /><hr>\r\n\r\n<br /><b>Was soll passieren ?</b>\r\n<br /><br /><select name=\"VALUE[1]\" onchange=\"rex_xform_toggleDb(this);\" style=\"width:90%;\">\r\n<option value=\"\" <?php if(\"REX_VALUE[1]\" == \"\") echo \" selected \"; ?>>Nichts machen</option>\r\n<option value=\"0\" <?php if(\"REX_VALUE[1]\" == \"0\") echo \" selected \"; ?>>Nur in Datenbank speichern</option>\r\n<option value=\"1\" <?php if(\"REX_VALUE[1]\" == \"1\") echo \" selected \"; ?>>Nur E-Mail versenden</option>\r\n<option value=\"2\" <?php if(\"REX_VALUE[1]\" == \"2\") echo \" selected \"; ?>>E-Mail versenden und in Datenbank speichern</option>\r\n<option value=\"3\" <?php if(\"REX_VALUE[1]\" == \"3\") echo \" selected \"; ?>>E-Mail versenden und Datenbank abfragen</option>\r\n</select>\r\n\r\n<br /><br />\r\n<b>Daten zu Beginn aus der Datenbank holen</b>\r\n<input type=\"checkbox\" value=\"<?php if(\"REX_VALUE[10]\"==\"\") echo \"Ja\"; else echo \"REX_VALUE[10]\";?>\" name=\"VALUE[10]\" <?php if(\"REX_VALUE[10]\"!=\"\") echo \"checked\";?>>\r\n\r\n<div id=\"db_data\">\r\n  <br />\r\n  <fieldset><legend>Datenbankdaten:</legend>\r\n  \r\n  <br /><b>Where Klausel angeben (PHP erlaubt)</b>\r\n  <br />$xform-&gt;setObjectparams(\"main_where\",$where);\r\n  \r\n  <br /><br /><textarea name=\"VALUE[9]\" cols=\"30\" rows=\"3\" style=\"width:90%; height:100px;\">REX_VALUE[9]</textarea>\r\n  \r\n  <div id=\"db_where_info\">\r\n    <table class=\"warning\"><tr><td>\r\n    In der Where Klausel koennen die verschiedenen Felder eingesetzt werden.\r\n    Dazu muss der entsprechende Feldname zwischen ### gesetzt werden. Z.B.\r\n    <br />text|myname|Name|1\r\n    <br />-&gt; ###myname### als Platzhalter in der Mail\r\n    </td></tr></table>\r\n  </div>\r\n  \r\n  <br />\r\n  <br /><b>Bitte Tabelle angeben </b>\r\n  <br />(Diese Tabelle gilt auch bei Uniqueabfragen (Pflichtfeld=2) siehe oben\r\n  <br /><br /><?php\r\n  $gc = new rex_sql;\r\n  $gc->setQuery(\"SHOW TABLES\");\r\n  $tables = $gc->getArray();\r\n  \r\n  $ts = new rex_select;\r\n  $ts->setName(\"VALUE[8]\");\r\n  $ts->setSize(1);\r\n  $ts->addOption(\"Keine Tabelle ausgewählt\", \"\");\r\n  \r\n  foreach ($tables as $key => $value)\r\n  {\r\n    $ts->addOption(current($value), current($value));\r\n  }\r\n  \r\n  $ts->setSelected(\"REX_VALUE[8]\");\r\n  \r\n  echo $ts->show();\r\n  ?>\r\n  </fieldset>\r\n</div>\r\n\r\n\r\n\r\n<div id=\"mail_data\">\r\n  <br /> <br />\r\n  <fieldset><legend>Emailversandtdaten:</legend>\r\n  \r\n  <br /><b>Bitte folgende Daten eingeben</b>\r\n  <br /><br />Absender:\r\n  <br /><input type=\"text\" name=\"VALUE[2]\" value=\"REX_VALUE[2]\"  style=\"width:90%;\" />\r\n  \r\n  <br /><br />Subject:\r\n  <br /><input type=\"text\" name=\"VALUE[4]\" value=\"REX_VALUE[4]\"  style=\"width:90%;\" />\r\n  \r\n  <br /><br />Mailbody:\r\n  <br /><textarea name=\"VALUE[5]\" style=\"width:90%;height:100px;\">REX_VALUE[5]</textarea>\r\n  \r\n  <table class=\"warning\"><tr><td>\r\n  In der Mail koennen die verschiedenen Felder eingesetzt werden.\r\n  Dazu muss der entsprechende Feldname zwischen ### gesetzt werden. Z.B.\r\n  <br />text|myname|Name|1\r\n  <br />-&gt; ###myname### als Platzhalter in der Mail\r\n  </td></tr></table>\r\n  \r\n  </fieldset>\r\n</div>\r\n\r\n<script type=\"text/javascript\">\r\n<!--\r\n\r\nfunction rex_xform_toggleDb(select)\r\n{\r\n   rex_xform_toggleDbValue(select.value);\r\n}\r\n\r\nfunction rex_xform_toggleDbValue(value)\r\n{\r\n   var displayDb = false;\r\n   var displayWhereInfo = false;\r\n   var displayMail = false;\r\n   \r\n   // \'\' => DefaultValue wenn Modul geadded wird\r\n   // 0 => Nur in Datenbank speichern\r\n   // 1 => Nur E-Mail versenden\r\n   // 2 => E-Mail versenden und in Datenbank speichern\r\n   if(value == 0 || value == \'\')\r\n   {\r\n      displayDb = true;\r\n   }\r\n   else if(value == 1)\r\n   {\r\n      displayMail = true;\r\n   }\r\n   else if(value == 2)\r\n   {\r\n      displayDb = true;\r\n      displayMail = true;\r\n   }\r\n   else if(value == 3)\r\n   {\r\n      displayDb = true;\r\n      displayWhereInfo = true;\r\n      displayMail = true;\r\n   }\r\n   \r\n   displayDb = displayDb == true ? \'\' : \'none\';\r\n   rex_xform_toggleElement(\'db_data\', displayDb);\r\n   \r\n   displayWhereInfo = displayWhereInfo == true ? \'\' : \'none\';\r\n   rex_xform_toggleElement(\'db_where_info\', displayWhereInfo);\r\n   \r\n   displayMail = displayMail == true ? \'\' : \'none\';\r\n   rex_xform_toggleElement(\'mail_data\', displayMail);\r\n}\r\n\r\n// Wenn der 2. Parameter angegeben wird, wird die style.display Eigenschaft auf den entsprechenden wert gesetzt,\r\n// Sonst wird der wert getoggled\r\nfunction rex_xform_toggleElement(id,display)\r\n{\r\n   var needle = new getObj(id);\r\n   \r\n   if (typeof(display) == \'undefined\')\r\n   {\r\n     needle.style.display = needle.style.display == \'\' ? \'none\' : \'\';\r\n   }\r\n   else\r\n   {\r\n     needle.style.display = display;\r\n   }\r\n}\r\n\r\nrex_xform_toggleDbValue(\"REX_VALUE[1]\");\r\n\r\n//-->\r\n</script>','','j3ff3',0,1292954028,'',0),
  (11,'CODE (HTML/PHP/JS)',0,'REX_PHP','PHP:<br>\r\n<textarea name=INPUT_PHP cols=80 rows=20 class=inp100>REX_PHP</textarea>\r\n<br><br>','j3ff3','j3ff3',1276745025,1292954028,'',0),
  (12,'gn2 textile',0,'<?php\r\n$textile = \'\';\r\n$markitup_textile_preview = rex_post(\'markitup_textile_preview_REX_SLICE_ID\', \'string\');\r\nif ($markitup_textile_preview != \'\')\r\n{\r\n	$textile = utf8_decode(stripslashes($markitup_textile_preview));\r\n}\r\nelseif(REX_IS_VALUE[1])\r\n{\r\n	$textile = htmlspecialchars_decode(\'REX_VALUE[1]\');	\r\n}\r\n\r\nif ($textile != \'\')\r\n{\r\n	$textile = str_replace(\"<br />\", \"\", $textile);\r\n	echo rex_a79_textile($textile);\r\n}\r\n?>','<strong>Text:</strong><br/>\r\n<textarea name=\"VALUE[1]\" class=\"markitup-text\" cols=\"80\" rows=\"10\">REX_VALUE[1]</textarea>\r\n\r\n<?php\r\na287_markitup::markitup(\'textarea.markitup-text\',\r\n\'h1,h2,h3,h4,h5,h6,separator,alignleft,alignright,aligncenter,alignjustify,separator,bold,italic,stroke,underline,superscript,subscript,table,separator,listbullet,listnumeric,separator,image,linkmedia,separator,linkintern,linkextern,linkmailto,separator,blockquote,code,separator,clean,separator,preview\',\r\n\'700\',\'400\'\r\n);\r\n?>','j3ff3','j3ff3',1277383357,1292954028,'',0),
  (13,'SmartAuth - Login',0,'<form action=\"<?php echo rex_getUrl(\"REX_ARTICLE_ID\", \"REX_CLANG_ID\", array(\"redirect_to\"=>rex_get(\"redirect_to\",\"int\"), \"login\"=>\"1\")); ?>\" method=\"POST\">\r\n<input type=\"password\" name=\"auth_pw\">\r\n<input type=\"submit\" value=\"Anmelden\">\r\n</form>','SmartAuth Login Modul','j3ff3','j3ff3',1295534770,1295534771,'',''),
  (14,'REXDEV MODUL TEMPLATE',0,'','<?php\r\n/**\r\n* REXDEV MODUL TEMPLATE - MODUL IN\r\n*\r\n* @version 0.0.1 - $Revision: 8 $\r\n*\r\n* @param REX_VALUE  1  =  \r\n* @param REX_VALUE  2  =  \r\n* @param REX_VALUE  3  =  \r\n* @param REX_VALUE  4  =  \r\n* @param REX_VALUE  5  =  \r\n* @param REX_VALUE  6  =  \r\n* @param REX_VALUE  7  =  \r\n* @param REX_VALUE  8  =  \r\n* @param REX_VALUE  9  =  \r\n* @param REX_VALUE 10  =  \r\n* @param REX_VALUE 11  =  \r\n* @param REX_VALUE 12  =  \r\n* @param REX_VALUE 13  =  \r\n* @param REX_VALUE 14  =  \r\n* @param REX_VALUE 15  =  \r\n* @param REX_VALUE 16  =  \r\n* @param REX_VALUE 17  =  \r\n* @param REX_VALUE 18  =  \r\n* @param REX_VALUE 19  =  \r\n* @param REX_VALUE 20  =  \r\n*\r\n* @param REX_FILE   1  =  \r\n*\r\n* $Id: rexdev_modul_template.rexmodul.in.php 8 2011-02-03 12:16:01Z jeffe $:\r\n*/\r\n\r\n// ERROR_REPORTING\r\n////////////////////////////////////////////////////////////////////////////////\r\n/*ini_set(\'error_reporting\', E_ALL);\r\nini_set(\'display_errors\', 1);*/\r\n\r\n// MARKITUP \r\n////////////////////////////////////////////////////////////////////////////////\r\nif(OOAddon::isAvailable(\"markitup\"))\r\n  a287_markitup::markitup(\'textarea.markitup-text2\');\r\n\r\n\r\n// STATIC VARS & DEFAULTS\r\n////////////////////////////////////////////////////////////////////////////////\r\n  $text_input     = \'default text_input\';\r\n\r\n// USER VALUES\r\n////////////////////////////////////////////////////////////////////////////////\r\n  if (@$_REQUEST[\'function\'] != \'add\')\r\n  {\r\n    $text_input   = \"REX_VALUE[1]\";\r\n  }\r\n\r\n\r\necho \'\r\n<!-- stylesheet-->\r\n  <style type=\"text/css\" media=\"screen\">\r\n  <!--\r\n    /*REXDEV MODUL STYLE*/\r\n    #rexdev                   {margin:0;padding:0;line-height:25px;}\r\n    #rexdev div.row           {margin:2px 0 2px 0;padding:0;}\r\n    #rexdev .fullwidth        {width:99%;}\r\n    #rexdev fieldset          {background:#E4E1D1;margin:-20px 0 0 0;padding: 4px 10px 10px 10px;-moz-border-radius:6px;-webkit-border-radius:6px;border-radius:6px;}\r\n    #rexdev fieldset legend   {display:block !important;position:relative !important;height:auto !important;top:0 !important;left:0 !important;width:100% !important;margin:0 0 0 0 !important;padding:30px 0 0 0px !important;background:transparent !important;border-bottom:1px solid #B1B1B1 !important;color:gray;font-size:14px;font-weight:bold;}\r\n    #rexdev fieldset label    {display:inline-block !important;width:150px !important;font-weight:bold;vertical-align:top;}\r\n    #rexdev input,\r\n    #rexdev textarea,\r\n    #rexdev select            {width:540px;border:auto;margin:0 !important;padding:0 !important;}\r\n    #rexdev hr                {border:0;height:0;margin:4px 0 4px 0;padding:0;border-top:1px solid #B1B1B1 !important;}\r\n  -->\r\n  </style>\r\n<!-- /stylesheet-->\r\n\r\n\r\n<div id=\"rexdev\">\r\n\r\n  <fieldset>\r\n    <legend>Text Inputs</legend>\r\n\r\n    <div class=\"row\">\r\n      <label for=\"text_input\">text input:</label>\r\n      <input id=\"text_input\" type=\"text\" maxlength=\"20\" name=\"VALUE[1]\" value=\"\'.$text_input.\'\" />\r\n    </div>\r\n\r\n    <div class=\"row\">\r\n      <label for=\"markitup-text1\">textarea:</label>\r\n      <textarea name=\"VALUE[3]\">REX_HTML_VALUE[2]</textarea>\r\n    </div>\r\n\r\n    <div class=\"row\">\r\n      <label for=\"markitup-text1\"  class=\"fullwidth\">textarea (fullwidth):</label><br>\r\n      <textarea class=\"fullwidth\" name=\"VALUE[2]\">REX_HTML_VALUE[2]</textarea>\r\n    </div>\r\n\r\n    <div class=\"row\">\r\n      <label for=\"markitup-text1\" style=\"width:99% !important;\">textarea (markitup):</label><br>\r\n      <textarea class=\"markitup-text2\" name=\"VALUE[4]\" style=\"width:99%;height:70px;\">REX_HTML_VALUE[4]</textarea>\r\n    </div>\r\n\r\n    <hr/>\r\n\r\n\r\n  </fieldset>\r\n\r\n</div><!-- /.rexdev -->\r\n\';\r\n\r\n?>','j3ff3','j3ff3',1296736073,1296737719,'',''),
  (15,'tiny',0,'<?php\r\nif (REX_IS_VALUE[1])\r\n{\r\n$wysiwigvalue =<<<EOD\r\nREX_HTML_VALUE[1]\r\nEOD;\r\n\r\n  if (trim($wysiwigvalue) <> \'\')\r\n  {\r\n    echo \'<div class=\"tinymcewysiwyg\">\';\r\n    echo $wysiwigvalue;\r\n    echo \'</div>\';\r\n  }\r\n}\r\n?>','<strong>Fliesstext:</strong><br />\r\n\r\n<textarea name=\"VALUE[1]\" class=\"tinyMCEEditor\" style=\"width:555px; height:250px;\">\r\nREX_VALUE[1]\r\n</textarea>','j3ff3','j3ff3',1298342453,1298342706,'',''),
  (16,'test',0,'<?php\r\n\r\n$rex_background = \'fgc_ffffff.fgo_50.png\';\r\n$rex_background = explode(\'.\',strtolower($rex_background));\r\n\r\nforeach($rex_background as $k => $v)\r\n{\r\n  if($v==\'png\' || $v==\'jpg\' || $v==\'gif\')\r\n  {\r\n    $rex_background[\'f\'] = $v;\r\n  }\r\n  else\r\n  {\r\n    $v = explode(\'_\',$v);\r\n    $rex_background[$v[0]] = $v[1];\r\n  }\r\n  unset($rex_background[$k]);\r\n}\r\n\r\nfb($rex_background,\'$rex_background\');\r\n\r\nfb(rex_get(\'foobar\',\'string\',false),\'$rex_get foobar\');\r\n\r\n?>','','j3ff3','j3ff3',1298678913,1298692166,'','');
/*!40000 ALTER TABLE `rex_module` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_module_action`;
CREATE TABLE `rex_module_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL DEFAULT '0',
  `action_id` int(11) NOT NULL DEFAULT '0',
  `revision` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `rex_template`;
CREATE TABLE `rex_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `createuser` varchar(255) NOT NULL,
  `updateuser` varchar(255) NOT NULL,
  `createdate` int(11) NOT NULL DEFAULT '0',
  `updatedate` int(11) NOT NULL DEFAULT '0',
  `attributes` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

LOCK TABLES `rex_template` WRITE;
/*!40000 ALTER TABLE `rex_template` DISABLE KEYS */;
INSERT INTO `rex_template` VALUES 
  (1,'','default','<?php\r\n\r\nif(OOAddon::isAvailable(\'rexseo\'))\r\n{\r\n  $meta_description = rexseo::description();\r\n  $meta_keywords    = rexseo::keywords();\r\n  $meta_title       = rexseo::title();\r\n  $meta_canonical   = rexseo::canonical();\r\n  $meta_base        = rexseo::base();\r\n  //$meta_base        = \'http://\'.$_SERVER[\'HTTP_HOST\'].\'/\';\r\n}\r\nelse\r\n{\r\n  $OOStartArticle = OOArticle::getArticleById($REX[\'START_ARTICLE_ID\'], $REX[\'CUR_CLANG\']);\r\n  // GENRELLE DESC/KEYS VOM STARTIKEL\r\n  $meta_description = $OOStartArticle->getValue(\"art_description\");\r\n  $meta_keywords    = $OOStartArticle->getValue(\"art_keywords\");\r\n\r\n  // SPEZIFISCHE DESC/KEYS FALLS IM ARTIKEL DEFINIERT\r\n  if($this->getValue(\"art_description\") != \"\")\r\n    $meta_description = htmlspecialchars($this->getValue(\"art_description\"));\r\n  if($this->getValue(\"art_keywords\") != \"\")\r\n    $meta_keywords    = htmlspecialchars($this->getValue(\"art_keywords\"));\r\n\r\n  $meta_title         = $REX[\'SERVERNAME\'].\' | \'.$this->getValue(\"name\");\r\n  $meta_canonical     = isset($_REQUEST[\'REQUEST_URI\']) ? $_REQUEST[\'REQUEST_URI\'] : \'\';\r\n  $meta_base          = \'http://\'.$_SERVER[\'HTTP_HOST\'].\'/\';\r\n}\r\n\r\n?><!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"\r\n  \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\r\n\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"de\" lang=\"de\">\r\n<head>\r\n  <base href=\"<?php echo $meta_base; ?>\" />\r\n  <title><?php echo $meta_title; ?></title>\r\n  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n  <meta       name=\"keywords\"     content=\"<?php echo $meta_keywords; ?>\" />\r\n  <meta       name=\"description\"  content=\"<?php echo $meta_description; ?>\" />\r\n  <link        rel=\"canonical\"       href=\"<?php echo $meta_canonical; ?>\" />\r\n\r\n\r\n  <link rel=\"stylesheet\" type=\"text/css\" href=\"<?php echo $REX[\'HTDOCS_PATH\'] ?>files/main.css\" media=\"screen\" />\r\n  <link rel=\"stylesheet\" type=\"text/css\" href=\"<?php echo $REX[\'HTDOCS_PATH\'] ?>files/navigation.css\" media=\"screen\" />\r\n  <link rel=\"stylesheet\" type=\"text/css\" href=\"<?php echo $REX[\'HTDOCS_PATH\'] ?>files/content.css\" media=\"screen\" />\r\n  <link rel=\"stylesheet\" type=\"text/css\" href=\"<?php echo $REX[\'HTDOCS_PATH\'] ?>files/default.css\" media=\"screen\" />\r\n\r\n\r\n</head>\r\n\r\n<body class=\"mainPage\" <?php\r\nif($REX[\"CUR_CLANG\"] != 0)\r\necho \'style=\"background:orange !important;\" \'; ?>\r\n>\r\nREX_TEMPLATE[4]\r\n  <div>\r\n    <a name=\"top\" id=\"top\"></a>\r\n  </div>\r\n\r\n  <div id=\"site-content\">\r\n    <div id=\"column\">\r\n      \r\n      <div id=\"header\">\r\n        <div id=\"logo\">\r\n          <a href=\"<?php echo $REX[\'HTDOCS_PATH\'] ?>index.php\" title=\"Zur&uuml;ck zur Startseite\">REDAXO Demo</a>\r\n        </div>\r\n      </div>\r\n      \r\n      <div id=\"content\">\r\n\r\n        <div id=\"main-content\">\r\n\r\n          <div id=\"nav\">\r\n            REX_TEMPLATE[2]\r\n            <p class=\"copy\">&copy; by <a href=\"http://www.redaxo.de\">REDAXO</a></p>\r\n          </div>\r\n\r\n          <div id=\"main\">\r\n            <div id=\"main-block\">\r\n              <div id=\"main-teaser\">\r\n                Slogan: Einfach, flexibel, sinnvoll\r\n              </div>\r\n\r\n              <div id=\"main-content-block\">\r\n                REX_TEMPLATE[3]\r\n                REX_ARTICLE[]\r\n              </div>\r\n            </div>\r\n          </div>\r\n          <br class=\"clear\" />\r\n\r\n        </div>\r\n\r\n      </div>\r\n\r\n      <div id=\"footer\">\r\n        <p class=\"floatRight\"><a href=\"http://www.redaxo.de\">REDAXO CMS</a> - SIMPLE DEMO | XHTML 1.0 Strict | pictures by <a href=\"http://www.photocase.com\">photocase.com</a></p>\r\n        <br class=\"clear\" />\r\n      </div>\r\n\r\n    </div>\r\n  </div>\r\n<div style=\"display:none;\">Eigene Templates sind besser - REDAXO</div>\r\n</body>\r\n</html>\r\n',1,'j3ff3','j3ff3',1296650567,1298647889,'a:3:{s:10:\"categories\";a:1:{s:3:\"all\";s:1:\"1\";}s:5:\"ctype\";a:0:{}s:7:\"modules\";a:1:{i:1;a:1:{s:3:\"all\";s:1:\"1\";}}}'),
  (3,'','Navigation: Breadcrumb','<?php\r\n\r\n// ---------- BREADCRUMB\r\n\r\n// Beginne in der Wurzelkategorie\r\n// 1 Ebene Tief\r\n// Nicht aufklappen (hier egal da nur 1 Ebene)\r\n// Offline ausblenden \r\n\r\n$category_id = 0;\r\n$includeCurrent = TRUE;\r\n\r\n// navigation generator erstellen\r\n$nav = rex_navigation::factory();\r\n\r\necho \'<div id=\"breadcrumb\">\';\r\nif ($REX[\'CUR_CLANG\'] == 1)\r\n{\r\n  echo \'<p>You are here:</p>\'. $nav->getBreadcrumb(\'Startpage\', $includeCurrent, $category_id);\r\n}\r\nelse\r\n{\r\n  echo \'<p>Sie befinden sich hier:</p>\'. $nav->getBreadcrumb(\'Startseite\', $includeCurrent, $category_id);\r\n}\r\necho \'</div>\';\r\n?>',0,'admin','j3ff3',1237380161,1292935301,'a:2:{s:7:\"modules\";a:1:{i:1;a:1:{s:3:\"all\";s:1:\"1\";}}s:5:\"ctype\";a:0:{}}'),
  (2,'','Navigation: Links','<?php\r\n\r\n// navigation generator erstellen\r\n$nav = rex_navigation::factory();\r\n\r\n// ---------- HEAD NAVI\r\n\r\n// Beginne in der Wurzelkategorie\r\n// 1 Ebene Tief\r\n// Nicht aufklappen (hier egal da nur 1 Ebene)\r\n// Offline ausblenden\r\n\r\n$category_id = 0;\r\n$depth = 3;\r\n$open = FALSE;\r\n$ignore_offlines = TRUE;\r\n\r\necho $nav->get($category_id, $depth, $open, $ignore_offlines);\r\n\r\n?>',0,'admin','j3ff3',1237373552,1292935301,'a:2:{s:7:\"modules\";a:1:{i:1;a:1:{s:3:\"all\";s:1:\"1\";}}s:5:\"ctype\";a:0:{}}'),
  (4,'','DEV includes','<?php\r\n\r\n//include_once \'redaxo/include/addons/rexseo/#dev-files/dev.tmpl.inc.php\';\r\n\r\n?>',0,'j3ff3','j3ff3',1298874576,1298874576,'a:3:{s:10:\"categories\";a:1:{s:3:\"all\";s:1:\"1\";}s:5:\"ctype\";a:0:{}s:7:\"modules\";a:1:{i:1;a:1:{s:3:\"all\";s:1:\"1\";}}}');
/*!40000 ALTER TABLE `rex_template` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_xform_email_template`;
CREATE TABLE `rex_xform_email_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `mail_from` varchar(255) NOT NULL,
  `mail_from_name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
