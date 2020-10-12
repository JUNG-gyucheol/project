<%@ page import="com.product.*" %>
<%@ page import="javax.print.attribute.standard.RequestingUserName" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/04
  Time: 12:22 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int productNum = Integer.parseInt(request.getParameter("productNum"));
    String brand = request.getParameter("brand");
    String productName = request.getParameter("productName");
    String productPrice = request.getParameter("productPrice");
    String productContent = request.getParameter("productContent");
    String mainCategory = request.getParameter("maincategory");
    ProductBean productBean = new ProductBean();
    ProductDAO productDAO = new ProductDAO();
    productBean.setBrand(brand);
    productBean.setProductName(productName);
    productBean.setProductPrice(productPrice);
    productBean.setProductContent(productContent);
    productBean.setMainCategory(mainCategory);
    int result1 = productDAO.productUpdate(productNum,productBean);
    String color = request.getParameter("productColor");
    if(result1 == 1) {
        if (mainCategory.equals("top")) {
            ProductSizeBean productSizeBean = new ProductSizeBean();
            int XLarge = Integer.parseInt(request.getParameter("XLarge"));
            int Large = Integer.parseInt(request.getParameter("Large"));
            int Medium = Integer.parseInt(request.getParameter("Medium"));
            int Small = Integer.parseInt(request.getParameter("Small"));
            productSizeBean.setXLarge(XLarge);
            productSizeBean.setLarge(Large);
            productSizeBean.setMedium(Medium);
            productSizeBean.setSmall(Small);
            productSizeBean.setProductName(productName);
            productSizeBean.setColor(color);
            result1 = productDAO.updateTop(productSizeBean,productNum);
            out.println(result1);
        } else if (mainCategory.equals("bottom")) {
            ProductsBottomSizeBean bottomSizeBean = new ProductsBottomSizeBean();
            int size26 = Integer.parseInt(request.getParameter("size26"));
            int size27 = Integer.parseInt(request.getParameter("size27"));
            int size28 = Integer.parseInt(request.getParameter("size28"));
            int size29 = Integer.parseInt(request.getParameter("size29"));
            int size30 = Integer.parseInt(request.getParameter("size30"));
            int size31 = Integer.parseInt(request.getParameter("size31"));
            int size32 = Integer.parseInt(request.getParameter("size32"));
            int size33 = Integer.parseInt(request.getParameter("size33"));
            bottomSizeBean.setSize26(size26);
            bottomSizeBean.setSize27(size27);
            bottomSizeBean.setSize28(size28);
            bottomSizeBean.setSize29(size29);
            bottomSizeBean.setSize30(size30);
            bottomSizeBean.setSize31(size31);
            bottomSizeBean.setSize32(size32);
            bottomSizeBean.setSize33(size33);
            bottomSizeBean.setProductName(productName);
            bottomSizeBean.setColor(color);
            result1 = productDAO.updateBottom(bottomSizeBean,productNum);
            out.println(result1);
        } else if (mainCategory.equals("shoes")) {
            ProductsShoesBean shoesBean = new ProductsShoesBean();
            int size220 = Integer.parseInt(request.getParameter("size220"));
            int size230 = Integer.parseInt(request.getParameter("size230"));
            int size240 = Integer.parseInt(request.getParameter("size240"));
            int size250 = Integer.parseInt(request.getParameter("size250"));
            int size260 = Integer.parseInt(request.getParameter("size260"));
            int size270 = Integer.parseInt(request.getParameter("size270"));
            int size280 = Integer.parseInt(request.getParameter("size280"));
            int size290 = Integer.parseInt(request.getParameter("size290"));
            shoesBean.setSize220(size220);
            shoesBean.setSize230(size230);
            shoesBean.setSize240(size240);
            shoesBean.setSize250(size250);
            shoesBean.setSize260(size260);
            shoesBean.setSize270(size270);
            shoesBean.setSize280(size280);
            shoesBean.setSize290(size290);
            shoesBean.setProductName(productName);
            shoesBean.setColor(color);
            result1 = productDAO.updateShoes(shoesBean,productNum);
            out.println(result1);
        }
    } else {
        out.println(0);
    }
%>
