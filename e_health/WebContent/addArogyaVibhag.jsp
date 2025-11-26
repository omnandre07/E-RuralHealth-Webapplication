<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="e_health.Dbconnection" %>
<%@ page import="java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Add Arogya Vibhag Staff</title>
 <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background: linear-gradient(to right, #fff3e0, #ffe0b2);
        }

        .navbar {
            background-color: #ff6f00;
            color: white;
            padding: 15px 30px;
            font-size: 18px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .navbar a:hover {
            text-decoration: underline;
        }

        .form-container {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
            width: 100%;
            max-width: 500px;
            margin: 60px auto;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #ff6f00;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="tel"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #ff6f00;
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 18px;
            cursor: pointer;
        }

        button:hover {
            background-color: #e65100;
        }

        .message {
            text-align: center;
            margin-top: 15px;
            color: green;
            font-weight: bold;
        }

        .error {
            color: red;
        }
    </style>
</head>
<body>

<div class="navbar">
    <span>Rural E-Health</span>
    <a href="adminDashboard.jsp"> Back to Dashboard</a>
</div>

<div class="form-container">
<h2>Add Arogya Vibhag </h2>
    <form method="post" action="">
        <input type="text" name="name" placeholder="Enter Name" required>
        <input type="email" name="email" placeholder="Enter Email" required>
        <input type="tel" name="mobile" placeholder="Enter Mobile Number" required pattern="[0-9]{10}">
        <input type="text" name="village" placeholder="Enter Village Name" required>
        <input type="text" name="district" placeholder="Enter District Name" required>
        <input type="password" name="password" placeholder="Enter Password" required>
        <button type="submit">Add now</button>
    </form>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String mobile = request.getParameter("mobile");
    String village = request.getParameter("village");
    String district = request.getParameter("district");
    String password = request.getParameter("password");

    if (name != null && email != null && mobile != null && village != null && district != null && password != null) {
        try {
            Connection con = Dbconnection.connect();
            PreparedStatement ps = con.prepareStatement("INSERT INTO arogya_vibhag (name, email, mobile, village, district, password) VALUES (?, ?, ?, ?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, mobile);
            ps.setString(4, village);
            ps.setString(5, district);
            ps.setString(6, password);

            int result = ps.executeUpdate();
            if (result > 0) {
%>
                <p class="message">Arogya Vibhag Added Successfully!</p>
<%
            } else {
%>
                <p class="message error">Failed to add Arogya Vibhag. Try again.</p>
<%
            }
        } catch (Exception e) {
%>
            <p class="message error">Error: <%= e.getMessage() %></p>
<%
        }
    }
%>
</div>

</body>
</html>
    