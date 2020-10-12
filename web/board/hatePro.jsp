<%@ page import="com.board.LikeBean" %>
<%@ page import="com.board.BoradDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/15
  Time: 10:31 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  request.setCharacterEncoding("UTF-8");

  String id = (String)session.getAttribute("id");
  int galleryNum = Integer.parseInt(request.getParameter("galleryNum"));

    LikeBean likeBean = new LikeBean();
    likeBean.setId(id);
    likeBean.setGallerynum(galleryNum);
    BoradDAO boradDAO = new BoradDAO();
    int result = boradDAO.deleteLike(likeBean);
    out.print(result);
%>
