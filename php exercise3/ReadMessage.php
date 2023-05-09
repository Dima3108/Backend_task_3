<?php

  require_once 'LibraryPchMain.php';//файл с именами подключенных файлов
  
 

  if($_POST){
    if(isset($_POST['suc_token'])&&$_POST['suc_token']!=(string)"1"){//Проверка токена (подробности в create_token.php)
Redirect("Index.php");//Перенаправление на главную страницу
     return;
    }
    echo "<script>alert('Запрос получен');</script>";
    $status=valid_attributes($pdo);//валидация данных
    
    if($status!=SUCCESSR){
    require_once 'Index.php';
return;
}else {
  $attr_cokie=array('user_nam','user_email','user_date');
for($j=0;$j<count($attr_cokie);$j++){
  disable_cookie($attr_cokie[$j]);//удаление предупреждений
}
//Очистка http заголовеов об ошибках
ClearNameHeader();
ClearEmailHeader();
ClearDateHeader();
  //WriteLine("Success");
}
require_once 'Index.php';
    try{
//Сохранение данных пользователя
    
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
    $pass_=GenerateRandomPassword();
    $login_=$email_;
    $pass_h=get_content($pdo,password_hash($pass_,PASSWORD_DEFAULT));

    $query="INSERT INTO userslogins (userid,email,password) VALUES($id_,$email_,$pass_h)";
    $result = $pdo->query($query);
    require_once ('CreateLogin.php');
    YourData($content->email,$pass_);
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