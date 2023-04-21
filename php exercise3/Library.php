<?php
define("SUCCESSR",1);//константа обозначающая успешное выполнение действий
require_once 'databaseconnection.php';
function StrArrayToString($stringarray)
{
    $str = "";
    if (isset($stringarray) && $stringarray !== null) {
        /*for($i=0;$i<count($stringarray);$i++){
        $str=$str." ".$i." ";
        }*/
        foreach ($stringarray as $val) {
            $str = $str . $val . " ";
        }
    }

    return $str;
}
function DIV_Start()
{
    echo "<div>";
}
function DIV_Stop()
{
    echo "</div>";
}
function DIV_StopStart()
{
    DIV_Stop();
    DIV_Start();
}
function WriteLine($value){
    echo "<br>".$value."</br>";
}
?>