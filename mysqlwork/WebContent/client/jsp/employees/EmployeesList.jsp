<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="mysqlwork.model.Employees,
			mysqlwork.dao.EmployeesDao,java.util.List"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
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
				List<Employees> list = null;
				if (request.getAttribute("Alllist") != null) {
					list = (List<Employees>) request.getAttribute("Alllist");
				}
				if (list == null || list.size() == 0) {
					out.println("没有数据！");
				} else {
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

		</tr>
		<%}}%>
			<tr>
			<td colspan="14" align="center" bgcolor="#e1ffc1">${pagebar }
				</td>
			</tr>
		</table>
	</div>	
</div>	
           

</body>
</html>