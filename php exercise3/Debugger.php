<?php
require_once 'create_token.php';
function GetSessionFileName(){
    $date=get_date_token();
    return $date.".txt";

}
function DebuggerAddMessage($fname,$message){
    $file=fopen($fname,'a');
    fwrite($file,(get_time_token()).":".$message."\n");
    fclose($file);
}
?>