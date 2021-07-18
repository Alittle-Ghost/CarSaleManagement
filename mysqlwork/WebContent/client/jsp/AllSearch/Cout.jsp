<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="mysqlwork.model.Customers,
			mysqlwork.dao.CustomersDao,
			mysqlwork.model.Order,
			mysqlwork.dao.OrderDao,
			mysqlwork.model.Payments,
			mysqlwork.dao.PaymentsDao,
			java.util.List"
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
<title>客户订单查询</title>
</head>
<body>
<div class="container">
		<h1 class="display-4">
			<p class="text-center">客户</p>
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
						<td><b>Delete</b></td>
					</tr>
				</thead>
				<%
				List<Customers> list = null;
				if(session.getAttribute("clist")!=null){
					list = (List<Customers>) session.getAttribute("clist");
					//System.out.print("list");
				}
				if(list == null || list.size() == 0){
					out.println("查询失败");
				}else{
					for(Customers cus : list){
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
			</table>

		</div>
	</div>

	
<div class="container">
		<h1 class="display-4">
			<p class="text-center">订单</p>
		</h1>
	</div>
	<div class="container">
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<thead class="thead-dark">
					<tr>
						<th>OrderNumber</th>
			<th>orderDate</th>
			<th>requiredDate</th>
			<th>shippedDate</th>
			<th>status</th>
			<th>comments</th>
			<th>customerNumber</th>
					</tr>
				</thead>
				<%
				List<Order> olist = null;
				if(session.getAttribute("olist")!=null){
					olist = (List<Order>) session.getAttribute("olist");
				}
				if(olist == null || olist.size() == 0){
					out.println("查询失败");
				}else{
					for(Order or  : olist){
				%>
				<tr>
					<th>
				<%out.println(or.getOrderNumber());%>
			</th>
			<th>
				<%out.println(or.getOrderDate());%>
			</th>
			<th>
				<%out.println(or.getRequireDate());%>
			</th>
			<th>
				<%out.println(or.getShippedDate());%>
			</th>
			<th>
				<%out.println(or.getStatus());%>
			</th>
			<th>
				<%out.println(or.getComments());%>
			</th>
			<th>
				<%out.println(or.getCustomerNumber());%>
	    	</th>
				</tr>
		<%
						} 
			}
		%>
			</table>

		</div>
	</div>



<div class="container">
		<h1 class="display-4">
			<p class="text-center">支付</p>
		</h1>
	</div>
	<div class="container">
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<thead class="thead-dark">
					<tr>
						<th>CustomerNumber</th>
			<th>checkNumber</th>
			<th>paymentDate</th>
			<th>amount</th>
					</tr>
				</thead>
				<%
				List<Payments> plist = null;
				if(session.getAttribute("plist")!=null){
					plist = (List<Payments>) session.getAttribute("plist");
				}
				if(plist == null || plist.size() == 0){
					out.println("查询失败");
				}else{
					for(Payments pay  : plist){
				%>
				<tr>
					<th>
				<%out.println(pay.getCustomerNumber());%>
			</th>
			<th>
				<%out.println(pay.getCheckNumber());%>
			</th>
			<th>
				<%out.println(pay.getPaymentDate());%>
			</th>
			<th>
				<%out.println(pay.getAmount());%>
			</th>
				</tr>
		<%
						} 
			}
		%>
			</table>

		</div>
	</div>
</body>
</html>