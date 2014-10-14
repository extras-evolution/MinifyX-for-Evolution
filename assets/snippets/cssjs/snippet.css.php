<?php
if(!defined('MODX_BASE_PATH')) {die('What are you doing? Get out of here!');}

//параметры
$files = isset($files) ? $files : ''; // Список файлов (css, scss, less)
$inline = isset($inline) ? $inline : ''; // инлайн код стилей
$minify = isset($minify) ? $minify : '0'; //сжымать и минифицировать файлы
$folder = isset($minify) ? $minify : '/assets/templates/'; // папка для сгенерированных стилей по умолчанию
$parse = isset($parse) ? $parse : '0'; //обрабатывать ли теги MODX

//подключаем библиотеки
include_once(MODX_BASE_PATH. "assets/snippets/cssjs/cssmin.class.php"); 


//разбираем параметр files что б нормально работало с переносом строк
$files = explode(',', str_replace('\n', '', $files));
foreach ($files as $key => $value) {
	$files[$key] = trim($value);
}


//Обрабатываем файлы, преобразовываем less и scss
foreach ($files as $key => $value) {
	$file = trim($value);
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
//Обрабатываем инлайн 


//Минифицируем 


//отдаем на сайт