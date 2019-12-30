package dev.mvc.usercategrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


//���� �̸� ����
@Component("dev.mvc.usercategrp.UsercateProc")
public class UsercateProc implements UsercateProcInter{

  // UsercateDAOInter�� MyBATIS�� ȣ���ϴ� �ڵ尡 �ڵ�������.
  // �ڵ� ������ Ŭ������ ��ü�� �ڵ� �Ҵ��.
  @Autowired
  private  UsercateDAOInter usercateDAO;
  
  @Override
  public int create(UsercateVO usercateVO) {
    
     int count  = usercateDAO.create(usercateVO);
     
    return count;
    
  }

  @Override
  public List<UsercateVO> list_seqno_asc() {
    
    List<UsercateVO> list =  usercateDAO.list_seqno_asc();
    return list;
  }
  
  @Override
  public int delete(int usercateno) {
    int count = usercateDAO.delete(usercateno);
    
    return count;
  }

  @Override
  public int update(UsercateVO usercateVO) {
    int count = usercateDAO.update(usercateVO);
    return count;
  }

  
  /**
   * ī�װ� ��ȸ
   */
  @Override
  public UsercateVO read(int usercateno) {
    UsercateVO list = usercateDAO.read(usercateno);
    return list;
  }

  @Override
  public int update_seqno_up(int usercateno) {
    int count = usercateDAO.update_seqno_up(usercateno);
    return 0;
  }

  @Override
  public int update_seqno_down(int usercateno) {
    int count = usercateDAO.update_seqno_down(usercateno);
    return count;
  }
  
}
