<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css.css">	
<%@ page import="java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <center>
<% 
try{
	request.setCharacterEncoding("euc-kr");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id="AmusementPark";
	String pwd="1234";
	ResultSet rs=null;
	Connection conn=null;
	PreparedStatement pstmt;
	Statement stmt=null;
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, id, pwd);
	stmt=conn.createStatement();
	
String id1=request.getParameter("name");
String tel=request.getParameter("tel");

String sql="select ticket.NAME,VISIT_DATE,TICKET_TYPE,ADULT,TEEN,KID from ticket,booker where ticket.name ='"+id1 +"' and tel='"+tel+"' and ticket.name=booker.name";
rs = stmt.executeQuery(sql);    // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
String name,date,type;
int adult,teen,kid;
while(rs.next()){ // 결과를 한 행씩 돌아가면서 가져온다.
	 name=rs.getString("NAME");
	 date=rs.getString("VISIT_DATE");
	 date=date.substring(0,date.length()-8);
	 type=rs.getString("TICKET_TYPE");
	 adult= rs.getByte("ADULT");
	 teen= rs.getByte("TEEN");
	 kid= rs.getByte("KID");

%>
<br><br><br><br>
<h3><%= name %>님은 <%= date %>에 <%= type %>으로 어른 <%= adult %>명, 청소년 <%= teen %>명, 아동 <%= kid %>명을 예약하셨습니다.
<br><br> 총 금액 : <%=adult*15000+teen*10000+kid*6000 %>원
</h3>
<br>

<a href="delete.jsp"><button> 예약 취소 </button></a>
<a href="MainPage.jsp"><button> 홈으로 돌아가기 </button></a>

<%
}
}catch(Exception e){
	e.printStackTrace();
	out.println("예약조회에 실패하였습니다.");
}
%>
</center>
</body>
</html>