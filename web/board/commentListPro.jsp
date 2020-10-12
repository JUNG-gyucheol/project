<%@ page import="com.board.BoradDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.board.CommentBean" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/30
  Time: 2:31 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    int boardNum = Integer.parseInt(request.getParameter("boardNum"));
    String commPage = request.getParameter("commPage");
    int commSize = 10;

    if(commPage == null){
        commPage = "1";
    }
    int currentPage = Integer.parseInt(commPage);

    int startRow = (currentPage -1) * commSize;
    int endRow = commSize;

    BoradDAO boradDAO = new BoradDAO();
    ArrayList<CommentBean> list = boradDAO.getAllComment(boardNum, startRow,endRow);
    int count = boradDAO.commentCount(boardNum);

    int pageCount = count/commSize + (count%commSize == 0 ? 0 : 1);
    int pageBlock = 10;
    int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
    int endPage = startPage + pageBlock -1;
    if(endPage>pageCount)endPage=pageCount;

    StringBuffer str = new StringBuffer("");
    str.append("{\"comment\":[");
    for(int i = 0; i<list.size(); i++) {
        str.append("{\"boardNum\":\""+list.get(i).getBoardNum()+"\",");
        str.append("\"memberId\":\""+list.get(i).getMemberId()+"\",");
        str.append("\"commentContent\":\""+list.get(i).getCommentContent().replace("<","&lt;").replace(">","&gt;").replace(" ","&nbsp;").replace("\n","\\n")+"\",");
        str.append("\"commentNum\":\""+list.get(i).getCommentNum()+"\",");
        str.append("\"re_lev\":\""+list.get(i).getRe_lev()+"\",");
        str.append("\"re_seq\":\""+list.get(i).getRe_seq()+"\",");
        str.append("\"date\":\""+list.get(i).getDate().substring(0,16)+"\",");
        str.append("\"startPage\":\""+startPage+"\",");
        str.append("\"endPage\":\""+endPage+"\"},");
    }
    str.append("]}");

    out.print(str);
%>
