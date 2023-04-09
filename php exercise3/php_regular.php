<?php
$reg="[^0-6]";
$val="asd23NME.com";
$val2="ert88ghk";
$vals=array($val,$val2);
for($i=0;$i<count($vals);$i++){
    if(preg_match($reg,$vals[$i])){
        echo "<br>true</br>";
    }
    else{
        echo "<br>true</br>";
    }
}
?>