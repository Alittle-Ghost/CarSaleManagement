<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>客户订单查询</title>
<style type="text/css">
#search {
	margin-top: 20%; 
	margin-left: 25%;
	background: skyblue;
	border-radius: 20px;
	height: 70px;
	width: 500px;
	color: #FFD700 ;
}


</style>
</head>
<body>
<table>
	<div align="center" id="search">
		<form action="COSControl.jsp" method="post" name="forms">
			Please insert CustomerNumber: <input type="text"
				name="customerNumber" /><br /> <input type="submit" value="search"
				style="width: 200px" />
		</form>
	</div>
</table>	
</body>
</html>