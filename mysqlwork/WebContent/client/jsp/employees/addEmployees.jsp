<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="DoAddEmployees.jsp" method="post">
		<table align="center">
			<tr>
				<td align="center" colspan="2">
					<h2>添加用户信息</h2>
					<hr>
				</td>
			</tr>
			<tr>
				<td align="right">员工编号</td>
				<td><input type="text" name="employeesNumber">
			</tr>
			<tr>
				<td align="right">员工姓氏</td>
				<td><input type="text" name="employeesLastName">
			</tr>
			<tr>
				<td align="right">员工名字</td>
				<td><input type="text" name="employeesFirstNumber">
			</tr>
			<tr>
				<td align="right">电话号码</td>
				<td><input type="text" name="extension">
			</tr>
			<tr>
				<td align="right">员工邮箱</td>
				<td><input type="text" name="email">
			</tr>
			<tr>
				<td align="right">所在公司</td>
				<td><input type="text" name="officeCode">
			</tr>
			<tr>
				<td align="right">员工上级</td>
				<td><input type="text" name="reports To">
			</tr>
			<tr>
				<td align="right">工作职位</td>
				<td><input type="text" name="JobTitle">
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