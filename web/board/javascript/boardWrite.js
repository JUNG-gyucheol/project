function boardRegistry() {
    var subject = $("#subject").val();
    var content = $("#content").val();

    if($.trim(subject) == ""){
        alert('제목을 입력해주세요~');
        return;
    } else if($.trim(content) == ""){
        alert('내용을 입력해주세요~');
        return;
    }

    var form = $("#form1").serialize();
    $.ajax({
        type:"post",
        url:"boardWritePro.jsp",
        data: form,
        dataType : "text",
        success:function (data, status) {
            var result = data;
            if(result == 1 ){
                alert('문의글이 등록되었습니다!');
                location.href='boardList.jsp';
            } else{
                alert('등록이 되지 않았습니다.');
            }
        },
        error:function () {
            alert('에러발생!');
        }
    });
}