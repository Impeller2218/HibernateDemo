<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,model.Department" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dept details</title>
<style type="text/css">
table{
border:3px solid black;
border-collapse:collapse;
width:550px;
}
td{
border:2px solid black;
}
</style>
</head>
<body>
<%ArrayList<Department> deptList = (ArrayList)request.getAttribute("deptList");
%>
<h2 style="color:green">Department details</h2>
<table>
<tr style="color:DarkSlateGray;font-size:20px; font-weight:bold;text-align:center;">
<td>Dept Id</td><td>Dept Name</td><td>Dept HOD</td><td>Hod EmpId</td><td>Hod Phone</td>
</tr>
<%for(Department dept:deptList){
	out.print("<tr>");
	out.println("<td>"+dept.getDeptId()+"</td>");
	out.println("<td>"+dept.getDeptName()+"</td>");
	out.println("<td>"+dept.getHodName()+"</td>");
	if(dept.getHodEmployee()!=null){
		out.println("<td>"+dept.getHodEmployee().getEmpId()+"</td>");
		out.println("<td>"+dept.getHodEmployee().getEmpPhoneNum()+"</td>");
	}
	else{
		out.println("<td>NA</td>");
		out.println("<td>NA</td>");
	}
	out.print("</tr>");
	}%>
</table>
</body>
</html>






