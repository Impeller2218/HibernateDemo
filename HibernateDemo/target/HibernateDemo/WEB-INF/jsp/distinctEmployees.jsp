<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,model.Employee" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>distinctEmployees</title>
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
<%ArrayList<Integer> distinctEmpList = (ArrayList)request.getAttribute("distinctEmpList"); %>
<h2 style="color:green">Distinct Employee details</h2>
<table>
<tr style="color:DarkSlateGray;font-size:20px; font-weight:bold;text-align:center;">
<td>Value</td>
</tr>
<%for(Integer emp:distinctEmpList){
	out.print("<tr>");
	out.println("<td>"+emp+"</td>");
	out.print("</tr>");
	}%>
</table>
<br>
<h3>Using taglib</h3>
<ul>
	<c:forEach items="${distinctEmpList}" var="sal">
		  <li>${sal}</li>
	</c:forEach>
</ul> 
<form action="goIndex" method="post">
<input type="submit" value="Index page" style="color:white;font-weight:bold; background-color:black;border-radius:9px;height:30px;width:150px">
</form>
</body>
</html>