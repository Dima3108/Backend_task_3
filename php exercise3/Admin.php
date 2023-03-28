<?php
require_once 'databaseconnection.php';
$query="SELECT * FROM users,POL WHERE users.polid=POL.id";
$result = $pdo->query($query);
while($row = $result->fetch()){
    echo "<div>";
    $name=htmlspecialchars($row['name']);
    $email=htmlspecialchars($row['email']);
    $date=htmlspecialchars($row['date']);
    $count=htmlspecialchars($row['count_conech']);
    $superspos=htmlspecialchars($row['superspos']);
    $pol=htmlspecialchars($row['pol']);
    $comment=htmlspecialchars($row['comment']);
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
    DIV_Stop();
    echo "</div>";
}
function DIV_Start(){
    echo "<div>";
}
function DIV_Stop(){
    echo "</div>";
}
function DIV_StopStart(){
    DIV_Stop();
    DIV_Start();
}
?>