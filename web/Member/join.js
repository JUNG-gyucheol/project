
function Check() {

    var userID = $("#userID").val();
    var id_Check = $("#id_Check").val();
    var userPW1 = $("#userPW1").val();
    var userPW2 = $("#userPW2").val();
    var userName = $("#userName").val();
    var gender = $('input[name=gender]');
    var brth = $("#testDatepicker").val();
    var userEmail = $("#userEamil").val();
    var p1 = $("#phone1").val();
    var p2 = $("#phone2").val();
    var p3 = $("#phone3").val();
    var postCode = $("#sample6_postcode").val();
    var adress = $("#sample6_address").val();
    var detailAddress = $("#sample6_detailAddress").val();
    var extraAddress = $("#sample6_extraAddress").val();

    //정규표현식
    //이름
    var reg1 = /^[가-힣]{2,5}$/;
    //아이디
    var reg2 = /(?=.*[a-zA-Z])(?=.*[0-9]).{4,12}$/i;
    //비밀번호
    var reg3 = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{6,20}$/;
    //이메일
    var reg4 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
    //휴대폰번호
    var reg5 = /^\d{3,3}$/;
    var reg6 = /^\d{3,4}$/;
    var reg7 = /^\d{3,4}$/;
    //생년월일
    var reg8 =/[^a-z][^A-Z][^~!@#$%^&*()+][^ㄱ-ㅎ][^가-힣]$/;
    //우편번호
    var reg9=/^[가-힣a-zA-Z0-9~!@#$%^&*()_+-]{4,40}$/;
    var reg10=/^[가-힣a-zA-Z0-9]$/;

    var result2 = reg2.test(userID);
    if(userID == '') {
        alert("아이디를 입력해주세요.")
        return false;
    } else if (result2 != true) {
        alert("아이디를 정확하게 입력해주세요.");
        return false;
    }
    if(id_Check == 'fal'){
        alert("아이디 중복체크해주세요.");
        return false;
    }

    var result3 = reg3.test(userPW1);
    if(userPW1 == '') {
        alert("비밀번호 입력해주세요.")
        return false;
    } else if (result3 != true) {
        alert("비밀번호를 정확하게 입력해주세요.");
        return false;
    }
    if(userPW1 != userPW2){
        alert('비밀번호가 동일하지않습니다.');
        return false;
    }

    var result1 = reg1.test(userName);
    if(userName == '') {
        alert("이름을 입력해주세요.");
        return false;
    } else if (result1 != true) {
        alert("이름을 정확하게 입력해주세요(2~5글자)");
        return false;
    }


    if(gender[0].checked == false && gender[1].checked == false){
        alert("성별을 선택해주세요.");
        return false;
    }

    var result8 = reg8.test(brth);
    console.log(brth);
    if(brth == '') {
        alert("생년월일을 선택해주세요.")
        return false;
    } else if (result8 != true) {
        alert("생년월일을 정확하게 입력해주세요");
        return false;
    }
    var result4 = reg4.test(userEmail);
    if(userEmail == '') {
        alert("이메일을 입력해주세요.")
        return false;
    } else if (result4 != true) {
        alert("이메일을 정확하게 입력해주세요.");
        return false;
    }

    var result5 = reg5.test(p1);
    if(p1 == '') {
        alert("휴대폰번호를 입력해주세요.")
        return false;
    } else if (result5 != true) {
        alert("휴대폰번호를 정확하게 입력해주세요.");
        return false;
    }
    var result6 = reg6.test(p2);
    if(p2 == '') {
        alert("휴대폰번호를 입력해주세요.")
        return false;
    } else if (result6 != true) {
        alert("휴대폰번호를 정확하게 입력해주세요.");
        return false;
    }
    var result7 = reg7.test(p3);
    if(p3 == '') {
        alert("휴대폰번호를 입력해주세요.")
        return false;
    } else if (result7 != true) {
        alert("휴대폰번호를 정확하게 입력해주세요.");
        return false;
    }

    if(postCode == ''){
        alert('우편번호를 선택해주세요.');
        return false;
    }
    if(adress == ''){
        alert('주소를 선택해주세요.');
        return false;
    }
    var result9 = reg9.test(detailAddress);
    if(detailAddress == '') {
        alert("상세주소를 입력해주세요.")
        return false;
    } else if (result9 != true) {
        alert("상세주소를 정확하게 입력해주세요.");
        return false;
    }
    var result10 = reg10.test(extraAddress);
    if(result9 != true) {
        alert("특수문자를 사용 할 수 없습니다.");
        return false;
    }
    var form = $("#form1").serialize();
    $.ajax({
        type: "post",
        url:"memberJoinPro.jsp",
        data : form,
        success:function (data, status) {
            var result = data;
            if(result == 1){
                alert("회원가입 성공하셨습니다!!!");
                location.href='../index.jsp';
            } else{
                alert('회원가입을 실패하셨습니다.');
            }
        }
    });


    return false;
}
$(function () {

    $("#testDatepicker").datepicker({
        changeMonth: true,
        changeYear: true,
        showMonthAfterYear : true,
        dateFormat : "yy-mm-dd",
        yearRange: "-100:+0",
        showButtonPanel: true

    });
});

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;

            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
function idCheck1() {
    var userid = $("#userID").val();
    var reg = /(?=.*[a-zA-Z])(?=.*[0-9]).{4,12}$/i;
    var result1 = reg.test(userid);
    if(userid == '') {
        alert("아이디를 입력해주세요.")
        return false;
    } else if (result1 != true) {
        alert("아이디를 정확하게 입력해주세요.");
        return false;
    }
    $.ajax({
        type:"post",
        url:"idCheckPro.jsp",
        data:{userid : userid},
        dataType:"text",
        success:function (data, status) {
            var result = data;
            if(result == 1){
                alert('중복된 아이디입니다.');
            } else{
                alert('사용가능한 아이디입니다.');
                $('#id_Check').val("suc");
            }
        },
        error:function (data,status) {
            alert('오류입니다.')
        }
    });
}
function reId() {
    $("#id_Check").val('fal');
}
