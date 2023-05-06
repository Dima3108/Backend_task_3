<?php
require_once 'LibraryPchMain.php';
function RedactData($pdo,$userid){
    $normalid=get_content($pdo,$userid);
   // $query="SELECT * FROM users WHERE id = $normalid";
   $query="SELECT * FROM users,POL WHERE users.polid=POL.id AND users.id = $normalid";
    $result=$pdo->query($query);
    while($row=$result->fetch()){
        echo "<form action='data_replacement.php' method='post'>";
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
       

        DIV_Start();
        echo "<label>Имя:<input type='text' value='" . $name . "' name='name' required></label>";
        DIV_StopStart();
        echo "<label>почта:<input type='email' value='" . $email . "' name='email' required></label>";
        DIV_StopStart();
        echo "<label>Дата рождения:<input type='date' value='" . $date . "' name='date' required></label>";
        DIV_StopStart();
        echo "<label>Количество конечностей:" ;//. $count . "</label>";
         echo "</label>";
        for($i=1;$i<=10;$i++){
            if($i!=$count){
                echo "<label>$i <input type='radio' name='count' value='$i'></label>";
            }
            else{
                echo "<label>$i <input type='radio' name='count' value='$i' checked> </label>";
            }
        }
       
        DIV_StopStart();
        echo "<label>Пол:";// . $pol . "</label>";
        $query = "SELECT * FROM POL";
        $result = $pdo->query($query);
        $count = 0;
        while ($row = $result->fetch()) {
            $r0 = htmlspecialchars($row['pol']);
            $r1 = htmlspecialchars($row['id']);
            if ($r1!=$polid) {


                echo <<<_END
                            
                              <label>$r0
                              <input type="radio" value="$r1" class="form-check" name="pol">
                              </label>
                             
                              _END;
            } else {
                echo <<<_END
                            
                              <label>$r0
                              <input type="radio" value="$r1" class="form-check" name="pol" checked>
                              </label>
                             
                              _END;
            }
            $count++;
        }
        echo "</label>";
        DIV_StopStart();
        echo "<div>Комментарий: <textarea name='biograf'>" . $comment . "</textarea></div>";
        DIV_StopStart();
        echo "<label>Суперспособности:";
         $query2 = "SELECT * FROM supersposobnosti , user_supers WHERE user_supers.iduser = $id_ AND supersposobnosti.id = user_supers.idsuper";
        // echo $query2;
        $result2 = $pdo->query($query2);
        //echo "<select name='supers'"
        $chsup=array();
        while ($row = $result2->fetch()) {
           /* DIV_Start();
            echo htmlspecialchars($row['sposobnost']);
            DIV_Stop();*/
$chsup[]= htmlspecialchars($row['sposobnost']);
        }
        echo " <select name='supers[]'  multiple>";
        require_once 'LibraryPchMain.php';
        $query = "SELECT * FROM  supersposobnosti";
        $result = $pdo->query($query);
        while ($row = $result->fetch()) {
            $r0 = htmlspecialchars($row['sposobnost']);
            $r1 = htmlspecialchars($row['id']);
            $suc=-1;
            for($i=0;$i<count($chsup);$i++){
                if($chsup[$i]==$r0){
                    $suc=1;
                    break;
                }
            }
            if($suc!=1){
                 echo <<<_END
                               <option value="$r1">$r0</option>
                            _END;
            }
           else{
                echo <<<_END
                               <option value="$r1" selected>$r0</option>
                            _END;
           }

        }
        echo "</select>";
        echo "</label>";
        DIV_Stop();
        echo "<input type='hidden' value='$userid' name='uid'>";
        $token=get_date_token();
        echo "<input type='hidden' value='$token' name='toksafe'>";
        echo "<button type='submit'>Сохранить</button>";
        echo "</div>";
        echo "</form>";
    }
} 
if($_POST&&isset($_POST['type'])&&($_POST['type']=='admin')&&isset($_POST['safetok'])&&(valid_date_token($_POST['safetok'])==SUCCESSR)&&isset($_POST['uid'])){
    echo <<<_END
<!DOCTYPE html>
        <html>
            <head>
               <title>Редакция</title>
            </head>
              <body>
                 <header>Изменение данных</header>
                 <main>
_END;
   
        RedactData($pdo, $_GET['uid']);
    
    // print_r($_SESSION);


    echo <<<_END
 </main>
   </body>
   </html>
_END;
} 
$sstat=session_start() 
  ; 
if(session_status()==PHP_SESSION_DISABLED){

Redirect('login.php');
}
else{
    if($_SESSION['isauth']!=SUCCESSR){
       // session_abort();
        Redirect('login.php');
    }
    else{
            
    }
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
   if( $sstat   ){
    RedactData($pdo,$_SESSION['userid']);
   }
   else{
    Redirect('login.php');
   }
   // print_r($_SESSION);


   echo<<<_END
 </main>
   </body>
   </html>
_END;
  
   
}
?>