<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>
 
<%
int admin4no = Integer.parseInt(request.getParameter("admin4no"));
String email = request.getParameter("email");
%>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript">
window.onload = function(){
  frm.email.focus();
}
</script>
</head> 
 
<body>
<DIV class='container'>
<DIV class='content'>
 
<FORM name='frm' method='POST' action='./update_proc.jsp'>
  <input type='hidden' name='admin4no' value='<%=admin4no %>'>    
        
  <fieldset class='fieldset'>
    <legend class='legend'>회원 정보 변경</legend>
    <ul>
      <li>
       <label class='label' for='email'>이메일</label>
        <input type='email' name='email' id='email' required="required" value='<%=email %>' style='width: 80%;'>
      </li>
      <li class='center'>
        <button type="submit">변경 적용</button>
        <button type='button' id='close' onclick="window.close();">닫기</button> 
      </li>
    </ul>
  </fieldset>
</FORM>
 
</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
<!-- -------------------------------------------- -->
</html> 