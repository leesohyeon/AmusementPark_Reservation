<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>예약하기</title>
<link rel="stylesheet" href="css.css">

<body>
<center>
<br><br><br>
<form method="post" action="resProc.jsp">
<h2>예약하기</h2>
<table>
<tr><td valign="bottom"><h4>예약 정보</h4></td></tr>
  <tr> 
  <td>*방문하실 날짜를 선택해주세요  :</td>
  <td> <input type="date" placeholder="날짜를 선택해 주세요" name="date"><br></td>
  </tr>

  <tr>
  <td>*이용하실 표를 선택해주세요 : </td>
  <td><input type="radio" name="type" value="1일권" checked="checked">1일권
  <input type="radio" name="type" value="오후권">오후권(4시~)<br></td>
  </tr>
  
<tr>
<td valign="top">*표 매수를 선택해주세요   : </td>
<td> 어린이 (6000원) <input type="number" name="kid" value="0" size="3cm" min="0" placeholder="0"><br>
 청소년 (10000원) <input type="number" name="teen" value="0" size="3cm" min="0" placeholder="0"><br>
 &nbsp;성인 (15000원)&nbsp; <input type="number" value="0" name="adult" size="3cm" min="0" placeholder="0"></td>
</tr>

 <tr><td valign="bottom"><h4>방문자 정보</h4></td></tr>
 <tr>
 <td>*이름 : </td>
 <td><input type="text" name="name"> <br></td>
 </tr>
<tr> 
<td>*전화번호 : </td>
<td><input type="text" name="tel" placeholder="'-'없이 입력해주세요"><Br></td>
</tr>
<tr> 
<td>이메일 : </td>
<td><input type="text" name="email"><Br></td>
</tr>
 </table>
<input type="submit" value="예약하기" >
</form>


</center>
</body>
</html>