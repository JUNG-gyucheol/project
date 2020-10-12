<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.BufferedInputStream" %>
<%@ page import="java.io.BufferedOutputStream" %>
<%@ page import="java.net.URLEncoder" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/20
  Time: 9:46 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String fileName = request.getParameter("filename");
    String fileDir = request.getParameter("filedir");

    //파일명 인코딩
    String UTF8FileName = new String(fileName.getBytes("8859_1"), "UTF-8");

    //실제 파일
    String filePath = getServletConfig().getServletContext() + fileDir + "/" + fileName;

    boolean MSIE = request.getHeader("user-agent").indexOf("MSIE") != -1;
    if(MSIE){
        // 브라우저가 IE일 경우 저장될 파일 이름
        // 공백이 '+'로 인코딩된것을 다시 공백으로 바꿔준다.
        fileName = URLEncoder.encode(UTF8FileName, "UTF8").replaceAll("\\+", " ");
    }else{
        // 브라우저가 IE가 아닐 경우 저장될 파일 이름
        fileName = new String(UTF8FileName.getBytes("UTF-8"), "8859_1");
    }
    try{

        out.clear();
        out = pageContext.pushBody();

        File file = new File(filePath);

        byte b[] = new byte[1024 * 8];

        response.reset();

        //response.setContentType("application/octet-stream");
        response.setHeader("Content-Type", "application/octet-stream;");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");

        FileInputStream fis = new FileInputStream(filePath);
        BufferedInputStream bis = new BufferedInputStream(fis);
        BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());

        int numRead;

        while((numRead = bis.read(b,0,b.length)) != -1){
            bos.write(b,0,numRead);
        }
        bos.flush();
        bos.close();
        bis.close();

    }catch(Exception e){

        e.printStackTrace();

    }



%>