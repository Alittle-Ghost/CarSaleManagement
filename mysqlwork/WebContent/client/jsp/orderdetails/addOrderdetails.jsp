<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="DoAddOrderdetails.jsp" method="post">
		<table align="center">
			<tr>
				<td align="center" colspan="2">
					<h2>添加订单</h2>
					<hr>
				</td>
			</tr>
			<tr>
				<td align="right">订单编号</td>
				<td><input type="text" name="orderNumber">
			</tr>
			<tr>
				<td align="right">产品编号</td>
				<td><input type="text" name="productCode">
			</tr>
			<tr>
				<td align="right">已成交单数</td>
				<td><input type="text" name="quantityOrdered">
			</tr>
			<tr>
				<td align="right">成交金额</td>
				<td><input type="text" name="priceEach">
			</tr>
			<tr>
				<td align="right">进行中单数</td>
				<td><input type="text" name="orderLineNumber">
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="submit" value="添　加">
				</td>
			</tr>	
		</table>
	</form>

</body>
</html>