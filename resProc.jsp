<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css.css">

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<%
			try{
			request.setCharacterEncoding("euc-kr");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "AmusementPark";
			String pwd = "1234";
			ResultSet rs = null;
			Connection conn = null;
			Statement stmt = null;

			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pwd);
			stmt = conn.createStatement();

			String name = request.getParameter("name");
			String tel = request.getParameter("tel");
			String email = request.getParameter("email");
			String date = request.getParameter("date");
			String type = request.getParameter("type");
			String kid = request.getParameter("kid");
			String teen = request.getParameter("teen");
			String adult = request.getParameter("adult");
			
		
			
			String query = "SELECT dateCheck('" + date + "') FROM DUAL";
			System.out.println(query);
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				String gs = rs.getString(1);
				System.out.println(gs);
				if (gs.equals("no")) {
		%>  <script>
				alert("날짜가 올바르지 않습니다. \n 날짜를 다시 선택해주세요");
				window.history.back();
			</script>
		<%
			} else {
		%>
		<%
			//out.println(name+"\n"+tel+"\n"+email+"\n"+date+"\n"+type+"\n"+kid+"\n"+teen+"\n"+adult);

					String ticket = "insert into ticket (name,visit_date,ticket_type,adult,teen,kid)" + "values(N'"
							+ name + "','" + date + "','" + type + "','" + Integer.parseInt(adult) + "','"
							+ Integer.parseInt(teen) + "','" + Integer.parseInt(kid) + "') ";
					String booker = "insert into booker (name,email,tel)" + "values(N'" + name + "','" + email + "','"
							+ tel + "')";

					stmt.executeUpdate(ticket);
					stmt.executeUpdate(booker);
		%>
		<br>
		<br>
		<br>
		<br>
		<h2>예약이 완료되었습니다</h2>
		<a href="MainPage.jsp"><button>홈으로 돌아가기</button></a>
		<%
			}
		}
			}catch(Exception e){
				e.printStackTrace();
				} 
		%>
	</center>
</body>
</html>