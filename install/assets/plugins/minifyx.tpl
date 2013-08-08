//<?php
/**
 * MinifyX
 * 
 * Minify CSS and JS
 *
 * @category  plugin
 * @version   1.0
 * @license   http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @internal  @properties 
 * @internal  @events OnDocFormSave
 * @internal  @legacy_names MinifyX
 * @internal  @installset base
 */
 
if($modx->Event->name=='OnDocFormSave'){

  //$modx->db->update(array('content'=>$data),$modx->getFullTableName("site_content"),"id='58'");
  	$param=$modx->event->params;
	  $param['API']='1';

  $mode=false;
  	if($param['id']==$param['CSSdoc'] && (int)$param['CSSdoc']>0){
  		$param['JSdoc']='';
      $param['JSfile']='';
      $mode='css';
  	}else{
    	if($param['id']==$param['JSdoc'] && (int)$param['JSdoc']>0){
  			$param['CSSdoc']='';
      	$param['CSSfile']='';
        $mode='js';
  		} 
    }
  switch($mode){
    case 'css':
    case 'js':{
  		$flag=$modx->runSnippet("MinifyX",$param);
      break;
    }
    default:{
    	break;
    }
  }
}