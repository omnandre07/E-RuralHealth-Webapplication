<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="e_health.Dbconnection" %>
<%@ page import="e_health.getSet" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Specialist Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #fff8e1;
        }

        .navbar {
            width: 100%;
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

        h1 {
            text-align: center;
            color: #ff6f00;
            margin: 30px 0;
        }

        .container {
            width: 95%;
            margin: 0 auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #ffb74d;
            color: white;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        textarea {
            width: 95%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        .submit-btn {
            padding: 8px 15px;
            background-color: #ff9800;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background-color: #f57c00;
        }

        .no-cases {
            text-align: center;
            font-size: 18px;
            color: #888;
        }
    </style>
</head>
<body>

<div class="navbar">
    <span>Rural E-Health - Specialist Dashboard</span>
    <a href="Index.jsp">Logout</a>
</div>

<div class="container">
    <h1>Assigned Patient Cases</h1>

    <%
        getSet specialist = (getSet) session.getAttribute("specialist");
        if (specialist == null) {
            response.sendRedirect("splogin.jsp");
            return;
        }

        int specialistId = specialist.getSpecialist_id();

        try {
            Connection con = Dbconnection.connect();

            String comment = request.getParameter("comment");
            String prescription = request.getParameter("prescription");
            String caseId = request.getParameter("case_id");

            if (comment != null && prescription != null && caseId != null) {
                PreparedStatement update = con.prepareStatement(
                    "UPDATE patient_case SET comment=?, prescription=? WHERE id=?"
                );
                update.setString(1, comment);
                update.setString(2, prescription);
                update.setInt(3, Integer.parseInt(caseId));
                update.executeUpdate();
            }

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM patient_case WHERE specialist_id=?"
            );
            ps.setInt(1, specialistId);
            ResultSet rs = ps.executeQuery();

            if (!rs.isBeforeFirst()) {
    %>
                <p class="no-cases">No cases assigned to you currently.</p>
    <%
            } else {
    %>
    <table>
        <tr>
            <th>Patient Name</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Symptoms</th>
            <th>Comment</th>
            <th>Prescription</th>
            <th>Action</th>
        </tr>
        <%
            while(rs.next()) {
        %>
        <form method="post">
            <tr>
                <td><%= rs.getString("patient_name") %></td>
                <td><%= rs.getInt("age") %></td>
                <td><%= rs.getString("gender") %></td>
                <td><%= rs.getString("symptom1") %>, <%= rs.getString("symptom2") %>, <%= rs.getString("symptom3") %></td>
                <td>
                    <textarea name="comment" rows="3"><%= rs.getString("comment") == null ? "" : rs.getString("comment") %></textarea>
                </td>
                <td>
                    <textarea name="prescription" rows="3"><%= rs.getString("prescription") == null ? "" : rs.getString("prescription") %></textarea>
                </td>
                <td>
                    <input type="hidden" name="case_id" value="<%= rs.getInt("id") %>">
                    <button type="submit" class="submit-btn">Save</button>
                </td>
            </tr>
        </form>
        <%
            }
        %>
    </table>
    <%
            }
            con.close();
        } catch(Exception e) {
            out.println("<p class='no-cases'>Error: " + e.getMessage() + "</p>");
        }
    %>
</div>

</body>
</html>
