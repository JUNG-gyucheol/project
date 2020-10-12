<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<%@ page import="com.product.ProductDAO" %>
<%@ page import="com.product.ProductBean" %>
<%@ page import="com.product.ThumbnailBean" %>
<%@ page import="com.product.CartBean" %>
<%@ page import="org.apache.commons.collections4.functors.CatchAndRethrowClosure" %>
<%@ page import="java.nio.channels.SeekableByteChannel" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/11
  Time: 7:34 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String id = (String) session.getAttribute("id");
    List<String> size = Arrays.asList(request.getParameterValues("size[]"));
    List<String> stock = Arrays.asList(request.getParameterValues("stock[]"));
    int num = Integer.parseInt(request.getParameter("num"));
    int result = 0;
    ProductDAO productDAO = new ProductDAO();
    ProductBean productBean = productDAO.getOneproduct(num);
    ThumbnailBean thumbnailBean = productDAO.getOneThumbnail(num);
        if(productBean.getMainCategory().equals("top")) {
            for (int i = 0; i < size.size(); i++) {
                if (size.get(i).equals("SMALL")) {
                    CartBean cartBean = new CartBean();
                    cartBean.setNum(num);
                    cartBean.setId(id);
                    cartBean.setThumbnail(thumbnailBean.getThumbnail());
                    cartBean.setProductname(productBean.getProductName());
                    cartBean.setProductColor(productBean.getProductColor());
                    cartBean.setPrice(Integer.parseInt(productBean.getProductPrice()) * Integer.parseInt(stock.get(i)));
                    cartBean.setSize(size.get(i));
                    cartBean.setStock(Integer.parseInt(stock.get(i)));
                    cartBean.setCategory(productBean.getMainCategory());
                    result = productDAO.insertCart(cartBean);
                } else if (size.get(i).equals("MEDIUM")) {
                    CartBean cartBean = new CartBean();
                    cartBean.setNum(num);
                    cartBean.setId(id);
                    cartBean.setThumbnail(thumbnailBean.getThumbnail());
                    cartBean.setProductname(productBean.getProductName());
                    cartBean.setProductColor(productBean.getProductColor());
                    cartBean.setPrice(Integer.parseInt(productBean.getProductPrice()) * Integer.parseInt(stock.get(i)));
                    cartBean.setSize(size.get(i));
                    cartBean.setStock(Integer.parseInt(stock.get(i)));
                    cartBean.setCategory(productBean.getMainCategory());
                    result = productDAO.insertCart(cartBean);
                } else if (size.get(i).equals("LARGE")) {
                    CartBean cartBean = new CartBean();
                    cartBean.setNum(num);
                    cartBean.setId(id);
                    cartBean.setThumbnail(thumbnailBean.getThumbnail());
                    cartBean.setProductname(productBean.getProductName());
                    cartBean.setProductColor(productBean.getProductColor());
                    cartBean.setPrice(Integer.parseInt(productBean.getProductPrice()) * Integer.parseInt(stock.get(i)));
                    cartBean.setSize(size.get(i));
                    cartBean.setStock(Integer.parseInt(stock.get(i)));
                    cartBean.setCategory(productBean.getMainCategory());
                    result = productDAO.insertCart(cartBean);
                } else if (size.get(i).equals("XLARGE")) {
                    CartBean cartBean = new CartBean();
                    cartBean.setNum(num);
                    cartBean.setId(id);
                    cartBean.setThumbnail(thumbnailBean.getThumbnail());
                    cartBean.setProductname(productBean.getProductName());
                    cartBean.setProductColor(productBean.getProductColor());
                    cartBean.setPrice(Integer.parseInt(productBean.getProductPrice()) * Integer.parseInt(stock.get(i)));
                    cartBean.setSize(size.get(i));
                    cartBean.setStock(Integer.parseInt(stock.get(i)));
                    cartBean.setCategory(productBean.getMainCategory());
                    result = productDAO.insertCart(cartBean);
                }
            }
        } else if(productBean.getMainCategory().equals("bottom")) {
            for (int i = 0; i < size.size(); i++) {
                if (size.get(i).equals("26")) {
                    CartBean cartBean = new CartBean();
                    cartBean.setNum(num);
                    cartBean.setId(id);
                    cartBean.setThumbnail(thumbnailBean.getThumbnail());
                    cartBean.setProductname(productBean.getProductName());
                    cartBean.setProductColor(productBean.getProductColor());
                    cartBean.setPrice(Integer.parseInt(productBean.getProductPrice()) * Integer.parseInt(stock.get(i)));
                    cartBean.setSize(size.get(i));
                    cartBean.setStock(Integer.parseInt(stock.get(i)));
                    cartBean.setCategory(productBean.getMainCategory());
                    result = productDAO.insertCart(cartBean);
                } else if (size.get(i).equals("27")) {
                    CartBean cartBean = new CartBean();
                    cartBean.setNum(num);
                    cartBean.setId(id);
                    cartBean.setThumbnail(thumbnailBean.getThumbnail());
                    cartBean.setProductname(productBean.getProductName());
                    cartBean.setProductColor(productBean.getProductColor());
                    cartBean.setPrice(Integer.parseInt(productBean.getProductPrice()) * Integer.parseInt(stock.get(i)));
                    cartBean.setSize(size.get(i));
                    cartBean.setStock(Integer.parseInt(stock.get(i)));
                    cartBean.setCategory(productBean.getMainCategory());
                    result = productDAO.insertCart(cartBean);
                } else if (size.get(i).equals("28")) {
                    CartBean cartBean = new CartBean();
                    cartBean.setNum(num);
                    cartBean.setId(id);
                    cartBean.setThumbnail(thumbnailBean.getThumbnail());
                    cartBean.setProductname(productBean.getProductName());
                    cartBean.setProductColor(productBean.getProductColor());
                    cartBean.setPrice(Integer.parseInt(productBean.getProductPrice()) * Integer.parseInt(stock.get(i)));
                    cartBean.setSize(size.get(i));
                    cartBean.setStock(Integer.parseInt(stock.get(i)));
                    cartBean.setCategory(productBean.getMainCategory());
                    result = productDAO.insertCart(cartBean);
                } else if (size.get(i).equals("29")) {
                    CartBean cartBean = new CartBean();
                    cartBean.setNum(num);
                    cartBean.setId(id);
                    cartBean.setThumbnail(thumbnailBean.getThumbnail());
                    cartBean.setProductname(productBean.getProductName());
                    cartBean.setProductColor(productBean.getProductColor());
                    cartBean.setPrice(Integer.parseInt(productBean.getProductPrice()) * Integer.parseInt(stock.get(i)));
                    cartBean.setSize(size.get(i));
                    cartBean.setStock(Integer.parseInt(stock.get(i)));
                    cartBean.setCategory(productBean.getMainCategory());
                    result = productDAO.insertCart(cartBean);
                } else if (size.get(i).equals("30")) {
                    CartBean cartBean = new CartBean();
                    cartBean.setNum(num);
                    cartBean.setId(id);
                    cartBean.setThumbnail(thumbnailBean.getThumbnail());
                    cartBean.setProductname(productBean.getProductName());
                    cartBean.setProductColor(productBean.getProductColor());
                    cartBean.setPrice(Integer.parseInt(productBean.getProductPrice()) * Integer.parseInt(stock.get(i)));
                    cartBean.setSize(size.get(i));
                    cartBean.setStock(Integer.parseInt(stock.get(i)));
                    cartBean.setCategory(productBean.getMainCategory());
                    result = productDAO.insertCart(cartBean);
                } else if (size.get(i).equals("31")) {
                    CartBean cartBean = new CartBean();
                    cartBean.setNum(num);
                    cartBean.setId(id);
                    cartBean.setThumbnail(thumbnailBean.getThumbnail());
                    cartBean.setProductname(productBean.getProductName());
                    cartBean.setProductColor(productBean.getProductColor());
                    cartBean.setPrice(Integer.parseInt(productBean.getProductPrice()) * Integer.parseInt(stock.get(i)));
                    cartBean.setSize(size.get(i));
                    cartBean.setStock(Integer.parseInt(stock.get(i)));
                    cartBean.setCategory(productBean.getMainCategory());
                    result = productDAO.insertCart(cartBean);
                } else if (size.get(i).equals("32")) {
                    CartBean cartBean = new CartBean();
                    cartBean.setNum(num);
                    cartBean.setId(id);
                    cartBean.setThumbnail(thumbnailBean.getThumbnail());
                    cartBean.setProductname(productBean.getProductName());
                    cartBean.setProductColor(productBean.getProductColor());
                    cartBean.setPrice(Integer.parseInt(productBean.getProductPrice()) * Integer.parseInt(stock.get(i)));
                    cartBean.setSize(size.get(i));
                    cartBean.setStock(Integer.parseInt(stock.get(i)));
                    cartBean.setCategory(productBean.getMainCategory());
                    result = productDAO.insertCart(cartBean);
                } else if (size.get(i).equals("33")) {
                    CartBean cartBean = new CartBean();
                    cartBean.setNum(num);
                    cartBean.setId(id);
                    cartBean.setThumbnail(thumbnailBean.getThumbnail());
                    cartBean.setProductname(productBean.getProductName());
                    cartBean.setProductColor(productBean.getProductColor());
                    cartBean.setPrice(Integer.parseInt(productBean.getProductPrice()) * Integer.parseInt(stock.get(i)));
                    cartBean.setSize(size.get(i));
                    cartBean.setStock(Integer.parseInt(stock.get(i)));
                    cartBean.setCategory(productBean.getMainCategory());
                    result = productDAO.insertCart(cartBean);
                }
            }
        } else if(productBean.getMainCategory().equals("shoes")) {
            for (int i = 0; i < size.size(); i++) {
                if (size.get(i).equals("220")) {
                    CartBean cartBean = new CartBean();
                    cartBean.setNum(num);
                    cartBean.setId(id);
                    cartBean.setThumbnail(thumbnailBean.getThumbnail());
                    cartBean.setProductname(productBean.getProductName());
                    cartBean.setProductColor(productBean.getProductColor());
                    cartBean.setPrice(Integer.parseInt(productBean.getProductPrice()) * Integer.parseInt(stock.get(i)));
                    cartBean.setSize(size.get(i));
                    cartBean.setStock(Integer.parseInt(stock.get(i)));
                    cartBean.setCategory(productBean.getMainCategory());
                    result = productDAO.insertCart(cartBean);
                } else if (size.get(i).equals("230")) {
                    CartBean cartBean = new CartBean();
                    cartBean.setNum(num);
                    cartBean.setId(id);
                    cartBean.setThumbnail(thumbnailBean.getThumbnail());
                    cartBean.setProductname(productBean.getProductName());
                    cartBean.setProductColor(productBean.getProductColor());
                    cartBean.setPrice(Integer.parseInt(productBean.getProductPrice()) * Integer.parseInt(stock.get(i)));
                    cartBean.setSize(size.get(i));
                    cartBean.setStock(Integer.parseInt(stock.get(i)));
                    cartBean.setCategory(productBean.getMainCategory());
                    result = productDAO.insertCart(cartBean);
                } else if (size.get(i).equals("240")) {
                    CartBean cartBean = new CartBean();
                    cartBean.setNum(num);
                    cartBean.setId(id);
                    cartBean.setThumbnail(thumbnailBean.getThumbnail());
                    cartBean.setProductname(productBean.getProductName());
                    cartBean.setProductColor(productBean.getProductColor());
                    cartBean.setPrice(Integer.parseInt(productBean.getProductPrice()) * Integer.parseInt(stock.get(i)));
                    cartBean.setSize(size.get(i));
                    cartBean.setStock(Integer.parseInt(stock.get(i)));
                    cartBean.setCategory(productBean.getMainCategory());
                    result = productDAO.insertCart(cartBean);
                } else if (size.get(i).equals("250")) {
                    CartBean cartBean = new CartBean();
                    cartBean.setNum(num);
                    cartBean.setId(id);
                    cartBean.setThumbnail(thumbnailBean.getThumbnail());
                    cartBean.setProductname(productBean.getProductName());
                    cartBean.setProductColor(productBean.getProductColor());
                    cartBean.setPrice(Integer.parseInt(productBean.getProductPrice()) * Integer.parseInt(stock.get(i)));
                    cartBean.setSize(size.get(i));
                    cartBean.setStock(Integer.parseInt(stock.get(i)));
                    cartBean.setCategory(productBean.getMainCategory());
                    result = productDAO.insertCart(cartBean);
                } else if (size.get(i).equals("260")) {
                    CartBean cartBean = new CartBean();
                    cartBean.setNum(num);
                    cartBean.setId(id);
                    cartBean.setThumbnail(thumbnailBean.getThumbnail());
                    cartBean.setProductname(productBean.getProductName());
                    cartBean.setProductColor(productBean.getProductColor());
                    cartBean.setPrice(Integer.parseInt(productBean.getProductPrice()) * Integer.parseInt(stock.get(i)));
                    cartBean.setSize(size.get(i));
                    cartBean.setStock(Integer.parseInt(stock.get(i)));
                    cartBean.setCategory(productBean.getMainCategory());
                    result = productDAO.insertCart(cartBean);
                } else if (size.get(i).equals("270")) {
                    CartBean cartBean = new CartBean();
                    cartBean.setNum(num);
                    cartBean.setId(id);
                    cartBean.setThumbnail(thumbnailBean.getThumbnail());
                    cartBean.setProductname(productBean.getProductName());
                    cartBean.setProductColor(productBean.getProductColor());
                    cartBean.setPrice(Integer.parseInt(productBean.getProductPrice()) * Integer.parseInt(stock.get(i)));
                    cartBean.setSize(size.get(i));
                    cartBean.setStock(Integer.parseInt(stock.get(i)));
                    cartBean.setCategory(productBean.getMainCategory());
                    result = productDAO.insertCart(cartBean);
                } else if (size.get(i).equals("280")) {
                    CartBean cartBean = new CartBean();
                    cartBean.setNum(num);
                    cartBean.setId(id);
                    cartBean.setThumbnail(thumbnailBean.getThumbnail());
                    cartBean.setProductname(productBean.getProductName());
                    cartBean.setProductColor(productBean.getProductColor());
                    cartBean.setPrice(Integer.parseInt(productBean.getProductPrice()) * Integer.parseInt(stock.get(i)));
                    cartBean.setSize(size.get(i));
                    cartBean.setStock(Integer.parseInt(stock.get(i)));
                    cartBean.setCategory(productBean.getMainCategory());
                    result = productDAO.insertCart(cartBean);
                } else if (size.get(i).equals("290")) {
                    CartBean cartBean = new CartBean();
                    cartBean.setNum(num);
                    cartBean.setId(id);
                    cartBean.setThumbnail(thumbnailBean.getThumbnail());
                    cartBean.setProductname(productBean.getProductName());
                    cartBean.setProductColor(productBean.getProductColor());
                    cartBean.setPrice(Integer.parseInt(productBean.getProductPrice()) * Integer.parseInt(stock.get(i)));
                    cartBean.setSize(size.get(i));
                    cartBean.setStock(Integer.parseInt(stock.get(i)));
                    cartBean.setCategory(productBean.getMainCategory());
                    result = productDAO.insertCart(cartBean);
                }
            }
        }


    out.print(result);
%>