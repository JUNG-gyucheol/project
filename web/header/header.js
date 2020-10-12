
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
$(function () {
    $("#headerSearch").on("click", function () {
        if ($("#headerSearch").css("display") == "block") {
            $("#headerSearch").css("display", "none");
            $("#search1").css("display", "block");
        }
    });
    $('.svar').on('click',function () {
        if($("#headerSearch").css("display") == "none"){
            $("#headerSearch").css("display", "block");
            $("#search1").css("display", "none");
        }
    });
    $("#enter").keyup(function (e) {
        console.log(e.keyCode);
        var search = $(this).val();
        if (e.keyCode == 13) {
            location.href = '../products/searchProductPro.jsp?search=' + search;
        }
    });
    $(window).scroll(function () {
        var height = $(document).scrollTop(); //실시간으로 스크롤의 높이를 측정
        if (height > 195) {
            $('.main2').addClass('fixinner');
        } else if (height <= 195) {
            $('.main2').removeClass('fixinner');
        }
    });
});