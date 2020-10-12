<%@ page import="java.util.ArrayList" %>
<%@ page import="com.board.ContactBean" %>
<%@ page import="com.board.BoradDAO" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.JSONArray" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/07
  Time: 4:08 오후
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
    BoradDAO boradDAO = new BoradDAO();

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize ;
    int endRow = pageSize;
    String subject  = request.getParameter("subject");
    int count = boradDAO.mailListCount(subject);

    ArrayList<ContactBean> list = boradDAO.getContact(subject,startRow,endRow);
    int pageCount = count/pageSize +(count%pageSize == 0 ? 0 : 1);
    int pageBlock = 10;
    int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
    int endPage = startPage + pageBlock - 1 ;
    if(endPage>pageCount)endPage=pageCount;

    JSONObject jsonObject = new JSONObject();
    JSONArray jsonArray = new JSONArray();
    for(int i=0; i<list.size(); i++){
        JSONObject jsonObject1 = new JSONObject();
        jsonObject1.put("num",list.get(i).getNum());
        jsonObject1.put("memberId",list.get(i).getMemberId());
        jsonObject1.put("subject",list.get(i).getSubject());
        jsonObject1.put("content",list.get(i).getContent());
        jsonObject1.put("email", list.get(i).getEmail());
        jsonObject1.put("date",list.get(i).getDate().substring(0,16));
        jsonObject1.put("startPage",startPage);
        jsonObject1.put("endPage",endPage);

        jsonArray.add(jsonObject1);
    }
    jsonObject.put("contact",jsonArray);

    out.print(jsonObject.toJSONString());
%>
