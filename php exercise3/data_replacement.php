<?php

if($_POST){
    require_once 'LibraryPchMain.php';
    
    if(valid_hash_token($_POST['toksafe'])==SUCCESSR){
       /* echo <<<_END
        <!DOCTYPE html>
        <html>
        <head>
        <title >Данные получены</title>
        </head>
        <body>
        <main>
        <h3>Токен подтвержден</h3>

        </main>
        </body>
        </html>
        _END;*/
        session_start();
        if( valid_attributes($pdo)==SUCCESSR){
             $id=get_content($pdo,$_POST['uid']);
             $query="DELETE FROM users WHERE id =".$id;
             $result=$pdo->query($query);
             $content=ReadMessage();
            $name_ = get_content($pdo, $content->name);
            $email_ = get_content($pdo, $content->email);
            $date_ = get_content($pdo, $content->date);
            $count_ = get_content($pdo, $content->kolvo);
            $pol_ = get_content($pdo, $content->pol);
            $comment_ = //"'".
                get_content($pdo, $content->biografia) //.
                //"'"
            ;
            $query = "INSERT INTO users(name,email,date,count_conech,polid,comment) VALUES" . "(
        $name_,$email_,$date_,$count_,$pol_,$comment_
    )";
             
            $result=$pdo->query($query);
            
            $query = "SELECT id FROM users WHERE name=$name_ AND email = $email_ AND date = $date_ AND count_conech = $count_ AND polid = $pol_ AND comment = $comment_";
                $result = $pdo->query($query);
                while ($row = $result->fetch()) {
                    $id__ = htmlspecialchars($row['id']);//получить новый id

                }
                 $id_ = get_content($pdo, $id__);
            /*изменение логина:*/
            $query = "SELECT email,password FROM userslogins WHERE userid = $id";
            $result = $pdo->query($query);
            while ($row = $result->fetch()) {
                $usphash = htmlspecialchars($row['password']);
                $uemail = htmlspecialchars($row['email']);
                $uspassh_ = get_content($pdo, $usphash);
                $uemail_ = get_content($pdo, $uemail);
            }

            $query="DELETE FROM userslogins WHERE userid = $id";
            $result=$pdo->query($query);
            $query ="INSERT INTO userslogins (email,password,userid) VALUES($uemail_,$uspassh_,$id_)";
            $result=$pdo->query($query);
            $query="DELETE FROM users_supers WHERE iduser = $id";
            if ($content->supres != null) {
                
               
                for ($i = 0; $i < count($content->supres); $i++) {
                    $supid_ = get_content($pdo, $content->supres[$i]);
                    $query = "INSERT INTO user_supers (iduser ,idsuper) VALUES" . "($id_,$supid_)";
                    $result = $pdo->query($query);

                }
            }
            echo <<<_END
        <!DOCTYPE html>
        <html>
        <head>
        <title >Данные получены</title>
        </head>
        <body>
        <main>
        <h3>Данные успешно сохраненеы</h3>
        <a href="Index.php" >На главную</a>
       _END;
       if(isset($_SESSION['role'])&&$_SESSION['role']=='admin'){
        echo "<a href='Admin.php'>К списку пользователей</a>";
       }
        echo<<<_END
        </main>
        </body>
        </html>
        _END;
        }
        else{
             echo <<<_END
        <!DOCTYPE html>
        <html>
        <head>
        <title >Данные получены</title>
        </head>
        <body>
        <main>
        <h2>В данных присутствует ошибка<h2>
        </main>
        </body>
        </html>
        _END;
        }
    }
}
?>