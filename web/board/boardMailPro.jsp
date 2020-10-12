<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.*" %>
<%@ page import="com.SMTPAuthenticator" %>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/07
  Time: 9:47 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String host = "smtp.naver.com";

    Properties props = new Properties();
    props.put("mail.smtp.host", host);
    props.put("mail.smtp.port", "465");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.ssl.enable", "true");
    props.put("mail.smtp.ssl.trust", host);
    props.put("mail.smtp.debug", "true");
    props.put("mail.smtp.socketFactory.port", "465");
    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    props.put("mail.smtp.socketFactory.fallback", "false");


    try{
       Authenticator auth = new SMTPAuthenticator();
        Session session1 = Session.getInstance(props,null);

        session1.setDebug(true);
         MimeMessage message = new MimeMessage(session1);
         Address formadd = new InternetAddress("kcpooh0202@naver.com");
        message.setFrom(formadd);
        Address toadd = new InternetAddress("kcpooh0202@naver.com");
        message.addRecipients(Message.RecipientType.TO , String.valueOf(toadd));
        message.setSubject("gyucheol TEST SMPT");
        message.setText("succes!!!!");
        Transport.send(message);
        out.print("Success message");
    } catch (MessagingException e){
        e.printStackTrace();
    }


%>
