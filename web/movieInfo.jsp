<%@ page import="org.jsoup.Connection" %>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.select.Elements" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="com.movie.Movie" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.Manager.ManagerDAO" %>
<%@ page import="com.Manager.TopTenBean" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/05
  Time: 4:26 오후
  To change this template use File | Settings | File Templates.
--%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");

    ManagerDAO managerDAO = new ManagerDAO();
    ArrayList<TopTenBean> topTen = managerDAO.topTenList();

    request.setAttribute("topTen", topTen);
    RequestDispatcher dis = request.getRequestDispatcher("main.jsp");
    dis.forward(request,response);
%>