<%@ page import="java.util.Arrays" %>
<%@ page import="com.product.PurchaseBean" %>
<%@ page import="com.product.ProductDAO" %>
<%@ page import="com.product.ProductBean" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/12
  Time: 4:27 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String id = (String) session.getAttribute("id");
    String[] countNum = request.getParameterValues("countNum");
    String[] productNum = request.getParameterValues("productNum");
    String[] thumbnail= request.getParameterValues("thumbnail");
    String[] purchaseProductColor = request.getParameterValues("purchaseProductColor");
    String[]  purchaseProductName = request.getParameterValues("purchaseProductName");
    String[] purchaseProductPrice = request.getParameterValues("purchaseProductPrice");
    String[] size = request.getParameterValues("size");
    String[] stock = request.getParameterValues("stock");
    String[] category = request.getParameterValues("category");
    String postCode = request.getParameter("postCode");
    String add1 = request.getParameter("adress");
    String add2 = request.getParameter("detailAddress");
    String add3 = request.getParameter("extraAddress");
    String adress = add1+add2+add3;
    String payment = request.getParameter("payment");
    ProductDAO productDAO = new ProductDAO();
    request.setAttribute("size",size);
    request.setAttribute("stock",stock);
    request.setAttribute("productName", purchaseProductName);
    request.setAttribute("productColor",purchaseProductColor);
    request.setAttribute("thumbnail", thumbnail);
    request.setAttribute("postCode",postCode);
    request.setAttribute("adress", adress);
    int sum = 0;
    int[] productPrice = new int[size.length];
    for(int i=0; i < size.length; i++){
        ProductBean productBean = productDAO.getOneproduct(Integer.parseInt(productNum[i]));
        productPrice[i] = Integer.parseInt(productBean.getProductPrice());
    }
    request.setAttribute("productPrice",productPrice);
    for(int i = 0; i<category.length ; i++) {
        if (category[i].equals("top")) {
            if (size[i].equals("SMALL")) {
                ProductBean productBean = productDAO.getOneproduct(Integer.parseInt(productNum[i]));
                PurchaseBean purchaseBean = new PurchaseBean();
                purchaseBean.setProductNum(Integer.parseInt(productNum[i]));
                purchaseBean.setThumbnail(thumbnail[i]);
                purchaseBean.setProductPrice(Integer.parseInt(productBean.getProductPrice()));
                purchaseBean.setPurchaseId(id);
                purchaseBean.setPurchaseitem(purchaseProductName[i]);
                purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                purchaseBean.setPurchaseSize(size[i]);
                purchaseBean.setPurchaseCategory(category[i]);
                purchaseBean.setPostcode(postCode);
                purchaseBean.setAddress(adress);
                purchaseBean.setPayment(payment);
                int stocks = Integer.parseInt(stock[i]);
                productDAO.stockUpdateTop1(stocks, Integer.parseInt(productNum[i]));
                productDAO.insertPurchase(purchaseBean);
//                productDAO.cartDelete(Integer.parseInt(countNum[i]));
            } else if (size[i].equals("MEDIUM")) {
                ProductBean productBean = productDAO.getOneproduct(Integer.parseInt(productNum[i]));
                PurchaseBean purchaseBean = new PurchaseBean();
                purchaseBean.setProductNum(Integer.parseInt(productNum[i]));
                purchaseBean.setThumbnail(thumbnail[i]);
                purchaseBean.setProductPrice(Integer.parseInt(productBean.getProductPrice()));
                purchaseBean.setPurchaseId(id);
                purchaseBean.setPurchaseitem(purchaseProductName[i]);
                purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                purchaseBean.setPurchaseSize(size[i]);
                purchaseBean.setPurchaseCategory(category[i]);
                purchaseBean.setPostcode(postCode);
                purchaseBean.setAddress(adress);
                purchaseBean.setPayment(payment);
                int stocks = Integer.parseInt(stock[i]);
                productDAO.stockUpdateTop2(stocks, Integer.parseInt(productNum[i]));
                productDAO.insertPurchase(purchaseBean);
//                productDAO.cartDelete(Integer.parseInt(countNum[i]));
            }
            if (size[i].equals("LARGE")) {
                ProductBean productBean = productDAO.getOneproduct(Integer.parseInt(productNum[i]));
                PurchaseBean purchaseBean = new PurchaseBean();
                purchaseBean.setProductNum(Integer.parseInt(productNum[i]));
                purchaseBean.setThumbnail(thumbnail[i]);
                purchaseBean.setProductPrice(Integer.parseInt(productBean.getProductPrice()));
                purchaseBean.setPurchaseId(id);
                purchaseBean.setPurchaseitem(purchaseProductName[i]);
                purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                purchaseBean.setPurchaseSize(size[i]);
                purchaseBean.setPurchaseCategory(category[i]);
                purchaseBean.setPostcode(postCode);
                purchaseBean.setAddress(adress);
                purchaseBean.setPayment(payment);
                int stocks = Integer.parseInt(stock[i]);
                productDAO.stockUpdateTop3(stocks, Integer.parseInt(productNum[i]));
                productDAO.insertPurchase(purchaseBean);
//                productDAO.cartDelete(Integer.parseInt(countNum[i]));
            } else if (size[i].equals("XLARGE")) {
                ProductBean productBean = productDAO.getOneproduct(Integer.parseInt(productNum[i]));
                PurchaseBean purchaseBean = new PurchaseBean();
                purchaseBean.setProductNum(Integer.parseInt(productNum[i]));
                purchaseBean.setThumbnail(thumbnail[i]);
                purchaseBean.setProductPrice(Integer.parseInt(productBean.getProductPrice()));
                purchaseBean.setPurchaseId(id);
                purchaseBean.setPurchaseitem(purchaseProductName[i]);
                purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                purchaseBean.setPurchaseSize(size[i]);
                purchaseBean.setPurchaseCategory(category[i]);
                purchaseBean.setPostcode(postCode);
                purchaseBean.setAddress(adress);
                purchaseBean.setPayment(payment);
                int stocks = Integer.parseInt(stock[i]);
                productDAO.stockUpdateTop4(stocks, Integer.parseInt(productNum[i]));
                productDAO.insertPurchase(purchaseBean);
//                productDAO.cartDelete(Integer.parseInt(countNum[i]));
            }
        } else if (category[i].equals("bottom")) {
            if (size[i].equals("26")) {
                ProductBean productBean = productDAO.getOneproduct(Integer.parseInt(productNum[i]));
                PurchaseBean purchaseBean = new PurchaseBean();
                purchaseBean.setProductNum(Integer.parseInt(productNum[i]));
                purchaseBean.setThumbnail(thumbnail[i]);
                purchaseBean.setProductPrice(Integer.parseInt(productBean.getProductPrice()));
                purchaseBean.setPurchaseId(id);
                purchaseBean.setPurchaseitem(purchaseProductName[i]);
                purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                purchaseBean.setPurchaseSize(size[i]);
                purchaseBean.setPurchaseCategory(category[i]);
                purchaseBean.setPostcode(postCode);
                purchaseBean.setAddress(adress);
                purchaseBean.setPayment(payment);
                int stocks = Integer.parseInt(stock[i]);
                productDAO.stockUpdateBottom1(stocks, Integer.parseInt(productNum[i]));
                productDAO.insertPurchase(purchaseBean);
//                productDAO.cartDelete(Integer.parseInt(countNum[i]));
            } else if (size[i].equals("27")) {
                ProductBean productBean = productDAO.getOneproduct(Integer.parseInt(productNum[i]));
                PurchaseBean purchaseBean = new PurchaseBean();
                purchaseBean.setProductNum(Integer.parseInt(productNum[i]));
                purchaseBean.setThumbnail(thumbnail[i]);
                purchaseBean.setProductPrice(Integer.parseInt(productBean.getProductPrice()));
                purchaseBean.setPurchaseId(id);
                purchaseBean.setPurchaseitem(purchaseProductName[i]);
                purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                purchaseBean.setPurchaseSize(size[i]);
                purchaseBean.setPurchaseCategory(category[i]);
                purchaseBean.setPostcode(postCode);
                purchaseBean.setAddress(adress);
                purchaseBean.setPayment(payment);
                int stocks = Integer.parseInt(stock[i]);
                productDAO.stockUpdateBottom2(stocks, Integer.parseInt(productNum[i]));
                productDAO.insertPurchase(purchaseBean);
//                productDAO.cartDelete(Integer.parseInt(countNum[i]));
            } else if (size[i].equals("28")) {
                ProductBean productBean = productDAO.getOneproduct(Integer.parseInt(productNum[i]));
                PurchaseBean purchaseBean = new PurchaseBean();
                purchaseBean.setProductNum(Integer.parseInt(productNum[i]));
                purchaseBean.setThumbnail(thumbnail[i]);
                purchaseBean.setProductPrice(Integer.parseInt(productBean.getProductPrice()));
                purchaseBean.setPurchaseId(id);
                purchaseBean.setPurchaseitem(purchaseProductName[i]);
                purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                purchaseBean.setPurchaseSize(size[i]);
                purchaseBean.setPurchaseCategory(category[i]);
                purchaseBean.setPostcode(postCode);
                purchaseBean.setAddress(adress);
                purchaseBean.setPayment(payment);
                int stocks = Integer.parseInt(stock[i]);
                productDAO.stockUpdateBottom3(stocks, Integer.parseInt(productNum[i]));
                productDAO.insertPurchase(purchaseBean);
//                productDAO.cartDelete(Integer.parseInt(countNum[i]));
            } else if (size[i].equals("29")) {
                ProductBean productBean = productDAO.getOneproduct(Integer.parseInt(productNum[i]));
                PurchaseBean purchaseBean = new PurchaseBean();
                purchaseBean.setProductNum(Integer.parseInt(productNum[i]));
                purchaseBean.setThumbnail(thumbnail[i]);
                purchaseBean.setProductPrice(Integer.parseInt(productBean.getProductPrice()));
                purchaseBean.setPurchaseId(id);
                purchaseBean.setPurchaseitem(purchaseProductName[i]);
                purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                purchaseBean.setPurchaseSize(size[i]);
                purchaseBean.setPurchaseCategory(category[i]);
                purchaseBean.setPostcode(postCode);
                purchaseBean.setAddress(adress);
                purchaseBean.setPayment(payment);
                int stocks = Integer.parseInt(stock[i]);
                productDAO.stockUpdateBottom4(stocks, Integer.parseInt(productNum[i]));
                productDAO.insertPurchase(purchaseBean);
//                productDAO.cartDelete(Integer.parseInt(countNum[i]));
            } else if (size[i].equals("30")) {
                ProductBean productBean = productDAO.getOneproduct(Integer.parseInt(productNum[i]));
                PurchaseBean purchaseBean = new PurchaseBean();
                purchaseBean.setProductNum(Integer.parseInt(productNum[i]));
                purchaseBean.setThumbnail(thumbnail[i]);
                purchaseBean.setProductPrice(Integer.parseInt(productBean.getProductPrice()));
                purchaseBean.setPurchaseId(id);
                purchaseBean.setPurchaseitem(purchaseProductName[i]);
                purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                purchaseBean.setPurchaseSize(size[i]);
                purchaseBean.setPurchaseCategory(category[i]);
                purchaseBean.setPostcode(postCode);
                purchaseBean.setAddress(adress);
                purchaseBean.setPayment(payment);
                int stocks = Integer.parseInt(stock[i]);
                productDAO.stockUpdateBottom5(stocks, Integer.parseInt(productNum[i]));
                productDAO.insertPurchase(purchaseBean);
//                productDAO.cartDelete(Integer.parseInt(countNum[i]));
            } else if (size[i].equals("31")) {
                ProductBean productBean = productDAO.getOneproduct(Integer.parseInt(productNum[i]));
                PurchaseBean purchaseBean = new PurchaseBean();
                purchaseBean.setProductNum(Integer.parseInt(productNum[i]));
                purchaseBean.setThumbnail(thumbnail[i]);
                purchaseBean.setProductPrice(Integer.parseInt(productBean.getProductPrice()));
                purchaseBean.setPurchaseId(id);
                purchaseBean.setPurchaseitem(purchaseProductName[i]);
                purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                purchaseBean.setPurchaseSize(size[i]);
                purchaseBean.setPurchaseCategory(category[i]);
                purchaseBean.setPostcode(postCode);
                purchaseBean.setAddress(adress);
                purchaseBean.setPayment(payment);
                int stocks = Integer.parseInt(stock[i]);
                productDAO.stockUpdateBottom6(stocks, Integer.parseInt(productNum[i]));
                productDAO.insertPurchase(purchaseBean);
//                productDAO.cartDelete(Integer.parseInt(countNum[i]));
            } else if (size[i].equals("32")) {
                ProductBean productBean = productDAO.getOneproduct(Integer.parseInt(productNum[i]));
                PurchaseBean purchaseBean = new PurchaseBean();
                purchaseBean.setProductNum(Integer.parseInt(productNum[i]));
                purchaseBean.setThumbnail(thumbnail[i]);
                purchaseBean.setProductPrice(Integer.parseInt(productBean.getProductPrice()));
                purchaseBean.setPurchaseId(id);
                purchaseBean.setPurchaseitem(purchaseProductName[i]);
                purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                purchaseBean.setPurchaseSize(size[i]);
                purchaseBean.setPurchaseCategory(category[i]);
                purchaseBean.setPostcode(postCode);
                purchaseBean.setAddress(adress);
                purchaseBean.setPayment(payment);
                int stocks = Integer.parseInt(stock[i]);
                productDAO.stockUpdateBottom7(stocks, Integer.parseInt(productNum[i]));
                productDAO.insertPurchase(purchaseBean);
//                productDAO.cartDelete(Integer.parseInt(countNum[i]));
            } else if (size[i].equals("33")) {
                ProductBean productBean = productDAO.getOneproduct(Integer.parseInt(productNum[i]));
                PurchaseBean purchaseBean = new PurchaseBean();
                purchaseBean.setProductNum(Integer.parseInt(productNum[i]));
                purchaseBean.setThumbnail(thumbnail[i]);
                purchaseBean.setProductPrice(Integer.parseInt(productBean.getProductPrice()));
                purchaseBean.setPurchaseId(id);
                purchaseBean.setPurchaseitem(purchaseProductName[i]);
                purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                purchaseBean.setPurchaseSize(size[i]);
                purchaseBean.setPurchaseCategory(category[i]);
                purchaseBean.setPostcode(postCode);
                purchaseBean.setAddress(adress);
                purchaseBean.setPayment(payment);
                int stocks = Integer.parseInt(stock[i]);
                productDAO.stockUpdateBottom8(stocks, Integer.parseInt(productNum[i]));
                productDAO.insertPurchase(purchaseBean);
//                productDAO.cartDelete(Integer.parseInt(countNum[i]));
            }
        } else if (category[i].equals("shoes")) {
            if (size[i].equals("220")) {
                ProductBean productBean = productDAO.getOneproduct(Integer.parseInt(productNum[i]));
                PurchaseBean purchaseBean = new PurchaseBean();
                purchaseBean.setProductNum(Integer.parseInt(productNum[i]));
                purchaseBean.setThumbnail(thumbnail[i]);
                purchaseBean.setProductPrice(Integer.parseInt(productBean.getProductPrice()));
                purchaseBean.setPurchaseId(id);
                purchaseBean.setPurchaseitem(purchaseProductName[i]);
                purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                purchaseBean.setPurchaseSize(size[i]);
                purchaseBean.setPurchaseCategory(category[i]);
                purchaseBean.setPostcode(postCode);
                purchaseBean.setAddress(adress);
                purchaseBean.setPayment(payment);
                int stocks = Integer.parseInt(stock[i]);
                productDAO.stockUpdateShoes1(stocks, Integer.parseInt(productNum[i]));
                productDAO.insertPurchase(purchaseBean);
//                productDAO.cartDelete(Integer.parseInt(countNum[i]));
            } else if (size[i].equals("230")) {
                ProductBean productBean = productDAO.getOneproduct(Integer.parseInt(productNum[i]));
                PurchaseBean purchaseBean = new PurchaseBean();
                purchaseBean.setProductNum(Integer.parseInt(productNum[i]));
                purchaseBean.setThumbnail(thumbnail[i]);
                purchaseBean.setProductPrice(Integer.parseInt(productBean.getProductPrice()));
                purchaseBean.setPurchaseId(id);
                purchaseBean.setPurchaseitem(purchaseProductName[i]);
                purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                purchaseBean.setPurchaseSize(size[i]);
                purchaseBean.setPurchaseCategory(category[i]);
                purchaseBean.setPostcode(postCode);
                purchaseBean.setAddress(adress);
                purchaseBean.setPayment(payment);
                int stocks = Integer.parseInt(stock[i]);
                productDAO.stockUpdateShoes2(stocks, Integer.parseInt(productNum[i]));
                productDAO.insertPurchase(purchaseBean);
//                productDAO.cartDelete(Integer.parseInt(countNum[i]));
            } else if (size[i].equals("240")) {
                ProductBean productBean = productDAO.getOneproduct(Integer.parseInt(productNum[i]));
                PurchaseBean purchaseBean = new PurchaseBean();
                purchaseBean.setProductNum(Integer.parseInt(productNum[i]));
                purchaseBean.setThumbnail(thumbnail[i]);
                purchaseBean.setProductPrice(Integer.parseInt(productBean.getProductPrice()));
                purchaseBean.setPurchaseId(id);
                purchaseBean.setPurchaseitem(purchaseProductName[i]);
                purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                purchaseBean.setPurchaseSize(size[i]);
                purchaseBean.setPurchaseCategory(category[i]);
                purchaseBean.setPostcode(postCode);
                purchaseBean.setAddress(adress);
                purchaseBean.setPayment(payment);
                int stocks = Integer.parseInt(stock[i]);
                productDAO.stockUpdateShoes3(stocks, Integer.parseInt(productNum[i]));
                productDAO.insertPurchase(purchaseBean);
//                productDAO.cartDelete(Integer.parseInt(countNum[i]));
            } else if (size[i].equals("250")) {
                ProductBean productBean = productDAO.getOneproduct(Integer.parseInt(productNum[i]));
                PurchaseBean purchaseBean = new PurchaseBean();
                purchaseBean.setProductNum(Integer.parseInt(productNum[i]));
                purchaseBean.setThumbnail(thumbnail[i]);
                purchaseBean.setProductPrice(Integer.parseInt(productBean.getProductPrice()));
                purchaseBean.setPurchaseId(id);
                purchaseBean.setPurchaseitem(purchaseProductName[i]);
                purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                purchaseBean.setPurchaseSize(size[i]);
                purchaseBean.setPurchaseCategory(category[i]);
                purchaseBean.setPostcode(postCode);
                purchaseBean.setAddress(adress);
                purchaseBean.setPayment(payment);
                int stocks = Integer.parseInt(stock[i]);
                productDAO.stockUpdateShoes4(stocks, Integer.parseInt(productNum[i]));
                productDAO.insertPurchase(purchaseBean);
//                productDAO.cartDelete(Integer.parseInt(countNum[i]));
            } else if (size[i].equals("260")) {
                ProductBean productBean = productDAO.getOneproduct(Integer.parseInt(productNum[i]));
                PurchaseBean purchaseBean = new PurchaseBean();
                purchaseBean.setProductNum(Integer.parseInt(productNum[i]));
                purchaseBean.setThumbnail(thumbnail[i]);
                purchaseBean.setProductPrice(Integer.parseInt(productBean.getProductPrice()));
                purchaseBean.setPurchaseId(id);
                purchaseBean.setPurchaseitem(purchaseProductName[i]);
                purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                purchaseBean.setPurchaseSize(size[i]);
                purchaseBean.setPurchaseCategory(category[i]);
                purchaseBean.setPostcode(postCode);
                purchaseBean.setAddress(adress);
                purchaseBean.setPayment(payment);
                int stocks = Integer.parseInt(stock[i]);
                productDAO.stockUpdateShoes5(stocks, Integer.parseInt(productNum[i]));
                productDAO.insertPurchase(purchaseBean);
//                productDAO.cartDelete(Integer.parseInt(countNum[i]));
            } else if (size[i].equals("270")) {
                ProductBean productBean = productDAO.getOneproduct(Integer.parseInt(productNum[i]));
                PurchaseBean purchaseBean = new PurchaseBean();
                purchaseBean.setProductNum(Integer.parseInt(productNum[i]));
                purchaseBean.setThumbnail(thumbnail[i]);
                purchaseBean.setProductPrice(Integer.parseInt(productBean.getProductPrice()));
                purchaseBean.setPurchaseId(id);
                purchaseBean.setPurchaseitem(purchaseProductName[i]);
                purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                purchaseBean.setPurchaseSize(size[i]);
                purchaseBean.setPurchaseCategory(category[i]);
                purchaseBean.setPostcode(postCode);
                purchaseBean.setAddress(adress);
                purchaseBean.setPayment(payment);
                int stocks = Integer.parseInt(stock[i]);
                productDAO.stockUpdateShoes6(stocks, Integer.parseInt(productNum[i]));
                productDAO.insertPurchase(purchaseBean);
//                productDAO.cartDelete(Integer.parseInt(countNum[i]));
            } else if (size[i].equals("280")) {
                ProductBean productBean = productDAO.getOneproduct(Integer.parseInt(productNum[i]));
                PurchaseBean purchaseBean = new PurchaseBean();
                purchaseBean.setProductNum(Integer.parseInt(productNum[i]));
                purchaseBean.setThumbnail(thumbnail[i]);
                purchaseBean.setProductPrice(Integer.parseInt(productBean.getProductPrice()));
                purchaseBean.setPurchaseId(id);
                purchaseBean.setPurchaseitem(purchaseProductName[i]);
                purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                purchaseBean.setPurchaseSize(size[i]);
                purchaseBean.setPurchaseCategory(category[i]);
                purchaseBean.setPostcode(postCode);
                purchaseBean.setAddress(adress);
                purchaseBean.setPayment(payment);
                int stocks = Integer.parseInt(stock[i]);
                productDAO.stockUpdateShoes7(stocks, Integer.parseInt(productNum[i]));
                productDAO.insertPurchase(purchaseBean);
//                productDAO.cartDelete(Integer.parseInt(countNum[i]));
            } else if (size[i].equals("290")) {
                ProductBean productBean = productDAO.getOneproduct(Integer.parseInt(productNum[i]));
                PurchaseBean purchaseBean = new PurchaseBean();
                purchaseBean.setProductNum(Integer.parseInt(productNum[i]));
                purchaseBean.setThumbnail(thumbnail[i]);
                purchaseBean.setProductPrice(Integer.parseInt(productBean.getProductPrice()));
                purchaseBean.setPurchaseId(id);
                purchaseBean.setPurchaseitem(purchaseProductName[i]);
                purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                purchaseBean.setPurchaseSize(size[i]);
                purchaseBean.setPurchaseCategory(category[i]);
                purchaseBean.setPostcode(postCode);
                purchaseBean.setAddress(adress);
                purchaseBean.setPayment(payment);
                int stocks = Integer.parseInt(stock[i]);
                productDAO.stockUpdateShoes8(stocks, Integer.parseInt(productNum[i]));
                productDAO.insertPurchase(purchaseBean);
//                productDAO.cartDelete(Integer.parseInt(countNum[i]));
            }
        }

        productDAO.cartDelete(Integer.parseInt(countNum[i]));
        sum += Integer.parseInt(purchaseProductPrice[i]);
    }
    request.setAttribute("sumPrice", sum);
    RequestDispatcher dis = request.getRequestDispatcher("cartPurchaseEnd.jsp");
        dis.forward(request,response);



%>