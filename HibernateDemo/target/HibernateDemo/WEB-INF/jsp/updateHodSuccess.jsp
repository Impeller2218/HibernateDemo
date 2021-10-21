<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update done</title>
</head>
<body>
<h2 style="color:green">Department ${dept.deptId} Updated...</h2>
<h4>Dept Hod has been set to :${dept.getHodEmployee().getEmpId()}</h4> 
<br>
</body>
</html>