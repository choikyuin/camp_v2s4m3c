package dev.mvc.calendar;

public class CalendarVO {
 private String year;
 private String month; 
 private String date;
 private String value;
 
 
public CalendarVO() {}

public String getYear() {
  return year;
}
public void setYear(String year) {
  this.year = year;
}

public String getMonth() {
  return month;
}
public void setMonth(String month) {
  this.month = month;
}
public String getDate() {
  return date;
}
public void setDate(String date) {
  this.date = date;
}
public String getValue() {
  return value;
}
public void setValue(String value) {
  this.value = value;
}
 
}
