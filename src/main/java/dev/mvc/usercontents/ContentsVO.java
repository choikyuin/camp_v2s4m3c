package dev.mvc.usercontents;

public class ContentsVO {
  
  
  /** 컨텐츠 번호 */
  private int contentsno;
  
  /** 메인 카테고리 번호(FK) */
  private int usercateno;
  
  /** 서브 카테고리 번호(FK) */
  private int subcateno;
  
  /** 제목*/
  private String title;
  
  /** 내용 */
  private String content;
  
  /** 추천 수 */
  private int recom;
  
  /** 조회 수 */
  private int cnt;
  
  /** 댓글 수 */
  private int replycnt;
  
  /** 등록일 */
  private String rdate;
  
  /** '검색어' */
  private String word;

  public int getContentsno() {
    return contentsno;
  }

  public void setContentsno(int contentsno) {
    this.contentsno = contentsno;
  }

  public int getUsercateno() {
    return usercateno;
  }

  public void setUsercateno(int usercateno) {
    this.usercateno = usercateno;
  }

  public int getSubcateno() {
    return subcateno;
  }

  public void setSubcateno(int subcateno) {
    this.subcateno = subcateno;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public int getRecom() {
    return recom;
  }

  public void setRecom(int recom) {
    this.recom = recom;
  }

  public int getCnt() {
    return cnt;
  }

  public void setCnt(int cnt) {
    this.cnt = cnt;
  }

  public int getReplycnt() {
    return replycnt;
  }

  public void setReplycnt(int replycnt) {
    this.replycnt = replycnt;
  }

  public String getRdate() {
    return rdate;
  }

  public void setRdate(String rdate) {
    this.rdate = rdate;
  }

  public String getWord() {
    return word;
  }

  public void setWord(String word) {
    this.word = word;
  }
  


}
