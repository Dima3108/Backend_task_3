
        <?php  
       
 require_once('LibraryPchMain.php');
 require_once 'admin_authorize.php';
 if($_POST){
   DebuggerAddMessage($debfilename,'post запрос к странице login.php');
   DebuggerAddMessage($debfilename,'параметры post запроса :'.(print_r($_POST)));
   if(isset($_POST['safetok'])&&valid_hash_token($_POST['safetok'])==SUCCESSR){
    if(admin_verfi($_POST['email'],$_POST['password'])==SUCCESSR){
      session_start();
      $_SESSION['role']='admin';
      DebuggerAddMessage($debfilename,'роль администратора подтверждена , перенаправление на страницу администрирования');
      Redirect('Admin.php');
    }
    else{
   $email=get_content($pdo,$_POST['email']);
   $query="SELECT password from userslogins WHERE email = $email";
   $result=$pdo->query($query);
   $succes=-1;
   $pas="";
   // $name=htmlspecialchars($row['name']);
   while($row=$result->fetch()){
      DebuggerAddMessage($debfilename,'пользователь с логином "'.$email.'" существует , проверка соответсвия пароля');

      $phash=htmlspecialchars($row['password']);
      if(password_verify($_POST['password'],$phash)==true){
             $succes=SUCCESSR;
              $pas=$phash;
              DebuggerAddMessage($debfilename,'пароли совпадают ');
              break;
      }
   }
   if($succes==SUCCESSR){
      DebuggerAddMessage($debfilename,'найден указанный пользователь');
    $pas=get_content($pdo,$pas);
   $query="SELECT userid from userslogins WHERE email = $email AND password = $pas";
   $result=$pdo->query($query);
   while($row=$result->fetch()){
    $id_=htmlspecialchars($row['userid']);

   }
   session_start();
   DebuggerAddMessage($debfilename,'сессия запущена');
   $_SESSION['userid']=$id_;
   $_SESSION['isauth']=SUCCESSR;
   DebuggerAddMessage($debfilename,'состояние сессии:'.(print_r($_SESSION)));

   DebuggerAddMessage($debfilename,'вход выполнен успешно , перенаправление на страницу redact_user_data.php');
   Redirect('redact_user_data.php');
   }
   else{
      DebuggerAddMessage($debfilename,'ошибка во время авторизации , перенаправление на страницу входа logins.php');
    Redirect('logins.php');
   }
}
   }
   else{
      DebuggerAddMessage($debfilename,'токен не подтвержден , перенаправление на страницу входа logins.php');
              Redirect('logins.php');
   }
   
}
else{
   DebuggerAddMessage($debfilename,'get запрос , перенаправление на страницу logins.php');
 Redirect('logins.php');
}

?>