<?php
require_once 'LibraryPchMain.php';
function YourData($login,$password){
    echo "<!DOCTYPE html>";
    echo <<<_END
    <html>
       <body>
          <header>
             <h2>Вы успешно зарегестрировались!</h2>
          </header>
          <main>
          <div>
              Ваш логин для входа :<strong> $login </strong>
          </div>
             <div>
             Ваш пароль для входа: <strong>$password </strong>
             </div>
             <a href="login.php>Войти</a>
          </main>
       </body>
    </html>
    _END;
}
?>