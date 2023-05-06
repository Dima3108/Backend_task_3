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
    $tok=$date['year'].":".$date['mon'].":".$date['mday'];
    return $tok;
}
function valid_date_token($t){
    $date = getdate();
    $tok = $date['year'] . ":" . $date['mon'] . ":" . $date['mday'];
    if($tok==$t){
        return SUCCESSR;
    }
    else{
      return  -1;
    }
}
?>