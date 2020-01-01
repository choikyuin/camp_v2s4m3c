package dev.mvc.usercontents;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.subcategrp.SubcateProc;
import dev.mvc.subcategrp.SubcateVO;
import dev.mvc.usercategrp.UsercateProc;
import dev.mvc.usercategrp.UsercateVO;

@Controller
public class ContentsCont {
@Autowired
@Qualifier("dev.mvc.usercontents.ContentsProc")
private ContentsProc contentsProc;

@Autowired
@Qualifier("dev.mvc.usercategrp.UsercateProc")
private UsercateProc usercateProc;

@Autowired
@Qualifier("dev.mvc.subcategrp.SubcateProc")
private SubcateProc subcateProc;




/**
 * 서브 카테고리 > 컨텐츠 등록
 */
@RequestMapping(value="/contents/create.do", method=RequestMethod.GET)
public ModelAndView create(int subcateno) {
  ModelAndView mav = new ModelAndView();
  

  
  SubcateVO subcateVO = subcateProc.read(subcateno);
  int usercateno = subcateVO.getUsercateno();
  System.out.println("usercateno : " + usercateno);
  
  UsercateVO usercateVO = usercateProc.read(usercateno);
  
  mav.addObject("subcateVO", subcateVO);
  mav.addObject("usercateVO", usercateVO);
  
  mav.setViewName("/contents/create");
  
  return mav;
}


/**
 * 서브  카테고리 > 컨텐츠 등록 처리
 */
@RequestMapping(value="/contents/create.do", method=RequestMethod.POST)
public ModelAndView create(ContentsVO contentsVO,
                           
                           RedirectAttributes ra) {
  
  ModelAndView mav = new ModelAndView();
  int count = contentsProc.create(contentsVO);
  System.out.println(count);
  System.out.println("등록일 : " + contentsVO.getRdate());
  ra.addAttribute("count", count);
  ra.addAttribute("usercateno",contentsVO.getUsercateno());
  ra.addAttribute("subcateno", contentsVO.getSubcateno());
  

  
  mav.setViewName("redirect:/contents/create_msg.jsp");
  return mav;
}






/**
 * 서브 카테고리별 컨텐츠 목록
 */
@RequestMapping(value="/contents/list.do", method=RequestMethod.GET)
public ModelAndView list(int subcateno, int usercateno) {
  ModelAndView mav = new ModelAndView();
  
  List<ContentsVO> list = contentsProc.list(subcateno);
  mav.addObject("list", list);
  
  UsercateVO usercateVO = usercateProc.read(usercateno);
  mav.addObject("usercateVO", usercateVO);
  
  SubcateVO subcateVO = subcateProc.read(subcateno);
  mav.addObject("subcateVO", subcateVO);
  
  mav.setViewName("/contents/list");
  
  return mav;
}
}
