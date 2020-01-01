package dev.mvc.subcategrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.subcategrp.SubcateProc")
public class SubcateProc implements SubcateProcInter {
  @Autowired
  private SubcateDAOInter subcateDAO;
  

  @Override
  public int create(SubcateVO subcateVO) {
    int count = subcateDAO.create(subcateVO); 
    return count;
  }

  

  @Override
  public List<SubcateVO> list_by_categrpno(int usercateno) {
    List<SubcateVO>list =  subcateDAO.list_by_categrpno(usercateno);
   return list;
  }

  
  @Override
  public SubcateVO read(int subcateno) {
    SubcateVO list = subcateDAO.read(subcateno);
    return list;
  }
  
  

  @Override
  public int count_by_categrpno(int usercateno) {
    int cnt =  subcateDAO.count_by_categrpno(usercateno);
    return cnt;
  }






}
