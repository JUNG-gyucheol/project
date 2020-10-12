<%@ page import="java.util.Properties" %>
<%@ page import="com.SMTPAuthenticator" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.*" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/22
  Time: 2:11 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");

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

            StringBuffer stringBuffer = new StringBuffer();
            String num2 = "";
        for (int i=0; i<7; i++){
            int num = (int)(Math.random()*9)+1;
            String num1 = String.valueOf(num);
            num2 += num1;
        }
    try{
        Authenticator auth = new SMTPAuthenticator();
        Session session1 = Session.getInstance(props,auth);

        session1.setDebug(true);
        MimeMessage message = new MimeMessage(session1);
        Address from = new InternetAddress("kcpooh0202@naver.com");
        message.setFrom(from);
        Address to = new InternetAddress(email);
        message.addRecipients(Message.RecipientType.TO , String.valueOf(to));
        message.setSubject("GGYUSTORE 인증번호입니다.");

        message.setContent(num2,"text/html; cahrset=UTF-8");
        Transport.send(message);
        out.print(num2);
    } catch (MessagingException e){
        e.printStackTrace();
    }

%>