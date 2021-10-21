<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,model.Project" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Project details</title>
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
<%ArrayList<Project> projectList = (ArrayList)request.getAttribute("projectList");
%>
<h2 style="color:green">Project details</h2>
<table>
<tr style="color:DarkSlateGray;font-size:20px; font-weight:bold;text-align:center;">
<td>Project Id</td><td>Project Name</td><td>Lead Id</td><td>Lead Name</td><td>Lead Phone</td>
</tr>
<%for(Project project:projectList){
	out.print("<tr>");
	out.println("<td>"+project.getProjectID()+"</td>");
	out.println("<td>"+project.getProjectName()+"</td>");
	if(project.getLeadEmployee()!=null){
	out.println("<td>"+project.getLeadEmployee().getEmpId()+"</td>");
	out.println("<td>"+project.getLeadEmployee().getEmpName()+"</td>");
	out.println("<td>"+project.getLeadEmployee().getEmpPhoneNum()+"</td>");
	}else{
	out.println("<td>NA</td>");
	out.println("<td>NA</td>");
	out.println("<td>NA</td>");
	}out.print("</tr>");
	}%>
</table>
</body>
</html>






