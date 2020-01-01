package dev.mvc.subcategrp;

import java.util.List;

public interface SubcateProcInter {
  
  /**
   * 서브카테고리 등록
   * <xmp>
   *  <insert id="create" parameterType="SubcateVO">
   * </xmp>
   */
  public int create(SubcateVO subcateVO);
 
  
  /**
   * 서브카테고리 목록
   * <xmp>
   * <select id="list_by_categrpno" parameterType="int" resultType="SubcateVO">
   * </xmp>
   */
  public List<SubcateVO> list_by_categrpno(int usercateno);
  
  
  /**
   * 서브카테고리 조회
   *
   */
  public SubcateVO read(int subcateno);
  
  
  
  /**
   * FK 값이 있는 SUBCATE 레코드 갯수
   * <xmp>
   * <select id="count_by_categrpno"  resultType="int">
   * </xmp>
   */
  public int count_by_categrpno(int usercateno);
}
