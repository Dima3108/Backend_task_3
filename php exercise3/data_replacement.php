<?php

if($_POST){
    require_once 'LibraryPchMain.php';
    if(valid_date_token($_POST['toksafe'])){
        echo <<<_END
        <!DOCTYPE html>
        <html>
        <head>
        <title >Данные получены</title>
        </head>
        <body>
        <main>
        <h3>Токен подтвержден</h3>
        <main>
        </body>
        </html>
        _END;
    }
}
?>