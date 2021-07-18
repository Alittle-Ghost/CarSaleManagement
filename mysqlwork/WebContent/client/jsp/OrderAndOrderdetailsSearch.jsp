<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单详情查询</title>
<style type="text/css">
#search {
	margin-top: 20%; 
	margin-left: 25%;
	background: skyblue;
	border-radius: 20px;
	height: 70px;
	width: 500px;
}
</style>
</head>
<body>
	<div align="center" id="search">
		<form action="OAOControl.jsp" method="post" name="forms">
			Please insert orderNumber: <input type="text"
				name="orderNumber" /><br /> <input type="submit" value="search"
				style="width: 200px" />
		</form>
	</div>
</body>
</html>










