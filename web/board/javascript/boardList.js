function idCheck() {
    $.ajax({
        type:"post",
        url:"idCheck.jsp",
        data:"text",
        success:function (data , status) {
            var result = data;
            if(result == 1){
                location.href='boardWrite.jsp';
            } else {
                alert("권한이 없습니다🤬!");
            }
        },
        error:function () {
            alert('에러발생!!');
        }
    });
}
function boardSearch(i) {
    var subject = $("#boardSearch").val();
    // if($.trim(subject) == ""){
    //     alert('제목을 입력해주세요!!');
    //     return;
    // }
    $.ajax({
        type: "post",
        url:"boardSearchPro.jsp",
        data:{subject : subject,
            pageNum : i },
        dataType:"text",
        success:function (data, status) {
            var result = eval('('+data+')');
            var board = result.board;
            $("#numList").empty();
            $("#pageBlock").empty();
            if(board.length != 0) {
                for (var i = 0; i < board.length; i++) {
                    $("#numList").append(
                        "<div class='subList1'><div class='num' id='num'>" + board[i].boardNum + "</div>"
                        + "<div class='subject'><a href='boardView.jsp?boardNum=" + board[i].boardNum + "&commentPage=null'>" + board[i].subject + "</a></div>"
                        + "<div class='id'>" + board[i].memberId + "</div>"
                        + "<div class='date'>" + board[i].date + "</div>"
                        + "<div class='count'>" + board[i].count + "</div></div>");
                }
                for (var i = board[0].startPage; i <= board[0].endPage; i++) {
                    $("#pageBlock").append("<a onclick='boardSearch(" + i + ")'>" + "[" + i + "]" + "</a>");
                }
            } else{
                $("#numList").append("<div class='subList2'> NO LIST😱!!!</div>");
            }
        },
        error:function () {
            alert('에러발생!');
        }
    });
}
function allList(){
    if($("#boardSearch").val() == ""){
        boardSearch();
    }
}

$(function () {
    boardSearch();
})