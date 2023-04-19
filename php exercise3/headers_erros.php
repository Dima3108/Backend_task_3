<?php
//устанавливает ошибку валидации name в виде заголовка
function SetErrorNameHeader($error){
    header('h_name:'.$error);
}
//удаляет ошибку валидации name
function ClearNameHeader(){
    header('h_name:');
}
//устанавливает ошибку валидации email в виде заголовка
function SetErrorEmailHeader($error)
{
    header('h_email:' . $error);
}
//удаляет ошибку валидации email
function ClearEmailHeader()
{
    header('h_email:');
}
//устанавливает ошибку валидации date в виде заголовка
function SetErrorDateHeader($error)
{
    header('h_date:' . $error);
}
//удаляет ошибку валидации date
function ClearDateHeader()
{
    header('h_date:');
}
?>