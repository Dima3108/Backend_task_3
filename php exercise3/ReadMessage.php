<?php
class MessageContent{
  public  $email;
  public $name;
  public $date;
  public $pol;
  public $kolvo;
  public $biografia;
  //public $awtc;
  public $supres;
 function __construct(){
       
  }
}
  function ReadMessage(){
 $name=$_POST['name'];
    $email=$_POST['email'];
    $date=$_POST['date'];
    $pol=$_POST['pol'];
    $kolvo=$_POST['count'];
    $biografia=$_POST['biograf'];
    //$awtc=$_POST['AWTC'];
    $supres=$_POST['supers'];
    
  }
  if(isset($_POST)){
    require_once 'Index.php';
  }
?>