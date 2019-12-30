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
   * seqno ���� ī�װ� ���
   * <xmp>
   * <select id="list_categrpno_asc" resultType="UsercateVO">
   *</xmp>
   */
  public List<UsercateVO> list_seqno_asc();
  
  /**
   * ���� ó��
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param categrpno
   * @return ó���� ���ڵ� ����
   */
  public int delete(int usercateno);
  
  
  /**
   * ī�װ� ���
   * <xmp>
   *  <update id="update" parameterType="UsercateVO">
   *</xmp>
   */
  public int update(UsercateVO usercateVO);
  
  
  /**
   * ī�װ� ��ȸ
   * <xmp>
   * <select id="read" resultType="UsercateVO" parameterType="int">
   * </xmp>
   */
  public UsercateVO read(int usercateno);
  
  
  
  /**
   * ī�װ� �켱���� ����
   * <xmp>
   * <update id="update_seqno_up" parameterType="int">
   * </xmp>
   */
  public int update_seqno_up(int usercateno);
  
  
  /**
   * ī�װ� �켱���� ����
   * <xmp>
   * <update id="update_seqno_down" parameterType="int">
   * </xmp>
   */
  public int update_seqno_down(int usercateno);
  
}
