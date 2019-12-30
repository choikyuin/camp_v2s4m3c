package dev.mvc.subcategrp;

import java.util.List;

public interface SubcateProcInter {
  
  /**
   * ����ī�װ� ���
   * <xmp>
   * <select id="list_by_categrpno" parameterType="int" resultType="SubcateVO">
   * </xmp>
   */
  public List<SubcateVO> list_by_categrpno(int usercateno);
  
  /**
   * FK ���� �ִ� SUBCATE ���ڵ� ����
   * <xmp>
   * <select id="count_by_categrpno"  resultType="int">
   * </xmp>
   */
  public int count_by_categrpno(int usercateno);
}
