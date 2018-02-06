<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ include file="./ssi.jsp" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>방명록</title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
</head>
<body>
<DIV class='container'>
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV class='content'>
 
  <fieldset class='fieldset_basic'>
    <legend class='legend_basic'>방명록 삭제</legend>
      <ul>
      <%
      int visitorno = Integer.parseInt(request.getParameter("visitorno"));
      String passwd = request.getParameter("passwd");
       
      int count = 0;
      if (visitorProc.passwordCheck(visitorno, passwd) == 1) {    // 패스워드가 일치하면
        count = visitorProc.delete(visitorno); // 패스워드가 일치하고 delete 제대로 처리된 레코드 갯수
       
        if (count == 1) {   // 패스워드 일치해서 delete 제대로 처리했으면
          response.sendRedirect("./list.jsp");
        } else {          // 패스워드가 일치하는데 뭔지 모를 에러로 delete 못했으면
        %>  
          <li class='li_none'>방명록 삭제에 실패했습니다.</li>
          <li class='li_none'>다시한번 시도해주세요.</li>
        <%  
        }
      } else {          // 패스워드 일치하는지 count 했을 때 1이 아니라 0일때
      %>
        <li class='li_none'>패스워드가 일치하지 않습니다.</li>
      <%  
      }
      %>
        </ul>
  </fieldset>
  
  <DIV class='bottom_menu'>
    <%
    if (count == 0) {
    %>
      <button type='button' onclick="location.href='./delete_form.jsp?visitorno=<%=visitorno%>'">다시 시도</button>  
    <%  
    } else {
    %>
      <button type='button' onclick="location.href='./read.jsp?visitorno=<%=visitorno%>'">삭제 확인</button>
    <%  
    }
    %> 
    <button type='button' onclick="location.href='./list.jsp'">목록</button>
  </DIV>
  
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->
 
</body>
</html>