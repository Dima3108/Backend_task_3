<?php
require_once 'Library.php';
define("TIME_COOK",365*24*60*60);
function get_begin_time($stime=TIME_COOK){
   return time()+$stime;
}
function get_end_time(){
    return 1;
}
function enable_cookie($cname,$cvalue,$ctime=TIME_COOK){
    setcookie($cname,$cvalue,get_begin_time($ctime));
}
function disable_cookie($cname,$cvalue=''){
    setcookie($cname,$cvalue,get_end_time());
}
?>