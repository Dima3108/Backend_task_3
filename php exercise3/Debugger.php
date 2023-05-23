<?php
require_once 'create_token.php';
define("dir","/home/u52934/s0172090_Backend/");
define("mainurl","https://forweb4.mykeencentvi12.keenetic.pro/Home/");
function GetSessionFileName(){
    //echo shell_exec("bash");
   //echo shell_exec("ls -F");
    $date="deb".(get_date_token()).".txt"; //dir."Files/deb".(get_date_token()).".txt";
 /*   shell_exec("touch ".$date);
    chmod(dir."Files",0755);*/
file_get_contents(mainurl."CreateFile?fname=".$date);
    return $date;

}
/*
https://forweb4.mykeencentvi12.keenetic.pro/Home/CreateFile?fname - создать txt файл с именем fname .(get)
https://forweb4.mykeencentvi12.keenetic.pro/Home/SetMessage?fname&&message - добавить сообщение в указанный файл с именем fname и сообщением message (post)
https://forweb4.mykeencentvi12.keenetic.pro/Home/GetContent?fname - получить информацию из файла fname (get)
*/ 
/*
https://www.php.net/manual/ru/class.swoole-http-client.php  -  php request api
*/
function DebuggerAddMessage($fname,$message){
    /*$file=fopen($fname,'a');
    fwrite($file,(get_time_token()).":".$message."\n");
    fclose($file);*/
    //file_get_contents(mainurl."SetMessage?fname=".$fname)
    $data="fname=$fname&message=$message";
    Swoole\Http\Client::post(mainurl."SetMessage",$data);
}
?>