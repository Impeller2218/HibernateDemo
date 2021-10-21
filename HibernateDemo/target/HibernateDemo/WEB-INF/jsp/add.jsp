<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="springform" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Employee</title>
<style>
label{
font-weight:bold;
}
input{
width:170px;
height:17px;
}
.div1{
display:inline-block;
}
</style>
</head>
<body>
<div class="div1">
<h2>Enter employee details</h2><!--    <form action="add" method="post">
	<h3>Enter Name : <input type="text" name="empName"/></h3>
	<h3>Enter Phone: <input type="text" name="empPhoneNum"/></h3>
	<h3>Enter Experience: <input type="text" name="experience"/></h3>
	<h3>DOB (DD/MM/YYYY): <input type="text" name="dob"/></h3>
	<input type="submit" value="Create"/>
</form>  --> 

    <springform:form action="add" modelAttribute="emp" method="POST" style="background-color:darkseagreen;width:400px;height:400px;border-radius:10px">
	<springform:errors path="*"  cssClass="error" style="color:red; margin-left:15px;font-weight:bold;"/>
	<br><br>
	<springform:label path="empName" style="margin-left:17px;">Employee Name: </springform:label>
	<springform:input path="empName" />
		<br><br>
	<springform:label path="empPhoneNum" style="margin-left:17px;">Employee Phone: </springform:label>
	<springform:input path="empPhoneNum" />
			<br><br>
	<springform:label path="experience" style="margin-left:17px;">Emp Experience:</springform:label>
	<springform:input path="experience" />
	<br><br>
	<springform:label path="dob">DOB (dd/mm/yyyy):</springform:label>
	<springform:input path="dob"   cssClass="datepicker" />
 	<br><br>
	<springform:label path="salary" style="margin-left:85px;">Salary:</springform:label>
	<springform:input path="salary"  /> 
<%-- 	<br><br>
	<springform:label path="department">Department:</springform:label>
	<springform:input path="department" type="int" />
	<br><br>  --%>
	<input type="submit" value="Add Employee" style="margin-left:100px;color:white;background-color:black;font-weight:bold; width:170px;height:35px;border-radius:9px;">
	
</springform:form>
<br>
<form action="goIndex">
	<input type="submit" value="Go Home" style="margin-left:100px;color:white;background-color:red;font-weight:bold; width:170px;height:35px;border-radius:9px;">
</form>
</div>

</body>
</html>