<?php
require_once 'LibraryPchMain.php';
function RedactData($pdo,$userid){
    $normalid=get_content($pdo,$userid);
   // $query="SELECT * FROM users WHERE id = $normalid";
   $query="SELECT * FROM users,POL WHERE users.polid=POL.id AND users.id = $normalid";
    $result=$pdo->query($query);
    while($row=$result->fetch()){
        echo "<div>";
        $name = htmlspecialchars($row['name']);
        $email = htmlspecialchars($row['email']);
        $date = htmlspecialchars($row['date']);
        $count = htmlspecialchars($row['count_conech']);

        $pol = htmlspecialchars($row['pol']);
        $polid = htmlspecialchars($row['polid']);
        $comment = htmlspecialchars($row['comment']);
        $name_ = get_content($pdo, $name);
        $email_ = get_content($pdo, $email);
        $date_ = get_content($pdo, $date);
        $count_ = get_content($pdo, $count);
        $pol_ = get_content($pdo, $polid);
        $comment_ = get_content($pdo, $comment);
        $query2 = "SELECT id FROM users WHERE name=$name_ AND email = $email_ AND date = $date_ AND count_conech = $count_ AND polid = $pol_ AND comment = $comment_";
        //echo $query2;
        $result2 = $pdo->query($query2);
        while ($row2 = $result2->fetch()) {
            $id__ = htmlspecialchars($row2['id']);
            //echo "<br># $id__ #</br>";
        }
        $id_ = get_content($pdo, $id__);

        // $id_us=get_content($pdo,$id_);
        $query2 = "SELECT * FROM supersposobnosti , user_supers WHERE user_supers.iduser = $id_ AND supersposobnosti.id = user_supers.idsuper";
        // echo $query2;
        $result2 = $pdo->query($query2);

        DIV_Start();
        echo "<label>Имя:<input type='text' value='" . $name . "' name='name'></label>";
        DIV_StopStart();
        echo "<label>почта:<input type='email' value=''" . $email . "' name='email'></label>";
        DIV_StopStart();
        echo "<label>Дата рождения:" . $date . "</label>";
        DIV_StopStart();
        echo "<label>Количество конечностей:" . $count . "</label>";
        DIV_StopStart();
        echo "<label>Пол:" . $pol . "</label>";
        DIV_StopStart();
        echo "<div>Комментарий: <textarea>" . $comment . "</textarea></div>";
        DIV_StopStart();
        echo "<label>Суперспособности:";
        while ($row = $result2->fetch()) {
            DIV_Start();
            echo htmlspecialchars($row['sposobnost']);
            DIV_Stop();
        }
        echo "</label>";
        DIV_Stop();
        echo "</div>";
    }
}
if(session_status()==PHP_SESSION_DISABLED){

Redirect('login.php');
}
else{
    /*if($_SESSION['isauth']!=SUCCESSR){
       // session_abort();
        Redirect('login.php');
    }
    else{
            
    }*/
    echo<<<_END
<!DOCTYPE html>
        <html>
            <head>
               <title>Редакция</title>
            </head>
              <body>
                 <header>Изменение данных</header>
                 <main>
_END;
      session_start();  
   // print_r($_SESSION);

RedactData($pdo,$_SESSION['userid']);
   echo<<<_END
 </main>
   </body>
   </html>
_END;
  
   
}
?>