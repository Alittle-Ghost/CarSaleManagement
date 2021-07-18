<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="DoAddOrders.jsp" method="post">
		<table align="center">
			<tr>
				<td align="center" colspan="2">
					<h2>添加客户订单</h2>
					<hr>
				</td>				
			</tr>
			<tr>
				<td align="right">订单编号</td>
				<td><input type="text" name="orderNumber" /></td>
			</tr>
			<tr>
				<td align="right">订单日期</td>
				<td><input type="text" name="orderDate" /></td>
			</tr>
			<tr>
				<td align="right">修理时间</td>
				<td><input type="text" name="requiredDate" /></td>
			</tr>
			<tr>
				<td align="right">发货时间</td>
				<td><input type="text" name="ShippedDate" /></td>
			</tr>
			<tr>
				<td align="right">身份</td>
				<td><input type="text" name="status" /></td>
			</tr>
			<tr>
				<td align="right">评论</td>
				<td><input type="text" name="comments" /></td>
			</tr>
			<tr>
				<td align="right">客户编号</td>
				<td><input type="text" name="CustomerNumber" /></td>
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