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

String sql1="delete FROM ticket where exists (select * from booker where ticket.name ='"+id1 +"' and booker.tel='"+tel+"')";
String sql2="delete FROM booker where name ='"+id1 +"' and tel='"+tel+"'";
rs = stmt.executeQuery(sql1);    // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.
rs = stmt.executeQuery(sql2);    

%>
<br><br><br><br>
<h3> ���� ��Ұ� �Ϸ�Ǿ����ϴ�.</h3>
<br>

<a href="MainPage.jsp"><button> Ȩ���� ���ư��� </button></a>
<%

}catch(Exception e){
	e.printStackTrace();
	out.println("������ȸ�� �����Ͽ����ϴ�.");
}
%>
</center>
</body>
</html>