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
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head> 
 
<body>
<DIV class='container'>
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV class='content'>
<DIV class='title'>SESSION 테스트</DIV>
 
  <ul>
    <li>고유한 세션 ID: <%=session.getId() %></li>
    <li>
      <button type='button' onclick="location.href='./create.jsp'">세션 생성</button>
      <button type='button' onclick="location.href='./delete.jsp'">세션 삭제</button>
      <button type='button' onclick="location.href='./send.jsp'">send.jsp 갔다오기</button>
    </li>
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
  </ul>
 
 
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->
</body>
 
</html>