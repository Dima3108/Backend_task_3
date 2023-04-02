<?php 

function ContainsAttribute($attr_name,$error_message){
if(isset($_POST[$attr_name])){
   return "";
}
else return $error_message;
}
?>