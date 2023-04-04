<?php
require_once 'databaseconnection.php';
require_once 'Library.php';
$query="SELECT * FROM users,POL WHERE users.polid=POL.id  ";
$result = $pdo->query($query);
while($row = $result->fetch()){
    echo "<div>";
    $name=htmlspecialchars($row['name']);
    $email=htmlspecialchars($row['email']);
    $date=htmlspecialchars($row['date']);
    $count=htmlspecialchars($row['count_conech']);
    //$superspos= htmlspecialchars(StrArrayToString(array($row['sposobnost'])));
    $pol=htmlspecialchars($row['pol']);
    $comment=htmlspecialchars($row['comment']);
    $name_=get_content($pdo,$name);
    $email_=get_content($pdo,$email);
    $date_=get_content($pdo,$date);
    $count_=get_content($pdo,$count);
    $pol_=get_content($pdo,$pol);
    $comment_=get_content($pdo,$comment);
    $query11 = "SELECT id FROM users WHERE name=$name_ AND email = $email_ AND date = $date_ AND count_conech = $count_ AND polid = $pol_ AND comment = $comment_";
    $result11 = $pdo->query($query11);
    while ($row = $result11->fetch()) {
        $id__ = htmlspecialchars($row['id']);

    }
    $id_us=get_content($pdo,$id__);
    $query2="SELECT * FROM supersposobnosti , user_supers WHERE user_supers.iduser=$id_us AND supersposobnosti.id = user_supers.iduser";
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
    echo "<label>Суперспособности:".$superspos."</label>";
    while($row=$result2->fetch()){
        DIV_Start();
        echo htmlspecialchars($row['sposobnost']);
        DIV_Stop();
    }
    DIV_Stop();
    echo "</div>";
}

?>