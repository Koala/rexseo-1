<?php
// SITEMAP.PHP (used to generate xml sitemap for google and co. for a redaxo website)

// VERSION 1.1.0 (2010-04-26):
// first version by: Joachim Schloeffel, www.2s-it.de
// this version by: Rudi, www.webdevone.de
// sitemap.php is now part of REXseo (gn2-code.de), but it can also be used without this excellent addon

// CHANGES AND FEATURES SINCE FIRST VERSION:
// * works with redaxo 4.x and REXseo
// * articles that who don't belong to a category will also be considered
// * priority and changefreq will be calculated automatically, but can also be set globally
// * changefreq calculation is improved and supports setting 'daily'
// * multi-language sites supported
// * on/offline status of articles will be considered

// USAGE:
// if used within REXseo you do not have to do anything!
// if used as standalone version (without REXseo):
//		- put sitemap.php in www root folder of your webserver (where index.php of redaxo frontend resides)
//		- you can edit your .htaccess file in your root folder to make sitemap.php available as sitemap.xml (rewrite engine must be on)
//				RewriteRule ^sitemap\.xml$ sitemap.php [NC,L]

// SETTINGS ------------------------------------------------------------------------------------ //

// you can modifiy this variables if you want to influence automatic changefreq and priority calculation
$auto_changefreq = true; // if true changefreq will be calculated automatically
$default_changefreq = 'daily'; // if you set $auto_changefreq to false you can define default changefreq for all pages. possible values: never, yearly, monthly, weekly, daily, hourly, or always

$auto_priority = true; // if true priority will be calculated automatically
$default_priority = '1.00'; // otherwise set default priority for all pages


// FUNCTIONS ----------------------------------------------------------------------------------- //

function calcChangeFreq($article) {
	$articleUpdatedTime = $article->getUpdatedate();
	$actualtime = time();
	$timepastsinceupdate = $actualtime - $articleUpdatedTime;

	if ($timepastsinceupdate < 604800) { // < 1 woche = 604800 sek. (24h = 86400 sek.)
		$changefreq = 'daily';
	} else if ($timepastsinceupdate < 2419200) { // < 4 wochen
		$changefreq = 'weekly';
	} else {
		$changefreq = 'monthly';
	}

	return $changefreq;
}

function getArticleAsXML($article, $priority, $ignoreOffline = false) {
	global $REX;
	global $auto_priority;
	global $default_priority;
	global $auto_changefreq;
	global $default_changefreq;
	$out = "";

	if ($article->isOnline() || $ignoreOffline) {
		$xml_loc = $REX['SERVER'] . ltrim($article->getUrl(),'/');
		$xml_lastmod = date("Y-m-d\TH:i:s", $article->getUpdatedate()) . "+00:00";
		$xml_changefreq = $default_changefreq;
		$xml_priority = $default_priority;

		// this is a hack due to current rexseo version, should be solved better
		if ($article->getUrl() == "/") {
			$xml_loc = $REX['SERVER'];
		}

		// priority
		if ($article->getID() == $REX['START_ARTICLE_ID'] && $article->getClang() == $REX['START_CLANG_ID']) {
			// the start article has priority 1.00
			$xml_priority = "1.00";
		} else if ($auto_priority) {
			if ($article->getValue("art_rexseo_priority") != "") {
				// use metafield value
				$xml_priority = $article->getValue("art_rexseo_priority");
			} else {
				// otherwiese use calculated
				$xml_priority = number_format($priority, 2, ".", "");
			}
		}

		// changefreq
		if ($auto_changefreq) {
			if ($article->getValue("art_rexseo_changefreq") != "") {
				// use metafield value
				$xml_changefreq = $article->getValue("art_rexseo_changefreq");
			} else {
				// otherwiese calculate
				$xml_changefreq = calcChangeFreq($article);
			}
		}

		$out .= "\t<url>\n";
		$out .= "\t\t<loc>" . $xml_loc . "</loc>\n";
		$out .= "\t\t<lastmod>" . $xml_lastmod . "</lastmod>\n";
		$out .= "\t\t<changefreq>" . $xml_changefreq . "</changefreq>\n";
		$out .= "\t\t<priority>" . $xml_priority . "</priority>\n";
		$out .= "\t</url>\n";
	}

	return $out;
}

function getArticles($category, $priority = 0.8) { // recursive function
	global $REX;
	$out = "";

	foreach ($category->getChildren() as $subcat) {
		if ($subcat->isOnline()) {
			$out .= getArticles($subcat, round($priority * 0.8, 2));
		}
	}

	foreach ($category->getArticles() as $article) {
		$out .= getArticleAsXML($article, $priority);
	}

	return $out;
}

// MAKE XML ------------------------------------------------------------------------------------ //

$xml_output = '<?xml version="1.0" encoding="UTF-8"?>'."\n";
$xml_output .= "<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n";

// consider all languages
$langs = array_keys($REX['CLANG']); // get clang ids

foreach ($langs as $lang) {
	// go through main categories and add articles to xml
	foreach (OOCategory::getRootCategories(true, $lang) as $maincat) {
		if ($maincat->isOnline()) {
			$xml_output .= getArticles($maincat);
		}
	}

	// do the same with articles that doesn't belong to a category
	foreach (OOArticle::getRootArticles(true, $lang) as $art) {
		if ($art->isOnline()) {
			$xml_output .= getArticleAsXML($art, 0.8);
		}
	}
}

$xml_output .= '</urlset>';

// OUTPUT -------------------------------------------------------------------------------------- //

header('Content-Type: application/xml');
header('Content-Length: '.strlen($xml_output));
echo $xml_output;
?>