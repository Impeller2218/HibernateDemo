<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,model.Employee" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HomePage</title>
<style type="text/css">
table{
border:3px solid black;
border-collapse:collapse;
width:700px;
}
td{
border:2px solid black;
}
</style>
</head>
<body>
<%ArrayList<Employee> empList = (ArrayList)request.getAttribute("empList");%>
<h2 style="color:green">Employee details</h2>
<table>
<tr style="color:DarkSlateGray;font-size:20px; font-weight:bold;text-align:center;">
<td>EmpId</td><td>Name</td>
<td>Experience</td><td>DOB</td><td>Phone</td><td>Salary</td><td>Dept Id</td><td>Dept name</td>
</tr>
<%for(Employee emp:empList){
	out.print("<tr>");
	out.println("<td>"+emp.getEmpId()+"</td>");
	out.println("<td>"+emp.getEmpName()+"</td>");
	out.println("<td>"+emp.getExperience()+"</td>");
	out.println("<td>"+emp.getDob()+"</td>");
	out.println("<td>"+emp.getEmpPhoneNum()+"</td>");
	out.println("<td>"+emp.getSalary()+" /-</td>");
	out.println("<td>"+emp.getDepartment().getDeptId()+"</td>");
	out.println("<td>"+emp.getDepartment().getDeptName()+"</td>");
	out.print("</tr>");
	}%>
</table>
<br>
<form action="goIndex" method="post">
<input type="submit" value="Index page" style="color:white;font-weight:bold; background-color:black;border-radius:9px;height:30px;width:150px">
</form>
 <h3>Using Jstl core taglib:</h3>
<ul>
	<c:forEach items="${empList}" var="emp">
	<c:set var="eid" scope="session" value="2"/>
<%-- 		<c:if test="${eid==emp.empId }">
		  <li>${emp.empName}</li>
		  <li>${emp.empId}</li>
		  <li>${emp.empPhoneNum}</li>
		  <li>${emp.dob}</li>
		</c:if> --%>
		<c:choose>
		<c:when test="${emp.salary<19000}">
			Basic salaray
		</c:when>
		<c:when test="${emp.salary>19000}">
			Good salaray
		</c:when>
		</c:choose>
	</c:forEach>
</ul> 
</body>
</html>