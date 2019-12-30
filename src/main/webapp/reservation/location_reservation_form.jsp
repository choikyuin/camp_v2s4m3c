<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="UTF-8">
<title></title>

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

function pay(){
	
	if (document.map.a1.value == 1){
		document.frm.pay.value = '25000';
		return false;
	}
	
	if (document.map.a1.value != 1) {
		document.frm.pay.value = "";
		return false;
	}
	
}


</script>

</head>
<body>

<div>

<form name="map">
<div style="position: absolute;  top: 1px; left: 1px ;">

<div style="position: relative; top: 1px; left: 76px;"><img src="./images/back.png"></img></div>



</div>

<div style="position: absolute;  top: 177px; left: 728px ;">

<div style="position: relative; top: 0px; "> <input type="checkbox" name="a1" value="1"  onclick="pay()"> </div>
<div style="position: relative; top: 8px; "> <input type="checkbox" value="2" > </div>
<div style="position: relative; top: 19px;"> <input type="checkbox" value="3" > </div>
<div style="position: relative;  top: 28px;;"> <input type="checkbox" value="4" > </div>

</div>


<div style="position: absolute;  top: 177px; left: 699px ;">
<div style="position: relative; top: 0px; "> <input type="checkbox" value="a5" > </div>
<div style="position: relative; top: 8px; "> <input type="checkbox" value="a6" > </div>
<div style="position: relative; top: 19px; "> <input type="checkbox" value="a7" > </div>
<div style="position: relative; top: 28px; "> <input type="checkbox" value="a8" > </div>
</div>
</form>
<img src="./images/myface.png"></img>

</div>



    <FORM name='frm' method='POST' action='reservation_proc.jsp' style="position: absolute; top: 510px; left: 76px ; " >
       
<br><br>
      <table style="border: solid 1px;  font-size : 25px; width: 100%">
       <tr>
       
       <th> 선택한 자리 </th>
        
      <td>
      <input type="checkbox" value="" > 야영장      
       <select id="people" name="num">
       <option  value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       </select>     (인원)명 
      </td>       
       <td>00000 원</td>       
       </tr>      
       
          
               
    <tr>   
    <th>합계</th>
    <td><input type="text" name="pay"></td>
    <td>0000</td>
    </tr>
    
    
    
    </table>
    <button type="submit" class="btn btn-info">결제하기</button>
    </FORM>

</body>
</html>
  