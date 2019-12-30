package dev.mvc.usercategrp;

import java.util.List;

public interface UsercateProcInter {

  /**
   * <xmp>
   *<insert id="create" parameterType="UsercateVO"> 
   *</xmp>
   */
  public int create (UsercateVO usercateVO);
  
  
  /**
   * seqno 순서 카테고리 목록
   * <xmp>
   * <select id="list_categrpno_asc" resultType="UsercateVO">
   *</xmp>
   */
  public List<UsercateVO> list_seqno_asc();
  
  /**
   * 삭제 처리
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param categrpno
   * @return 처리된 레코드 갯수
   */
  public int delete(int usercateno);
  
  
  /**
   * 카테고리 목록
   * <xmp>
   *  <update id="update" parameterType="UsercateVO">
   *</xmp>
   */
  public int update(UsercateVO usercateVO);
  
  
  /**
   * 카테고리 조회
   * <xmp>
   * <select id="read" resultType="UsercateVO" parameterType="int">
   * </xmp>
   */
  public UsercateVO read(int usercateno);
  
  
  
  /**
   * 카테고리 우선순위 상향
   * <xmp>
   * <update id="update_seqno_up" parameterType="int">
   * </xmp>
   */
  public int update_seqno_up(int usercateno);
  
  
  /**
   * 카테고리 우선순위 하향
   * <xmp>
   * <update id="update_seqno_down" parameterType="int">
   * </xmp>
   */
  public int update_seqno_down(int usercateno);
  
}
