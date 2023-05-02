<?php
define('NUMBERS',"0123456789");
define('CHARS', "~!@#%^&*()_+.?");
define('LOWERCASELETTERS',"qwertyuiopasdfghjklzxcvbnm");
define('UPPERCASELETTERS',"QWERTYUIOPASDFGHJKLZXCVBNM");
define('LETTERS',LOWERCASELETTERS.UPPERCASELETTERS);
define('TABLE',LOWERCASELETTERS.NUMBERS.UPPERCASELETTERS.CHARS);
//$TABLE=LOWERCASELETTERS.NUMBERS.UPPERCASELETTERS.CHARS;
function CharIsNumber($char ){
    if(strlen($char)!=1){
        return false;
    }
    else{
        for($i=0;$i<strlen(NUMBERS);$i++){
            if(NUMBERS[$i]===$char){
                return true;
            }
        }
        return false;
    }
}
function CharIsCHARS($char){
    if (strlen($char) != 1) {
        return false;
    } else {
        for ($i = 0; $i < strlen(CHARS); $i++) {
            if (CHARS[$i] === $char) {
                return true;
            }
        }
        return false;
    }
}
function GetRandomCharValue(){
    return TABLE[rand(0,strlen(TABLE)-1)];
}
function GetRandomNumber(){
    return NUMBERS[rand(0,strlen(NUMBERS)-1)];
}
function GetRandomChar(){
    return CHARS[rand(0,strlen(CHARS)-1)];
}
function GetRandomLewerLetter(){
    return LOWERCASELETTERS[rand(0,strlen(LOWERCASELETTERS)-1)];
}
function GetRandomUpperLetter(){
    return UPPERCASELETTERS[rand(0,strlen(UPPERCASELETTERS)-1)];
}
function GetRandomLetter(){
    return LETTERS[rand(0,strlen(LETTERS)-1)];
}
function MixPassword($value){
    if(strlen($value)>2){
         $val1="";
         $val2="";
         for($i=0;$i<strlen($value)/2;$i++){
            $val1=$val1.$value[$i];
            $val2=$val2.$value[(int)(strlen($value)/2)+$i];
         }
         $val1=MixPassword($val1);
         $val2=MixPassword($val2);
        return $val2.$val1;
    }
    else{
        return $value[1].$value[0];
    }
}
function ShiftPassword($value,$offset){
    $len=strlen($value);
    $pos=$offset;
    $val2="";
    for($i=0;$i<$len;$i++){
        $val2=$val2.$value[$pos];
        $pos++;
        if($pos>=$len){
            $pos=0;
        }
    }
    return $val2;
}
function GenerateRandomPassword($passlen=16,$numberscount=4,$charscount=2,$letterscount=7){
   
    if(($passlen>($numberscount+$charscount+$letterscount))&&($letterscount>=7&&$charscount>=2&&$numberscount>=4)){
           $pass="";
           $numbercount=0;
           $charcount=0;
           $lettercount=0;
           $letter_max_count=$passlen-($charscount+$numberscount);
          $passcesh="";
          for(;$numbercount<$numberscount;$numbercount++){
            $passcesh=$passcesh.(GetRandomNumber());
          }
        
          for(;$charcount<$charscount;$charcount++){
            $passcesh=$passcesh.(GetRandomChar());
          }
          $lowercount=$letterscount-rand(1,$letterscount-1);
          $uppercount=$letterscount-$lowercount;
          for($i=0;$i<$lowercount;$i++){
            $passcesh=$passcesh.(GetRandomLewerLetter());
          }
          for($i=0;$i<$uppercount;$i++){
            $passcesh=$passcesh.(GetRandomUpperLetter());
          }
          for($i=0;$i<($letter_max_count-$letterscount);$i++){
            $passcesh=$passcesh.(GetRandomCharValue());
          }
          return MixPassword(ShiftPassword($passcesh,rand(0,strlen($passcesh)-1)));
          //return $pass;
    }
    else {
        return "@";
    }
}

?>
