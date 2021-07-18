<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="mysqlwork.model.Orderdetails,
			mysqlwork.dao.OrderdetailsDao,java.util.List"
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
		<p class="text-center">订单状态</p>	
	</h1>	
  	</div>
	<%
	request.setCharacterEncoding("UTF-8");
	Orderdetails em = new Orderdetails();
	List<Orderdetails> emlist = OrderdetailsDao.showAllOrderdetails();

%>
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
for(int i = 0; i < emlist.size(); i++){
em=emlist.get(i);
//out.println(emlist.get(i));
%>

		<tr>
			<th>
				<%out.println(em.getOrderNumber());%>
			</th>
			<th>
				<%out.println(em.getProductCode());%>
			</th>
			<th>
				<%out.println(em.getQuantityOrdered());%>
			</th>
			<th>
				<%out.println(em.getPriceEach());%>
			</th>
			<th>
				<%out.println(em.getOrderLineNumber());%>
			</th>
			
		</tr>
		<%}%>
	</table>
	</div>	
</div>	
</body>
</html>
