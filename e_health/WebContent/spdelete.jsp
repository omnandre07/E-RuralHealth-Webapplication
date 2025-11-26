<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="e_health.Dbconnection" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");
if (id != null ) {
    try {
        Connection con = Dbconnection.connect();
        PreparedStatement pstmt = con.prepareStatement("DELETE FROM specialist_doctor WHERE id = ?");
        pstmt.setString(1, id);
        int i = pstmt.executeUpdate();

        if (i > 0) {
            response.sendRedirect("viewSpecialists.jsp?msg=Deleted+successfully");
        } else {
            response.sendRedirect("viewSpecialists.jsp?msg=No+record+found+to+delete");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("viewSpecialists.jsp?msg=Error+occurred+while+deleting");
    }
} else {
    response.sendRedirect("viewSpecialists.jsp?msg=Invalid+ID");
}
%>
</body>
</html>