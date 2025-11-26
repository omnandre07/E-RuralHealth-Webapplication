<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="e_health.Dbconnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>View Arogya Vibhag</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #fff3e0, #ffe0b2);
        }

        .navbar {
            background-color: #ff6f00;
            color: white;
            padding: 15px 30px;
            font-size: 18px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .navbar a:hover {
            text-decoration: underline;
        }

        .container {
            padding: 40px;
            max-width: 1000px;
            margin: auto;
        }

        h1 {
            text-align: center;
            color: #ff6f00;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #ffcc80;
            color: #4e342e;
        }

        tr:hover {
            background-color: #fff3e0;
        }

        @media (max-width: 768px) {
            table, th, td, tr {
                display: block;
            }

            
            td {
                position: relative;
                padding-left: 50%;
                border-bottom: 1px solid #ccc;
            }

            
        }
    </style>
</head>
<body>

<div class="navbar">
    <span>View Arogya Vibhag</span>
    <a href="adminDashboard.jsp">Back</a>
</div>

<div class="container">
    <h1>Arogya Vibhag Details</h1>
    <table>
        
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Village</th>
                <th>District</th>
                <th>Delete</th>
            </tr>
        
        
        <%
            try {
                Connection con = Dbconnection.connect();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM arogya_vibhag");
                while (rs.next()) {
        %>
            <tr>
                <td ><%= rs.getInt("id") %></td>
                <td ><%= rs.getString("name") %></td>
                <td ><%= rs.getString("email") %></td>
                <td><%= rs.getString("mobile") %></td>
                <td ><%= rs.getString("village") %></td>
                <td><%= rs.getString("district") %></td>
                <td><a href="erdelete.jsp?id=<%= rs.getInt(1) %>">Delete</a></td>
                
            </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
        %>
            <tr><td colspan="6">Error: <%= e.getMessage() %></td></tr>
        <%
            }
        %>
        
    </table>
</div>

</body>
</html>
