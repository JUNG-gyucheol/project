<%@ page import="com.product.ProductDAO" %>
<%@ page import="com.product.PurchaseBean" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/12
  Time: 1:21 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    int num = Integer.parseInt(request.getParameter("num"));
    int productNum = Integer.parseInt(request.getParameter("productNum"));
    String size = request.getParameter("size");
    int stock = Integer.parseInt(request.getParameter("stock"));
    String cate = request.getParameter("cate");
    ProductDAO productDAO = new ProductDAO();

    PurchaseBean purchaseBean = productDAO.getOnePurchase(num);
    productDAO.insertRefund(purchaseBean);
    int result = 0;
    if(cate.equals("top")){
        if(size.equals("SMALL")){
            productDAO.stockRefundTop1(stock,productNum);
            result = productDAO.refundOrder(num);
        } else if(size.equals("MEDIUM")) {
            productDAO.stockRefundTop2(stock, productNum);
            result = productDAO.refundOrder(num);
        } else if(size.equals("LARGE")) {
            productDAO.stockRefundTop3(stock, productNum);
            result = productDAO.refundOrder(num);
        } else if(size.equals("XLARGE")) {
            productDAO.stockRefundTop4(stock, productNum);

            result = productDAO.refundOrder(num);
        }
    } else if(cate.equals("bottom")){
        if(size.equals("26")){
            productDAO.stockRefundBottom1(stock,productNum);
            result = productDAO.refundOrder(num);
        } else if(size.equals("27")) {
            productDAO.stockRefundBottom2(stock, productNum);
            result = productDAO.refundOrder(num);
        } else if(size.equals("28")) {
            productDAO.stockRefundBottom3(stock, productNum);
            result = productDAO.refundOrder(num);
        } else if(size.equals("29")) {
            productDAO.stockRefundBottom4(stock, productNum);
            result = productDAO.refundOrder(num);
        }  else if(size.equals("30")) {
            productDAO.stockRefundBottom5(stock, productNum);
            result = productDAO.refundOrder(num);
        }  else if(size.equals("31")) {
            productDAO.stockRefundBottom6(stock, productNum);
            result = productDAO.refundOrder(num);
        }  else if(size.equals("32")) {
            productDAO.stockRefundBottom7(stock, productNum);
            result = productDAO.refundOrder(num);
        }  else if(size.equals("33")) {
            productDAO.stockRefundBottom8(stock, productNum);
            result = productDAO.refundOrder(num);
        }
    } else if(cate.equals("shoes")){
        if(size.equals("220")){
            productDAO.stockRefundShoes1(stock,productNum);
            result = productDAO.refundOrder(num);
        } else if(size.equals("230")) {
            productDAO.stockRefundShoes2(stock, productNum);
            result = productDAO.refundOrder(num);
        } else if(size.equals("240")) {
            productDAO.stockRefundShoes3(stock, productNum);
            result = productDAO.refundOrder(num);
        } else if(size.equals("250")) {
            productDAO.stockRefundShoes4(stock, productNum);
            result = productDAO.refundOrder(num);
        }  else if(size.equals("260")) {
            productDAO.stockRefundShoes5(stock, productNum);
            result = productDAO.refundOrder(num);
        }  else if(size.equals("270")) {
            productDAO.stockRefundShoes6(stock, productNum);
            result = productDAO.refundOrder(num);
        }  else if(size.equals("280")) {
            productDAO.stockRefundShoes7(stock, productNum);
            result = productDAO.refundOrder(num);
        }  else if(size.equals("290")) {
            productDAO.stockRefundShoes8(stock, productNum);
            result = productDAO.refundOrder(num);
        }
    }

    out.print(result);
%>
