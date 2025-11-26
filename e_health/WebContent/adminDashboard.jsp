<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="e_health.Dbconnection" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Dashboard - Rural E-Health</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://www.medicaleconomics.com/_next/image?url=https:%2F%2Fcdn.sanity.io%2Fimages%2F0vv8moc6%2Fmedec%2Fe1becec777baa7e2ad7edd2ae822312f18ab1ad1-5382x2876.jpg%3Ffit%3Dcrop%26auto%3Dformat&w=3840&q=75') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            color: white;
        }

        .navbar {
            background-color: rgba(255, 111, 0, 0.9);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .navbar .logo {
            font-size: 1.8em;
            font-weight: bold;
            color: white;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            transition: opacity 0.3s ease;
        }

        .navbar a:hover {
            opacity: 0.8;
        }

        .overlay {
            background-color: rgba(0, 0, 0, 0.6);
            min-height: calc(100vh - 70px);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 15px;
        }

        .container {
            width: 100%;
            max-width: 800px;
            background: rgba(255, 255, 255, 0.1);
            padding: 40px 30px;
            border-radius: 20px;
            backdrop-filter: blur(12px);
            box-shadow: 0 10px 40px rgba(0,0,0,0.6);
            text-align: center;
        }

        h1 {
            font-size: 2.4em;
            margin-bottom: 30px;
            color: #ffd740;
        }

        .card {
            background: rgba(255, 255, 255, 0.15);
            border: 1px solid rgba(255, 255, 255, 0.3);
            padding: 25px;
            margin: 20px 0;
            border-radius: 15px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: scale(1.03);
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
        }

        .card h3 {
            font-size: 1.5em;
            color: #ffee58;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 2.2em;
            font-weight: bold;
            margin: 0;
            color: #ffffff;
        }

        .button-container {
            margin-top: 40px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .button-container a {
            background: linear-gradient(135deg, #ff6f00, #ffa000);
            color: white;
            padding: 14px 28px;
            border-radius: 10px;
            font-weight: 600;
            font-size: 1em;
            text-decoration: none;
            transition: background 0.4s ease, transform 0.3s;
        }

        .button-container a:hover {
            background: linear-gradient(135deg, #ff8f00, #ffca28);
            transform: scale(1.05);
        }

        @media (max-width: 600px) {
            .container {
                padding: 25px 15px;
            }

            h1 {
                font-size: 2em;
            }

            .card h3 {
                font-size: 1.2em;
            }

            .card p {
                font-size: 1.6em;
            }

            .button-container a {
                font-size: 0.9em;
                padding: 10px 20px;
            }
        }
    </style>
</head>
<body>

<div class="navbar">
    <div class="logo">Rural E-Health</div>
    <a href="Index.jsp">Log Out</a>
</div>

<div class="overlay">
    <div class="container">
        <h1>Admin Dashboard</h1>

        <div class="card">
            <h3>Total Arogya Vibhag</h3>
            <%
                int arogyaCount = 0;
                try {
                    Connection con = Dbconnection.connect();
                    PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM arogya_vibhag");
                    ResultSet rs = ps.executeQuery();
                    if(rs.next()){
                        arogyaCount = rs.getInt(1);
                    }
                } catch(Exception e) { out.println("Error: " + e); }
            %>
            <p><%= arogyaCount %></p>
        </div>

        <div class="card">
            <h3>Total Specialist Doctors</h3>
            <%
                int specialistCount = 0;
                try {
                    Connection con = Dbconnection.connect();
                    PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM specialist_doctor");
                    ResultSet rs = ps.executeQuery();
                    if(rs.next()){
                        specialistCount = rs.getInt(1);
                    }
                } catch(Exception e) { out.println("Error: " + e); }
            %>
            <p><%= specialistCount %></p>
        </div>

        <div class="button-container">
            <a href="addArogyaVibhag.jsp">Add Arogya Vibhag</a>
            <a href="viewArogyaVibhag.jsp">View Arogya Vibhag</a>
            <a href="addSpecialist.jsp">Add Specialist</a>
            <a href="viewSpecialists.jsp">View Specialists</a>
        </div>
    </div>
</div>

</body>
</html>
