<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page import="nation.web.tool.DBOpen" %>
<%@ page import="nation.web.tool.DBClose" %>
 
<% 
request.setCharacterEncoding("utf-8"); 
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
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV class='content'>
 
  <fieldset style='width: 70%; margin: 10px auto;'>
    <legend>공지사항 삭제</legend>
      <ul>
      <%
      int noticeno = Integer.parseInt(request.getParameter("noticeno"));
      
      Connection con = null;              // DBMS 연결   
      PreparedStatement pstmt = null; // SQL 실행
      ResultSet rs = null;                   // SELECT 결과를 저장
      StringBuffer sql = null;              // SQL 저장
      int count = 0;                          // 처리된 레코드 갯수
      
       try {
        con = new DBOpen().getConnection();  // MySQL 연결
        sql = new StringBuffer();
        
        sql.append(" DELETE FROM notice");
        sql.append(" WHERE noticeno=?");

        pstmt = con.prepareStatement(sql.toString()); // SQL 실행 객체 생성
        pstmt.setInt(1, noticeno);
       
        count = pstmt.executeUpdate();  // INSERT, UPDATE, DELETE SQL 실행
        
        if (count == 1) {
        %>  
          <li class='li_none'>삭제 처리에 성공했습니다.</li>
        <%  
        } else {
        %>  
          <li class='li_none'>공지사항 삭제에 실패했습니다.</li>
          <li class='li_none'>다시한번 시도해주세요.</li>
        <%  
        }
        
      } catch (Exception e) {
        e.printStackTrace();
      } finally {
        new DBClose().close(con, pstmt);
      }
      %>
      </ul>
  </fieldset>
  
  <DIV class='bottom_menu'>
    <button type='button' onclick="location.href='./list.jsp'">목록</button>
  </DIV>
  
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->
 
</body>
</html>