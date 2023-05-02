<!DOCTYPE html>
<html>
    <head>
        <title>login</title>
</head>
    <body>
        <main>
        <?php  
       
if($_GET){
   echo <<<_END
   <form action="login.php" method="post">
   <div>
   <label>Ваш логин:</label><input type="email" name="email" required>
   </div>
   <div>
   <label>Ваш пароль:</label><input type="password" name="password" required>
   <button type="submit">отправить</button>
   </form>
   _END;
}
else if($_POST){
     require_once('LibraryPchMain.php');
   $email=get_content($pdo,$_POST['email']);
   $query="SELECT password from userslogins WHERE email = $email";
   $result=$pdo->query($query);
   $succes=-1;
   $pas="";
   // $name=htmlspecialchars($row['name']);
   while($row=$result->fetch()){
      $phash=htmlspecialchars($row['password']);
      if(password_verify($_POST['password'],$phash)==true){
             $succes=SUCCESSR;
              $pas=$phash;
              break;
      }
   }
   if($succes==SUCCESSR){
    $pas=get_content($pdo,$pas);
   $query="SELECT userid from userslogins WHERE email = $email AND password = $pas";
   $result=$pdo->query($query);
   while($row=$result->fetch()){
    $id_=htmlspecialchars($row['userid']);

   }
   session_start();
   $_SESSION['userid']=$id_;
   $_SESSION['isauth']=SUCCESSR;
   Redirect('redact_user_data.php');
   }
   else{
    Redirect('login.php');
   }
   
}
?>
</main>
</body>
    </html>
