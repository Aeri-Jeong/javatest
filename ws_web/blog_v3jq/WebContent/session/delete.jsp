<%@ page contentType="text/html; charset=UTF-8" %>
 
<%
// session.removeAttribute("id");
// session.removeAttribute("passwd");
// session.removeAttribute("date");
 
session.invalidate(); // 모든 세션 변수 삭제 예) 로그 아웃
 
response.sendRedirect("./session.jsp");
%>