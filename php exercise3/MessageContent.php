<?php
 class MessageContent
{
    public $email;
    public $name;
    public $date;
    public $pol;
    public $kolvo;
    public $biografia;
    //public $awtc;
    public $supres;
  public  function __construct()
    {

    }
}
function ReadMessage()
{
  $name = $_POST['name'];
  $email = $_POST['email'];
  $date = $_POST['date'];
  $pol = $_POST['pol'];
  $kolvo = $_POST['count'];
  $biografia = $_POST['biograf'];
  //$awtc=$_POST['AWTC'];
  if (ContainsAttribute("supers", "#") == "") {
    $supres = ($_POST['supers']);
    /* print_r($supres);
    echo "<br>";
    print_r($_POST['supers']);*/
  } else {
    $supres = null;
  }
  $result = new MessageContent();
  $result->email = $email;
  $result->name = $name;
  $result->date = $date;
  $result->pol = $pol;
  $result->biografia = $biografia;
  $result->kolvo = $kolvo;
  $result->supres = $supres;
  return $result;
}
?>