<%@ page language="java" contentType="text/html; charset=UTF-8"
import="mysqlwork.model.Employees,
		mysqlwork.dao.EmployeesDao,
		java.util.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>changeEmail</title>
<style>
#change {
	margin-top: 20%; 
	margin-left: 25%;
	background: skyblue;
	border-radius: 20px;
	height: 70px;
	width: 500px;
	color: #FFD700 ;
}
</style>
</head>
<body>
<% int eNum = Integer.parseInt(session.getAttribute("emNum").toString()); %>
	<div align="center" id="change">
		<form action="EChange.jsp" method="post" name="forms">
			Please insert your new email: <input type="text"
				name="email" />
				<input type="hidden" name="employeeNumber" value="<%=eNum %>" />
				 <input type="submit" value="change!"
				style="width: 200px" />
		</form>
	</div>
</body>
</html>

