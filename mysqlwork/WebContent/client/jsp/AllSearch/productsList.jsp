<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="mysqlwork.model.Products,
		mysqlwork.dao.ProductsDao,
		mysqlwork.model.ProductLine,
		mysqlwork.dao.ProductLineDao,
		java.util.*"
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
<title>产品查询</title>
</head>
<body>
	<div class="container">
		<h1 class="display-4">
			<p class="text-center">产品</p>
		</h1>
	</div>
	<div class="container">
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<thead class="thead-dark">
					<tr>
						<th>ProductCode</th>
						<th>ProductName</th>
						<th>ProductLine</th>
						<th>ProductScale</th>
						<th>ProductVendor</th>
						<th>QuantityInStock</th>
						<th>BuyPrice</th>
						<th>MSRP</th>
						<th></th>
					</tr>
				</thead>
				<%
					List<Products> pdlist = null;
					if (session.getAttribute("pdlist") != null) {
						pdlist = (List<Products>) session.getAttribute("pdlist");
						//System.out.print(pdlist);
					}
					if (pdlist == null || pdlist.size() == 0) {
						out.println("查询失败");
					} else {
						for (Products pd : pdlist) {
				%>
				<tr>
			<th>
				<%out.println(pd.getProductCode());%>
			</th>
			<th>
				<%out.println(pd.getProductName());%>
			</th>
			<th>
				<%out.println(pd.getProductLine());%>
			</th>
			<th>
				<%out.println(pd.getProductScale());%>
			</th>
			<th>
				<%out.println(pd.getProductVendor());%>
			</th>
			<th>
				<%out.println(pd.getQuantityInStock());%>
			</th>
			<th>
				<%out.println(pd.getBuyPrice());%>
			</th>
			<th>
				<%out.println(pd.getMSRP());%>
			</th>
			<th>
			<%String temp = pd.getProductLine(); 
			session.setAttribute("temp",temp);%>
			 <input type="button" value="订单详情" onclick="javascript:window.location.href='PPList.jsp'"/> 
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



