<%@ page import="com.member.MemberDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.member.MemberBean" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/06/27
  Time: 6:46 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    String id  = request.getParameter("memberId");
    MemberDAO memberDAO = new MemberDAO();
    ArrayList<MemberBean> list = memberDAO.getAllMember(id);

    StringBuffer str = new StringBuffer("");
    str.append("{\"member\":[");
    for(int i = 0; i<list.size(); i++) {
      str.append("{\"num\":\""+list.get(i).getUserNum()+"\",");
      str.append("\"id\":\""+list.get(i).getUserID()+"\",");
      str.append("\"name\":\""+list.get(i).getUserName()+"\",");
      str.append("\"gender\":\""+list.get(i).getGender()+"\",");
      str.append("\"birth\":\""+list.get(i).getBirth()+"\",");
      str.append("\"email\":\""+list.get(i).getUserEmail()+"\",");
      str.append("\"phone\":\""+list.get(i).getPhone()+"\",");
      str.append("\"post\":\""+list.get(i).getPostCode()+"\",");
      str.append("\"address\":\""+list.get(i).getAdress()+"\",");
      str.append("\"date\":\""+list.get(i).getDate()+"\",");
      str.append("\"grade\":\""+list.get(i).getGrade()+"\"},");
    }
    str.append("]}");

    out.print(str);

%>