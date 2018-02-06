<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
 
 <%!
public String checkNull(Object obj){
  if (obj == null){
    return "";
  }else{
    return (String)obj;
  }
}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
</head>
<body>
<DIV class='container'>
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV class='content'>
 
  <br>
  다른 페이지로 이동해도 session은 살아있습니다.
  <br>
  request.getParameter("id") 같은 코드가 필요 없습니다.
  <br>
  값은 특정 시간동안 메모리상에 계속 유지됩니다.
  <br>
  <li>
      ID: <%=checkNull(session.getAttribute("id")) %> <br> 
      PASSWORD: <%=checkNull(session.getAttribute("passwd")) %><br>
      <%
      Object obj = session.getAttribute("date");
      
      if (obj != null){
        Date date = (Date)obj; // 객체 형변환
        out.println("로그인 시간: " + date.toLocaleString());
      }
      %>
    </li>
  <br>
  
  [<A href='./session.jsp'>session.jsp 페이지로 이동</A>]
 
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->
 
</body>
</html>