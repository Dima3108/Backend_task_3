<?php

  require_once 'LibraryPchMain.php';
  function ReadMessage(){
    $name=$_POST['name'];
    $email=$_POST['email'];
    $date=$_POST['date'];
    $pol=$_POST['pol'];
    $kolvo=$_POST['count'];
    $biografia=$_POST['biograf'];
    //$awtc=$_POST['AWTC'];
    if(ContainsAttribute("supers","#")==""){
$supres=($_POST['supers']);
   /* print_r($supres);
    echo "<br>";
    print_r($_POST['supers']);*/
    }
    else{
      $supres=null;
    }
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
  
function valid_name($name){
if(preg_match('/^[a-z]/i',$name)||preg_match('/^[а-я]/i',$name)){
  setcookie('user_nam','',-1);
  return SUCCESSR;
}
else{
  setcookie('user_nam','имя должно начинатся с символов a-z или а-я',TIME_COOK);
  return -1;
}
}
  function valid_attributes($pdo){
    $attributes_n=array('name','email','date');
    $attributes_errors=array('вы не ввели имя','вы не ввели фамилию','вы не выбрали дату');
    $attr_htmlid=array('name_sp','email_sp','date_sp');
    $attr_cokie=array('user_nam','user_email','user_date');
    $message="";
    for($i=0;$i<count($attributes_errors);$i++){
             $val=ContainsAttribute($attributes_n[$i],null,$attr_htmlid[$i]);
             if($val!=""){
              $message=$message.$val."<br/>";
             }
    }
    try{
      $datestr=get_content($pdo,htmlspecialchars($_POST['date']));
      $str=(string)($datestr);
     $date_f=date_create($_POST['date']);
      if(strlen($str)<=0||$str==''||$_POST['date']===null||$_POST['date']==null){
        $message="Проверьте корректность даты";
        setcookie($attr_cokie[2],'Проверьте корректность даты',365*24*60*60);
      }
    }
    catch(Exception $e){
       $message="Проверьте корректность даты";
    }
    if($message!=""){
      echo "<div>".$message."</div>";
      return 2;
    }
    else{
      return 1;
    }
  }


  if($_POST){
    if($_POST['suc_token']!=(string)"1"){
Redirect("Index.php");
     return;
    }
    echo "<script>alert('Запрос получен');</script>";
    require_once 'Index.php';
    try{
if(valid_attributes($pdo)!=1){
return;
}else {
  //WriteLine("Success");
}
    
    $content=ReadMessage();
    /*WriteLine("@");
    print_r($content);
    WriteLine("");*/
    $name_=get_content($pdo,$content->name);
    $email_=get_content($pdo,$content->email);
    $date_=get_content($pdo,$content->date);
    $count_=get_content($pdo,$content->kolvo);
    $pol_=get_content($pdo,$content->pol);
    $comment_=//"'".
    get_content($pdo,$content->biografia)//.
    //"'"
    ;
    $query="INSERT INTO users(name,email,date,count_conech,polid,comment) VALUES"."(
        $name_,$email_,$date_,$count_,$pol_,$comment_
    )";
        echo "<br>";
   // echo $query;
    echo "<br>";
    $result = $pdo->query($query);

    if($content->supres!=null){
      $query="SELECT id FROM users WHERE name=$name_ AND email = $email_ AND date = $date_ AND count_conech = $count_ AND polid = $pol_ AND comment = $comment_";
      $result = $pdo->query($query);
      while($row=$result->fetch()){
        $id__ = htmlspecialchars($row['id']);

      }
      $id_=get_content($pdo,$id__);
      for($i=0;$i<count($content->supres);$i++){
        $supid_=get_content($pdo,$content->supres[$i]);
        $query="INSERT INTO user_supers (iduser ,idsuper) VALUES"."($id_,$supid_)";
       $result= $pdo->query($query);

      }
    }
    echo "<script>alert('Запрос обработан');</script>";

}
catch(Exception $e){
  $mes=  $e->getMessage();
    echo "<strong>! $mes </strong>";
}
  }
  else if($_GET){
    /*$host = $_SERVER['HTTP_HOST'];
    $uri = rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
    $extra = 'Index.php';
    header("Location: http://$host$uri/$extra");*/
Redirect("Index.php");
  }
?>