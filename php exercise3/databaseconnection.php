<?php
$user = 'u52934'; // Заменить на ваш логин uXXXXX
$pass = '8240229'; // Заменить на пароль, такой же, как от SSH
$pdo = new PDO('mysql:host=localhost;dbname=u52934', $user, $pass,
[PDO::ATTR_PERSISTENT => true, PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]); // Заменить test на имя БД, совпадает с логином uXXXXX
function get_content($pdo, $var)
{
    return $pdo->quote($var);
}
?>