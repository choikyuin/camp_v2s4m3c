package dev.mvc.calendar;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class CalendarCont {

  public CalendarCont(){
    System.out.println("CalendarCont 실행");
  }
  
  
  //http:localhost:9090/team2/calendar/list.do
  /**
   * 카테고리 그룹별 목록
   * http://localhost:9090/ojt/attachfile/list.do
   * @return
   */
  @RequestMapping(value = "/calendar/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    Map<String, Integer> listMap = new HashMap<>();
   
    List datelist = new ArrayList();
    for(int i=1; i<=31; i++) {
       listMap.put("day", i);
    }
    datelist.add(listMap);
    mav.addObject(datelist);
    mav.setViewName("/home/calendar"); // 카테고리 그룹별 목록

    return mav; 
  }
  
}
