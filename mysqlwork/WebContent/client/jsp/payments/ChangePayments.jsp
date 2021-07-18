<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="mysqlwork.model.Payments,
			mysqlwork.dao.PaymentsDao,java.util.List"
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
<title>PaymentsList</title>
</head>
<body>
		<div class="container"> 
	<h1 class="display-4">
		<p class="text-center">客户付款信息</p>	
	</h1>	
  	</div>
		<%
		if(session.getAttribute("emNum")!=null){
			int CustomerNumber = Integer.parseInt(session.getAttribute("emNum").toString());
			List<Payments> list = PaymentsDao.getAllPayments(CustomerNumber);
		}
	
	%>
	
	
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
		if(session.getAttribute("emNum")!=null){
			int CustomerNumber = Integer.parseInt(session.getAttribute("emNum").toString());
			List<Payments> list = PaymentsDao.getAllPayments(CustomerNumber);
				for (Payments em : list) {
		%>

		<tr>
			<th>
				<%out.println(em.getCustomerNumber());%>
			</th>
			<th>
				<%out.println(em.getCheckNumber());%>
			</th>
			<th>
				<%out.println(em.getPaymentDate());%>
			</th>
			<th>
				<%out.println(em.getAmount());%>
			</th>
			<td><a href="delInfo.jsp?id=<%=em.getCustomerNumber()%>">删除</a></td>
			

		</tr>
		<%}}%>
		<tr>
				<td colspan="14" align="center" bgcolor="#e1ffc1"><a
				href="addPayment.jsp">添加订单详情</a></td>
			<tr>
			<td colspan="14" align="center" bgcolor="#e1ffc1">${pagebar }
				</td>
			</tr>
		</table>
	</div>	
</div>	
           

</body>
</html>