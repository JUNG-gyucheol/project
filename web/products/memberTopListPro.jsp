<%@ page import="com.product.ThumbnailBean" %>
<%@ page import="com.product.ProductDAO" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/14
  Time: 10:01 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String pageNum = request.getParameter("pageNum");
    int pageSize = 40;

    if(pageNum == null){
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);


    ProductDAO productDAO = new ProductDAO();
    int startRow = (currentPage - 1) * pageSize ;
    int endRow = pageSize;
    int count =productDAO.topAllListCount();

     ArrayList<ThumbnailBean> top = productDAO.topAllList(startRow, endRow);

    int pageCount = count/pageSize +(count%pageSize == 0 ? 0 : 1);
    int pageBlock = 10;
    int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
    int endPage = startPage + pageBlock - 1 ;
    if(endPage>pageCount)endPage=pageCount;


    request.setAttribute("count",count);
    request.setAttribute("endPage", endPage);
    request.setAttribute("startPage",startPage);
    request.setAttribute("top", top);
    RequestDispatcher dis = request.getRequestDispatcher("memberTopList.jsp");
    dis.forward(request,response);

%>