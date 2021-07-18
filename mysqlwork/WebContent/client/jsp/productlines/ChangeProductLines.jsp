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
		if(session.getAttribute("emNum")!=null){
			int productLine = Integer.parseInt(session.getAttribute("emNum").toString());
			List<ProductLine> list = ProductLineDao.getAllProductLine(productLine);
		}
	
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
		if(session.getAttribute("emNum")!=null){
			int productLine = Integer.parseInt(session.getAttribute("emNum").toString());
			List<ProductLine> list = ProductLineDao.getAllProductLine(productLine);
				for (ProductLine em : list) {
		%>
  	<tr>
			<th>
				<%out.println(em.getProductLine());%>
			</th>
			<th>
				<%out.println(em.getTextDescription());%>
			</th>
			<th>
				<%out.println(em.getHtmlDescription());%>
			</th>
			<th>
			<img src="<%=em.getImage()%>" height="300px"  />
			</th>
			<td><a href="delInfo.jsp?id=<%=em.getProductLine()%>">删除</a></td>
		</tr>
<%}}%>
		<tr>
				<td colspan="14" align="center" bgcolor="#e1ffc1"><a
				href="addProductline.jsp">添加生产线</a></td>
			<tr>
			<td colspan="14" align="center" bgcolor="#e1ffc1">${pagebar }
				</td>
			</tr>
		</table>
	</div>	
</div>	
           

</body>
</html>