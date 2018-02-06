<%@ page contentType="text/html; charset=UTF-8" %>
 
<%
if (session.getAttribute("act") == null) {
  session.setAttribute("act", "G"); // 손님 권한 적용
}
%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>애리의 수업 블로그</title>
<link href="./css/style.css" rel="Stylesheet" type="text/css">
<style type="text/css">
  .td_img{
    width: 10%;
    height: 80px; 
    padding: 1px;
  }
</style>
</head>
<body>
<DIV class='container'>
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV class='content'>
 
  <DIV class='title'>Category 목록</DIV>
  <TABLE style='width: 100%; margin: 30px auto; border-collapse: collapse;'>
  <tr>
    <td class='td_img'><img src='./menu/images/01.jpg' style='width: 100%; height: 100%; display: block;'></td>
    <td class='td_img'><img src='./menu/images/02.jpg' style='width: 100%; height: 100%; display: block;'></td>
    <td class='td_img'><img src='./menu/images/03.jpg' style='width: 100%; height: 100%; display: block;'></td>
    <td class='td_img'><img src='./menu/images/04.jpg' style='width: 100%; height: 100%; display: block;'></td>
    <td class='td_img'><img src='./menu/images/01.jpg' style='width: 100%; height: 100%; display: block;'></td>
    <td class='td_img'><img src='./menu/images/02.jpg' style='width: 100%; height: 100%; display: block;'></td>
    <td class='td_img'><img src='./menu/images/03.jpg' style='width: 100%; height: 100%; display: block;'></td>
    <td class='td_img'><img src='./menu/images/04.jpg' style='width: 100%; height: 100%; display: block;'></td>
   </tr>
  </TABLE>
  <TABLE style='width: 100%;'>
    <TR>
      <TD style='width: 50%; padding-right: 2%; '><jsp:include page="/notice3/list_home.jsp" /></TD>
      <TD style='width: 50%; padding-left: 2%;'><jsp:include page="/visitor4/list_home.jsp" /></TD>
    </TR>
  </TABLE>
 
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->
</body>
</html>