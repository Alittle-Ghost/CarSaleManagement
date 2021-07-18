<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="mysqlwork.model.Order,
			mysqlwork.dao.OrderDao,java.util.List"
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
<title>ProductList</title>
</head>
<body>
	<div class="container"> 
	<h1 class="display-4">
		<p class="text-center">订单信息</p>	
	</h1>	
  	</div>
	<%
	request.setCharacterEncoding("UTF-8");
	Order em = new Order();
	List<Order> emlist = OrderDao.showAllOrder();

%>
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
for(int i = 0; i < emlist.size(); i++){
em=emlist.get(i);
//out.println(emlist.get(i));
%>

		<tr>
			<th>
				<%out.println(em.getOrderNumber());%>
			</th>
			<th>
				<%out.println(em.getOrderDate());%>
			</th>
			<th>
				<%out.println(em.getRequireDate());%>
			</th>
			<th>
				<%out.println(em.getShippedDate());%>
			</th>
			<th>
				<%out.println(em.getStatus());%>
			</th>
			<th>
				<%out.println(em.getComments());%>
			</th>
			<th>
				<%out.println(em.getCustomerNumber());%>
	    	</th>
		</tr>
		<%}%>
	</table>
</div>	
 
</div>		
</body>
</html>
