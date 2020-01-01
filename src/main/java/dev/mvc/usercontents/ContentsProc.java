package dev.mvc.usercontents;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.usercontents.ContentsProc")
public class ContentsProc implements ContentsProcInter{
  @Autowired
  private ContentsDAOInter contentsDAO;

  
  @Override
  public int create(ContentsVO contentsVO) {
    int count = contentsDAO.create(contentsVO);
    return count;
  }


  @Override
  public List<ContentsVO> list(int subcateno) {
    List<ContentsVO> list = contentsDAO.list(subcateno);
    return list;
  }

  
}
