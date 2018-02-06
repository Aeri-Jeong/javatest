package nation.web.visitor4;

import java.util.ArrayList;

import nation.web.tool.DBClose;
import nation.web.tool.DBOpen;

public class VisitorProc {
  private VisitorDAO visitorDAO;
  
  public VisitorProc() {          // 생성자. - 리턴타입이 없다 + 클래스명과 대소문자까지 동일하다
    visitorDAO = new VisitorDAO();    // 생성자에서 visitorDAO 객체를 만들었다.
  }
  
  public int insert(VisitorVO visitorVO) { // Call By Reference
    int count = visitorDAO.insert(visitorVO);     // visitorDAO 객체의 insert 메소드를 호출 (클래스에 객체를 만들어 메소드를 호출)
    
    return count;     // count의 타입이 int니까 메소드의 타입도 int (insert)로 해줘야한다!
  }
  
  public ArrayList<VisitorVO> list() {
    ArrayList<VisitorVO> list = visitorDAO.list(); //list의 타입이 ArrayList<VisitorVO> 니까 앞의 타입도 ArrayList<VisitorrVO>
    
    return list;      // list의 타입이 ArrayList<VisitorVO> 니까 메소드의 타입도 ArrayList<VisitorrVO>
  }
 
  /**
   * 한건의 레코드 조회
   * @param visitorno 번호
   * @return 조회된 레코드 객체
   */
  public VisitorVO read(int visitorno) {  // 한건의 레코드 조회
    VisitorVO visitorVO = visitorDAO.read(visitorno);
    
    return visitorVO ;
  }
  
  /**
   * 한건의 레코드 조회
   * @param visitorVO 변경할 레코드 처리
   * @return
   */
  public int update(VisitorVO visitorVO) { // Call By Reference
    int count = visitorDAO.insert(visitorVO);     // visitorDAO 객체의 insert 메소드를 호출 (클래스에 객체를 만들어 메소드를 호출)
    
    return count;     // count의 타입이 int니까 메소드의 타입도 int (insert)로 해줘야한다!
  }
  
  /**
   * 패스워드 체크
   * @return = 0 or 1 (불일치/일치)
   */
  public int passwordCheck(int visitorno, String passwd) {  // 한건의 레코드 조회
    int cnt = visitorDAO.passwordCheck(visitorno, passwd); // =count , 처리된 레코드 갯수
          
    return cnt; // =count , 처리된 레코드 갯수
  }
  
  /**
   * 한 건의 레코드 삭제
   * @param visitorno = 삭제할 레코드 번호
   * @return count = 삭제된 레코드 갯수
   */
  public int delete(int visitorno) {
    int count = visitorDAO.delete(visitorno);
    
    return count;
  }
  
  
  
  /**
   * 레코드 갯수를 전달받아 레코드 객체(VO)를 리턴
   * @param count ==> 갯수
   * @return
   */
    public ArrayList<VisitorVO> list_home(int count) {         // count를 받는구나!
    ArrayList<VisitorVO> list = visitorDAO.list_home(count); // 지역 변수
    
    return list;
    
  }

  
  
  
  
  
  
  
  
}
 