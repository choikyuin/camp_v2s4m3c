package dev.mvc.usercontents;

public class ContentsVO {
  
  
  /** ������ ��ȣ */
  private int contentsno;
  
  /** ���� ī�װ� ��ȣ(FK) */
  private int usercateno;
  
  /** ���� ī�װ� ��ȣ(FK) */
  private int subcateno;
  
  /** ����*/
  private String title;
  
  /** ���� */
  private String content;
  
  /** ��õ �� */
  private int recom;
  
  /** ��ȸ �� */
  private int cnt;
  
  /** ��� �� */
  private int replycnt;
  
  /** ����� */
  private String rdate;
  
  /** '�˻���' */
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
