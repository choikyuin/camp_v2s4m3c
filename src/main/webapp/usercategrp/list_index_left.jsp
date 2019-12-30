<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
 <c:set var="root" value="${pageContext.request.contextPath}" />
 
       ▷ <A href='${root}/contents/list_all.do'>전체 카테고리(${total_count })</A>
       
    
       <UL style='padding-left: 30px; border: 1px solid;'>
          
         <c:forEach var="usercateVO" items = "${list }">  
           <c:set var="usercateno" value="${usercateVO.usercateno }" />
           
           <li style='font-size: 0.9em; list-style: none;'>
             <A href='../subcategrp/list.do?usercateno=${usercateno }' style='font-size: 0.9em;
             '>${usercateVO.name }</A> (${usercateVO.cnt })           
           </li>      
         </c:forEach> 
       </UL>
       

  