<?php
require_once 'LibraryPchMain.php';
define("usadminmail","admin@mail.com");
define("pashash",sha1("admin123"));
function admin_verfi($admin_nam,$admin_pass){
    if(usadminmail==htmlspecialchars($admin_nam)&&sha1(htmlspecialchars($admin_pass))==pashash){
         return SUCCESSR;
    }
    else{
        return -1;
    }
}
?>