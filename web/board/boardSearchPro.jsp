<%@ page import="com.board.BoradDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.board.BoardBean" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/28
  Time: 5:35 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");

    String pageNum = request.getParameter("pageNum");
    int pageSize = 10;

    if(pageNum == null){
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);

    int startRow = (currentPage - 1) * pageSize ;
    int endRow = pageSize;
    BoradDAO boradDAO = new BoradDAO();
    String subject  = request.getParameter("subject");
    int count = boradDAO.boardCount(subject);

    ArrayList<BoardBean> list = boradDAO.boardSearch(subject,startRow, endRow);


    int pageCount = count/pageSize +(count%pageSize == 0 ? 0 : 1);
    int pageBlock = 10;
    int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
    int endPage = startPage + pageBlock - 1 ;
    if(endPage>pageCount)endPage=pageCount;

    StringBuffer str = new StringBuffer("");
    str.append("{\"board\":[");
    for(int i = 0; i<list.size(); i++) {
        str.append("{\"boardNum\":\""+list.get(i).getBoardNum()+"\",");
        str.append("\"memberId\":\""+list.get(i).getMemberId()+"\",");
        str.append("\"subject\":\""+list.get(i).getSubject().replace("<","&lt;").replace(">","&gt;").replace(" ","&nbsp;")+"\",");
        str.append("\"date\":\""+list.get(i).getDate().substring(0,16)+"\",");
        str.append("\"count\":\""+list.get(i).getCount()+"\",");
        str.append("\"startPage\":\""+startPage+"\",");
        str.append("\"endPage\":\""+endPage+"\"},");
    }
    str.append("]}");

    out.print(str);

%>