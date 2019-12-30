package dev.mvc.usercategrp;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.jws.WebParam.Mode;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.subcategrp.SubcateProc;
import dev.mvc.subcategrp.SubcateVO;


@Controller
public class UsercateCont {
  
@Autowired
@Qualifier("dev.mvc.usercategrp.UsercateProc") // �̸� ����
private UsercateProc usercateProc;

@Autowired
@Qualifier("dev.mvc.subcategrp.SubcateProc") // �̸� ����
private SubcateProc subcateProc;

public UsercateCont() {
  System.out.println("--> UsercateCont created.");
}

// http://localhost:9090/team2/usercategrp/create.do
@RequestMapping(value="/usercategrp/create.do", method=RequestMethod.GET)
public ModelAndView create() {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/usercategrp/create"); // /webapp/categrp/create.jsp
  
  return mav;
}

// ��� ó��
@RequestMapping(value="/usercategrp/create.do", method=RequestMethod.POST)
public ModelAndView create(UsercateVO usercateVO) {
  ModelAndView mav = new ModelAndView();
  
  int count = usercateProc.create(usercateVO);
  
  // type 1
  // mav.addObject("count", count);
  // mav.setViewName("/categrp/create_msg"); // /webapp/categrp/create_msg.jsp

  // type 2
  // mav.setViewName("redirect:/categrp/create_msg.jsp?count=" + count);
  
  // type 3: ����ó��: list.do, ������ �߻�: create_msg.jsp�� ��� 
  if (count == 0) {
    mav.setViewName("redirect:/usercategrp/create_msg.jsp?count=" + count);
  } else {
    mav.setViewName("redirect:/usercategrp/list.do"); // list.jsp X
  }
      
  return mav;
}

// seqno �������� ��� ���
@RequestMapping(value="/usercategrp/list.do", method=RequestMethod.GET)
public ModelAndView list() {
  ModelAndView mav = new ModelAndView();
  
  List<UsercateVO> list = usercateProc.list_seqno_asc();
  
  
  mav.addObject("list", list);
  mav.setViewName("/usercategrp/list"); // /webapp/categrp/list.jsp

  // mav.setViewName("redirect:/categrp/create_msg.jsp?count=" + count);
      
  return mav;
}


// seqno �������� ��� ���
@RequestMapping(value="/usercategrp/list_index_left.do", 
                           method=RequestMethod.GET)
public ModelAndView list_index_left() {
  ModelAndView mav = new ModelAndView();
  
  List<UsercateVO> list = usercateProc.list_seqno_asc();
  
  
  mav.addObject("list", list);
  
  
  
 // int total_count = usercateProc.total_count();
 // mav.addObject("total_count", total_count);
  
  mav.setViewName("/usercategrp/list_index_left"); // /webapp/categrp/list_index_left.jsp

  // mav.setViewName("redirect:/categrp/create_msg.jsp?count=" + count);
      
  return mav;
}

 
//seqno �������� ��� ���
@RequestMapping(value="/usercategrp/top.do", 
                        method=RequestMethod.GET)
public ModelAndView top_index() {
ModelAndView mav = new ModelAndView();

List<UsercateVO> list = usercateProc.list_seqno_asc();


mav.addObject("list", list);



// int total_count = usercateProc.total_count();
// mav.addObject("total_count", total_count);

mav.setViewName("/menu/top"); // /webapp/categrp/list_index_left.jsp

// mav.setViewName("redirect:/categrp/create_msg.jsp?count=" + count);
   
return mav;
}


// ī�װ� ���� 
  @RequestMapping(value="/usercategrp/update.do", method=RequestMethod.GET)
  public ModelAndView update(int usercateno) {
    ModelAndView mav = new ModelAndView();
    
    UsercateVO usercateVO = usercateProc.read(usercateno);
    mav.addObject("usercateVO", usercateVO);
    
    mav.setViewName("/usercategrp/update");
    
    return mav;
  }
  

// ī�װ� ����  ó��  
  @RequestMapping(value="/usercategrp/update.do", method=RequestMethod.POST)
  public ModelAndView update(UsercateVO usercateVO,
                                        RedirectAttributes ra) {
    ModelAndView mav = new ModelAndView();
    
    int count = usercateProc.update(usercateVO);
    ra.addAttribute("count", count);
    ra.addAttribute("usercateno", usercateVO.getUsercateno());
   
    
    mav.setViewName("redirect:/usercategrp/update_msg.jsp");
    
    return mav;
  }
  
  
// ���� �� 
  @RequestMapping(value="/usercategrp/delete.do", method=RequestMethod.GET)
  public ModelAndView delete(int usercateno) {
    ModelAndView mav = new ModelAndView();
    
    UsercateVO usercateVO = usercateProc.read(usercateno);
    int count_by_categrpno   = subcateProc.count_by_categrpno(usercateno);
    
    mav.addObject("count_by_categrpno", count_by_categrpno);
    mav.addObject("usercateVO", usercateVO);
    
    mav.setViewName("/usercategrp/delete");
   
    return mav;
  }
  
// ī�װ� ���� ó��
  @RequestMapping(value = "/usercategrp/delete.do", method=RequestMethod.POST) 
  public ModelAndView delete(int usercateno,
                                       RedirectAttributes ra) {
    ModelAndView mav = new ModelAndView();
   int count = usercateProc.delete(usercateno);
   ra.addAttribute("count", count);
   
   mav.setViewName("redirect:/usercategrp/delete_msg");
    return mav;
  }
  
  
// ī�װ� ���� ����
  @RequestMapping(value="/usercategrp/update_seqno_up.do", method=RequestMethod.GET)
  public ModelAndView update_seqno_up(int usercateno) {
    ModelAndView mav =  new ModelAndView();
    
    int count = usercateProc.update_seqno_up(usercateno);
    String url = "redirect:/usercategrp/list.do";
    mav.setViewName(url);
    
    return mav;
  }
  
// ī�װ� ���� ����
  @RequestMapping(value="/usercategrp/update_seqno_down.do", method=RequestMethod.GET)
  public ModelAndView update_seqno_down(int usercateno) {
    ModelAndView mav = new ModelAndView();
    
    int count = usercateProc.update_seqno_down(usercateno);
    String url = "redirect:/usercategrp/list.do";
    mav.setViewName(url);
    
    return mav;
    
    
  }
}
