<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="css.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
var pw = prompt('비밀번호를 입력하세요'); 
if(pw=='0000'){
	
}
else{
	alert("접근 실패 \n 홈으로 이동합니다");
	window.history.back();
}
</script>
</head>
<body>
<center>
<br><br><br>
<h2>관리자 페이지</h2>
	
	<table border="1">
		<tr>
			<td width="70">이름</td>
			<td width="120">전화번호</td>
			<td width="120">날짜</td>
			<td width="50">어른</td>
			<td width="50">청소년</td>
			<td width="50">어린이</td>
			<td width="100">총액</td>
			
		</tr>
<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Statement stmt=null;

		
		try {
			request.setCharacterEncoding("euc-kr");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id="AmusementPark";
			String pwd="1234";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pwd);
			stmt=conn.createStatement();
			
			String sql="select ticket.NAME,VISIT_DATE,TICKET_TYPE,ADULT,TEEN,KID,TEL from ticket,booker where ticket.name=booker.name order by VISIT_DATE";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			String name,date,type,tel;
			int adult,teen,kid,total,all=0;
			while(rs.next()){
				 name=rs.getString("NAME");
				date=rs.getString("VISIT_DATE");
				 date=date.substring(0,date.length()-8);
				 type=rs.getString("TICKET_TYPE");
				 adult= rs.getByte("ADULT");
				 teen= rs.getByte("TEEN");
				 kid= rs.getByte("KID");
				tel=rs.getString("TEL");
%>				
				<tr>
					<td><%= name %></td>
					<td><%= tel %></td>
					<td><%= date %></td>
					<td><%= adult %></td>
					<td><%= teen %></td>
					<td><%= kid %></td>
					<td><% total=adult*15000+teen*10000+kid*6000; %>
					<%=total %></td>
				</tr>
			
<%			
all+=total;
			}//while
			sql="select sum(adult),sum(teen),sum(kid) from ticket ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
			
				%>
				<tr>
				<td colspan="4">
				<strong>총 인원수</strong> <br>
				어른 : <%= rs.getByte(1) %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				청소년 : <%= rs.getByte(2) %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				어린이 : <%= rs.getByte(3) %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td colspan="3">
				<strong>총 수입</strong><br> : <%=all %>
				</td>
				</tr>
			
				<%
			}
		  } catch(Exception e) {
			e.printStackTrace();
			out.println("조회 실패");
		}   
%>
	</table>
	<br><br>
<a href="MainPage.jsp"><button>홈으로 돌아가기</button></a>
	</center>
</body>
</html>