<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 100%;
            max-width: 400px;
            margin: 100px auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ddd;
        }
        input[type="submit"] {
            background-color: #28a745;
            color: white;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
        .error-message {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ankush?autoReconnect=true&useSSL=false", "root", "Deshmukhadcet@123");

    PreparedStatement stmt = con.prepareStatement("select * from admininfo where uid=? and pwd=?");
    stmt.setString(1, request.getParameter("t1"));
    stmt.setString(2, request.getParameter("t2"));

    ResultSet rs = stmt.executeQuery();
    if (rs.next()) {
%>
    <div class="container">
        <h1>Account Verification</h1>
        <form action="retbal.jsp" method="post">
            <label for="t1">Account Number:</label>
            <input type="text" id="t1" name="t1" placeholder="Enter your account number" required><br><br>
            <input type="submit" value="Submit">
        </form>
    </div>
<%
    } else {
%>
    <div class="container">
        <h1>Login Failed</h1>
        <p class="error-message">Incorrect username or password. Please try again.</p>
    </div>
<%
    }
    rs.close();
    con.close();
} catch (Exception ex) {
    out.println("<div class='container'><h1>Error</h1><p>" + ex.getMessage() + "</p></div>");
}
%>
</body>
</html>
