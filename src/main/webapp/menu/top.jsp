<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/css?family=Coiny&display=swap" rel="stylesheet">
<c:set var="root" value="${pageContext.request.contextPath}" />


<DIV class='container' style='width: 100%;'> 

  <!-- 화면 상단 메뉴 -->
<header class="main_header">
  <div class="top_title">
  <a  href='${root}'>
    <h1 style="font-family: 'Coiny', cursive; font-size: 4em;">
    SOL CAMP
    </h1>
    <h4 style="font-family: 'Coiny', cursive; color: red;">welcome!</h4>
  </div>
  </a>
  <nav class="main_lnb">
    <ul>
      <li style="color: black;"><A class='menu_link'  href='${root}' >HOME</A></li>
      <li><A href='${root}/usercategrp/list.do'>카테고리 그룹</A></li>
      <%-- <li><A class='menu_link'  href='${root}/contents/list_all.do'>전체글</A></li> --%>
      <li><A href=''>로그인</A></li>
      <li><A href=''>회원가입</A></li>
      
    </ul>
  </nav>
 
</header>
      
  <!-- 화면을 2개로 분할하여 좌측은 메뉴, 우측은 내용으로 구성 -->  
  <DIV class="row" style='margin-top: 2px;'>
    <DIV class="col-md-2"> <!-- 메뉴 출력 컬럼 -->
      <img src='${root}/menu/images/camp.jpg' style='width: 50%;'>
      <div style='margin-top: 5px;'>
        <img src='${root}/menu/images/myface.png'>쥐
      </div>
      <!-- Spring 출력 카테고리 그룹 / 카테고리 -->
      <c:import url="/usercategrp/list_index_left.do" /> 
    </div>
      
    <DIV class="col-md-10 cont">  <!-- 내용 출력 컬럼 -->  
   
<DIV class='content'>






