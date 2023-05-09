<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <title>Вход</title>
</head>

<body>
    <header>
        <h2>Вход в систему</h2>
    </header>
    <form action="login.php" method="post">
        <div>
            <label>Введите логин:</label><input type="text" name="email" required />
        </div>
        <div>
            <label>Введите пароль:</label><input type="password" name="password" required />
        </div>
       <?php
       require_once 'LibraryPchMain.php';
       $tok=get_hash_token();
       echo "<input type='hidden' name='safetok' value='$tok'>";
       ?>
        <button type="submit">Отправить</button>
    </form>
</body>

</html>