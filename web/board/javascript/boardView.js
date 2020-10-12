//댓글등록
function commentRegistry() {
    var comment =$("#comment").val();
    var boardNum = $("#boardNum").val();
    if($.trim(comment) == ""){
        alert("내용을 입력해주세요~~");
        return;
    }
    $.ajax({
        type:"post",
        url:"commentPro.jsp",
        data:{comment:comment,
            boardNum : boardNum},
        dataType:"text",
        success:function (data, status) {
            var result = data;
            if(result == 1){
                alert("댓글등록되었습니다!!성공!!");
                $("#comment").val("").focus();
                $("#commentList").empty();
                commentList();
            } else{
                alert("댓글등록실패!");
            }
        },
        error:function () {
            alert("오류발생ㅠㅠ");
        }
    });
}
//댓글목록 가져오기
function commentList(i) {
    var boardNum = $("#boardNum").val();
    $.ajax({
        type:"post",
        url:"commentListPro.jsp",
        data : {boardNum : boardNum,
            commPage : i},
        dataType: "text",
        success:function (data, status) {
            var result = eval('('+data+')');
            $("#commentList").empty();
            var comm = result.comment;
            for(var i=0; i<comm.length; i++){
                $("#commentList").append(
                    "<div id='commentReWrite"+i+"'><div class='commListWrap'><div class='commList1'>"+comm[i].memberId+"</div><div class='commList2'>"+comm[i].date+"" +
                    "</div><div class='commList3'><button onclick='commentDelete("+i+")'>삭제</button><button onclick='commentReWrite("+i+")'>수정</button><button onclick='commentRe("+i+")'>답글쓰기</button></div></div>"
                    +"<div class='commList4'>"+comm[i].commentContent.replace("\n","<br>")+"</div></div><hr>" +
                    "<input type='hidden' value='"+comm[i].commentNum+"' id='commentNum"+i+"'>"
                    +"<input type='hidden' value='"+comm[i].memberId+"' id='commentId"+i+"'>"
                    +"<textarea id='commentContent"+i+"'  style='display:none;'>"+comm[i].commentContent.replace("\n","<br>")+"</textarea><br>"
                    +"<input id='reSeq"+i+"' type='hidden'value='"+comm[i].re_seq+"'>");
                if(comm[i].re_seq > 0){
                    $("#commentReWrite"+i+"").css('margin-left','30px');
                }
            }
            $("#commentPageBlock").empty();
            for(var i=comm[0].startPage; i<=comm[0].endPage; i++){
                $("#commentPageBlock").append("<a onclick='commentList("+i+")'>["+i+"]</a>" );
            }
        },
        error:function (data) {
            console.debug(data);
            alert("error!!!");
        }
    });
}
//게시글삭제
function boardDelete(){
    var boardNum = $("#boardNum").val();
    var memberId = $("#memberId").val();
    console.log(memberId);
    $.ajax({
        type:"post",
        url:"boardDeletePro.jsp",
        data:{boardNum:boardNum,
            memberId : memberId},
        dataType : "text",
        success:function (data, status) {
            console.log(data);
            var result = data;
            if(result == 1){
                alert("삭제되셨습니다~!");
                location.href='boardList.jsp';
            } else{
                alert("권한이 없습니다.");
            }
        },
        error:function () {
            alert("error!!!");
        }
    });
}
//게시글수정
function reWrite(){
    var boardNum = $("#boardNum").val();
    var memberId = $("#memberId").val();
    $.ajax({
        type:"post",
        url:"boardReWritePro.jsp",
        data:{memberId : memberId},
        dataType : "text",
        success:function (data, status) {
            console.log(data);
            var result = data;
            if(result == 1){
                location.href="boardRewrite.jsp?boardNum="+boardNum+"";
            } else{
                alert("권한이 없습니다.");
            }
        },
        error:function () {
            alert("error!!!");
        }
    });
}
//댓글수정
function commentReWrite(i){
    var commId = $("#commentId"+i+"").val();
    $.ajax({
        type:"post",
        url:"commentUpdateIdCheckPro.jsp",
        data:{commId : commId},
        dataType : "text",
        success:function (data, status) {
            var result = data;
            console.log(data);
            if(result == 1) {
                $("#commentReWrite" + i + "").empty();
                var commContent = $("#commentContent" + i + "").val();
                $("#commentReWrite" + i + "").append("<div>" + $("#commentId" + i + "").val() + "</div>"
                    + "<div class='commRegi2'><textarea cols='30' rows='6' style='resize: none;' id='comment" + i + "'>" + commContent + "</textarea></div>"
                    + "<div class='commRegi1'><button onclick='commentUpdate(" + i + ")'>수정등록</button><button onclick='commentList()'>취소</button></div>");
            } else{
                alert("권한이 없네요~ㅠㅠ");
            }
        },
        error:function () {
            alert("에러가발생했어요~");
        }
    });
}
//댓글수정한것 등록
function commentUpdate(i){
    var commNum =  $("#commentNum"+i+"").val();
    var commContent = $("#comment"+i+"").val();
    if($.trim(commContent) == ""){
        alert('글을 입력해주세요!');
        return;
    }
    $.ajax({
        type:"post",
        url:"commentUpdate.jsp",
        data:{commNum : commNum, commContent:commContent},
        dataType:"text",
        success:function (data,status) {
            var result = data;
            if(result == 1){
                alert("댓글수정완료!");
                $("#commentList").empty();
                commentList();
            } else{
                alert("댓글수정실패!");
            }
        },
        error:function () {
            alert("error!");
        }
    })
}
//댓글삭제
function commentDelete(i){
    var commNum =  $("#commentNum"+i+"").val();
    var reSeq =  $("#reSeq"+i+"").val();
    var commId = $("#commentId"+i+"").val();
    $.ajax({
        type:"post",
        url:"commentDeletePro.jsp",
        data:{commId : commId, reSeq : reSeq,
            commNum : commNum},
        dataType : "text",
        success:function (data, status) {
            var result = data;
            if(result == 1) {
                alert("댓글이 삭제되었습니다.");
                $("#commentList").empty();
                commentList();
            } else{
                alert("권한이 없네요~ㅠㅠ");
            }
        },
        error:function () {
            alert("에러가발생했어요~");
        }
    });
}
//댓글에 답글달기!!!
function commentRe(i){
    $("#commentReWrite"+i+"").append("<div>"+$('#currentId').val()+"</div>"
        +"<div class='commRegi2'><textarea cols='30' rows='6' style='resize: none;' id='comment1'></textarea></div>"
        +"<div class='commRegi1'> <button onclick='commentReRegistry("+i+")'>답글등록</button><button onclick='commentList()'>취소</button></div"
    );
}
function commentReRegistry(i){
    var commNum =  $("#commentNum"+i+"").val();
    var boardNum = $("#boardNum").val();
    var comment1 = $("#comment1").val();
    if($.trim(comment1)==""){
        alert("내용을 입력해주세요.");
        return;
    }
    $.ajax({
        type:"post",
        url:"commentReRegistryPro.jsp",
        data:{commNum : commNum,
            boardNum : boardNum,
            comment1 : comment1},
        dataType:"text",
        success:function (data,status) {
            var result = data;
            if(data == 1 ){
                alert("답글등록완료!");
                $("#commentList").empty();
                commentList();
            } else {
                alert("답글등록실패!");
            }
        },
        error:function () {
            alert("에러발생!");
        }
    });
}
$(function () {
    commentList();
})