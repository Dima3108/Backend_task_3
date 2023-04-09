<?php 
define("TIME_COOK",365*24*60*60);
function ContainsAttribute($attr_name,$error_message,$id_spa=null,$cokie_name=null){
if(isset($_POST[$attr_name])&&!empty($_POST[$attr_name])){
   if($cokie_name!=null){
      setcookie($cokie_name,"",-1);
   }
   return "";
}
else{
   if($id_spa!=null){
   echo "<script>";
   echo "var s=document.getElementById('$id_spa');";
   echo "s.value='$error_message';";
   echo "</script>";
   }
   if($cokie_name!=null){
     
      setcookie($cokie_name,$error_message,TIME_COOK);
   }
   return $error_message;
} 
}
?>