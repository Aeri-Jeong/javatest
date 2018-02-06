<%@ page contentType="text/html; charset=UTF-8" %>
<!-- 화면 상단 메뉴 -->
<DIV style='text-align: left;'>
  Movie Blog ver 0.6<br>
  
  <% String root = request.getContextPath(); %>   <!--  자동으로 경로 가져와서 이미지가 어디에 속하든 자동으로 가져옴 --> 
  <IMG src='<%=root %>/menu/images/top_image.jpg' style='width: 100%; height: 200px'>
 <br>
  <nav>
    <A href='<%=root %>'>HOME</A>
    <A href='<%=root %>/notice1/list.jsp'>공지사항1</A>
    <A href='<%=root %>/notice2/list.jsp'>공지사항2</A>
    <A href='<%=root %>/notice3/list.jsp'>공지사항3</A>
    <A href='<%=root %>/visitor4/list.jsp'>방명록</A>
    <A href='<%=root %>/category4/list.jsp'>카테고리</A>
  </nav>
</DIV>