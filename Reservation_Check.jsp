
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="css.css">	
<title>Check Page</title>

</head>
<body>
<br><Br><br><br><br>
<center>
<form action="resCheckProc.jsp" method="post">
<h2>예약확인</h2>
<table >
 <tr>
 <td>이름 : </td>
 <td><input type="text" name="name"> <br></td>
 </tr>
<tr> 
<td>전화번호 : </td>
<td><input type="text" name="tel" placeholder="'-'없이 입력해주세요"><Br></td>
</tr>
</table>
<input type="submit" value="예약조회" >
</form>




</center>
</body>
</html>