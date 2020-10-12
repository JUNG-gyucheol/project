<%@ page import="com.product.ProductBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.product.ProductDAO" %>
<%@ page import="com.product.ThumbnailBean" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/02
  Time: 2:12 오후
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


    int startRow = (currentPage - 1) * pageSize ;
    int endRow = pageSize;

    ProductDAO productDAO = new ProductDAO();
    int count = productDAO.thumbCount();

    int pageCount = count/pageSize +(count%pageSize == 0 ? 0 : 1);
    int pageBlock = 10;
    int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
    int endPage = startPage + pageBlock - 1 ;
    if(endPage>pageCount)endPage=pageCount;

    ArrayList<ThumbnailBean> list = productDAO.listThunbnail(startRow,endRow);

    request.setAttribute("startPage",startPage);
    request.setAttribute("endPage",endPage);
    request.setAttribute("count",count);
    request.setAttribute("list", list);
    RequestDispatcher dis = request.getRequestDispatcher("allProductsList.jsp");
    dis.forward(request,response);
%>
