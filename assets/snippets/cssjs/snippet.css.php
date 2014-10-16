<?php
if(!defined('MODX_BASE_PATH')) {die('What are you doing? Get out of here!');}

//параметры
$files = isset($files) ? $files : ''; // Список файлов (css, scss, less)
$inline = isset($inline) ? $inline : ''; // инлайн код стилей
$minify = isset($minify) ? $minify : '1'; //сжымать и минифицировать файлы
$folder = isset($folder) ? $folder : 'assets/templates/'; // папка для сгенерированных стилей по умолчанию
$parse = isset($parse) ? $parse : '0'; //обрабатывать ли теги MODX



//Обрабатываем файлы, преобразовываем less и scss
$files = explode(',', str_replace('\n', '', $files));
foreach ($files as $key => $value) {
	$file = MODX_BASE_PATH . trim($value);
	$fileinfo = pathinfo($filename);
	switch ($fileinfo['extension']) {
		case 'css':
		$files[$key] = $file;     
		break;
		case 'less':
		require_once(MODX_BASE_PATH. "assets/snippets/cssjs/less.inc.php"); 
		$less = new lessc;
		$less->checkedCompile($file, $folder.$fileinfo.'.css');
		$files[$key] = $folder.$fileinfo.'.css';
		break;
		case 'scss':
		require_once(MODX_BASE_PATH. "assets/snippets/cssjs/scss.inc.php"); 
		$scss = new scssc();
		$scss->checkedCompile($file, $folder.$fileinfo.'.css');
		$files[$key] = $folder.$fileinfo.'.css';
		break;
	}

}
//Обрабатываем инлайн тут думаю логично просто сохранять в файлик а после обрабатывать как все остальные но надо думать 
//Минифицируем 
if ($minify == '1') {
	include_once(MODX_BASE_PATH. "assets/snippets/cssjs/class.magic-min.php"); 
	$minified = new Minifier();
	$min = $minified->merge( MODX_BASE_PATH.$folder.'styles.min.css', 'css', $files, '1.1' );
}
//отдаем на сайт
return '<link rel="stylesheet" href="/'.$folder.'styles.min.css" />';

