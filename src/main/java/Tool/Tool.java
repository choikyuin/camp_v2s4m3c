package Tool;


import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;

import org.omg.CORBA.Request;

import dev.mvc.calendar.CalendarVO;



public class Tool {

  public Tool() {}
    // 날짜에 관련된 달력정보를 가지는 메소드
  
    
    Map<String, Integer> listMap = new HashMap<String, Integer>();
    
    public Map<String, Integer> datelist() {
      for(int i=1; i<=31; i++) {
        listMap.put("day", i);
      }
      
      return listMap;
    }
    
    
}
