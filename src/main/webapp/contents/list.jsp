<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
</head>

<body>
<jsp:include page="/menu/top.jsp" flush='false' />
<aside style="float: left;">
  <a href="../subcategrp/list.do?usercateno=${usercateVO.usercateno}">${usercateVO.name }</a> 
  > ${subcateVO.name }
</aside>



<DIV class='menu_line' style="clear: both;"></DIV>
<DIV>
<DIV class='title_line'> ${subcateVO.name }</DIV>
  <aside style="float: right;">
  <a href="./create.do?usercateno=${usercateVO.usercateno}&subcateno=${subcateVO.subcateno }" 
  class="a_write">
  <img src="./images/pen.jpg">
  글쓰기
  </a>
</aside>
</DIV>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
      <%-- <c:choose>
        <c:when test="${sessionScope.id != null}"> --%>
          <col style="width: 15%;"></col>
          <col style="width: 60%;"></col>
          <col style="width: 10%;"></col>
          <col style="width: 15%;"></col>
       <%--  </c:when>
        <c:otherwise>
          <col style="width: 15%;"></col>
          <col style="width: 75%;"></col>
          <col style="width: 10%;"></col>
        </c:otherwise>
      </c:choose> --%>
        
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center; font-size: 0.9em;'>등록일</th>
          <th style='text-align: center; font-size: 0.9em;'>제목</th>
          <th style='text-align: center; font-size: 0.9em;'>추천</th>
          <c:if test="${sessionScope.id != null}">
            <th style='text-align: center; font-size: 0.9em;'>
              기타
            </th>
          </c:if>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="contentsVO" items="${list }">
          <c:set var="contentsno" value="${contentsVO.contentsno }" />
          
          <tr> 
            <td style='text-align: center;'>${contentsVO.rdate.substring(0, 10)}</td>
            <td>
              <a href="./read.do?contentsno=${contentsno}">${contentsVO.title}</a>
            
            </td> 
            <td style='text-align: center;'>${contentsVO.recom}</td>
           <%--  <c:if test="${sessionScope.id != null}"> --%>
              <td style='text-align: center;'>
                <a href="./update.do?contentsno=${contentsno}&categrpno=${categrpVO.categrpno}"><img src="./images/update.png" title="수정"></a>
                <a href="./delete.do?contentsno=${contentsno}&categrpno=${categrpVO.categrpno}"><img src="./images/delete.png" title="삭제"></a>
                <a href="../attachfile/create.do?contentsno=${contentsno}&categrpno=${categrpVO.categrpno}"><img src="./images/upload.png" title="파일 업로드"></a>
              </td>
            <%-- </c:if> --%>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
