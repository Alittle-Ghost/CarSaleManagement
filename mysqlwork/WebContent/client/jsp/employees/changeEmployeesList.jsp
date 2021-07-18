<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="mysqlwork.model.Employees,
			mysqlwork.dao.EmployeesDao,java.util.List"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>EmployeeList</title>
</head>
<body>
	<div class="container"> 
	<h1 class="display-4">
		<p class="text-center">员工列表</p>	
	</h1>	
  	</div>
	
<div class="container">          
<div class="table-responsive">     
  <table class="table table-bordered table-hover">
    <thead class="thead-dark">
      <tr>
       		<th>EmployeeNumber</th>
			<th>LastName</th>
			<th>FirstName</th>
			<th>Extension</th>
			<th>Email</th>
			<th>OfficeCode</th>
			<th>ReportsTo</th>
			<th>JobTitle</th>
      </tr>
    </thead>
		<%
		if (session.getAttribute("emNum") != null) {
			int reportTo = Integer.parseInt(session.getAttribute("emNum").toString());
			List<Employees> list = EmployeesDao.getAllEmployees(reportTo);
				for (Employees em : list) {
		%>

		<tr>
			<th><%out.println(em.getEmployeeNumber());%></th> 
			<th>
				<%out.println(em.getLastName());%>
			</th>
			<th>
				<%out.println(em.getFirstName());%>
			</th>
			<th><%out.println(em.getExtension());%></th> 
			<th>
				<%out.println(em.getEmail());%>
			</th>
			<th><%out.println(em.getOfficeCode());%></th> 
			<th><%out.println(em.getReportsTo());%></th> 
			<th>
				<%out.println(em.getJobTitle());%>
			</th>
			<td><a href="delInfo.jsp?id=<%=em.getEmployeeNumber()%>">删除</a></td>
			

		</tr>
		<%}}%>
		<tr>
				<td colspan="14" align="center" bgcolor="#e1ffc1"><a
				href="addEmployees.jsp">添加用户</a></td>
			</tr>
			<tr>
			<td colspan="14" align="center" bgcolor="#e1ffc1">${pagebar }
				</td>
			</tr>
		</table>
	</div>	
</div>	
           

</body>
</html>