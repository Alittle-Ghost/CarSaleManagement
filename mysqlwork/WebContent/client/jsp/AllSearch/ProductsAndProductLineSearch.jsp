<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>产品查询</title>
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
		<form action="PAPControl.jsp" method="post" name="forms">
			Please insert productCode: <input type="text"
				name="productCode" /><br /> <input type="submit" value="search"
				style="width: 200px" />
		</form>
	</div>
</body>
</html>










