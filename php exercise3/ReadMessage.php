<?php

  require_once 'LibraryPchMain.php';//файл с именами подключенных файлов
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
  function uncorrect_name(){
    SetErrorNameHeader('имя должно состоять из букв a-z , а-я , цифр 0-9 ');
  enable_cookie('user_nam', 'имя должно состоять из букв a-z , а-я , цифр 0-9 ');//установка предупреждения с сообщением ошибки валидации
  return -2;
  }
function valid_name($name){
  if(strlen($name)<=0){
    return uncorrect_name();
  }
if(
  preg_match('/^[[a-z]|[а-я]]/i',$name)
 // preg_match('/^[a-z]/i',$name)||preg_match('/^[а-я]/i',$name)
  ){
  
    if(preg_match('/[[a-z]|[а-я]|[0-9]]/i',$name)){
      $len=strlen($name);
      if(preg_match('/([a-z]|[а-я]|[0-9]){'.$len.',}?/i',$name)){//проверка соотношения числа допутимых символов с общим числом символов
      //  setcookie('user_nam','',-1);
      disable_cookie('user_nam');
  return SUCCESSR;
      }
      else{
      //  setcookie('user_nam', 'имя должно состоять из букв a-z , а-я , цифр 0-9 ', TIME_COOK);
     /* enable_cookie('user_nam', 'имя должно состоять из букв a-z , а-я , цифр 0-9 ');
        return -2;*/
        return uncorrect_name();
      }

    }
    else{
     // setcookie('user_nam', 'имя должно состоять из букв a-z , а-я , цифр 0-9 ', TIME_COOK);
    /* enable_cookie('user_nam', 'имя должно состоять из букв a-z , а-я , цифр 0-9 ');
      return -2;*/
      return uncorrect_name();
    }
 // }
  
}
else{
 // setcookie('user_nam','имя должно начинатся с символов a-z или а-я',TIME_COOK);
/* enable_cookie('user_nam','имя должно начинатся с символов a-z или а-я');
  return -1;*/
  return uncorrect_name();
}
}
function uncorrect_email(){
  SetErrorEmailHeader('проверьте корректность адреса электронной почты');
   setcookie('user_email','проверьте корректность адреса электронной почты',TIME_COOK);
  // echo "проверьте корректность почты";
  // disable_cookie('user_email');
    return -2;
}
function valid_email(string $email ){
  
  $len=strlen($email);
  if($len<1||empty($email)||$email==""){
    return uncorrect_email();
  }
  else return SUCCESSR;
  
 /* $char0=$email[0];
  if(preg_match('/[a-z]|[0-9]/i',$char0)){
     $charn=$email[$len-1];
     if(preg_match('/[a-b]/i',$charn)){
        $is_point=2;
        $is_dog=2;
        for($i=$len-2;$i>=1;$i--){
            switch($email[$i]){
              case '.':
                $is_point=SUCCESSR;
                break;
                case '@':
                  if($is_point==SUCCESSR){
                    $is_dog=SUCCESSR;
                  }
                  else return uncorrect_email();
                  break;
                  default :
                    if(preg_match('/[a-z]|[0-9]/i',$email[$i])){

                    }
                    else{
                      return uncorrect_email();
                    }
                  break;
            }
        }
        if($is_dog==SUCCESSR&&$is_point==SUCCESSR){
          disable_cookie('user_email');
          ClearEmailHeader();
          return SUCCESSR;
        }
        else{
          return uncorrect_email();
        }
     }
     else {
        return uncorrect_email();
     }
  }
  else return uncorrect_email();*/
}
function save_commit(){
  if(isset($_POST['biograf'])&&!empty($_POST['biograf'])){
    enable_cookie('user_cvalue',$_POST['biograf']);
  }
}
  function valid_attributes($pdo){
    save_commit();
    //вспомогательные массивы
    $attributes_n=array('name','email','date');
    $attributes_errors=array('вы не ввели имя','вы не ввели почту','вы не выбрали дату');
    $attr_htmlid=array('name_sp','email_sp','date_sp');
    $attr_cokie=array('user_nam','user_email','user_date');
    $message="";
    $is_empty_attr=SUCCESSR;
    for($i=0;$i<count($attributes_errors);$i++){
             $val=ContainsAttribute($attributes_n[$i],$attributes_errors[$i],$attr_htmlid[$i],$attr_cokie[$i]);
             if($val!=""){
              $message=$message.$val."<br/>";
              $is_empty_attr=$is_empty_attr-2*($i+1);
             }
    }
    if($is_empty_attr!=SUCCESSR){
      return $is_empty_attr;
    }
  $status = valid_name($_POST['name']);//расширенная проверка имени с помощью регулярных вырожений
  if ($status != SUCCESSR) {
    return 2;
   // echo "<br>" . $status . "-------------------------------------------------------</br>";
  }
  $mail=(string) $_POST['email'];
  $status2 = valid_email($mail);//расширенная проверка email 
  //echo strlen($mail);
  if ($status2 != SUCCESSR) {
    return 2;
  }
    try{
      $datestr=get_content($pdo,htmlspecialchars($_POST['date']));
      $str=(string)($datestr);
     $date_f=date_create($_POST['date']);
      if(strlen($str)<=0||$str==''||$_POST['date']===null||$_POST['date']==null){
        $message="Проверьте корректность даты";
      //  setcookie($attr_cokie[2],'Проверьте корректность даты',365*24*60*60);
      SetErrorDateHeader('Проверьте корректность даты');
      enable_cookie($attr_cokie[2], 'Проверьте корректность даты');
      }
    }
    catch(Exception $e){
       $message="Проверьте корректность даты";
    SetErrorDateHeader('Проверьте корректность даты');
    enable_cookie($attr_cokie[2], 'Проверьте корректность даты');
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