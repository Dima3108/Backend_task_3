<?php 
//define("TIME_COOK",365*24*60*60);
require_once 'LibraryPchMain.php';
//проверка post атрибута на существование
function ContainsAttribute($attr_name,$error_message,$id_spa=null,$cokie_name=null){
   
if(isset($_POST[$attr_name])&&!empty($_POST[$attr_name])){
   $val_n=$_POST[$attr_name];
   switch ($attr_name) {
      case 'name':
         enable_cookie('user_nvalue',$val_n);
         break;
      case 'email':
        enable_cookie('user_evalue',$val_n);
         break;
      case 'date':
         enable_cookie('user_dvalue',$val_n);
         break;
      default:
         break;

   }
   if($cokie_name!=null){
     // setcookie($cokie_name,"",-1);
     disable_cookie($cokie_name);
       // enable_cookie($cokie_name,$_POST[$attr_name]);
   }
   /*echo "<script>";
         echo "var s=document.getElementById('$id_spa');";
         echo "s.value='';";
         echo "</script>"; */
      switch ($attr_name) {
         case 'name':
            ClearNameHeader();
            break;
         case 'email':
            ClearEmailHeader();
            break;
         case 'date':
            ClearDateHeader();
            break;
         default:
            break;

      }
   return "";
}
else{
   if($id_spa!=null){
   /*echo "<script>{";
   echo "var s=document.getElementById('$id_spa');";
   echo "s.textContent='$error_message';";
   echo "}</script>";*/
   }
   if($cokie_name!=null){
     
   
      enable_cookie($cokie_name,$error_message);
   }
   switch($attr_name){
      case 'name':
         SetErrorNameHeader($error_message);
         break;
         case 'email':
            SetErrorEmailHeader($error_message);
            break;
            case 'date':
               SetErrorDateHeader($error_message);
               break;
               default:break;
               
   }
   return $error_message;
} 
}
function GenerateScriptForInsertValue($el_id,$el_value){
  
  echo "<script>";
   echo "{";
      echo "var d".$el_id."=document.getElementById('".$el_id."')";
      echo "d".$el_id.".value='$el_value'";
    echo "}" ;
  echo "</script>";
}
?>