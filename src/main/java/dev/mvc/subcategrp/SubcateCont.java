package dev.mvc.subcategrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.usercategrp.UsercateProc;
import dev.mvc.usercategrp.UsercateVO;

@Controller
public class SubcateCont {
  @Autowired
  @Qualifier("dev.mvc.subcategrp.SubcateProc") // 이름 지정
  private SubcateProc subcateProc;
  
  @Autowired
  @Qualifier("dev.mvc.usercategrp.UsercateProc") // 이름 지정
  private UsercateProc usercateProc;
  
  /*@RequestMapping(value="/usercategrp/create.do", method=RequestMethod.POST)*/
  @RequestMapping(value="/subcategrp/list.do", method=RequestMethod.GET)
  public ModelAndView list_by_categrpno(int usercateno) {
    ModelAndView mav = new ModelAndView();
    System.out.println("usercateno : " + usercateno);
    
    List<SubcateVO> list=  subcateProc.list_by_categrpno(usercateno);
    mav.addObject("list", list);
    
    
 
    mav.setViewName("/subcategrp/list_by_categrpno");
    
    
    return mav;
  }
  
}
