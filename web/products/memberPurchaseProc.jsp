<%@ page import="com.product.PurchaseBean" %>
<%@ page import="com.product.ProductDAO" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/11
  Time: 2:52 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String id = (String) session.getAttribute("id");

    int productNum = Integer.parseInt(request.getParameter("productNum"));
    String[] thumbnail= request.getParameterValues("thumbnail");
    String[] purchaseProductColor = request.getParameterValues("purchaseProductColor");
    String[]  purchaseProductName = request.getParameterValues("purchaseProductName");
    String[] purchaseProductPrice = request.getParameterValues("purchaseProductPrice");
    String[] size = request.getParameterValues("size");
    String[] stock = request.getParameterValues("stock");
    String postCode = request.getParameter("postCode");
    String add1 = request.getParameter("adress");
    String add2 = request.getParameter("detailAddress");
    String add3 = request.getParameter("extraAddress");
    String adress = add1+add2+add3;
    String payment = request.getParameter("payment");
    String category = request.getParameter("category");
    int productPrice =Integer.parseInt(request.getParameter("productPrice"));

    int sum = 0;
    request.setAttribute("productPrice",productPrice);
    request.setAttribute("size", size);
    request.setAttribute("stock", stock);
    request.setAttribute("productName", purchaseProductName);
    request.setAttribute("productColor",purchaseProductColor);
    request.setAttribute("thumbnail", thumbnail);
    request.setAttribute("postCode",postCode);
    request.setAttribute("adress", adress);


    ProductDAO productDAO = new ProductDAO();
    for (int i = 0 ; i< size.length; i++) {
        if (category.equals("top")) {
                if (size[i].equals("SMALL")) {
                    PurchaseBean purchaseBean = new PurchaseBean();
                    purchaseBean.setProductNum(productNum);
                    purchaseBean.setThumbnail(thumbnail[i]);
                    purchaseBean.setProductPrice(productPrice);
                    purchaseBean.setPurchaseId(id);
                    purchaseBean.setPurchaseitem(purchaseProductName[i]);
                    purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                    purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                    purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                    purchaseBean.setPurchaseSize(size[i]);
                    purchaseBean.setPurchaseCategory(category);
                    purchaseBean.setPostcode(postCode);
                    purchaseBean.setAddress(adress);
                    purchaseBean.setPayment(payment);
                    int stocks = Integer.parseInt(stock[i]);
                    productDAO.stockUpdateTop1(stocks, productNum);
                    productDAO.insertPurchase(purchaseBean);
                } else if (size[i].equals("MEDIUM")) {
                    PurchaseBean purchaseBean = new PurchaseBean();
                    purchaseBean.setProductNum(productNum);
                    purchaseBean.setThumbnail(thumbnail[i]);
                    purchaseBean.setProductPrice(productPrice);
                    purchaseBean.setPurchaseId(id);
                    purchaseBean.setPurchaseitem(purchaseProductName[i]);
                    purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                    purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                    purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                    purchaseBean.setPurchaseSize(size[i]);
                    purchaseBean.setPurchaseCategory(category);
                    purchaseBean.setPostcode(postCode);
                    purchaseBean.setAddress(adress);
                    purchaseBean.setPayment(payment);
                    int stocks = Integer.parseInt(stock[i]);
                    productDAO.stockUpdateTop2(stocks, productNum);
                    productDAO.insertPurchase(purchaseBean);
                }
                if (size[i].equals("LARGE")) {
                    PurchaseBean purchaseBean = new PurchaseBean();
                    purchaseBean.setProductNum(productNum);
                    purchaseBean.setThumbnail(thumbnail[i]);
                    purchaseBean.setProductPrice(productPrice);
                    purchaseBean.setPurchaseId(id);
                    purchaseBean.setPurchaseitem(purchaseProductName[i]);
                    purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                    purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                    purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                    purchaseBean.setPurchaseSize(size[i]);
                    purchaseBean.setPurchaseCategory(category);
                    purchaseBean.setPostcode(postCode);
                    purchaseBean.setAddress(adress);
                    purchaseBean.setPayment(payment);
                    int stocks = Integer.parseInt(stock[i]);
                    productDAO.stockUpdateTop3(stocks, productNum);
                    productDAO.insertPurchase(purchaseBean);
                } else if (size[i].equals("XLARGE")) {
                    PurchaseBean purchaseBean = new PurchaseBean();
                    purchaseBean.setProductNum(productNum);
                    purchaseBean.setThumbnail(thumbnail[i]);
                    purchaseBean.setProductPrice(productPrice);
                    purchaseBean.setPurchaseId(id);
                    purchaseBean.setPurchaseitem(purchaseProductName[i]);
                    purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                    purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                    purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                    purchaseBean.setPurchaseSize(size[i]);
                    purchaseBean.setPurchaseCategory(category);
                    purchaseBean.setPostcode(postCode);
                    purchaseBean.setAddress(adress);
                    purchaseBean.setPayment(payment);
                    int stocks = Integer.parseInt(stock[i]);
                    productDAO.stockUpdateTop4(stocks, productNum);
                    productDAO.insertPurchase(purchaseBean);
                }

        } else if (category.equals("bottom")) {
                if (size[i].equals("26")) {
                    PurchaseBean purchaseBean = new PurchaseBean();
                    purchaseBean.setProductNum(productNum);
                    purchaseBean.setThumbnail(thumbnail[i]);
                    purchaseBean.setProductPrice(productPrice);
                    purchaseBean.setPurchaseId(id);
                    purchaseBean.setPurchaseitem(purchaseProductName[i]);
                    purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                    purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                    purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                    purchaseBean.setPurchaseSize(size[i]);
                    purchaseBean.setPurchaseCategory(category);
                    purchaseBean.setPostcode(postCode);
                    purchaseBean.setAddress(adress);
                    purchaseBean.setPayment(payment);
                    int stocks = Integer.parseInt(stock[i]);
                    productDAO.stockUpdateBottom1(stocks, productNum);
                    productDAO.insertPurchase(purchaseBean);
                } else if (size[i].equals("27")) {
                    PurchaseBean purchaseBean = new PurchaseBean();
                    purchaseBean.setProductNum(productNum);
                    purchaseBean.setThumbnail(thumbnail[i]);
                    purchaseBean.setProductPrice(productPrice);
                    purchaseBean.setPurchaseId(id);
                    purchaseBean.setPurchaseitem(purchaseProductName[i]);
                    purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                    purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                    purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                    purchaseBean.setPurchaseSize(size[i]);
                    purchaseBean.setPurchaseCategory(category);
                    purchaseBean.setPostcode(postCode);
                    purchaseBean.setAddress(adress);
                    purchaseBean.setPayment(payment);
                    int stocks = Integer.parseInt(stock[i]);
                    productDAO.stockUpdateBottom2(stocks, productNum);
                    productDAO.insertPurchase(purchaseBean);
                } else if (size[i].equals("28")) {
                    PurchaseBean purchaseBean = new PurchaseBean();
                    purchaseBean.setProductNum(productNum);
                    purchaseBean.setThumbnail(thumbnail[i]);
                    purchaseBean.setProductPrice(productPrice);
                    purchaseBean.setPurchaseId(id);
                    purchaseBean.setPurchaseitem(purchaseProductName[i]);
                    purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                    purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                    purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                    purchaseBean.setPurchaseSize(size[i]);
                    purchaseBean.setPurchaseCategory(category);
                    purchaseBean.setPostcode(postCode);
                    purchaseBean.setAddress(adress);
                    purchaseBean.setPayment(payment);
                    int stocks = Integer.parseInt(stock[i]);
                    productDAO.stockUpdateBottom3(stocks, productNum);
                    productDAO.insertPurchase(purchaseBean);
                } else if (size[i].equals("29")) {
                    PurchaseBean purchaseBean = new PurchaseBean();
                    purchaseBean.setProductNum(productNum);
                    purchaseBean.setThumbnail(thumbnail[i]);
                    purchaseBean.setProductPrice(productPrice);
                    purchaseBean.setPurchaseId(id);
                    purchaseBean.setPurchaseitem(purchaseProductName[i]);
                    purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                    purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                    purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                    purchaseBean.setPurchaseSize(size[i]);
                    purchaseBean.setPurchaseCategory(category);
                    purchaseBean.setPostcode(postCode);
                    purchaseBean.setAddress(adress);
                    purchaseBean.setPayment(payment);
                    int stocks = Integer.parseInt(stock[i]);
                    productDAO.stockUpdateBottom4(stocks, productNum);
                    productDAO.insertPurchase(purchaseBean);
                } else if (size[i].equals("30")) {
                    PurchaseBean purchaseBean = new PurchaseBean();
                    purchaseBean.setProductNum(productNum);
                    purchaseBean.setThumbnail(thumbnail[i]);
                    purchaseBean.setProductPrice(productPrice);
                    purchaseBean.setPurchaseId(id);
                    purchaseBean.setPurchaseitem(purchaseProductName[i]);
                    purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                    purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                    purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                    purchaseBean.setPurchaseSize(size[i]);
                    purchaseBean.setPurchaseCategory(category);
                    purchaseBean.setPostcode(postCode);
                    purchaseBean.setAddress(adress);
                    purchaseBean.setPayment(payment);
                    int stocks = Integer.parseInt(stock[i]);
                    productDAO.stockUpdateBottom5(stocks, productNum);
                    productDAO.insertPurchase(purchaseBean);
                } else if (size[i].equals("31")) {
                    PurchaseBean purchaseBean = new PurchaseBean();
                    purchaseBean.setProductNum(productNum);
                    purchaseBean.setThumbnail(thumbnail[i]);
                    purchaseBean.setProductPrice(productPrice);
                    purchaseBean.setPurchaseId(id);
                    purchaseBean.setPurchaseitem(purchaseProductName[i]);
                    purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                    purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                    purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                    purchaseBean.setPurchaseSize(size[i]);
                    purchaseBean.setPurchaseCategory(category);
                    purchaseBean.setPostcode(postCode);
                    purchaseBean.setAddress(adress);
                    purchaseBean.setPayment(payment);
                    int stocks = Integer.parseInt(stock[i]);
                    productDAO.stockUpdateBottom6(stocks, productNum);
                    productDAO.insertPurchase(purchaseBean);
                } else if (size[i].equals("32")) {
                    PurchaseBean purchaseBean = new PurchaseBean();
                    purchaseBean.setProductNum(productNum);
                    purchaseBean.setThumbnail(thumbnail[i]);
                    purchaseBean.setProductPrice(productPrice);
                    purchaseBean.setPurchaseId(id);
                    purchaseBean.setPurchaseitem(purchaseProductName[i]);
                    purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                    purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                    purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                    purchaseBean.setPurchaseSize(size[i]);
                    purchaseBean.setPurchaseCategory(category);
                    purchaseBean.setPostcode(postCode);
                    purchaseBean.setAddress(adress);
                    purchaseBean.setPayment(payment);
                    request.setAttribute("sumPrice", purchaseProductPrice);
                    int stocks = Integer.parseInt(stock[i]);
                    productDAO.stockUpdateBottom7(stocks, productNum);
                    productDAO.insertPurchase(purchaseBean);
                } else if (size[i].equals("33")) {
                    PurchaseBean purchaseBean = new PurchaseBean();
                    purchaseBean.setProductNum(productNum);
                    purchaseBean.setThumbnail(thumbnail[i]);
                    purchaseBean.setProductPrice(productPrice);
                    purchaseBean.setPurchaseId(id);
                    purchaseBean.setPurchaseitem(purchaseProductName[i]);
                    purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                    purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                    purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                    purchaseBean.setPurchaseSize(size[i]);
                    purchaseBean.setPurchaseCategory(category);
                    purchaseBean.setPostcode(postCode);
                    purchaseBean.setAddress(adress);
                    purchaseBean.setPayment(payment);
                    int stocks = Integer.parseInt(stock[i]);
                    productDAO.stockUpdateBottom8(stocks, productNum);
                    productDAO.insertPurchase(purchaseBean);
                }

        } else if (category.equals("shoes")) {
                if (size[i].equals("220")) {
                    PurchaseBean purchaseBean = new PurchaseBean();
                    purchaseBean.setProductNum(productNum);
                    purchaseBean.setThumbnail(thumbnail[i]);
                    purchaseBean.setProductPrice(productPrice);
                    purchaseBean.setPurchaseId(id);
                    purchaseBean.setPurchaseitem(purchaseProductName[i]);
                    purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                    purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                    purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                    purchaseBean.setPurchaseSize(size[i]);
                    purchaseBean.setPurchaseCategory(category);
                    purchaseBean.setPostcode(postCode);
                    purchaseBean.setAddress(adress);
                    purchaseBean.setPayment(payment);
                    int stocks = Integer.parseInt(stock[i]);
                    productDAO.stockUpdateShoes1(stocks, productNum);
                    productDAO.insertPurchase(purchaseBean);
                } else if (size[i].equals("230")) {
                    PurchaseBean purchaseBean = new PurchaseBean();
                    purchaseBean.setProductNum(productNum);
                    purchaseBean.setThumbnail(thumbnail[i]);
                    purchaseBean.setProductPrice(productPrice);
                    purchaseBean.setPurchaseId(id);
                    purchaseBean.setPurchaseitem(purchaseProductName[i]);
                    purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                    purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                    purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                    purchaseBean.setPurchaseSize(size[i]);
                    purchaseBean.setPurchaseCategory(category);
                    purchaseBean.setPostcode(postCode);
                    purchaseBean.setAddress(adress);
                    purchaseBean.setPayment(payment);
                    int stocks = Integer.parseInt(stock[i]);
                    productDAO.stockUpdateShoes2(stocks, productNum);
                    productDAO.insertPurchase(purchaseBean);
                } else if (size[i].equals("240")) {
                    PurchaseBean purchaseBean = new PurchaseBean();
                    purchaseBean.setProductNum(productNum);
                    purchaseBean.setThumbnail(thumbnail[i]);
                    purchaseBean.setProductPrice(productPrice);
                    purchaseBean.setPurchaseId(id);
                    purchaseBean.setPurchaseitem(purchaseProductName[i]);
                    purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                    purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                    purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                    purchaseBean.setPurchaseSize(size[i]);
                    purchaseBean.setPurchaseCategory(category);
                    purchaseBean.setPostcode(postCode);
                    purchaseBean.setAddress(adress);
                    purchaseBean.setPayment(payment);
                    int stocks = Integer.parseInt(stock[i]);
                    productDAO.stockUpdateShoes3(stocks, productNum);
                    productDAO.insertPurchase(purchaseBean);
                } else if (size[i].equals("250")) {
                    PurchaseBean purchaseBean = new PurchaseBean();
                    purchaseBean.setProductNum(productNum);
                    purchaseBean.setThumbnail(thumbnail[i]);
                    purchaseBean.setProductPrice(productPrice);
                    purchaseBean.setPurchaseId(id);
                    purchaseBean.setPurchaseitem(purchaseProductName[i]);
                    purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                    purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                    purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                    purchaseBean.setPurchaseSize(size[i]);
                    purchaseBean.setPurchaseCategory(category);
                    purchaseBean.setPostcode(postCode);
                    purchaseBean.setAddress(adress);
                    purchaseBean.setPayment(payment);
                    int stocks = Integer.parseInt(stock[i]);
                    productDAO.stockUpdateShoes4(stocks, productNum);
                    productDAO.insertPurchase(purchaseBean);
                } else if (size[i].equals("260")) {
                    PurchaseBean purchaseBean = new PurchaseBean();
                    purchaseBean.setProductNum(productNum);
                    purchaseBean.setThumbnail(thumbnail[i]);
                    purchaseBean.setProductPrice(productPrice);
                    purchaseBean.setPurchaseId(id);
                    purchaseBean.setPurchaseitem(purchaseProductName[i]);
                    purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                    purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                    purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                    purchaseBean.setPurchaseSize(size[i]);
                    purchaseBean.setPurchaseCategory(category);
                    purchaseBean.setPostcode(postCode);
                    purchaseBean.setAddress(adress);
                    purchaseBean.setPayment(payment);
                    int stocks = Integer.parseInt(stock[i]);
                    productDAO.stockUpdateShoes5(stocks, productNum);
                    productDAO.insertPurchase(purchaseBean);
                } else if (size[i].equals("270")) {
                    PurchaseBean purchaseBean = new PurchaseBean();
                    purchaseBean.setProductNum(productNum);
                    purchaseBean.setThumbnail(thumbnail[i]);
                    purchaseBean.setProductPrice(productPrice);
                    purchaseBean.setPurchaseId(id);
                    purchaseBean.setPurchaseitem(purchaseProductName[i]);
                    purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                    purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                    purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                    purchaseBean.setPurchaseSize(size[i]);
                    purchaseBean.setPurchaseCategory(category);
                    purchaseBean.setPostcode(postCode);
                    purchaseBean.setAddress(adress);
                    purchaseBean.setPayment(payment);
                    int stocks = Integer.parseInt(stock[i]);
                    productDAO.stockUpdateShoes6(stocks, productNum);
                    productDAO.insertPurchase(purchaseBean);
                } else if (size[i].equals("280")) {
                    PurchaseBean purchaseBean = new PurchaseBean();
                    purchaseBean.setProductNum(productNum);
                    purchaseBean.setThumbnail(thumbnail[i]);
                    purchaseBean.setProductPrice(productPrice);
                    purchaseBean.setPurchaseId(id);
                    purchaseBean.setPurchaseitem(purchaseProductName[i]);
                    purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                    purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                    purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                    purchaseBean.setPurchaseSize(size[i]);
                    purchaseBean.setPurchaseCategory(category);
                    purchaseBean.setPostcode(postCode);
                    purchaseBean.setAddress(adress);
                    purchaseBean.setPayment(payment);
                    int stocks = Integer.parseInt(stock[i]);
                    productDAO.stockUpdateShoes7(stocks, productNum);
                    productDAO.insertPurchase(purchaseBean);
                } else if (size[i].equals("290")) {
                    PurchaseBean purchaseBean = new PurchaseBean();
                    purchaseBean.setProductNum(productNum);
                    purchaseBean.setThumbnail(thumbnail[i]);
                    purchaseBean.setProductPrice(productPrice);
                    purchaseBean.setPurchaseId(id);
                    purchaseBean.setPurchaseitem(purchaseProductName[i]);
                    purchaseBean.setPurchasePrice(Integer.parseInt(purchaseProductPrice[i]));
                    purchaseBean.setPurchaseStock(Integer.parseInt(stock[i]));
                    purchaseBean.setPurchaseColor(purchaseProductColor[i]);
                    purchaseBean.setPurchaseSize(size[i]);
                    purchaseBean.setPurchaseCategory(category);
                    purchaseBean.setPostcode(postCode);
                    purchaseBean.setAddress(adress);
                    purchaseBean.setPayment(payment);
                    int stocks = Integer.parseInt(stock[i]);
                    productDAO.stockUpdateShoes8(stocks, productNum);
                    productDAO.insertPurchase(purchaseBean);
                }

        }
        sum += Integer.parseInt(purchaseProductPrice[i]);
    }
    request.setAttribute("sumPrice", sum);
    RequestDispatcher dis = request.getRequestDispatcher("memberPurchaseEnd.jsp");
    dis.forward(request,response);



%>