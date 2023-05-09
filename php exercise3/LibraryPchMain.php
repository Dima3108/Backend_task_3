<?php
/*
Это основной заголовочный файл , он содержит имена файлов подключаемых к коду .
(аналог pch.h в C+++ (https://learn.microsoft.com/ru-ru/cpp/build/creating-precompiled-header-files?view=msvc-170))
*/ 
require_once 'create_token.php';//для работы с токенами
require_once 'MessageContent.php';//Для использования класса MessageContent
require_once 'Library.php';//Некоторые функции упрощающие разметку страницы
require_once 'databaseconnection.php';//вспомогательная часть для подключения к базе данных
require_once 'Redirect.php';//функция перенаправления
require_once 'ContainPostAttribute.php';//начальная валидация атрибутов 
require_once 'Cookie_lib.php';//Вспомогательные функции для Cookie файлов
require_once 'headers_erros.php';//установка/удаление заголовков валидации.
require_once 'crypto.php';
require_once 'Validation.php';//валидация
?>