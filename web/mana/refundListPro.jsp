<%@ page import="com.Manager.ManagerDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.Manager.RefundBean" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/13
  Time: 8:31 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  request.setCharacterEncoding("UTF-8");
  String pageNum = request.getParameter("pageNum");
  int pageSize = 10;

  if(pageNum == null){
    pageNum = "1";
  }

  int currentPage = Integer.parseInt(pageNum);


  ManagerDAO managerDAO = new ManagerDAO();
  int startRow = (currentPage - 1) * pageSize ;
  int endRow = pageSize;

  int count = managerDAO.refundCount();

  int pageCount = count/pageSize +(count%pageSize == 0 ? 0 : 1);
  int pageBlock = 10;
  int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
  int endPage = startPage + pageBlock - 1 ;
  if(endPage>pageCount)endPage=pageCount;

  ArrayList<RefundBean> refund = managerDAO.refundBeanArrayList(startRow,endRow);


  request.setAttribute("startPage",startPage);
  request.setAttribute("endPage",endPage);
  request.setAttribute("count",count);
  request.setAttribute("refund", refund);
  RequestDispatcher dis = request.getRequestDispatcher("refundList.jsp");
  dis.forward(request, response);
%>
