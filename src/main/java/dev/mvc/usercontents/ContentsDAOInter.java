package dev.mvc.usercontents;

import java.util.List;

public interface ContentsDAOInter {
  
  
  /**
   * ������ ���
   * @param contentsVO
   * @return int
   */
  public int create(ContentsVO contentsVO);
  
  /**
   * ����ī�װ��� ������ ���
   * @param int subcateno
   * @return ContentsVO
   */
  public List<ContentsVO> list(int subcateno);

}
