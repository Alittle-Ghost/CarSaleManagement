<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="mysqlwork.model.Orderdetails,mysqlwork.dao.OrderdetailsDao,java.util.*"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
<title>OrderdetailsList</title>
</head>
<body>

	<div class="container"> 
	<h1 class="display-4">
		<p class="text-center">订单状态</p>	
	</h1>	
  	</div>
		<%
		if(session.getAttribute("emNum")!=null){
			int orderNumber = Integer.parseInt(session.getAttribute("emNum").toString());
			List<Orderdetails> list = OrderdetailsDao.getAllOrderdetails(orderNumber);
		}
	
	%>
<div class="container">          
<div class="table-responsive">     
  <table class="table table-bordered table-hover">
    <thead class="thead-dark">

		<tr>
			<th>OrderNumber</th>
			<th>ProductCoode</th>
			<th>quantityOrdered</th>
			<th>priceEach</th>
			<th>OrderLineNumber</th>
		</tr>
	</thead>		

		<%
		
		if(session.getAttribute("emNum")!=null){
			int orderNumber = Integer.parseInt(session.getAttribute("emNum").toString());
			List<Orderdetails> list = OrderdetailsDao.getAllOrderdetails(orderNumber);

				for (Orderdetails cus : list) {
		%>
						<tr>
							<th><%=cus.getOrderNumber()%></th>
							<th><%=cus.getProductCode()%></th>
							<th><%=cus.getQuantityOrdered()%></th>
							<th><%=cus.getPriceEach()%></th>
							<th><%=cus.getOrderLineNumber()%></th>
							<td><a href="delInfo.jsp?id=<%=cus.getOrderNumber()%>">删除</a></td>

						</tr>	
						
		<%
  			} 
 			} 
		%> 
			<tr>
				<td colspan="14" align="center" bgcolor="#e1ffc1"><a
				href="addOrderdetails.jsp">添加订单detail</a></td>
			<tr>
			<td colspan="14" align="center" bgcolor="#e1ffc1">${pagebar }
				</td>
			</tr>

			</table>
		</div>
	</div>

</body>
</html>