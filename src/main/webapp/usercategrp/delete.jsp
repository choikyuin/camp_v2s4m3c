<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 <script type="text/javascript">
 function delete_by_categrpno() {
   frm_delete_by_categrpno.submit();
 }
 </script>   
 
</head> 
 
<body>
<FORM  name='frm_delete_by_categrpno' action='../subcate/delete_by_categrpno.do' method="POST">
<input type="hidden" value="${usercateVO.usercateno }">
</FORM>

<FORM id="frm" name="frm" method="POST" action="./delete.do">
<input type="hidden" value="${usercateVO.usercateno }">

<fieldset style="border: 1px solid;">
<ul>
  <li class="li_none">
  삭제될 카테고리 그룹 이름: ${usercateVO.name }
  </li>
  <c:if test="${count_by_categrpno > 0 }">
  <li class="li_none">관련된 글이 (${count_by_categrpno }) 건 발견되었습니다.</li>
  <li class="li_none">관련글을 삭제해야 카테고리 그룹을 삭제 할수 있습니다.<br>
  <span style="color: #FF0000">관련글이 삭제되면 복구 할수 없습니다.</span>
  관련글을 삭제 하시겠습니까?
  <button type="button" onclick="delete_by_categrpno();" class="btn btn-info">삭제</button>
  </li>
  </c:if>
  <c:if test="${count_by_categrpno == 0 }">
  <li class="li_none">
  삭제하면 복구 할수 없습니다. <br>
  삭제 하시겠습니까?
  </li>
  <li class="li_right">
  <button type="button" onclick="submit();" class="btn btn-info">삭제</button>
  <button type="button" onclick="window.close();" class="btn btn-info">닫기</button>
  </li>
  </c:if>
</fieldset>

</FORM>

</body>
 
</html> 
  
   