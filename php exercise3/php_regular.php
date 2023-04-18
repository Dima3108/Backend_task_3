<?php
$reg="[^0-6]";

$val="asd23NME.com";
$val2="ert88ghk";
$vals=array($val,$val2,"@asdf.cv","11224354676","as@wmail.com","saEDWRFGRYwwe","asdf@a45%f.com");
for($i=0;$i<count($vals);$i++){
$regs=array('/^[[a-z]|[а-я]]/i','/[^0-6]/','/([a-z]|[а-я]|[0-9]){'.strlen($vals[$i]).',}?/i', '/[[a-z]|[а-я]|[0-9]]/i','/[0-9]/');
    for($j=0;$j<count($regs);$j++){
        if(preg_match($regs[$j],$vals[$i])){
        echo "<br> ".$vals[$i].": true for ".$regs[$j]."</br>";
    }else{
        echo "<br> ".$vals[$i].":false for".$regs[$j]."</br>";
    }
    
    }
    
}
?>