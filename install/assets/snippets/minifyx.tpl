<?php
/**
 * MinifyX
 * 
 * Minify CSS and JS 
 *
 * @category  snippet
 * @version   1.0
 * @license   http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @internal  @properties 
 * @internal  @legacy_names MinifyX
 * @internal  @modx_category Content
 * @internal    @installset base, sample
 */

include($modx->config['base_path']."assets/snippets/MinifyX/MinifyX.core.php");
$CSSfile=isset($CSSfile) ? $CSSfile : '';
$JSfile=isset($JSfile) ? $JSfile : '';
$CSSdoc=isset($CSSdoc) ? (int)$CSSdoc : 0;
$JSdoc=isset($JSdoc) ? (int)$JSdoc : 0;


$MinifyX=new MinifyX($modx);
if($CSSfile!='' || (int)$CSSdoc>0){
  $flagCSS=$MinifyX->minCSS($CSSfile,$CSSdoc);
  $modx->logEvent(46,1,"CSSFILE: ".$CSSfile."<br />CSSDOC: ".$CSSdoc,"MinifyX new CSS");
}

if($JSfile!='' || (int)$JSdoc>0){
  $flagJS=$MinifyX->minJS($JSfile,$JSdoc);
  $modx->logEvent(46,1,"JSFILE: ".$JSfile."<br />JSDOC: ".$JSdoc,"MinifyX newJS");
}

if(isset($API)){
  $data=array('js'=>'','css'=>'');
  if($flagJS){
  	$data['js']="/".$MinifyX->outFolder.$MinifyX->jsFile;
  }
  if($flagCSS){
  	$data['css']="/".$MinifyX->outFolder.$MinifyX->cssFile;
  }	
}else{
  $data='';
  $modx->logEvent(46,2,"slow MODE","MinifyX");
	if($flagJS){
  	$modx->regClientCSS("/".$MinifyX->outFolder.$MinifyX->jsFile);
  }
  if($flagCSS){
  	$modx->regClientCSS("/".$MinifyX->outFolder.$MinifyX->cssFile);
  }
}

return $data;
?>
