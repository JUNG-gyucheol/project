<%@ page import="com.product.ProductDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.product.ThumbnailBean" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/19
  Time: 2:23 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    request.setCharacterEncoding("UTF-8");

    String search = request.getParameter("search");
    String pageNum = request.getParameter("pageNum");
    int pageSize = 40;

    if(pageNum == null){
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);

    int startRow = (currentPage - 1) * pageSize ;
    int endRow = pageSize;

    ProductDAO productDAO = new ProductDAO();
    int count = productDAO.searchCount(search);

    int pageCount = count/pageSize +(count%pageSize == 0 ? 0 : 1);
    int pageBlock = 10;
    int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
    int endPage = startPage + pageBlock - 1 ;
    if(endPage>pageCount)endPage=pageCount;

    ArrayList<ThumbnailBean> list = productDAO.searchProducts(search,startRow,endRow);

    request.setAttribute("startPage",startPage);
    request.setAttribute("endPage",endPage);
    request.setAttribute("count",count);
    request.setAttribute("list", list);
    RequestDispatcher dis = request.getRequestDispatcher("searchProductsList.jsp");
    dis.forward(request,response);



%>
