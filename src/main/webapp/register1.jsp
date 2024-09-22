<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>

<body>
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ankush?autoReconnect=true&useSSL=false","root","Deshmukhadcet@123");
	
	PreparedStatement stmt=con.prepareStatement("insert into admininfo values(?,?,?,?,?)");
	stmt.setString(1,request.getParameter("t1"));
	stmt.setString(2,request.getParameter("t2"));
	stmt.setString(3,request.getParameter("t3"));
	stmt.setString(4,request.getParameter("t4"));
	stmt.setInt(5,Integer.parseInt(request.getParameter("t5")));
	
	stmt.executeUpdate();
	out.println("<h1>Account opened successfully</h2>");
	con.close();
	
	
}
catch(Exception ex){
	out.println(ex.getMessage());
}


%>

</body>
</html>