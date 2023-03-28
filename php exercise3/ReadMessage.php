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
function StrArrayToString($stringarray){
    $str="";
    if(isset($stringarray)&&$stringarray!==null){
      /*for($i=0;$i<count($stringarray);$i++){
       $str=$str." ".$i." ";
    }*/
    foreach( $stringarray as $val)
    {
$str=$str.$val." ";
    }  
    }
    
    return $str;
}
  function ReadMessage(){
    $name=$_POST['name'];
    $email=$_POST['email'];
    $date=$_POST['date'];
    $pol=$_POST['pol'];
    $kolvo=$_POST['count'];
    $biografia=$_POST['biograf'];
    //$awtc=$_POST['AWTC'];
    $supres=($_POST['supers']);
    print_r($supres);
    echo "<br>";
    print_r($_POST['supers']);
    $result=new MessageContent();
    $result->email=$email;
    $result->name=$name;
    $result->date=$date;
    $result->pol=$pol;
    $result->biografia=$biografia;
    $result->kolvo=$kolvo;
    $result->supres=$supres;
    return $result;
  }
  if($_POST){
    echo "<script>alert('Запрос получен');</script>";
    require_once 'Index.php';
    try{

    
    $content=ReadMessage();
    $supers_="'".//get_content($pdo,$content->supres);
    StrArrayToString(($content->supres)).
    "'"
    ;
    $name_=get_content($pdo,$content->name);
    $email_=get_content($pdo,$content->email);
    $date_=get_content($pdo,$content->date);
    $count_=get_content($pdo,$content->kolvo);
    $pol_=get_content($pdo,$content->pol);
    $comment_=//"'".
    get_content($pdo,$content->biografia)//.
    //"'"
    ;
    $query="INSERT INTO users(name,email,date,count_conech,superspos,polid,comment) VALUES"."(
        $name_,$email_,$date_,$count_,$supers_,$pol_,$comment_
    )";
        echo "<br>";
    echo $query;
    echo "<br>";
    $result = $pdo->query($query);
    echo "<script>alert('Запрос обработан');</script>";
}
catch(Exception $e){
  $mes=  $e->getMessage();
    echo "<strong>! $mes </strong>";
}
  }
  else if($_GET){
    $host = $_SERVER['HTTP_HOST'];
    $uri = rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
    $extra = 'Index.php';
    header("Location: http://$host$uri/$extra");

  }
?>