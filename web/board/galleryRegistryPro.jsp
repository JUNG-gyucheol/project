<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.board.BoradDAO" %>
<%@ page import="com.board.GalleryBean" %>
<%@ page import="java.net.URLEncoder" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/08
  Time: 12:43 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");

    ServletConfig ctx = getServletConfig();

    String realPath = ctx.getServletContext().getRealPath("/galleryImage");

    int max = 100*1024*1024;
    MultipartRequest multipartRequest = new MultipartRequest(request,realPath,max,"UTF-8",new DefaultFileRenamePolicy());

    String id = multipartRequest.getParameter("galleryId");
    String subject = multipartRequest.getParameter("subject");
    String name = multipartRequest.getFilesystemName("image");

//    name = URLEncoder.encode(name,"UTF-8");
//    name = new String(name.getBytes("8859_1"),"UTF-8");

    BoradDAO boradDAO = new BoradDAO();
    GalleryBean galleryBean = new GalleryBean();

    galleryBean.setId(id);
    galleryBean.setFileName(name);
    galleryBean.setSubject(subject);

    int result = boradDAO.insertGallery(galleryBean);

    out.print(result);
%>
