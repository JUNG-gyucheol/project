<%@ page import="java.lang.ref.ReferenceQueue" %>
<%@ page import="com.member.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/09
  Time: 4:22 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  request.setCharacterEncoding("UTF-8");

  int num = Integer.parseInt(request.getParameter("userNum"));
  String pass = request.getParameter("userPW");
  String name = request.getParameter("userName");
  String birth = request.getParameter("birth");
  String email = request.getParameter("userEmail");
  String ph1 = request.getParameter("p1");
  String ph2 = request.getParameter("p2");
  String ph3 = request.getParameter("p3");
  String phone = ph1+"-"+ph2+"-"+ph3;
  String postCode = request.getParameter("postCode");
  String address = request.getParameter("adress");
  String address1 = request.getParameter("detailAddress");
  String address2 = request.getParameter("extraAddress");
  String addre = address+" "+address1+" "+address2;


  MemberDAO memberDAO = new MemberDAO();
  int result = memberDAO.memberUpdate(num,pass,name,birth,email,phone,postCode,addre);

  out.print(result);
%>
