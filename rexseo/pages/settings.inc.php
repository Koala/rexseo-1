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
$myself  = rex_request('page',            'string');
$subpage = rex_request('subpage',         'string');
$func    = rex_request('func',            'string');
$backup  = $REX['INCLUDE_PATH'].'/backup/addons/rexseo/config.inc.php';

// SETTINGS PARAMS
////////////////////////////////////////////////////////////////////////////////
$CAST = array (
      'page'                       => 'unset',
      'subpage'                    => 'unset',
      'func'                       => 'unset',
      'submit'                     => 'unset',
      'sendit'                     => 'unset',
      'def_desc'                   => 'array',
      'def_keys'                   => 'array',
      'robots'                     => 'string',
      'homeurl'                    => 'int',
      'homelang'                   => 'int',
      'allow_articleid'            => 'int',
      'levenshtein'                => 'int',
      '301s'                       => '301_2_array',
      'url_schema'                 => 'string',
      'url_ending'                 => 'string',
      'expert_settings'            => 'int',
      'alert_setup'                => 'int',
      'first_run'                  => 'int',
      'rewrite_params'             => 'int',
      'params_starter'             => 'string',
      'title_schema'               => 'string',
      'url_whitespace_replace'     => 'string'
      );

// UPDATE/SAVE SETTINGS
////////////////////////////////////////////////////////////////////////////////
if ($func == 'update')
{
  // NO BACKUP FILE -> INSTALL
  if(!file_exists($backup))
  {
    $source = $REX['INCLUDE_PATH'].'/addons/'.$myself.'/install/backup/';
    $target = $REX['INCLUDE_PATH'].'/';
    rexseo_recursive_copy($source, $target);
  }

  // GET ADDON SETTINGS FROM REQUEST
  $myCONF = rexseo_batch_cast($_POST,$CAST);

  // UPDATE REX
  $REX['ADDON'][$myself] = $myCONF;

  // SAVE ADDON SETTINGS
  $DYN    = '$REX[\'ADDON\'][\''.$myself.'\'] = '.stripslashes(var_export($myCONF,true)).';';
  $config = $REX['INCLUDE_PATH'].'/addons/'.$myself.'/config.inc.php';
  rex_replace_dynamic_contents($config, $DYN);
  rex_replace_dynamic_contents($backup, $DYN);
  echo rex_info('Einstellungen wurden gespeichert, '.rex_generateAll().'.');
}


// FIRST RUN NOTIFY
////////////////////////////////////////////////////////////////////////////////
if($REX['ADDON'][$myself]['alert_setup'] == 1)
{
  echo rex_warning('HINWEIS: Das Addon ist noch nicht einsatzbereit!<br /> Es m&uuml;ssen noch Anpassungen vorgenommen werden die im Kapitel <a href="index.php?page=rexseo&subpage=help&chapter=&func=setup_alert_disable&highlight=Quickstart">Quickstart</a> der Hilfe beschrieben sind');

  $subdir = rexseo_subdir();
  if($subdir != '')
  {
    echo rex_warning('HINWEIS: Redaxo scheint in einem Unterordner installiert zu sein (./'.$subdir.') - dieser muß in der .htaccess entsprechend <a href="index.php?page=rexseo&subpage=help&chapter=&func=alert_setup&highlight='.urlencode('Installation in Unterverzeichnissen:').'">eingetragen</a> werden!');
  }
}


// RESTORE SETTINGS FROM BACKUP FILE
////////////////////////////////////////////////////////////////////////////////
if($REX['ADDON'][$myself]['first_run'] == 1 && file_exists($backup))
{
  require_once $backup;
  echo rex_info('Daten wurde aus Backup ins Formular &uuml;bernommen - bitte Einstellungen speichern!');
}



// URL_SCHEMA SELECT BOX
////////////////////////////////////////////////////////////////////////////////
$url_schema_select = new rexseo_select();
$url_schema_select->setSize(1);
$url_schema_select->setName('url_schema');
$url_schema_select->addOption('RexSEO','rexseo');
$url_schema_select->addOption('url_rewrite','url_rewrite');
$url_schema_select->setAttribute('style','width:250px');
$url_schema_select->setSelected($REX['ADDON'][$myself]['url_schema']);

// URL_ENDING SELECT BOX
////////////////////////////////////////////////////////////////////////////////
$url_ending_select = new rexseo_select();
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

$homeurl_select = new rexseo_select();
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
  $homelang_select = new rexseo_select();
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
$allow_articleid_select = new rexseo_select();
$allow_articleid_select->setSize(1);
$allow_articleid_select->setName('allow_articleid');
$allow_articleid_select->addOption('Nicht zulässig, nur rewrite URLs'           ,0);
$allow_articleid_select->addOption('Zulässig, 301 Weiterleitung auf korrekte URL (ohne Parameter)',1);
$allow_articleid_select->addOption('Zulässig ohne Weiterleitung'                ,2);
$allow_articleid_select->setSelected($REX['ADDON'][$myself]['allow_articleid']);


// LEVENSHTEIN SELECT BOX
////////////////////////////////////////////////////////////////////////////////
$levenshtein_select = new rexseo_select();
$levenshtein_select->setSize(1);
$levenshtein_select->setName('levenshtein');
$levenshtein_select->addOption('Strikte URL-Übereinstimmung, sonst Fehlerseite (404)',0);
$levenshtein_select->addOption('Artikel mit ähnlichster URL anzeigen',1);
$levenshtein_select->setSelected($REX['ADDON'][$myself]['levenshtein']);


// PARAMS REWRITE SELECT BOX
////////////////////////////////////////////////////////////////////////////////
$params_rewrite_select = new rexseo_select();
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
    <input type="hidden" name="rexseo_version" value="'.$REX['ADDON']['version'][$myself].'" />
    <input type="hidden" name="first_run" value="0" />
    <input type="hidden" name="alert_setup" value="'.$REX['ADDON'][$myself]['alert_setup'].'" />
    <input type="hidden" name="install_subdir" value="'.rexseo_subdir().'" />
    <input type="hidden" name="url_whitespace_replace" value="-" />';

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
              <textarea id="rexseo_redirects" name="301s">'.rexseo_301_2_string($REX['ADDON'][$myself]['301s']).'</textarea>
            </p>
          </div><!-- /rex-form-row -->

        </div><!-- /rex-form-wrapper -->
      </fieldset>

      <fieldset class="rex-form-col-1">
        <legend>Page Title</legend>
        <div class="rex-form-wrapper">

          <div class="rex-form-row">
            <p class="rex-form-col-a rex-form-text">
              <label for="title_schema">Schema: <a class="help-icon" title="Hilfe zum Thema anzeigen" href="index.php?page=rexseo&subpage=help&chapter=settings&highlight='.urlencode('Page Title').'#settings">?</a></label>
              <input id="title_schema" class="rex-form-text" type="text" name="title_schema" value="'.stripslashes($REX['ADDON'][$myself]['title_schema']).'" /><br />
              <em style="color:gray;font-size:10px;">%B = breadcrumb | %N = article name | %S = server/host</em>
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
?>