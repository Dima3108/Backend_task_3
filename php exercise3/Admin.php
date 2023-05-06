<?php
require_once 'LibraryPchMain.php';
$query="SELECT * FROM users,POL WHERE users.polid=POL.id  ";
$result = $pdo->query($query);
$stook=get_date_token();
while($row = $result->fetch()){
    echo "<div>";
    $name=htmlspecialchars($row['name']);
    $email=htmlspecialchars($row['email']);
    $date=htmlspecialchars($row['date']);
    $count=htmlspecialchars($row['count_conech']);
    
    $pol=htmlspecialchars($row['pol']);
    $polid=htmlspecialchars($row['polid']);
    $comment=htmlspecialchars($row['comment']);
    $name_=get_content($pdo,$name);
    $email_=get_content($pdo,$email);
    $date_=get_content($pdo,$date);
    $count_=get_content($pdo,$count);
    $pol_=get_content($pdo,$polid);
    $comment_=get_content($pdo,$comment);
    $query2 = "SELECT id FROM users WHERE name=$name_ AND email = $email_ AND date = $date_ AND count_conech = $count_ AND polid = $pol_ AND comment = $comment_";
    //echo $query2;
    $result2 = $pdo->query($query2);
    while ($row2 = $result2->fetch()) {
        $id__ = htmlspecialchars($row2['id']);
        //echo "<br># $id__ #</br>";
    }
    $id_ = get_content($pdo, $id__);
   
   // $id_us=get_content($pdo,$id_);
    $query2="SELECT * FROM supersposobnosti , user_supers WHERE user_supers.iduser = $id_ AND supersposobnosti.id = user_supers.idsuper";
    // echo $query2;
    $result2=$pdo->query($query2);

    DIV_Start();
    echo "<label>Имя:".$name."</label>";
    DIV_StopStart();
    echo "<label>почта:".$email."</label>";
    DIV_StopStart();
    echo "<label>Дата рождения:".$date."</label>";
    DIV_StopStart();
    echo "<label>Количество конечностей:".$count."</label>";
    DIV_StopStart();
    echo "<label>Пол:".$pol."</label>";
    DIV_StopStart();
    echo "<div>Комментарий: <textarea>".$comment."</textarea></div>";
    DIV_StopStart();
    echo "<label>Суперспособности:";
    while($row=$result2->fetch()){
        DIV_Start();
        echo htmlspecialchars($row['sposobnost']);
        DIV_Stop();
    }
    echo "</label>";
    DIV_Stop();
    echo "</div>";
    echo "<form action='redact_user_data.php' method='post'>";
    echo "<input type='hidden' value='admin' name='type'>";
    echo "<input type='hidden' value='$stook' name='safetok'>";
    echo "<input type='hidden' value='$id__' name='uid'>";
    echo "<button type='submit'>изменить данные пользователя</button>";
    echo "</form >";
}

?>