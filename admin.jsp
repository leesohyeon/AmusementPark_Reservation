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
var pw = prompt('��й�ȣ�� �Է��ϼ���'); 
if(pw=='0000'){
	
}
else{
	alert("���� ���� \n Ȩ���� �̵��մϴ�");
	window.history.back();
}
</script>
</head>
<body>
<center>
<br><br><br>
<h2>������ ������</h2>
	
	<table border="1">
		<tr>
			<td width="70">�̸�</td>
			<td width="120">��ȭ��ȣ</td>
			<td width="120">��¥</td>
			<td width="50">�</td>
			<td width="50">û�ҳ�</td>
			<td width="50">���</td>
			<td width="100">�Ѿ�</td>
			
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
				<strong>�� �ο���</strong> <br>
				� : <%= rs.getByte(1) %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				û�ҳ� : <%= rs.getByte(2) %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				��� : <%= rs.getByte(3) %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td colspan="3">
				<strong>�� ����</strong><br> : <%=all %>
				</td>
				</tr>
			
				<%
			}
		  } catch(Exception e) {
			e.printStackTrace();
			out.println("��ȸ ����");
		}   
%>
	</table>
	<br><br>
<a href="MainPage.jsp"><button>Ȩ���� ���ư���</button></a>
	</center>
</body>
</html>