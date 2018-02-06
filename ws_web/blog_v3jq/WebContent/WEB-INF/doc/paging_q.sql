1) 실습 테이블 생성
 
CREATE TABLE month(
  monthno INT         NOT NULL PRIMARY KEY,
  title   VARCHAR(20) NOT NULL -- 월 이름
);
 
INSERT INTO month(monthno, title) VALUES(1, 'January');
INSERT INTO month(monthno, title) VALUES(2, 'February');
INSERT INTO month(monthno, title) VALUES(3, 'March');
INSERT INTO month(monthno, title) VALUES(4, 'April');
INSERT INTO month(monthno, title) VALUES(5, 'May');
INSERT INTO month(monthno, title) VALUES(6, 'June');
INSERT INTO month(monthno, title) VALUES(7, 'July');
INSERT INTO month(monthno, title) VALUES(8, 'August');
INSERT INTO month(monthno, title) VALUES(9, 'September');
INSERT INTO month(monthno, title) VALUES(10, 'October');
INSERT INTO month(monthno, title) VALUES(11, 'November');
INSERT INTO month(monthno, title) VALUES(12, 'December');
INSERT INTO month(monthno, title) VALUES(13, 'none');
 
 
2) 페이징 실습
-- MySQL
-- LIMIT 제외할 레코드의 갯수, 출력할 레코드의 갯수
 
-- 1년을 5개의 레코드로 분할하여 출력하세요.
SELECT monthno, title
FROM month
ORDER BY monthno ASC
LIMIT 0, 5;
 
 monthno title
 ------- --------
       1 January
       2 February
       3 March
       4 April
       5 May
 
       
SELECT monthno, title
FROM month
ORDER BY monthno ASC
LIMIT 5, 5;
       
 monthno title
 ------- ---------
       6 June
       7 July
       8 August
       9 September
      10 October
 
      
SELECT monthno, title
FROM month
ORDER BY monthno ASC
LIMIT 10, 5;
 
 monthno title
 ------- --------
      11 November
      12 December
      13 none
 
 
 
3) 검색된 전체 레코드 수
SELECT COUNT(pdsno) as cnt 
FROM pds4
WHERE rname LIKE '%왕눈이%';
 
 cnt
 ---
  17
   
4) 페이징
SELECT pdsno, categoryno, rname, email, title, content, passwd, cnt, 
          SUBSTRING(rdate, 1, 10) as rdate, web, file1, fstor1,
          thumb, size1, map, youtube, mp3, mp4, ip, visible 
FROM pds4
WHERE rname LIKE '%왕눈이%'
ORDER BY pdsno DESC
LIMIT 0, 5;
 

5) 카테고리별 페이징
SELECT pdsno, categoryno, rname, email, title, content, passwd, cnt, 
          SUBSTRING(rdate, 1, 10) as rdate, web, file1, fstor1,
          thumb, size1, map, youtube, mp3, mp4, ip, visible 
FROM pds4
WHERE category =1 AND rname LIKE '%왕눈이%'
ORDER BY pdsno DESC
LIMIT 0, 5;
   
-----------------------------------------------------------------------------------
     
     
2. DAO
  - 페이징을 위해서 레코드 갯수를 구해야합니다.
  - LIMIT의 사용
    공식: (현재 페이지 - 1 ) * 페이지당 출력할 레코드 갯수
    ----------------------------------------------------------
    1 page: (1 - 1) * 10 = 0    LIMIT 0, 10
    2 page: (2 - 1) * 10 = 10  LIMIT 10, 10
    3 page: (3 - 1) * 10 = 20  LIMIT 20, 10
    4 page: (4 - 1) * 10 = 30  LIMIT 30, 10
    5 page: (5 - 1) * 10 = 40  LIMIT 40, 10
    ----------------------------------------------------------
 
1) 검색된 레코드 갯수 카운트

▷ Pds4DAO.java  
- FK(Foreign Key)가 없는 경우의 페이징
 /**
   * 검색된 레코드 갯수를 구합니다.
   * @param col 검색 컬럼
   * @param word 검색어
   * @return 검색된 갯수
   */
  public int count(String col, String word){ ... }
 
- FK(Foreign Key)가 있는 경우의 페이징
 /**
   * 검색된 레코드 갯수를 구합니다.
   * @param categoryno 카테고리 번호
   * @param col 검색 컬럼
   * @param word 검색어
   * @return 검색된 갯수
   */
  public int count(int categoryno, String col, String word){ ... }

- 'public ArrayList<Pds4VO> list_category(int categoryno, String col, String word) {' 
  메소드를 복사하여 개발
-----------------------------------------------------------------------------------
  /**
   * 카테고리별로 검색된 레코드
   * 
   * @return
   */
  public int count(int categoryno, String col, String word) {
    int count = 0;
  
    try {
      con = dbopen.getConnection();
  
      sql = new StringBuffer();
      sql.append(" SELECT COUNT(pdsno) as cnt ");
      sql.append(" FROM pds4");
      
      if (col.equals("rname")) {
        sql.append(" WHERE categoryno = ? AND rname LIKE ?");
        sql.append(" ORDER BY pdsno DESC");
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setInt(1, categoryno);
        pstmt.setString(2, "%" + word + "%");
      } else if (col.equals("title")) {
        sql.append(" WHERE categoryno = ? AND  title LIKE ?");
        sql.append(" ORDER BY pdsno DESC");
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setInt(1, categoryno);
        pstmt.setString(2, "%" + word + "%");
      } else if (col.equals("content")) {
        sql.append(" WHERE categoryno = ? AND  content LIKE ?");
        sql.append(" ORDER BY pdsno DESC");
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setInt(1, categoryno);
        pstmt.setString(2, "%" + word + "%");
      } else if (col.equals("title_content")) {
        sql.append(" WHERE categoryno = ? AND (title LIKE ? OR content LIKE ?)");
        sql.append(" ORDER BY pdsno DESC");
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setInt(1, categoryno);
        pstmt.setString(2, "%" + word + "%");
        pstmt.setString(3, "%" + word + "%");
      } else { // 검색하지 않는 경우
        sql.append(" WHERE categoryno = ?");
        sql.append(" ORDER BY pdsno DESC");
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setInt(1, categoryno);
      }
  
      rs = pstmt.executeQuery(); // SELECT
  
      if (rs.next() == true) {
        count = rs.getInt("cnt");
      }
  
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt, rs);
    }
  
    return count;
  }