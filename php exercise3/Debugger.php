<?php
require_once 'create_token.php';
define("dir","/home/u52934/s0172090_Backend/");
function GetSessionFileName(){
    //echo shell_exec("bash");
   //echo shell_exec("ls -F");
    $date= dir."Files/deb".(get_date_token()).".txt";
    shell_exec("touch ".$date);
    chmod(dir."Files",0755);

    return $date;

}
function DebuggerAddMessage($fname,$message){
    $file=fopen($fname,'a');
    fwrite($file,(get_time_token()).":".$message."\n");
    fclose($file);
}
?>