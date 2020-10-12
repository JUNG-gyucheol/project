<%@ page import="com.Manager.ManagerDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.product.ProductsShoesBean" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/13
  Time: 10:26 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  request.setCharacterEncoding("UTF-8");
  String shoesName = request.getParameter("shoesName");
  if(shoesName == null){
    shoesName = "";
  }


  String pageNum = request.getParameter("pageNum");
  int pageSize = 10;

  if(pageNum == null){
    pageNum = "1";
  }
  int currentPage = Integer.parseInt(pageNum);
  ManagerDAO managerDAO = new ManagerDAO();
  int startRow = (currentPage - 1) * pageSize ;
  int endRow = pageSize;
  int count = managerDAO.stockShoesCount(shoesName);

  ArrayList<ProductsShoesBean> shoes = managerDAO.productShoes(shoesName, startRow, endRow);

  int pageCount = count/pageSize +(count%pageSize == 0 ? 0 : 1);
  int pageBlock = 10;
  int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
  int endPage = startPage + pageBlock - 1 ;
  if(endPage>pageCount)endPage=pageCount;


  request.setAttribute("count",count);
  request.setAttribute("endPage", endPage);
  request.setAttribute("startPage",startPage);
  request.setAttribute("shoes", shoes);
  RequestDispatcher dis = request.getRequestDispatcher("stockShoesList.jsp");
  dis.forward(request, response);
%>
