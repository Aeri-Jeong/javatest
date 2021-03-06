<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ include file="./ssi.jsp" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
</head>
<body>
<DIV class='container'>
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV class='content'>
 
  <fieldset style='width: 70%; margin: 10px auto;'>
    <legend>공지사항 수정</legend>
      <ul>
      <%
      int noticeno = Integer.parseInt(request.getParameter("noticeno"));
      String title = request.getParameter("title");
      String rname = request.getParameter("rname");
       
      NoticeVO noticeVO = new NoticeVO();
      noticeVO.setNoticeno(noticeno); 
      noticeVO.setTitle(title);
      noticeVO.setRname(rname);
      
      int count = noticeDAO.update(noticeVO); // 처리된 레코드 갯수
      
      if (count == 1) {
      %>  
        <li class='li_none'>수정 처리에 성공했습니다.</li>
      <%  
      } else {
      %>  
        <li class='li_none'>공지사항 수정에 실패했습니다.</li>
        <li class='li_none'>다시한번 시도해주세요.</li>
      <%  
      }
      %>
      </ul>
  </fieldset>
  
  <DIV class='bottom_menu'>
    <button type='button' onclick="location.href='./update_form.jsp?noticeno=<%=noticeno%>'">다시 수정</button>  
    <button type='button' onclick="location.href='./list.jsp'">목록</button>
  </DIV>
  
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->
 
</body>
</html>