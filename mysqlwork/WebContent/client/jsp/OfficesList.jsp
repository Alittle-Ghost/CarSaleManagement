<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="mysqlwork.model.Offices,
			mysqlwork.dao.OfficesDao,java.util.List"
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
<title>OfficesList</title>
</head>
<body>
	<div class="container"> 
	<h1 class="display-4">
		<p class="text-center">公司列表</p>	
	</h1>	
  	</div>
	<%
	request.setCharacterEncoding("UTF-8");
	Offices em = new Offices();
	List<Offices> emlist = OfficesDao.showAllOffices();

%>
<div class="container">          
<div class="table-responsive">     
  <table class="table table-bordered table-hover">
    <thead class="thead-dark">	
		<tr>
			<th>OfficeCode</th>
			<th>city</th>
			<th>phone</th>
			<th>addresslin1</th>
			<th>addresslin2</th>
			<th>state</th>
			<th>country</th>
			<th>postalCode</th>
			
			
		</tr>
	</thead>		

		<%
for(int i = 0; i < emlist.size(); i++){
em=emlist.get(i);
//out.println(emlist.get(i));
%>

		<tr>
			<th><%out.println(em.getOfficescode());%></th> 
			<th>
				<%out.println(em.getCity());%>
			</th>
			<th>
				<%out.println(em.getPhone());%>
			</th>
			<th><%out.println(em.getAddressline1());%></th> 
			<th>
				<%out.println(em.getAddressline2());%>
			</th>
			<th><%out.println(em.getState());%></th> 
			<th><%out.println(em.getPostalcode());%></th> 
			<th>
				<%out.println(em.getTerritory());%>
			</th>


		</tr>
		<%}%>
	</table>
</div>	
  
</div>	
           	
</body>
</html>
