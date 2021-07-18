<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="mysqlwork.model.Products,
			mysqlwork.dao.ProductsDao,java.util.List"
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
<title>ProductList</title>
</head>
<body>
	<div class="container">
		<h1 class="display-4">
			<p class="text-center">商品列表</p>
		</h1>
	</div>
<%-- 	<%
		if (session.getAttribute("emNum") != null) {
			int productCode = Integer.parseInt(session.getAttribute("emNum").toString());
			List<Products> list = ProductsDao.getAllProducts(productCode);
		}
	%> --%>
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
						<th>ProductDescription</th>
						<th>QuantityInStock</th>
						<th>BuyPrice</th>
						<th>MSRP</th>
					</tr>
				</thead>
				<%
					if (session.getAttribute("emNum") != null) {
						int productCode = Integer.parseInt(session.getAttribute("emNum").toString());
						List<Products> list = ProductsDao.getAllProducts(productCode);
						for (Products em : list) {
				%>
				<tr>
					<th>
						<%
							out.println(em.getProductCode());
						%>
					</th>
					<th>
						<%
							out.println(em.getProductName());
						%>
					</th>
					<th>
						<%
							out.println(em.getProductLine());
						%>
					</th>
					<th>
						<%
							out.println(em.getProductScale());
						%>
					</th>
					<th>
						<%
							out.println(em.getProductVendor());
						%>
					</th>
					<th>
						<%
							out.println(em.getProductDescription());
						%>
					</th>
					<th>
						<%
							out.println(em.getQuantityInStock());
						%>
					</th>
					<th>
						<%
							out.println(em.getBuyPrice());
						%>
					</th>
					<th>
						<%
							out.println(em.getMSRP());
						%>
					</th>
					<td><a href="elInfo.jsp?id=<%=em.getProductCode()%>">删除</a></td>
				</tr>
				<%
					}
					}
				%>
				<tr>
					<td colspan="14" align="center" bgcolor="#e1ffc1"><a
						href="addProducts.jsp">添加商品</a></td>
				<tr>
					<td colspan="14" align="center" bgcolor="#e1ffc1">${pagebar }
					</td>
				</tr>
			</table>
		</div>
	</div>


</body>
</html>