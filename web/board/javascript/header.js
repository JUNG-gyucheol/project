
var requestLogout = new XMLHttpRequest();
function logout() {
    requestLogout.open("post", "../Member/memberLogoutPro.jsp",true);
    requestLogout.onreadystatechange = callback;
    requestLogout.setRequestHeader("Context-Type", "application/x-www-form-urlencoded");
    requestLogout.send(null);
}
function callback() {
    if(requestLogout.readyState == 4 && requestLogout.status == 200){
        var result = requestLogout.responseText;
        if(result == 0){
            alert('로그아웃 되셨습니다. bye!!');
            location.href="../index.jsp";
        } else{
            alert("오류발생 ㅠㅠ");
        }
    }
}