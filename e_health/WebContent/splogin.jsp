<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="e_health.Dbconnection" %>
<%@ page import="e_health.getSet" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Specialist Login - Rural E-Health</title>
    <style>
        body {
            margin: 0;
            height: 100vh;
            font-family: Arial, sans-serif;
            display: flex;
            background: linear-gradient(135deg, #fff3e0, #ffe0b2, #fff8e1);
        }

        .left_side {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .right_side {
            flex: 1;
            background: rgba(255, 255, 255, 0.7);
            color: #333;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
            backdrop-filter: blur(10px);
        }

        .right_side h1 {
            font-size: 50px;
            margin-bottom: 10px;
            color: #ff6f00;
            text-shadow: 1px 1px 4px rgba(0,0,0,0.2);
        }

        .right_side p {
            font-size: 20px;
            margin-bottom: 15px;
            text-align: center;
            color: #555;
        }

        .login_form {
            width: 100%;
            max-width: 400px;
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 32px 0 rgba(255,150,0,0.2);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255,200,100,0.3);
        }

        .login_form h1 {
            text-align: center;
            margin-bottom: 25px;
            color: #ff6f00;
        }

        .login_form input {
            width: 100%;
            border: none;
            border-bottom: 2px solid #ccc;
            padding: 12px;
            font-size: 16px;
            margin-bottom: 25px;
            background: transparent;
            color: #333;
            outline: none;
            transition: border-color 0.3s;
        }

        .login_form input::placeholder {
            color: #999;
        }

        .login_form input:focus {
            border-color: #ff9800;
        }

        .login_btn {
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 25px;
            background-color: #ff9800;
            color: #fff;
            font-size: 18px;
            cursor: pointer;
            transition: background 0.3s, transform 0.2s;
        }

        .login_btn:hover {
            background-color: #fb8c00;
            transform: scale(1.05);
        }

        .error {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<div class="left_side">
    <form class="login_form" method="post">
        <h1>Specialist Login</h1>
        <input type="email" name="email" placeholder="Enter your email" required><br>
        <input type="password" name="password" placeholder="Enter your password" required><br>
        <button class="login_btn" type="submit">Login</button>

        <%
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            if (email != null && password != null) {
                try {
                    Connection con = Dbconnection.connect();
                    PreparedStatement ps = con.prepareStatement("SELECT id FROM specialist_doctor WHERE email=? AND password=?");
                    ps.setString(1, email);
                    ps.setString(2, password);
                    ResultSet rs = ps.executeQuery();

                    if (rs.next()) {
                        int specialistId = rs.getInt("id");

                        getSet obj = new getSet();
                        obj.setSpecialist_id(specialistId);
                        session.setAttribute("specialist", obj);

                        response.sendRedirect("specialistMain.jsp");
                    } else {
        %>
                        <p class="error">Invalid email or password.</p>
        <%
                    }
                    con.close();
                } catch(Exception e) {
        %>
                    <p class="error">Error: <%= e.getMessage() %></p>
        <%
                }
            }
        %>
    </form>
</div>

<div class="right_side">
    <h1>Rural E-Health</h1>
    <p>Specialist Doctor Portal</p>
</div>

</body>
</html>
