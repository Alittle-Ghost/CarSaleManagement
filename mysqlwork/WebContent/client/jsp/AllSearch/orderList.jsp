<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="mysqlwork.model.Order,
			mysqlwork.dao.OrderDao,
			mysqlwork.model.Orderdetails,
			mysqlwork.dao.OrderdetailsDao,
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
<title>订单详情查询</title>
</head>
<body>
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
					List<Order> oaolist = null;
					if (session.getAttribute("oaolist") != null) {
						oaolist = (List<Order>) session.getAttribute("oaolist");
					}
					if (oaolist == null || oaolist.size() == 0) {
						out.println("查询失败");
					} else {
						for (Order or : oaolist) {
				%>
				<tr>
					<th>
						<%
							out.println(or.getOrderNumber());
						%>
					</th>
					<th>
						<%
							out.println(or.getOrderDate());
						%>
					</th>
					<th>
						<%
							out.println(or.getRequireDate());
						%>
					</th>
					<th>
						<%
							out.println(or.getShippedDate());
						%>
					</th>
					<th>
						<%
							out.println(or.getStatus());
						%>
					</th>
					<th>
						<%
							out.println(or.getComments());
						%>
					</th>
					<th>
						<%
							out.println(or.getCustomerNumber());
						%> 
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
			<p class="text-center">订单详情</p>
		</h1>
	</div>
	<div class="container">
	<div class="table-responsive">
		<table class="table table-bordered table-hover">
			<thead class="thead-dark">

				<tr>
					<th>OrderdetailsNumber</th>
					<th>ProductCoode</th>
					<th>quantityOrdered</th>
					<th>priceEach</th>
					<th>OrderLineNumber</th>
				</tr>
			</thead>
			<%
				List<Orderdetails> odlist = null;
				if (session.getAttribute("odlist") != null) {
					odlist = (List<Orderdetails>) session.getAttribute("odlist");
				}
				if (odlist == null || odlist.size() == 0) {
					out.println("查询失败");
				} else {
					for (Orderdetails od : odlist) {
			%>
			<tr>
				<th>
					<%
						out.println(od.getOrderNumber());
					%>
				</th>
				<th>
					<%
						out.println(od.getProductCode());
					%>
				</th>
				<th>
					<%
						out.println(od.getQuantityOrdered());
					%>
				</th>
				<th>
					<%
						out.println(od.getPriceEach());
					%>
				</th>
				<th>
					<%
						out.println(od.getOrderLineNumber());
					%>
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
 <!--<input type="button" value="订单详情" onclick="javascript:window.location.href='orderdetailsList.jsp'"/> -->
						


