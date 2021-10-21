<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,model.BankAccount" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account details</title>
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
<%ArrayList<BankAccount> accountList = (ArrayList)request.getAttribute("accountList");
%>
<h2 style="color:green">BankAccount details</h2>
<table>
<tr style="color:DarkSlateGray;font-size:20px; font-weight:bold;text-align:center;">
<td>Acc Id</td><td>Acc type</td><td>Bank Name</td><td>Ifsc</td>
</tr>
<%for(BankAccount account:accountList){
	out.print("<tr>");
	out.println("<td>"+account.getAccountId()+"</td>");
	out.println("<td>"+account.getAccountType()+"</td>");
	out.println("<td>"+account.getBankName()+"</td>");
	out.println("<td>"+account.getIfsc()+"</td>");
	out.print("</tr>");
	}%>
</table>
</body>
</html>






