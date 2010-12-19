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

// MAIN PARAMS
////////////////////////////////////////////////////////////////////////////////
$myself          = rex_request('page',            'string');
$subpage         = rex_request('subpage',         'string');
$func            = rex_request('func',            'string');

// SETTINGS PARAMS
////////////////////////////////////////////////////////////////////////////////
$def_desc        = rex_request('def_desc',        'array');
$def_keys        = rex_request('def_keys',        'array');
$robots          = rex_request('robots',          'string');
$homeurl         = rex_request('homeurl',         'int');
$homelang        = rex_request('homelang',        'int');
$allow_articleid = rex_request('allow_articleid', 'int');
$levenshtein     = rex_request('levenshtein',     'int');
$redirects       = rex_request('301s',            'string');
$url_schema      = rex_request('url_schema',      'string');
$url_ending      = rex_request('url_ending',      'string');
$expert_settings = rex_request('expert_settings', 'int');
$alert_setup     = $REX['ADDON'][$myself]['alert_setup'];
$first_run       = rex_request('first_run',       'int');
$rewrite_params  = rex_request('rewrite_params',  'int');
$params_starter  = rex_request('params_starter',  'string');
$sendit          = rex_request('sendit',          'string');

// RESTORE SETTINGS FROM BACKUP FILE
////////////////////////////////////////////////////////////////////////////////
$backup = $REX['HTDOCS_PATH'].'files/addons/rexseo_backup/rexseo_config_backup.inc.php';
if(file_exists($backup))
{
  if($REX['ADDON'][$myself]['first_run'] == 1 && $sendit == '')
  {
    require_once $backup;
    echo rex_info('Daten wurde aus Backup ins Formular &uuml;bernommen - bitte Einstellungen speichern!');
  }
}

