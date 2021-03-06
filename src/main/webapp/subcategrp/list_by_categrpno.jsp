<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>camp world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    
<script type="text/javascript">
function update_form(usercateno) {
  var url = './update.do?usercateno=' + usercateno;
  var win = window.open(url, '카테고리 그룹 삭제', 'width=800px, height=350px'); 
  var x = (screen.width - 800) / 2;
  var y = (screen.height - 350) / 2; 
  win.moveTo(x, y); // 지정된 좌표로 이동    
} 
</script>
     
    
    
    
<script type="text/javascript">
function delete_form(usercateno) {
  var url = './delete.do?usercateno=' + usercateno;
  var win = window.open(url, '카테고리 그룹 삭제', 'width=800px, height=350px'); 
  var x = (screen.width - 800) / 2;
  var y = (screen.height - 350) / 2; 
  win.moveTo(x, y); // 지정된 좌표로 이동    
} 
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
 
  <DIV class='title_line'>${usercateVO.name }</DIV>
 
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      <!-- <input type='hidden' name='lang' id='lang' value='en'> --> <!-- ko, en -->
        
      <label>장소 분류</label>
      <input type="hidden" name="usercateno" value="${usercateVO.usercateno }">
      <input type='text' name='name' value='' required="required" style='width: 25%;'>
 
      <label>순서</label>
      <input type='number' name='seqno' value='1' required="required" 
                min='1' max='1000' step='1' style='width: 5%;'>
  
      <label>사용 가능 여부</label>
      <select name='visible'>
        <option value='Y' selected="selected">Y</option>
        <option value='N'>N</option>
      </select>
       
      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="cancel();">취소</button>
    </FORM>
  </DIV>
 
  
<TABLE class='table table-striped'>
  <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 40%;'/>
    <col style='width: 20%;'/>
    <col style='width: 10%;'/>    
    <col style='width: 20%;'/>
  </colgroup>
 
  <thead>  
  <TR>
    <TH class='th_basic'>순서</TH>
    <TH class='th_basic'>서브 카테고리</TH>
    <TH class='th_basic'>등록일</TH>
    <TH class='th_basic'>사용 가능여부</TH>
    <TH class='th_basic'>기타</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="subcateVO" items = "${list }">
    <c:set var="usercateno" value="${subcateVO.usercateno }" />
    
    <TR>
      <TD style='text-align: center;'>${subcateVO.seqno }</TD>
      <TD>
      <A href="../contents/list.do?usercateno=${usercateno }&subcateno=${subcateVO.subcateno}">
       ${subcateVO.name }
       </A> 
       </TD>
      <TD style='text-align: center;'>${subcateVO.rdate.substring(0, 10) }</TD>
      <TD style='text-align: center;'>${subcateVO.visible }</TD>
      <TD style='text-align: center;'>
        <A ><IMG src='../images/up.png' title='우선순위 높임' style='width: 16px;'></A>
        <A><IMG src='../images/down.png' title='우선순위 낮춤' style='width: 16px;'></A>
        <A href="javascript: update_form(${usercateno });"><IMG src='./images/update.png' title='수정'></A>
        <A href="javascript: delete_form(${usercateno });"><IMG src='./images/delete.png' title='삭제'></A>
      </TD>
    </TR>
  </c:forEach> 
  </tbody>
 
</TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 