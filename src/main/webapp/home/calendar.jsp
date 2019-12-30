<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
.calendar_body{
      width:60%;
      background-color: #FFFFFF;
      border:1px solid white;
      margin-bottom: 50px;
      border-collapse: collapse;
      margin: 1px auto;
      text-align: center;
}
.day_sun{
 color:red;
}
</style>

</head>
<body>

<table class="calendar_body">
<thead>
  <tr bgcolor="#CECECE">
    <td class="day_sun" >일</td>
    <td class="day" >월</td>
    <td class="day" >화</td>
    <td class="day" >수</td>
    <td class="day" >목</td>
    <td class="day" >금</td>
    <td class="day sat" >토</td>
  </tr>
</thead>
<tbody>
  <tr>
    <c:forEach var="dateList" items="${datelist}" varStatus="date_status">
      <c:choose>
        <c:when test="dateList.value=='today'">
           <div class="date">
              ${dateList.date}
            </div></c:when>
      </c:choose>
    
    </c:forEach>  
  </tr>
</tbody>
</table>

</body>
</html>
 