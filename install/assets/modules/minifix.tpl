//<?php
/**
 * MinifyX
 * 
 * Minify CSS and JS for MODX Evolution
 * 
 * @category	module
 * @version 	1.0
 * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @internal	@properties &CSSfile=CSS файлы;textarea; &JSfile=JS файлы;textarea; &CSSdoc=ID CSS документа;int; &JSdoc=ID JS документа;int;
 * @internal	@guid minf345f3443423ff45t54t
 * @internal	@shareparams 1
 * @internal	@dependencies requires files located at /assets/modules/docmanager/
 * @internal	@modx_category Manager and Admin
 * @internal    @installset base, sample
 */


$param=$modx->event->params;
$param['API']='1';

$flag=$modx->runSnippet("MinifyX",$param);
if(isset($flag['js']) && $flag['js']){
  echo "JS ";
}
if(isset($flag['css']) && $flag['css']){
	echo "CSS ";
}