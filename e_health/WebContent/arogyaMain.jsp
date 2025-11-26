<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="e_health.Dbconnection" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Arogya Vibhag Dashboard - Rural E-Health</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #ffe0b2, #fff3e0);
            min-height: 100vh;
        }

        .navbar {
            background-color: #ff6f00;
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            margin-left: 20px;
        }

        .navbar a:hover {
            text-decoration: underline;
        }
  .navbar .logo {
            font-size: 1.8em;
            font-weight: bold;
            color: white;
        }

        .container {
            max-width: 900px;
            margin: 50px auto;
            background: white;
            border-radius: 12px;
            padding: 40px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
        }

        h1 {
            color: #ff6f00;
            text-align: center;
            margin-bottom: 30px;
        }

        .cards {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            gap: 30px;
        }

        .card {
            background: #fff8e1;
            padding: 25px 30px;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
            text-align: center;
            flex: 1 1 250px;
            transition: 0.3s ease;
        }

        .card:hover {
            transform: scale(1.03);
        }

        .card h3 {
            margin-bottom: 15px;
            color: #fb8c00;
        }

        .card a {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            background-color: #ff9800;
            color: white;
            border-radius: 20px;
            text-decoration: none;
            transition: 0.3s;
        }

        .card a:hover {
            background-color: #f57c00;
        }
    </style>
</head>
<body>

<div class="navbar">
<div class="logo">Rural E-Health</div>
    <div>
       
        <a href="Index.jsp">Logout</a>
    </div>
</div>

<div class="container">
    <h1>Welcome to Arogya Vibhag Dashboard</h1>

    <div class="cards">
        <div class="card">
            <h3>Add New Case</h3>
            <p>Register a new patient case and auto-assign it to a specialist.</p>
            <a href="addCase.jsp">Add Case</a>
        </div>

        <div class="card">
            <h3>View Case Records</h3>
            <p>View existing cases, comments, and prescriptions from specialists.</p>
            <a href="viewCase.jsp">View Cases</a>
        </div>
    </div>
</div>

</body>
</html>
