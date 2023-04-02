// JavaScript source code
var res_but = document.getElementById('res_but');
res_but.addEventListener('click', function () {
    var suc = true;
    if (document.getElementById('name').value == null|| 
       String( document.getElementById('name').value )== "") {
        alert('Введите имя!');
        suc = false;
    }
    if (document.getElementById('date').value === null) {
        alert('Выберите дату рожднения!');
        suc = false;
    }
    if(document.getElementById('email').value==null||String(document.getElementById('email').value)==""){
        suc=false;
        alert('Вы не ввели почту');
    }
    if(suc==true){
        document.getElementById('suc_token').value=String("1");
    }
    else{
        document.getElementById('suc_token').value = String("0");
    }
        return suc;
});