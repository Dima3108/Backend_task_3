var name_=document.getElementById('name');
name_.addEventListener('change',function(){
sessionStorage.setItem('name',name_.value);
});
var email_=document.getElementById('email');
email_.addEventListener('change',function(){
sessionStorage.setItem('email',email_.value);
});
var comment_=document.getElementById('commit');
comment_.addEventListener('change',function(){
sessionStorage.setItem('commit',comment_.value);
});

document.addEventListener('DOMContentLoaded',function(){
if(sessionStorage.getItem('name')!=null){
 
  document.getElementById('name').value=sessionStorage.getItem('name');
}
if(sessionStorage.getItem('email')!=null){
    document.getElementById('email').value = sessionStorage.getItem('email');
}
if(sessionStorage.getItem('commit')!=null){
    document.getElementById('commit').value=sessionStorage.getItem('commit');
}
});