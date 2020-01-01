package dev.mvc.usercontents;

import java.util.List;

public interface ContentsDAOInter {
  
  
  /**
   * ÄÁÅÙÃ÷ µî·Ï
   * @param contentsVO
   * @return int
   */
  public int create(ContentsVO contentsVO);
  
  /**
   * ¼­ºêÄ«Å×°í¸®º° ÄÁÅÙÃ÷ ¸ñ·Ï
   * @param int subcateno
   * @return ContentsVO
   */
  public List<ContentsVO> list(int subcateno);

}
