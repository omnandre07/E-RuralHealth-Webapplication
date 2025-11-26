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
<form action="erdelete.jsp">
<% 
Connection con=Dbconnection.connect();
String id=request.getParameter("id");
try{
PreparedStatement pstmt=con.prepareStatement("delete from arogya_vibhag where id=?");
pstmt.setString(1,id);
int i=pstmt.executeUpdate();
if(i>0){
	response.sendRedirect("viewArogyaVibhag.jsp?msg=deleted+successfully");
}
}
catch(Exception e){
	e.printStackTrace();

}
%>
</form>
</body>
</html>
