<?php
require_once 'LibraryPchMain.php';
define("usadminmail","admin@mail.com");
define("pashash",sha1("admin123"));
function admin_verfi($admin_nam,$admin_pass){
    require_once 'LibraryPchMain.php';
    DebuggerAddMessage($debfilename,'проверка является ли пользователь администратором');
    if(usadminmail==htmlspecialchars($admin_nam)&&sha1(htmlspecialchars($admin_pass))==pashash){
        DebuggerAddMessage($debfilename,'пользователь является администратором');
        return SUCCESSR;
    }
    else{
        DebuggerAddMessage($debfilename,'пользовательне является администратором');
        return -1;
    }
}
?>