// UPDATE/SAVE SETTINGS
////////////////////////////////////////////////////////////////////////////////
if ($func == "update")
{
  // INSTALL BACKUP FILE
  if(!file_exists($backup))
  {
    $source = $REX['INCLUDE_PATH'].'/addons/'.$myself.'/install/backup/';
    $target = $REX['HTDOCS_PATH'];
    rexseo_recursive_copy($source, $target);
  }

  $REX['ADDON'][$myself]['def_desc']        = $def_desc;
  $REX['ADDON'][$myself]['def_keys']        = $def_keys;
  $REX['ADDON'][$myself]['robots']          = $robots;
  $REX['ADDON'][$myself]['homeurl']         = $homeurl;
  $REX['ADDON'][$myself]['homelang']        = $homelang;
  $REX['ADDON'][$myself]['allow_articleid'] = $allow_articleid;
  $REX['ADDON'][$myself]['levenshtein']     = $levenshtein;
  $REX['ADDON'][$myself]['301s']            = $redirects;
  $REX['ADDON'][$myself]['url_schema']      = $url_schema;
  $REX['ADDON'][$myself]['url_ending']      = $url_ending;
  $REX['ADDON'][$myself]['expert_settings'] = $expert_settings;
  $REX['ADDON'][$myself]['alert_setup']     = $alert_setup;
  $REX['ADDON'][$myself]['first_run']       = $first_run;
  $REX['ADDON'][$myself]['rewrite_params']  = $rewrite_params;
  $REX['ADDON'][$myself]['params_starter']  = $params_starter;

  $content = '
$REX[\'ADDON\'][\'rexseo\'][\'def_desc\']        = '.var_export($def_desc,true).';
$REX[\'ADDON\'][\'rexseo\'][\'def_keys\']        = '.var_export($def_keys,true).';
$REX[\'ADDON\'][\'rexseo\'][\'robots\']          = \''.$robots         .'\';
$REX[\'ADDON\'][\'rexseo\'][\'homeurl\']         = '  .$homeurl        .';
$REX[\'ADDON\'][\'rexseo\'][\'homelang\']        = '  .$homelang       .';
$REX[\'ADDON\'][\'rexseo\'][\'allow_articleid\'] = '  .$allow_articleid.';
$REX[\'ADDON\'][\'rexseo\'][\'levenshtein\']     = '  .$levenshtein    .';
$REX[\'ADDON\'][\'rexseo\'][\'301s\']            = \''.$redirects      .'\';
$REX[\'ADDON\'][\'rexseo\'][\'url_schema\']      = \''.$url_schema     .'\';
$REX[\'ADDON\'][\'rexseo\'][\'url_ending\']      = \''.$url_ending     .'\';
$REX[\'ADDON\'][\'rexseo\'][\'expert_settings\'] = '  .$expert_settings.';
$REX[\'ADDON\'][\'rexseo\'][\'alert_setup\']     = '  .$alert_setup    .';
$REX[\'ADDON\'][\'rexseo\'][\'first_run\']       = '  .$first_run      .';
$REX[\'ADDON\'][\'rexseo\'][\'rewrite_params\']  = '  .$rewrite_params .';
$REX[\'ADDON\'][\'rexseo\'][\'params_starter\']  = \''.$params_starter .'\';
';

  $file = $REX['INCLUDE_PATH'].'/addons/rexseo/config.inc.php';
  rex_replace_dynamic_contents($file, $content);
  rex_replace_dynamic_contents($backup, $content);

  echo rex_info('Einstellungen wurden gespeichert, '.rex_generateAll().'.');
}

// SVN & DOWNLOAD CHECK
////////////////////////////////////////////////////////////////////////////////
$Parser = new SimplePie();
$Parser->set_cache_location($REX['INCLUDE_PATH'].'/generated/files');
$Parser->set_feed_url('http://www.gn2-code.de/projects/rexseo/activity.atom?key=4372f934b085621f0878e4d8d2dc8b1a4c3fd9dc');
$Parser->init();
$Parser->handle_content_type();

$this_revision = intval($REX['ADDON'][$myself]['VERSION']['SUBVERSION']);
$latest_download = false;
foreach ($Parser->get_items(0,10) as $item)
{
  $title = $item->get_title();
  if (strpos($title,'.zip') !== false)
  {
    $latest_download = intval(str_replace('rexseo_1.2_r','',$title));
    $latest_download = intval(str_replace('.zip','',$latest_download));
    break;
  }
}

if($latest_download > $this_revision)
{
  echo rex_info('Eine neue Download Version ist verf&uuml;gbar: <a href="index.php?page='.$myself.'&subpage=help&chapter=downloads&highlight='.$title.'">'.$title.'</a>');
}

if($REX['ADDON']['rexseo']['svn_version_notify'] == 1)
{
  $latest_revision = false;
  foreach ($Parser->get_items(0,10) as $item)
  {
    $title = $item->get_title();
    if (strpos($title,'Revision') !== false)
    {
      $latest_revision = intval(str_replace('Revision ','',$title));
      break;
    }
  }

  if($latest_revision > $this_revision)
  {
    echo rex_info('Eine neue SVN Version ist verf&uuml;gbar: <a href="index.php?page='.$myself.'&subpage=help&chapter=changelog&highlight=Revision+'.$latest_revision.'">Revision '.$latest_revision.'</a>');
  }
}
unset($Parser);

// URL_SCHEMA SELECT BOX
////////////////////////////////////////////////////////////////////////////////
$url_schema_select = new rex_select();
$url_schema_select->setSize(1);
$url_schema_select->setName('url_schema');
$url_schema_select->addOption('RexSEO','rexseo');
$url_schema_select->addOption('url_rewrite','url_rewrite');
$url_schema_select->setAttribute('style','width:250px');
$url_schema_select->setSelected($REX['ADDON'][$myself]['url_schema']);

// URL_ENDING SELECT BOX
////////////////////////////////////////////////////////////////////////////////
$url_ending_select = new rex_select();
$url_ending_select->setSize(1);
$url_ending_select->setName('url_ending');
$url_ending_select->addOption('.html','.html');
$url_ending_select->addOption('/','/');
$url_ending_select->addOption('(ohne)','');
$url_ending_select->setAttribute('style','width:70px;margin-left:20px;');
$url_ending_select->setSelected($REX['ADDON'][$myself]['url_ending']);


// HOMEURL SELECT BOX
////////////////////////////////////////////////////////////////////////////////
$ooa = OOArticle::getArticleById($REX['START_ARTICLE_ID']);
if($ooa)
{
  $homename = strtolower($ooa->getName());
}
else
{
  $homename = 'Startartikel';
}
unset($ooa);

$homeurl_select = new rex_select();
$homeurl_select->setSize(1);
$homeurl_select->setName('homeurl');
$homeurl_select->addOption($REX['SERVER'].$homename.'.html',0);
$homeurl_select->addOption($REX['SERVER'],1);
$homeurl_select->setAttribute('style','width:250px;');
$homeurl_select->setSelected($REX['ADDON'][$myself]['homeurl']);


// HOMELANG SELECT BOX
////////////////////////////////////////////////////////////////////////////////
if(count($REX['CLANG']) > 1)
{
  $homelang_select = new rex_select();
  $homelang_select->setSize(1);
  $homelang_select->setName('homelang');
  foreach($REX['CLANG'] as $id => $str)
  {
    $homelang_select->addOption($str,$id);
  }
  $homelang_select->setSelected($REX['ADDON'][$myself]['homelang']);
  $homelang_select->setAttribute('style','width:70px;margin-left:20px;');
  $homelang_box = '
              <span style="margin:0 4px 0 4px;display:inline-block;width:100px;text-align:right;">
                Sprache: <a class="help-icon" title="Hilfe zum Thema anzeigen" href="index.php?page=rexseo&subpage=help&chapter=settings&highlight='.urlencode('Sprache:').'#settings">?</a>
              </span>
              '.$homelang_select->get().'
              ';
}
else
{
  $homelang_box = '';
}

// ARTICLE_ID SELECT BOX
////////////////////////////////////////////////////////////////////////////////
$allow_articleid_select = new rex_select();
$allow_articleid_select->setSize(1);
$allow_articleid_select->setName('allow_articleid');
$allow_articleid_select->addOption('Nicht zulässig, nur rewrite URLs'           ,0);
$allow_articleid_select->addOption('Zulässig, 301 Weiterleitung auf korrekte URL (ohne Parameter)',1);
$allow_articleid_select->addOption('Zulässig ohne Weiterleitung'                ,2);
$allow_articleid_select->setSelected($REX['ADDON'][$myself]['allow_articleid']);


// LEVENSHTEIN SELECT BOX
////////////////////////////////////////////////////////////////////////////////
$levenshtein_select = new rex_select();
$levenshtein_select->setSize(1);
$levenshtein_select->setName('levenshtein');
$levenshtein_select->addOption('Strikte URL-Übereinstimmung, sonst Fehlerseite (404)',0);
$levenshtein_select->addOption('Artikel mit ähnlichster URL anzeigen',1);
$levenshtein_select->setSelected($REX['ADDON'][$myself]['levenshtein']);


// PARAMS REWRITE SELECT BOX
////////////////////////////////////////////////////////////////////////////////
$params_rewrite_select = new rex_select();
$params_rewrite_select->setSize(1);
$params_rewrite_select->setName('rewrite_params');
$params_rewrite_select->setAttribute('style','width:250px;');
//$params_rewrite_select->setAttribute('onchange','toggle');
$params_rewrite_select->addOption('Aus : ?param1=wert1&param2=wert2',0);
$params_rewrite_select->addOption('Ein : '.$REX['ADDON'][$myself]['params_starter'].'/param1/wert1/param2/wert2',1);
$params_rewrite_select->setSelected($REX['ADDON'][$myself]['rewrite_params']);



// EXPERT SETTINGS CHECKBOX OPTIONS
////////////////////////////////////////////////////////////////////////////////
if($REX['ADDON'][$myself]['expert_settings'] == 1)
{
  $expert_display = '';
  $expert_checked = 'checked="checked"';
}
else
{
  $expert_display = 'display:none;';
  $expert_checked = '';
}


// FORM
////////////////////////////////////////////////////////////////////////////////
echo '

<div class="rex-addon-output">
  <div class="rex-form">

  <form action="index.php" method="post">
    <input type="hidden" name="page" value="rexseo" />
    <input type="hidden" name="subpage" value="settings" />
    <input type="hidden" name="func" value="update" />
    <input type="hidden" name="first_run" value="0" />';

foreach ($REX['CLANG'] as $id => $str)
{
  echo '
    <fieldset class="rex-form-col-1">
      <legend>Meta Defaults ('.$str.')</legend>
      <div class="rex-form-wrapper">

        <div class="rex-form-row">
          <p class="rex-form-col-a rex-form-select">
          <label for="def_desc">Description: <a class="help-icon" title="Hilfe zum Thema anzeigen" href="index.php?page=rexseo&subpage=help&chapter=settings&highlight='.urlencode('Description:').'#settings">?</a><br /><br /><em style="color:gray;font-size:10px;">z.B. My super description</em></label>
            <textarea id="def_desc_'.$id.'" name="def_desc['.$id.']">'.stripslashes($REX['ADDON'][$myself]['def_desc'][$id]).'</textarea>

          </p>
        </div><!-- /rex-form-row -->

        <div class="rex-form-row">
          <p class="rex-form-col-a rex-form-select">
            <label for="def_keys">Keywords: <a class="help-icon" title="Hilfe zum Thema anzeigen" href="index.php?page=rexseo&subpage=help&chapter=settings&highlight='.urlencode('Keywords:').'#settings">?</a><br /><br /><em style="color:gray;font-size:10px;">z.B. My, list, of, keywords</em></label>
            <textarea id="def_keys_'.$id.'" name="def_keys['.$id.']">'.stripslashes($REX['ADDON'][$myself]['def_keys'][$id]).'</textarea>
          </p>
        </div><!-- /rex-form-row -->

      </div><!-- /rex-form-wrapper -->
    </fieldset>';
}

echo '
    <div id="expert_block" style="'.$expert_display.'margin:0;padding:0;">

      <fieldset class="rex-form-col-1">
        <legend>Rewrite URL</legend>
        <div class="rex-form-wrapper">

          <div class="rex-form-row">
            <p class="rex-form-col-a rex-form-select">
              <label for="url_schema">Schema: <a class="help-icon" title="Hilfe zum Thema anzeigen" href="index.php?page=rexseo&subpage=help&chapter=settings&highlight='.urlencode('Schema:').'#settings">?</a></label>
                '.$url_schema_select->get().'

              <span style="margin:0 4px 0 4px;display:inline-block;width:100px;text-align:right;">Endung: <a class="help-icon" title="Hilfe zum Thema anzeigen" href="index.php?page=rexseo&subpage=help&chapter=settings&highlight='.urlencode('Endung:').'#settings">?</a></span>
                '.$url_ending_select->get().'
            </p>
          </div><!-- /rex-form-row -->

          <div class="rex-form-row">
            <p class="rex-form-col-a rex-form-select">
              <label for="homeurl">Startseite: <a class="help-icon" title="Hilfe zum Thema anzeigen" href="index.php?page=rexseo&subpage=help&chapter=settings&highlight='.urlencode('Startseite:').'#settings">?</a></label>
                '.$homeurl_select->get().'
                '.$homelang_box.'
            </p>
          </div><!-- /rex-form-row -->

        </div><!-- /rex-form-wrapper -->
      </fieldset>

      <fieldset class="rex-form-col-1">
        <legend>Rewrite Optionen</legend>
        <div class="rex-form-wrapper">

          <div class="rex-form-row">
            <p class="rex-form-col-a rex-form-select">
              <label for="allow_articleid">Aufruf via article_id: <a class="help-icon" title="Hilfe zum Thema anzeigen" href="index.php?page=rexseo&subpage=help&chapter=settings&highlight='.urlencode('Aufruf via article_id:').'#settings">?</a></label>
                '.$allow_articleid_select->get().'
                </p>
          </div><!-- /rex-form-row -->

          <div class="rex-form-row">
            <p class="rex-form-col-a rex-form-select">
              <label for="levenshtein">Genauigkeit: <a class="help-icon" title="Hilfe zum Thema anzeigen" href="index.php?page=rexseo&subpage=help&chapter=settings&highlight='.urlencode('Genauigkeit:').'#settings">?</a></label>
                '.$levenshtein_select->get().'
            </p>
          </div><!-- /rex-form-row -->

          <div class="rex-form-row">
            <p class="rex-form-col-a rex-form-select">
              <label for="robots">301 Weiterleitungen: <a class="help-icon" title="Hilfe zum Thema anzeigen" href="index.php?page=rexseo&subpage=help&chapter=settings&highlight='.urlencode('301 Weiterleitungen:').'#settings">?</a><br /> <br /><em style="color:gray;font-size:10px;">url article_id clang<br /><br />z.B. foo/bar.html 4 0</em></label>
              <textarea id="rexseo_redirects" name="301s">'.stripslashes($REX['ADDON'][$myself]['301s']).'</textarea>
            </p>
          </div><!-- /rex-form-row -->

        </div><!-- /rex-form-wrapper -->
      </fieldset>

      <fieldset class="rex-form-col-1">
        <legend>URL Parameter</legend>
        <div class="rex-form-wrapper">

          <div class="rex-form-row">
            <p class="rex-form-col-a rex-form-select">
              <label for="url_schema">Parameter Rewrite: <a class="help-icon" title="Hilfe zum Thema anzeigen" href="index.php?page=rexseo&subpage=help&chapter=settings&highlight='.urlencode('Parameter Rewrite:').'#settings">?</a></label>
                '.$params_rewrite_select->get().'

              <span style="margin:0 4px 0 4px;display:inline-block;width:100px;text-align:right;">Abtrenner: <a class="help-icon" title="Hilfe zum Thema anzeigen" href="index.php?page=rexseo&subpage=help&chapter=settings&highlight='.urlencode('Abtrenner:').'#settings">?</a></span>
                <input style="width:80px;" id="params_starter" class="rex-form-text" type="text" name="params_starter" value="'.stripslashes($REX['ADDON'][$myself]['params_starter']).'" />
            </p>
          </div><!-- /rex-form-row -->

        </div><!-- /rex-form-wrapper -->
      </fieldset>

      <fieldset class="rex-form-col-1">
        <legend>robots.txt</legend>
        <div class="rex-form-wrapper">

          <div class="rex-form-row">
            <p class="rex-form-col-a rex-form-select">
              <label for="robots">Regeln: <a class="help-icon" title="Hilfe zum Thema anzeigen" href="index.php?page=rexseo&subpage=help&chapter=settings&highlight='.urlencode('robots.txt:').'#settings">?</a></label>
              <textarea id="rexseo_robots" name="robots">'.stripslashes($REX['ADDON'][$myself]['robots']).'</textarea>
            </p>
          </div><!-- /rex-form-row -->

        </div><!-- /rex-form-wrapper -->
      </fieldset>

    </div><!-- /expert -->

      <fieldset class="rex-form-col-1">
        <legend>&nbsp;</legend>
        <div class="rex-form-wrapper">

          <div class="rex-form-row rex-form-element-v2">
            <p  class="rex-form-checkbox"style="display:inline !important;">
              <label for="expert_settings" style="width:145px !important;">Erweiterte Einstellungen</label>
              <input type="checkbox" '.$expert_checked.' value="1" id="expert_settings" name="expert_settings">
            </p>

            <p class="rex-form-submit">
              <input class="rex-form-submit" type="submit" id="sendit" name="sendit" value="Einstellungen speichern" />
            </p>
          </div><!-- /rex-form-row -->

        </div><!-- /rex-form-wrapper -->
      </fieldset>

  </form>
  </div><!-- /rex-addon-output -->
</div><!-- /rex-form -->

<script type="text/javascript">
<!--
jQuery(function($) {


  $("#expert_settings").click(function() {
    $("#expert_block").slideToggle("slow");
  });

  if($("#expert_settings").is(":checked")) {
    $("#expert_block").show();
  }

    $(function() {';
foreach ($REX['CLANG'] as $id => $str)
{
  echo '
      $("#def_desc_'.$id.'").autogrow();
      $("#def_keys_'.$id.'").autogrow();';
}

echo '
      $("#rexseo_redirects").autogrow();
      $("#rexseo_robots").autogrow();
  });


});
//-->
</script>

';

unset($levenshtein_select,$allow_articleid_select,$homeurl_select,$url_ending_select,$url_schema_select);
