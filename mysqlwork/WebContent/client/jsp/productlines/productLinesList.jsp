<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="mysqlwork.model.ProductLine,
			mysqlwork.dao.ProductLineDao,java.util.List"
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
<title>ProductLinesList</title>
</head>
<body>
	<div class="container"> 
	<h1 class="display-4">
		<p class="text-center">生产商列表</p>	
	</h1>	
  	</div>
	<%
	request.setCharacterEncoding("UTF-8");
	ProductLine em = new ProductLine();
	List<ProductLine> emlist = ProductLineDao.showAllProductLine();

%>
<div class="container">          
<div class="table-responsive">     
  <table class="table table-bordered table-hover">
    <thead class="thead-dark">
		<tr>
			<th>ProductLine</th>
			<th>textDescription</th>
			<th>htmlDescription</th>
			<th>image</th>
		</tr>
	</thead>		

		<%
for(int i = 0; i < emlist.size(); i++){
em=emlist.get(i);
//out.println(emlist.get(i));
%>

		<tr>
			<th>
				<%out.println(em.getProductLine());%>
			</th>
			<th>
				<%out.println(em.getTextDescription());%>
			</th>
<!-- 			<th> -->
<%-- 				<%out.println(em.getHtmlDescription());%> --%>
<!-- 			</th> -->
<!-- 			<th> -->
<%-- 			<img src="<%=em.getImage()%>" height="300px"  /> --%>
<!-- 			</th> -->
	
		</tr>
		
		<%}%>
	</table>
<table>
<tr>
<img src="0eb30f2442a7d93313e8b88076dd1b1672f00119.jpeg" />
</tr>
</table>
	</div>	
</div>	
</body>
</html>