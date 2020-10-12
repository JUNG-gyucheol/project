function login() {
    var userID = $("#userID").val();
    var userPW = $("#userPW").val();
    //아이디
    var reg1 = /(?=.*[a-zA-Z])(?=.*[0-9]).{4,12}$/i;
    //비밀번호
    var reg2 = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{6,20}$/;

    var result1 = reg1.test(userID);
    if(userID == '') {
        // alert("아이디를 입력해주세요.");
        swal("아이디를 입력해주세요!!");
        return false;
    } else if (result1 != true) {
        // alert("아이디를 정확하게 입력해주세요.");
        swal("아이디를 정확하게 입력해주세요.");
        return false;
    }
    var result2 = reg2.test(userPW);
    if(userPW == '') {
        // alert("비밀번호 입력해주세요.")
        swal("비밀번호 입력해주세요.");
        return false;
    } else if (result2 != true) {
        // alert("비밀번호를 정확하게 입력해주세요.");
        swal("비밀번호를 정확하게 입력해주세요.");
        return false;
    }
    var form = $("#form1").serialize();
    $.ajax({
        type:"post",
        url:"memberLoginPro.jsp",
        data : form,
        success:function (data, status) {
            var result = data;
            if(result == 1){
                alert('로그인 성공~!🤩');
                location.href='../index.jsp';
            }else if(result == 2){
                alert('비밀번호가 틀림😡!');
            } else{
                alert('로그인 실패ㅠㅠ😭');
            }
        },
        error:function () {
            alert("오류발생😱!");
        }
    });
}

$(function () {
    $('#findPassword').on('click', function () {
        window.open("findPassword.jsp",'_blank','width=600px height=400px top=100px left=500px');
    });
})
