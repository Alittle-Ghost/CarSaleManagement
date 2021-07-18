<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="DoAddPayments.jsp" method="post">
		<table align="center">
			<tr>
				<td align="center" colspan="2">
					<h2>添加付款状态</h2>
					<hr>
				</td>				
			</tr>
			<tr>
				<td align="right">客户编号</td>
				<td><input type="text" name="customersNumber" /></td>
			</tr>
			<tr>
				<td align="right">支付单号</td>
				<td><input type="text" name="checkNumber" /></td>
			</tr>
			<tr>
				<td align="right">支付时间</td>
				<td><input type="text" name="paymentDate" /></td>
			</tr>
			<tr>
				<td align="right">支付数量</td>
				<td><input type="text" name="amount" /></td>
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