<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="e_health.Dbconnection" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>View Patient Cases</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #fff8e1;
            margin: 0;
            padding: 0;
        }

        .navbar {
            width: 100%;
            background-color: #ff6f00;
            color: white;
            padding: 20px 40px;
            font-size: 22px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
            box-sizing: border-box;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .navbar a:hover {
            text-decoration: underline;
        }

        h1 {
            text-align: center;
            color: #ff6f00;
            margin: 40px 0 20px;
        }

        .table-container {
            max-width: 95%;
            margin: auto;
            overflow-x: auto;
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #ffb74d;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .no-data {
            text-align: center;
            color: #999;
            margin-top: 50px;
        }

        @media (max-width: 768px) {
            th, td {
                font-size: 14px;
                padding: 10px 8px;
            }

            .navbar {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }

            h1 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>

<div class="navbar">
    <div>Rural E-Health</div>
    <a href="arogyaMain.jsp">Back </a>
</div>

<h1>Patient Cases</h1>

<div class="table-container">
<%
    try {
        Connection con = Dbconnection.connect();
        PreparedStatement ps = con.prepareStatement(
            "SELECT pc.*, sd.name AS specialist_name " +
            "FROM patient_case pc " +
            "LEFT JOIN specialist_doctor sd ON pc.specialist_id = sd.id"
        );
        ResultSet rs = ps.executeQuery();

        if (!rs.isBeforeFirst()) {
%>
    <p class="no-data">No cases found.</p>
<%
        } else {
%>
    <table>
        <tr>
            <th>Patient Name</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Address</th>
            <th>Mobile</th>
            <th>Symptom 1</th>
            <th>Symptom 2</th>
            <th>Symptom 3</th>
            <th>Assigned Specialist</th>
            <th>Comment</th>
            <th>Prescription</th>
            
        </tr>
<%
            while(rs.next()) {
%>
        <tr>
            <td><%= rs.getString("patient_name") %></td>
            <td><%= rs.getInt("age") %></td>
            <td><%= rs.getString("gender") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getString("mobile") %></td>
            <td><%= rs.getString("symptom1") %></td>
            <td><%= rs.getString("symptom2") %></td>
            <td><%= rs.getString("symptom3") %></td>
            <td><%= rs.getString("specialist_name") != null ? rs.getString("specialist_name") : "Not Assigned" %></td>
            <td><%= rs.getString("comment") != null ? rs.getString("comment") : "" %></td>
            <td><%= rs.getString("prescription") != null ? rs.getString("prescription") : "" %></td>
            
        </tr>
<%
            }
%>
    </table>
<%
        }
        con.close();
    } catch(Exception e) {
%>
    <p class="no-data">Error: <%= e.getMessage() %></p>
<%
    }
%>
</div>

</body>
</html>
