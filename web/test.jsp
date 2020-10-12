<%@ page import="org.jsoup.Connection" %>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.select.Elements" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="sun.java2d.cmm.ProfileDeferralInfo" %>
<%@ page import="com.product.ProductDAO" %>
<%@ page import="com.product.ProductBean" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/05
  Time: 2:45 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    Connection.Response res = Jsoup.connect("http://localhost:8080/products/productViewPro.jsp?productNum=1")
            .method(Connection.Method.GET)
            .execute();
    Document googleDocument = res.parse();
    Element btnK = googleDocument.select("img").get(0);
//    Elements btnK1 = googleDocument.select(".link_boxthumb");
//    Elements btnK2 = googleDocument.select(".link_g");

    String imgUrl = btnK.getElementsByAttribute("src").attr("src");
    out.print(imgUrl);
%>