<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Account Balance</title>
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
            text-align: center;
        }
        h1 {
            color: #333;
        }
        .balance {
            font-size: 24px;
            font-weight: bold;
            color: #28a745;
            margin: 20px 0;
        }
        .error-message {
            color: red;
            font-size: 18px;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ankush?autoReconnect=true&useSSL=false", "root", "Deshmukhadcet@123");

            PreparedStatement stmt = con.prepareStatement("select bal from admininfo where Accnum=?");
            stmt.setString(1, request.getParameter("t1"));

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
        %>
            <h1>Account Balance</h1>
            <p class="balance">₹ <%= rs.getInt(1) %></p>
        <%
            } else {
        %>
            <h1>Account Not Found</h1>
            <p class="error-message">Invalid account number. Please check and try again.</p>
        <%
            }
            rs.close();
            con.close();
        } catch (Exception ex) {
            out.println("<div class='error-message'><h1>Error</h1><p>" + ex.getMessage() + "</p></div>");
        }
        %>
    </div>
</body>
</html>
