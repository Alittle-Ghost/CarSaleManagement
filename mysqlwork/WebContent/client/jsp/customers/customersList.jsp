<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="mysqlwork.model.Customers,mysqlwork.dao.CustomersDao,java.util.List"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>customersList</title>
</head>
<body>

	<div class="container">
		<h1 class="display-4">
			<p class="text-center">客户列表</p>
		</h1>
	</div>

	<div class="container">
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<thead class="thead-dark">
					<tr>
						<td><b>customerNumber</b></td>
						<td><b>customerName</b></td>
						<td><b>customerFirstName</b></td>
						<td><b>customerLastName</b></td>
						<td><b>phone</b></td>
						<td><b>addressline1</b></td>
						<td><b>addressline2</b></td>
						<td><b>city</b></td>
						<td><b>state</b></td>
						<td><b>postalCode</b></td>
						<td><b>country</b></td>
						<td><b>SalesRepEmployeeNumber</b></td>
						<td><b>creditLimit</b></td>
					</tr>
				</thead>

				<%
					List<Customers> list = null;
					if (request.getAttribute("Alllist") != null) {
						list = (List<Customers>) request.getAttribute("Alllist");
					}
					if (list == null || list.size() == 0) {
						out.println("没有数据！");
					} else {
						for (Customers cus : list) {
				%>
				<tr>
					<th><%=cus.getCustomerNumber()%></th>
					<th><%=cus.getCustomerName()%></th>
					<th><%=cus.getContactLastName()%></th>
					<th><%=cus.getContactFirstName()%></th>
					<th><%=cus.getPhone()%></th>
					<th><%=cus.getAddressLine1()%></th>
					<th><%=cus.getAddressLine2()%></th>
					<th><%=cus.getCity()%></th>
					<th><%=cus.getState()%></th>
					<th><%=cus.getPostalCode()%></th>
					<th><%=cus.getCountry()%></th>
					<th><%=cus.getSalesRepEmployeeNumber()%></th>
					<th><%=cus.getCreditlimit()%></th>
				</tr>

				<%
					}
					}
				%>
				<tr>
					<td colspan="14" align="center" bgcolor="#e1ffc1">${pagebar }
					</td>
				</tr>
			</table>
		</div>
	</div>

</body>
</html>