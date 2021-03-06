<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ include file="./ssi.jsp" %>
 
<%
String tempDir = application.getRealPath("/pds4/temp"); // WebContent 기준
String upDir = application.getRealPath("/pds4/storage");
// request, 메모리에 저장할 크기, 업로드할 최대 파일 크기, 임시 저장 폴더
Upload upload = new Upload(request, -1, 10485760, tempDir);
 
int categoryno = Integer.parseInt(upload.getParameter("categoryno"));
CategoryVO categoryVO = categoryProc.read(categoryno);
String category_title = categoryVO.getTitle();
int count = 0;
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
 
  <DIV class='aside_menu'>
    <ASIDE style='float: left;'>  <A href='../category4/list.jsp'>게시판</A> > <A href='./list.jsp?categoryno=<%=categoryno %>'><%=category_title %></A>＞수정 > 파일 삭제</ASIDE> 
    <ASIDE style='float: right;'>
    <A href='./list_category_table2.jsp?categoryno=<%=categoryno %>'>목록형</A> <span class='menu_divide'> |</span> 
    <A href='./list.jsp?categoryno=<%=categoryno %>'>앨범형</A> <span class='menu_divide'> |</span>
    <A href='./list_read.jsp'>펼쳐보기</A>
    </ASIDE> 
    <DIV class='menu_line' style='clear: both;'></DIV>
  </DIV>
 
  <DIV class='message'>
    <%
    int pdsno = Integer.parseInt(upload.getParameter("pdsno"));
    String passwd  = upload.toKor(upload.getParameter("passwd"));
    
    if (pds4Proc.passwordCheck(pdsno, passwd) == 1) { // 패스워드 일치
      // 기존 파일 삭제
      Pds4VO pds4VO = pds4Proc.read(pdsno);
    
      Tool.deleteFile(upDir, pds4VO.getFstor1());
      Tool.deleteFile(upDir, pds4VO.getThumb());
      
      count = pds4Proc.delete_file1(pdsno); // DBMS 파일 삭제 처리
      if (count == 1) {
      %>
        <SPAN class='span_info' style='text-align: center;'>파일을 삭제 했습니다.</SPAN><br> <br>
        삭제된 파일명: <%=pds4VO.getFile1() %>
      <%  
      } else {
      %>
        <SPAN class='span_warning'>에러가 발생하여 파일 삭제에 실패했습니다.</SPAN>
      <%  
      }
    } else {
      %>
      <SPAN class='span_warning'>패스워드가 일치하지 않습니다.</SPAN>
      <%  
    }
    %>
  </DIV>  
 
  <DIV class='bottom_menu'>
    <%
    if (count == 0) {
    %>
      <button type='button' onclick="history.back()">다시 시도</button>  
    <%  
    } else {
    %>
      <button type='button' onclick="location.href='./update_form.jsp?categoryno=<%=categoryno %>&pdsno=<%=pdsno %>'">계속 수정 [글 수정화면으로 돌아가기]</button>
    <%  
    }
    %>   
    
    <button type='button' onclick="location.href='./list.jsp?categoryno=<%=categoryno %>'">목록</button>
  </DIV>
  
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->
 
</body>
</html>