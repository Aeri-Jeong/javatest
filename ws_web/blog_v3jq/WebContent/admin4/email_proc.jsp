<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ include file="./ssi.jsp" %>
 
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
 
  <DIV class='aside_menu'>
    <ASIDE style='float: left;'>관리자 > 가입 > 이메일 중복 확인</ASIDE> 
    <ASIDE style='float: right;'>
      <A href='./list_table3.jsp'></A> <span class='menu_divide'> |</span> 
      <A href='./list_grid2.jsp'></A> <span class='menu_divide'> |</span>
      <A href='./list_read.jsp'></A>
    </ASIDE> 
    <DIV class='menu_line' style='clear: both;'></DIV>
  </DIV>
 
  <FORM name='frm' method='POST' action='./email_proc.jsp'>
    <fieldset class='fieldset_no_line'>
      <ul>
        <li class='li_center'>
          <span class='span_info'>중복 이메일 검사 결과</span><br>
          <%
          String email = request.getParameter("email");
          int count = adminProc.countEmail(email);
          %>
          <br>
          검사된 EMAIL: <%=email %><BR><BR>
          <%
          if (count == 0){
          %>
            <span class='span_info'>이메일이 중복되지 않습니다.</span><br>
            사용 가능합니다.
          <%
          }else{
          %>
            <span class='span_alert'>이메일이 중복됩니다.</span><br>
            이메일 검사를 다시 해주세요.
          <%  
          }
          %> 
        </li>
        <li class='li_right'>
          <%
          if (count == 0){
          %>
            <button type='button' onclick="use('<%=email %>')">사용</button> 
          <%
          }
          %>
          <button type='button' onclick="location.href='./email_form.jsp'">다시 검사</button> 
          <button type='button' onclick="window.close()">닫기</button>
        </li>
      </ul>
    </fieldset>
  </FORM>
 
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->
 
</body>
</html>
 