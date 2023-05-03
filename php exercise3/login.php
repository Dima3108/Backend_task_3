
        <?php  
       
 require_once('LibraryPchMain.php');
 if($_POST){
    
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
    Redirect('login.html');
   }
   
}
else{
 Redirect('login.html');
}

?>