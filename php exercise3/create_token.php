<?php
/*
Токен используется для проверки того что запрос пришел со страницы выданной сервером .
(файл ReadMessage.php )
*/
function get_default_tocken($val="1"){
return $val;
}
function get_date_token(){
    $date=getdate();
    $tok=$date['year'].".".$date['mon'].".".$date['mday'];
    return $tok;
}
function get_time_token(){
    $date=getdate();
    return $date['hours'].":".$date['minutes'].":".$date['seconds'];
}
function valid_date_token($t){
    $date = getdate();
    $tok = $date['year'] . "." . $date['mon'] . "." . $date['mday'];
    if($tok==$t){
        return SUCCESSR;
    }
    else{
      return  -1;
    }
}
define('TABLE_HASH','ABCDIFG123@!');
define("MAXRNUMBER",144);
function get_hash_token(){
  
    $rnumber=rand(0,  MAXRNUMBER);
    $x=(int)($rnumber/12);
    $y=(int)($rnumber%12);
   $start_tok=get_date_token()."#";
    for($i=0;$i<$y;$i++){
        $start_tok=$start_tok.TABLE_HASH[$i%strlen(TABLE_HASH)];
    }
    //$offset=$y;
/*$pos=0;
$cesh_hash="";
for($i=$y;$i<strlen($start_tok);$i++){
$cesh_hash=$cesh_hash.$start_tok[$pos];
$pos++;

}*/
return sha1($start_tok);
} 
function valid_hash_token($tok){
    $date=get_date_token()."#";
    for($rand_val=0;$rand_val<=MAXRNUMBER;$rand_val++){
        $y = (int) ($rand_val % 12);
        $htok=$date;
        for ($i = 0; $i < $y; $i++) {
            $htok= $htok . TABLE_HASH[$i % strlen(TABLE_HASH)];
        }
        if(sha1($htok)==$tok){
            return SUCCESSR;
        }
    }
    return -1;
}
?>