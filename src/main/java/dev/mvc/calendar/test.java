package dev.mvc.calendar;

import java.util.Calendar;


public class test {

  public static void main(String[] args) {
   
   // CalendarVO calendarVO = new CalendarVO();
    //Tool tool = new Tool();
   Calendar cal = Calendar.getInstance();
   int month = cal.get(Calendar.MONTH)+1;
   int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
   int startDay = cal.getMinimum(Calendar.DAY_OF_MONTH);
    // Map<String, Integer> today = tool.today_info(calendarVO);
    System.out.println("³¯Â¥ : " + month);
    System.out.println("endDay : " +endDay );
    System.out.println("startDay : " +startDay );
   /* System.out.println("startDay : " + today.get("startDay"));
    System.out.println("endDay : " + today.get("endDay"));
*/
  }

}
