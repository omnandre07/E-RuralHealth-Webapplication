<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="e_health.Dbconnection" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add Patient Case - Arogya Vibhag</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #fff3e0;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #ff6f00;
            color: white;
            padding: 15px 30px;
            font-size: 18px;
            display: flex;
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
        .container {
            width: 90%;
            max-width: 600px;
            margin: 50px auto;
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        h1 {
            color: #ff6f00;
            text-align: center;
            margin-bottom: 30px;
        }
        input, select {
            width: 100%;
            padding: 12px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
        }
        button {
            background-color: #ff9800;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
        }
        button:hover {
            background-color: #fb8c00;
        }
        .success {
            color: green;
            text-align: center;
            font-weight: bold;
        }
        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="navbar">
    <span>Rural E-Health</span>
    <a href="arogyaMain.jsp">Back to Dashboard</a>
</div>

<div class="container">
    <h1>Add Patient Case</h1>
    <form method="post">
        <input type="text" name="name" placeholder="Patient Name" required>
        <input type="number" name="age" placeholder="Age" required>
        <select name="gender" required>
            <option value="">Select Gender</option>
            <option>Male</option>
            <option>Female</option>
            <option>Other</option>
        </select>
        <input type="text" name="address" placeholder="Address" required>
        <input type="text" name="mobile" placeholder="Mobile Number" required>
        <input type="text" name="symptom1" placeholder="Symptom 1" required>
        <input type="text" name="symptom2" placeholder="Symptom 2">
        <input type="text" name="symptom3" placeholder="Symptom 3">
        <button type="submit">Submit Case</button>
    </form>

<%
    String name = request.getParameter("name");
    if (name != null) {
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String mobile = request.getParameter("mobile");
        String s1 = request.getParameter("symptom1").toLowerCase();
        String s2 = request.getParameter("symptom2") != null ? request.getParameter("symptom2").toLowerCase() : "";
        String s3 = request.getParameter("symptom3") != null ? request.getParameter("symptom3").toLowerCase() : "";
        int assignedTo = 0;
        try {
            Connection con = Dbconnection.connect();
            PreparedStatement ps = con.prepareStatement("SELECT id, disease_treat FROM specialist_doctor");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int docId = rs.getInt("id");
                String disease = rs.getString("disease_treat").toLowerCase();
                if (disease.equals(s1) || disease.equals(s2) || disease.equals(s3)) {
                    assignedTo = docId;
                    break;
                }
            }
            if (assignedTo != 0) {
                PreparedStatement insert = con.prepareStatement(
                    "INSERT INTO patient_case (patient_name, age, gender, address, mobile, symptom1, symptom2, symptom3, specialist_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
                insert.setString(1, name);
                insert.setInt(2, Integer.parseInt(age));
                insert.setString(3, gender);
                insert.setString(4, address);
                insert.setString(5, mobile);
                insert.setString(6, s1);
                insert.setString(7, s2);
                insert.setString(8, s3);
                insert.setInt(9, assignedTo);
                insert.executeUpdate();
                con.close();
%>
                <p class="success">Case submitted and assigned to specialist ID: <%= assignedTo %></p>
<%
            } else {
%>
                <p class="error">No matching specialist found for the entered symptoms.</p>
<%
            }
        } catch (Exception e) {
            out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
        }
    }
%>

</div>
</body>
</html>
