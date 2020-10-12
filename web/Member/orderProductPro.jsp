<%@ page import="com.product.ProductDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.product.PurchaseBean" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.security.interfaces.RSAKey" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/12
  Time: 12:47 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String id = (String)session.getAttribute("id");

    String pageNum = request.getParameter("pageNum");
    int pageSize = 10;

    if(pageNum == null){
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);


    int startRow = (currentPage - 1) * pageSize ;
    int endRow = pageSize;

    ProductDAO productDAO = new ProductDAO();
    ArrayList<PurchaseBean> list = productDAO.purchaseList(id,startRow,endRow);
    int count = productDAO.orderCount(id);


       int pageCount = count/pageSize +(count%pageSize == 0 ? 0 : 1);
       int pageBlock = 10;
       int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
       int endPage = startPage + pageBlock - 1 ;
        if(endPage>pageCount)endPage=pageCount;

    request.setAttribute("startPage",startPage);
    request.setAttribute("endPage",endPage);
    request.setAttribute("count",count);
    request.setAttribute("list", list);
    RequestDispatcher dis = request.getRequestDispatcher("orderProduct.jsp");
    dis.forward(request, response);



%>