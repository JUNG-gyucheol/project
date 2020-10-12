function reWrite() {
    var form = $("#form1").serialize();
    $.ajax({
        type:"post",
        url:"boardUpdate.jsp",
        data:form,
        dataType:"text",
        success:function (data, status) {
            var result = data;
            if(data == 1){
                alert("수정완료!");
                location.href='boardList.jsp';
            } else{
                alert("수정실패!");
            }
        },
        error:function () {
            alert("error!");
        }
    });
}