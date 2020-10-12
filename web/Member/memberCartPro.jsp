<%@ page import="com.product.ProductDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.product.CartBean" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="com.board.BoradDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/12
  Time: 1:49 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String pageNum = request.getParameter("pageNum");
    String id = (String) session.getAttribute("id");
    int pageSize = 10;
    ProductDAO productDAO = new ProductDAO();
    int count = productDAO.cartCount(id);

    if(pageNum == null){
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);

    int startRow = (currentPage - 1) * pageSize ;
    int endRow = pageSize;
    ArrayList<CartBean> list = productDAO.cartList(id,startRow,endRow);

    int pageCount = count/pageSize +(count%pageSize == 0 ? 0 : 1);
    int pageBlock = 10;
    int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
    int endPage = startPage + pageBlock - 1 ;
    if(endPage>pageCount)endPage=pageCount;

    JSONObject jsonObject1 = new JSONObject();
    JSONArray jsonArray = new JSONArray();

    for(int i = 0; i < list.size(); i++){
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("productNum",list.get(i).getNum());
        jsonObject.put("num",list.get(i).getNum1());
        jsonObject.put("id",list.get(i).getId());
        jsonObject.put("thumbnail",list.get(i).getThumbnail());
        jsonObject.put("productName",list.get(i).getProductname());
        jsonObject.put("productColor",list.get(i).getProductColor());
        jsonObject.put("productPrice",list.get(i).getPrice());
        jsonObject.put("productSize",list.get(i).getSize());
        jsonObject.put("productStock",list.get(i).getStock());
        jsonObject.put("productCategory",list.get(i).getCategory());
        jsonObject.put("productDate",list.get(i).getDate());
        jsonObject.put("startPage",startPage);
        jsonObject.put("endPage",endPage);

        jsonArray.add(jsonObject);
    }
    jsonObject1.put("cart",jsonArray);
    out.print(jsonObject1.toJSONString());
%>
