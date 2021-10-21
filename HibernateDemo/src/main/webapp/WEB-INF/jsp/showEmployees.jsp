<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,model.Employee" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AllEmployees</title>
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
<%ArrayList<Employee> fullEmpList = (ArrayList)request.getAttribute("fullEmpList");
%>
<h2 style="color:green">Employee details</h2>
<table>
<tr style="color:DarkSlateGray;font-size:20px; font-weight:bold;text-align:center;">
<td>EmpId</td><td>Name</td>
<td>Experience</td><td>DOB</td><td>Phone</td><td>Salary</td>
</tr>
<%for(Employee emp:fullEmpList){
	out.print("<tr>");
	out.println("<td>"+emp.getEmpId()+"</td>");
	out.println("<td>"+emp.getEmpName()+"</td>");
	out.println("<td>"+emp.getExperience()+"</td>");
	out.println("<td>"+emp.getDob()+"</td>");
	out.println("<td>"+emp.getEmpPhoneNum()+"</td>");
	out.println("<td>"+emp.getSalary()+" /-</td>");
	out.print("</tr>");
	}%>
</table>
<br>
<form action="goIndex" method="post">
<input type="submit" value="Index page" style="color:white;font-weight:bold; background-color:black;border-radius:9px;height:30px;width:150px">
</form> 
</body>
</html>






