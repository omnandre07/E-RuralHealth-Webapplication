<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="e_health.Dbconnection" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Rural E-Health - Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        * { box-sizing: border-box; }
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #fff3e0, #ffe0b2, #fff8e1);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .navbar {
            width: 100%;
            background: linear-gradient(90deg, #ff6f00, #ffa726);
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            flex-wrap: wrap;
        }
        .navbar .logo { font-size: 1.8em; font-weight: bold; }
        .navbar .nav-links { display: flex; gap: 20px; }
        .navbar .nav-links a {
            color: white; text-decoration: none; font-weight: 500;
            transition: color 0.3s;
        }
        .navbar .nav-links a:hover { color: #fff9c4; }
        .navbar .login-links {
            display: flex; gap: 15px; margin-top: 10px;
        }
        .navbar .login-links a {
            background: rgba(255,255,255,0.1);
            padding: 8px 18px; border-radius: 20px;
            color: white; font-size: 0.9em;
            font-weight: 600; text-decoration: none;
            transition: background 0.3s ease;
        }
        .navbar .login-links a:hover {
            background: rgba(255,255,255,0.3);
        }
        .welcome {
            text-align: center;
            margin: 30px 20px 10px;
            font-size: 1.5em;
            color: #333;
        }
        .video-container {
            width: 100%;
            display: flex;
            justify-content: center;
            padding: 20px;
        }
        .video-container iframe {
            width: 100%;
            max-width: 800px;
            aspect-ratio: 16/9;
            border: none;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.3);
        }
        .about {
            max-width: 900px;
            background: white;
            margin: 40px auto;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            color: #444;
            line-height: 1.6;
        }
        .about h2 {
            color: #ff6f00;
            margin-bottom: 15px;
            text-align: center;
        }
        @media (max-width: 768px) {
            .navbar { flex-direction: column; align-items: flex-start; }
            .navbar .nav-links,
            .navbar .login-links {
                margin-top: 10px;
                flex-wrap: wrap;
            }
            .navbar .login-links { margin-bottom: 10px; }
            .welcome { font-size: 1.2em; margin: 20px 10px; }
            .about { margin: 20px 10px; padding: 20px; }
        }
    </style>
</head>
<body>
<div class="navbar">
    <div class="logo">Rural E-Health</div>
    <div class="nav-links">
        <a href="#">Home</a>
        <a href="#">About</a>
        <a href="#">Contact</a>
    </div>
    <div class="login-links">
        <a href="adminlogin.jsp">Admin Login</a>
        <a href="arogyaLogin.jsp">Arogya Vibhag Login</a>
        <a href="splogin.jsp">Specialist Login</a>
    </div>
</div>

<div class="welcome">
    <p>Welcome to the Rural E-Health Portal</p>
</div>

<div class="video-container">
    <iframe src="https://www.youtube.com/embed/u_qMX-vTL9o?autoplay=1&mute=1&loop=1&playlist=u_qMX-vTL9o" 
        allow="autoplay; encrypted-media" allowfullscreen></iframe>
</div>

<div class="about">
    <h2>About Rural Health</h2>
    <p>Rural health focuses on the well-being of people living in remote and countryside areas. These populations often face significant challenges when accessing medical services due to geographic isolation, lower income, and limited healthcare infrastructure.</p>
    <p>Compared to urban communities, rural residents are more likely to experience chronic diseases and limited access to preventive care. Rural E-Health platforms aim to bridge this gap through digital health technologies such as telemedicine, online medical records, and remote consultations.</p>
    <p>By bringing modern healthcare solutions to villages and small towns, initiatives like Rural E-Health improve access, reduce travel burdens, and help save lives across underserved communities.</p>
</div>

</body>
</html>
