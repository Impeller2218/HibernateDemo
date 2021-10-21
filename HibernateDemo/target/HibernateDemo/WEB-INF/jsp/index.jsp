<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
        <%-- <%@taglib uri="http://www.springframework.org/tags/form" prefix="springform" %>  --%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Index</title>
</head>
<body>
<h1>Hibernate demo</h1><br>
<form action="index" method="post">
<input type="submit" value="Add Employee Page" style="color:white;font-weight:bold; background-color:red;border-radius:9px;height:30px;width:150px">
</form>
<br>
<form action="showAllEmployees" method="post">
<input type="submit" value="Show all employees" style="color:white;font-weight:bold; background-color:green;border-radius:9px;height:30px;width:150px">
</form>
<br>
<form action="distinctEmployees" method="post">
<input type="submit" value="Distinct employees" style="font-weight:bold; background-color:yellow;border-radius:9px;height:30px;width:150px">
</form>
<br>
<form action="employeeListHbq" method="post">
<input type="submit" value="empList Hbq" style="font-weight:bold; background-color:teal;border-radius:9px;height:30px;width:150px">
</form>
<br>
<form action="page" method="post">
<input type="submit" value="Pagination emp" style="font-weight:bold; background-color:DarkSalmon;border-radius:9px;height:30px;width:150px">
</form>
<br>
<div style="border:4px solid black;margin-top:15px;margin-bottom:5px;width:400px;height:150px;border-radius:10px;">
<h2 style="color:slateblue;margin-left:15px;">Fetch employee details</h2>
<form action="fetch" method="post">
<h3 style="margin-left:15px;">Enter empId : <input type="number" name="empId"/></h3>
<input type="submit" value="Get details" style="color:white;margin-left:130px;;font-weight:bold; background-color:blue;border-radius:9px;height:30px;width:150px">
</form>
</div>
</body>
</html>