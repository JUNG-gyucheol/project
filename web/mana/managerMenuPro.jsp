<%@ page import="com.Manager.ManagerDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.Manager.TopTenBean" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/13
  Time: 5:38 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    ManagerDAO managerDAO = new ManagerDAO();
    int today = managerDAO.todaySales();
    int gross = managerDAO.grossSales();
    ArrayList<TopTenBean> topTen = managerDAO.topTenList();

    request.setAttribute("today", today);
    request.setAttribute("gross", gross);
    request.setAttribute("topTen", topTen);
    RequestDispatcher dis = request.getRequestDispatcher("managerMenu.jsp");
    dis.forward(request, response);
%>
