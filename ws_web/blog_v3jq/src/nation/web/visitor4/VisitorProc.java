package nation.web.visitor4;

import java.util.ArrayList;

import nation.web.tool.DBClose;
import nation.web.tool.DBOpen;

public class VisitorProc {
  private VisitorDAO visitorDAO;
  
  public VisitorProc() {          // ������. - ����Ÿ���� ���� + Ŭ������� ��ҹ��ڱ��� �����ϴ�
    visitorDAO = new VisitorDAO();    // �����ڿ��� visitorDAO ��ü�� �������.
  }
  
  public int insert(VisitorVO visitorVO) { // Call By Reference
    int count = visitorDAO.insert(visitorVO);     // visitorDAO ��ü�� insert �޼ҵ带 ȣ�� (Ŭ������ ��ü�� ����� �޼ҵ带 ȣ��)
    
    return count;     // count�� Ÿ���� int�ϱ� �޼ҵ��� Ÿ�Ե� int (insert)�� ������Ѵ�!
  }
  
  public ArrayList<VisitorVO> list() {
    ArrayList<VisitorVO> list = visitorDAO.list(); //list�� Ÿ���� ArrayList<VisitorVO> �ϱ� ���� Ÿ�Ե� ArrayList<VisitorrVO>
    
    return list;      // list�� Ÿ���� ArrayList<VisitorVO> �ϱ� �޼ҵ��� Ÿ�Ե� ArrayList<VisitorrVO>
  }
 
  /**
   * �Ѱ��� ���ڵ� ��ȸ
   * @param visitorno ��ȣ
   * @return ��ȸ�� ���ڵ� ��ü
   */
  public VisitorVO read(int visitorno) {  // �Ѱ��� ���ڵ� ��ȸ
    VisitorVO visitorVO = visitorDAO.read(visitorno);
    
    return visitorVO ;
  }
  
  /**
   * �Ѱ��� ���ڵ� ��ȸ
   * @param visitorVO ������ ���ڵ� ó��
   * @return
   */
  public int update(VisitorVO visitorVO) { // Call By Reference
    int count = visitorDAO.insert(visitorVO);     // visitorDAO ��ü�� insert �޼ҵ带 ȣ�� (Ŭ������ ��ü�� ����� �޼ҵ带 ȣ��)
    
    return count;     // count�� Ÿ���� int�ϱ� �޼ҵ��� Ÿ�Ե� int (insert)�� ������Ѵ�!
  }
  
  /**
   * �н����� üũ
   * @return = 0 or 1 (����ġ/��ġ)
   */
  public int passwordCheck(int visitorno, String passwd) {  // �Ѱ��� ���ڵ� ��ȸ
    int cnt = visitorDAO.passwordCheck(visitorno, passwd); // =count , ó���� ���ڵ� ����
          
    return cnt; // =count , ó���� ���ڵ� ����
  }
  
  /**
   * �� ���� ���ڵ� ����
   * @param visitorno = ������ ���ڵ� ��ȣ
   * @return count = ������ ���ڵ� ����
   */
  public int delete(int visitorno) {
    int count = visitorDAO.delete(visitorno);
    
    return count;
  }
  
  
  
  /**
   * ���ڵ� ������ ���޹޾� ���ڵ� ��ü(VO)�� ����
   * @param count ==> ����
   * @return
   */
    public ArrayList<VisitorVO> list_home(int count) {         // count�� �޴±���!
    ArrayList<VisitorVO> list = visitorDAO.list_home(count); // ���� ����
    
    return list;
    
  }

  
  
  
  
  
  
  
  
}
 