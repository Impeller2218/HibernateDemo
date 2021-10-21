<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Success page</title>
</head>
<body>
<h2>Employee ${emp.empName} Created...</h2>
 <h4>Phone: <%= request.getParameter("empPhoneNum") %></h4> 
<h4>Experience: ${emp.experience}</h4> 
<h4>DOB :${emp.dob}</h4> 
<br>
<form action="goIndex" method="post">
<input type="submit" value="Index page" style="color:white;font-weight:bold; background-color:black;border-radius:9px;height:30px;width:150px">
</form> 
</body>
</html>