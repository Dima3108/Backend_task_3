<?php
function Redirect($extra){
  $host = $_SERVER['HTTP_HOST'];
$uri = rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
//$extra = 'Index.php';
header("Location: http://$host$uri/$extra");  
}

//return;
?>