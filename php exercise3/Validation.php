<?php
require_once 'LibraryPchMain.php';
function uncorrect_name()
{
    SetErrorNameHeader('имя должно состоять из букв a-z , а-я , цифр 0-9 ');
    enable_cookie('user_nam', 'имя должно состоять из букв a-z , а-я , цифр 0-9 '); //установка предупреждения с сообщением ошибки валидации
    return -2;
}
function valid_name($name)
{
    require_once 'LibraryPchMain.php';
    DebuggerAddMessage($debfilename,'проверка имени');
    DebuggerAddMessage($debfilename,'значение  имени:'.(print_r($name)));
    if (strlen($name) <= 0) {
        DebuggerAddMessage($debfilename,'имя незаполненно');
        return uncorrect_name();
    }
    DebuggerAddMessage($debfilename,'проверка регулярным вырожением');
    if (
        preg_match('/^[[a-z]|[а-я]]/i',
            $name)
        // preg_match('/^[a-z]/i',$name)||preg_match('/^[а-я]/i',$name)
    ) {

        if (preg_match('/[[a-z]|[а-я]|[0-9]]/i', $name)) {
            $len = strlen($name);
            if (preg_match('/([a-z]|[а-я]|[0-9]){' . $len . ',}?/i', $name)) { //проверка соотношения числа допутимых символов с общим числом символов
                //  setcookie('user_nam','',-1);
                DebuggerAddMessage($debfilename,'проверка регулярным вырожением успешно пройдена');
                disable_cookie('user_nam');
                return SUCCESSR;
            } else {
                //  setcookie('user_nam', 'имя должно состоять из букв a-z , а-я , цифр 0-9 ', TIME_COOK);
                /* enable_cookie('user_nam', 'имя должно состоять из букв a-z , а-я , цифр 0-9 ');
                return -2;*/
                DebuggerAddMessage($debfilename,'проверка не прйдена имя содержит недопустимые символы');
                return uncorrect_name();
            }

        } else {
            // setcookie('user_nam', 'имя должно состоять из букв a-z , а-я , цифр 0-9 ', TIME_COOK);
            /* enable_cookie('user_nam', 'имя должно состоять из букв a-z , а-я , цифр 0-9 ');
            return -2;*/
            DebuggerAddMessage($debfilename, 'проверка не прйдена имя содержит недопустимые символы');
            return uncorrect_name();
        }
        // }

    } else {
        // setcookie('user_nam','имя должно начинатся с символов a-z или а-я',TIME_COOK);
/* enable_cookie('user_nam','имя должно начинатся с символов a-z или а-я');
  return -1;*/ 
  DebuggerAddMessage($debfilename,'проверка не пройдена , первый символ не является буквой');
        return uncorrect_name();
    }
}
function uncorrect_email()
{
    SetErrorEmailHeader('проверьте корректность адреса электронной почты');
    setcookie('user_email', 'проверьте корректность адреса электронной почты', TIME_COOK);
    // echo "проверьте корректность почты";
    // disable_cookie('user_email');
    return -2;
}
function valid_email(string $email)
{
require_once 'LibraryPchMain.php';
DebuggerAddMessage($debfilename,'проверка почты');
DebuggerAddMessage($debfilename,'значение почты:'.(print_r($email)));
    $len = strlen($email);
    if ($len < 1 || empty($email) || $email == "") {
        DebuggerAddMessage($debfilename,'проверка почты непрошла, почта пустая');
        return uncorrect_email();
    } else{
        DebuggerAddMessage($debfilename,'проверка почты прошла успешно');
        enable_cookie('user_evalue',$email);
        return SUCCESSR;
    }
        

    /* $char0=$email[0];
    if(preg_match('/[a-z]|[0-9]/i',$char0)){
    $charn=$email[$len-1];
    if(preg_match('/[a-b]/i',$charn)){
    $is_point=2;
    $is_dog=2;
    for($i=$len-2;$i>=1;$i--){
    switch($email[$i]){
    case '.':
    $is_point=SUCCESSR;
    break;
    case '@':
    if($is_point==SUCCESSR){
    $is_dog=SUCCESSR;
    }
    else return uncorrect_email();
    break;
    default :
    if(preg_match('/[a-z]|[0-9]/i',$email[$i])){
    }
    else{
    return uncorrect_email();
    }
    break;
    }
    }
    if($is_dog==SUCCESSR&&$is_point==SUCCESSR){
    disable_cookie('user_email');
    ClearEmailHeader();
    return SUCCESSR;
    }
    else{
    return uncorrect_email();
    }
    }
    else {
    return uncorrect_email();
    }
    }
    else return uncorrect_email();*/
}
function save_commit()
{
    require_once 'LibraryPchMain.php';
    DebuggerAddMessage($debfilename,'сохранение комментария');
    if (isset($_POST['biograf']) && !empty($_POST['biograf'])) {
        DebuggerAddMessage($debfilename,'коментарией со значением :'.$_POST['biograf'].'  сохранен');
        enable_cookie('user_cvalue', $_POST['biograf']);
    }
    else{
        DebuggerAddMessage($debfilename,'коментарий пуст либо несуществует');
    }
}
function valid_attributes($pdo)
{
    require_once 'LibraryPchMain.php';
    DebuggerAddMessage($debfilename,'начало валидации атрибутов');
    save_commit();
    //вспомогательные массивы
    $attributes_n = array('name', 'email', 'date');
    $attributes_errors = array('вы не ввели имя', 'вы не ввели почту', 'вы не выбрали дату');
    $attr_htmlid = array('name_sp', 'email_sp', 'date_sp');
    $attr_cokie = array('user_nam', 'user_email', 'user_date');
    $message = "";
    $is_empty_attr = SUCCESSR;
    for ($i = 0; $i < count($attributes_errors); $i++) {
        $val = ContainsAttribute($attributes_n[$i], $attributes_errors[$i], $attr_htmlid[$i], $attr_cokie[$i]);
        if ($val != "") {
            DebuggerAddMessage($debfilename,'произошла ошибка при проверке атрибута '.$attributes_n[$i]);
            $message = $message . $val . "<br/>";
            $is_empty_attr = $is_empty_attr - 2 * ($i + 1);
        }
    }
    if ($is_empty_attr != SUCCESSR) {
        DebuggerAddMessage($debfilename,'во время проверки атрибутов произошли ошибки, возможно некоторые атрибуты незаполнены');
        return $is_empty_attr;
    }
    $status = valid_name($_POST['name']); //расширенная проверка имени с помощью регулярных вырожений
    if ($status != SUCCESSR) {
        DebuggerAddMessage($debfilename,'ошибка во время проверки имени');
        return 2;
        // echo "<br>" . $status . "-------------------------------------------------------</br>";
    }
    $mail = (string) $_POST['email'];
    $status2 = valid_email($mail); //расширенная проверка email 
    //echo strlen($mail);
    if ($status2 != SUCCESSR) {
        DebuggerAddMessage($debfilename,'ошибка во время проверки почты');
        return 2;
    }
    DebuggerAddMessage($debfilename,'проверка даты');
    try {

        $datestr = get_content($pdo, htmlspecialchars($_POST['date']));
        DebuggerAddMessage($debfilename,'значение даты:'.(print_r($datestr)));
        $str = (string) ($datestr);
        $date_f = date_create($_POST['date']);
        if (strlen($str) <= 0 || $str == '' || $_POST['date'] === null || $_POST['date'] == null) {
            $message = "Проверьте корректность даты";
            //  setcookie($attr_cokie[2],'Проверьте корректность даты',365*24*60*60);
            DebuggerAddMessage($debfilename,'ошибка проверки даты, дата пустая');
            SetErrorDateHeader('Проверьте корректность даты');
            enable_cookie($attr_cokie[2], 'Проверьте корректность даты');
        }
    } catch (Exception $e) {
        $message = "Проверьте корректность даты";
        DebuggerAddMessage($debfilename,'ошибка проверки даты, дата имеет неверный формат');
        SetErrorDateHeader('Проверьте корректность даты');
        enable_cookie($attr_cokie[2], 'Проверьте корректность даты');
    }
    if ($message != "") {
        echo "<div>" . $message . "</div>";
        DebuggerAddMessage($debfilename,'проверка даты завершилась ошибкой:"'.$message.'".');
        return 2;
    } else {
        DebuggerAddMessage($debfilename,'проверка даты успешно закончена');
        return 1;
    }
}

?>