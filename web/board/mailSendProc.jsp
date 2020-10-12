<%@ page import="java.util.Properties" %>
<%@ page import="com.SMTPAuthenticator" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.*" %>
<%@ page import="com.board.BoradDAO" %>
<%@ page import="com.board.ContactSendBean" %>
<%@ page import="javax.mail.internet.MimeMultipart" %>
<%@ page import="javax.mail.internet.MimeBodyPart" %><%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/07/07
  Time: 11:26 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    int num = Integer.parseInt(request.getParameter("num"));
    String id = request.getParameter("id");
    String adminEmail = request.getParameter("adminEmail");
    String email = request.getParameter("email");
    String subject = request.getParameter("subject");
    String content = request.getParameter("p_content");

    ContactSendBean contactSendBean = new ContactSendBean();
    contactSendBean.setNum(num);
    contactSendBean.setEmail(email);
    contactSendBean.setId(id);
    contactSendBean.setSubject(subject);
    contactSendBean.setContent(content);

    BoradDAO boradDAO = new BoradDAO();
    int result = boradDAO.insertContactSend(contactSendBean);


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
        Session session1 = Session.getInstance(props,auth);

        session1.setDebug(true);
        MimeMessage message = new MimeMessage(session1);
        Address from = new InternetAddress(adminEmail);
        message.setFrom(from);
        Address to = new InternetAddress(email);
        message.addRecipients(Message.RecipientType.TO , String.valueOf(to));
        message.setSubject(subject);

        message.setContent(content,"text/html;cahrset=UTF-8");
        Transport.send(message);
        out.print(result);
    } catch (MessagingException e){
        e.printStackTrace();
    }


%>