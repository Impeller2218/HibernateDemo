<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,model.Employee" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pagination</title>
</head>
<body>
<h3>Pagination</h3>
<%
Long count=null;
if(request.getAttribute("empCount")!=null){
count=(Long)request.getAttribute("empCount");
}else{
	count=(Long)pageContext.getAttribute("count",pageContext.APPLICATION_SCOPE);
}
System.out.println(count);
//int pages=(int)Math.ceil(count/10);
int pages=count!=null?(int)Math.ceil(count/10):(int)pageContext.getAttribute("pages",pageContext.APPLICATION_SCOPE);
if(request.getAttribute("empCount")!=null){
pageContext.setAttribute("pages",pages,pageContext.APPLICATION_SCOPE);
pageContext.setAttribute("count",count,pageContext.APPLICATION_SCOPE);
}
int rem=(int)(count%10);
if(rem>0)
	pages++;
System.out.println(pages);
String serverName=request.getServerName();
System.out.println(serverName);
int serverPort=request.getServerPort();
System.out.println(serverPort);
System.out.println(request.getContextPath());
%>
<%
boolean flag=false;
ArrayList<Employee> empList=null;
if(request.getAttribute("pageList")!=null){
empList = (ArrayList)request.getAttribute("pageList");
flag=true;
}%>
<%if(flag){ %>
<h2 style="color:green">Employee details</h2>
<table>
<tr style="color:DarkSlateGray;font-size:20px; font-weight:bold;text-align:center;">
<td>EmpId</td><td>Name</td>
<td>Experience</td><td>DOB</td><td>Phone</td><td>Salary</td>
</tr>
<%for(Employee emp:empList){
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
<%} %>
<br>

	<%for(int i=1;i<=pages;i++){%>
	<%-- <a href="//HibernateDemo/employee/getPage/<%=i%>">Page <%=i%></a>/ --%>
	<a href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/employee/getPage/<%=i%>">Page <%=i%></a>/
	<%} %>

<%-- <c:forEach var="i" begin="1" end="${pages}">
	<a href="getPage/${i}">page {i}</a>/&nbsp;
</c:forEach> --%>
</body>
</html>