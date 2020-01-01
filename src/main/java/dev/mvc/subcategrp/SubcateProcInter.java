package dev.mvc.subcategrp;

import java.util.List;

public interface SubcateProcInter {
  
  /**
   * ����ī�װ� ���
   * <xmp>
   *  <insert id="create" parameterType="SubcateVO">
   * </xmp>
   */
  public int create(SubcateVO subcateVO);
 
  
  /**
   * ����ī�װ� ���
   * <xmp>
   * <select id="list_by_categrpno" parameterType="int" resultType="SubcateVO">
   * </xmp>
   */
  public List<SubcateVO> list_by_categrpno(int usercateno);
  
  
  /**
   * ����ī�װ� ��ȸ
   *
   */
  public SubcateVO read(int subcateno);
  
  
  
  /**
   * FK ���� �ִ� SUBCATE ���ڵ� ����
   * <xmp>
   * <select id="count_by_categrpno"  resultType="int">
   * </xmp>
   */
  public int count_by_categrpno(int usercateno);
}
