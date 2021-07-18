<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="DoAddCustomers.jsp" method="post">
		<table align="center">
			<tr>
				<td align="center" colspan="2">
					<h2>添加客户信息</h2>
					<hr>
				</td>				
			</tr>
			<tr>
				<td align="right">客户编号</td>
				<td><input type="text" name="customersNumber" /></td>
			</tr>
			<tr>
				<td align="right">客户名称</td>
				<td><input type="text" name="customersName" /></td>
			</tr>
			<tr>
				<td align="right">客户姓氏</td>
				<td><input type="text" name="contactLastName" /></td>
			</tr>
			<tr>
				<td align="right">客户名字</td>
				<td><input type="text" name="contactFirstName" /></td>
			</tr>
			<tr>
				<td align="right">电话号码</td>
				<td><input type="text" name="phone" /></td>
			</tr>
			<tr>
				<td align="right">地址1</td>
				<td><input type="text" name="addressLine2" /></td>
			</tr>
			<tr>
				<td align="right">地址2</td>
				<td><input type="text" name="addressLine2" /></td>
			</tr>
			<tr>
				<td align="right">城市</td>
				<td><input type="text" name="city" /></td>
			</tr>
			<tr>
				<td align="right">state</td>
				<td><input type="text" name="state" /></td>
			</tr>
			<tr>
				<td align="right">邮编</td>
				<td><input type="text" name="postalCode" /></td>
			</tr>
			<tr>
				<td align="right">国家</td>
				<td><input type="text" name="country" /></td>
			</tr>
			<tr>
				<td align="right">销售代表号</td>
				<td><input type="text" name="salesRepEmployeeNumber" /></td>
			</tr>
			<tr>
				<td align="right">信用证号码</td>
				<td><input type="text" name="creditLimit" /></td>
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