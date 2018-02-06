<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
 
<%
session.setAttribute("id", "test1@mail.com");
session.setAttribute("passwd", "1234");
session.setAttribute("date", new Date());
 
response.sendRedirect("./session.jsp");
%>