<%@ page import="com.board.BoradDAO" %>
<%@ page import="com.board.GalleryBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="javafx.application.Application" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/08
  Time: 2:22 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");


    String pageNum = request.getParameter("pageNum");
    int pageSize = 12;

    if(pageNum == null){
        pageNum = "1";
    }
    BoradDAO boradDAO = new BoradDAO();

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize ;
    int endRow = pageSize;
    String subject  = request.getParameter("subject");
    int count = boradDAO.galleryCount(subject);

    ArrayList<GalleryBean> list = boradDAO.getAllGallery(subject,startRow,endRow);
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
        jsonObject1.put("memberId",list.get(i).getId());
        jsonObject1.put("FileName",list.get(i).getFileName());
        jsonObject1.put("subject",list.get(i).getSubject());
        jsonObject1.put("count", list.get(i).getCount());
        jsonObject1.put("date",list.get(i).getDate().substring(0,16));
        jsonObject1.put("startPage",startPage);
        jsonObject1.put("endPage",endPage);

        jsonArray.add(jsonObject1);
    }
    jsonObject.put("gallery",jsonArray);

    out.print(jsonObject.toJSONString());
%>

