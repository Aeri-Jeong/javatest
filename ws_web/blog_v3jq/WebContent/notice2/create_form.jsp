<%@ page contentType="text/html; charset=UTF-8" %>
 
<% 
request.setCharacterEncoding("utf-8"); //form에서 보낸 데이터를 한글로 변환할 때 사용
 %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
</head>
<body>
<DIV class='container'>
<jsp:include page="/menu/top.jsp" flush='false' />    <%-- jsp include : top,jsp가 다 처리된 결과를 create_form.jsp에서 포함됨. --%> 
<DIV class='content'>
 
  <form name='frm' action='./create_proc.jsp' method='POST'>
    <fieldset style='width: 70%; margin: 10px auto;'>
      <legend>공지사항 등록</legend>
      <ul>
        <li class='li_none'>
          <label for='title'>내용: </label>
          <input type='text' name='title' id='title' value='스타트랙 시즌1 open' style='width: 80%;'>
        </li>
        <li class='li_none'>
          <label for='rname'>성명: </label>
          <input type='text' name='rname' id='rname' value='관리자' style='width: 30%;'>
        </li>
      </ul>
    </fieldset>
    
    <DIV style='margin: 30px auto; text-align: center; background-color: #FFFFFF'>
      <button type='submit'>등록</button>
    </DIV>    
  </form>
 
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->
 
</body>
</html>