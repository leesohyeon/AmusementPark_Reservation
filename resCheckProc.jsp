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
rs = stmt.executeQuery(sql);    // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.
String name,date,type;
int adult,teen,kid;
while(rs.next()){ // ����� �� �྿ ���ư��鼭 �����´�.
	 name=rs.getString("NAME");
	 date=rs.getString("VISIT_DATE");
	 date=date.substring(0,date.length()-8);
	 type=rs.getString("TICKET_TYPE");
	 adult= rs.getByte("ADULT");
	 teen= rs.getByte("TEEN");
	 kid= rs.getByte("KID");

%>
<br><br><br><br>
<h3><%= name %>���� <%= date %>�� <%= type %>���� � <%= adult %>��, û�ҳ� <%= teen %>��, �Ƶ� <%= kid %>���� �����ϼ̽��ϴ�.
<br><br> �� �ݾ� : <%=adult*15000+teen*10000+kid*6000 %>��
</h3>
<br>

<a href="delete.jsp"><button> ���� ��� </button></a>
<a href="MainPage.jsp"><button> Ȩ���� ���ư��� </button></a>

<%
}
}catch(Exception e){
	e.printStackTrace();
	out.println("������ȸ�� �����Ͽ����ϴ�.");
}
%>
</center>
</body>
</html>