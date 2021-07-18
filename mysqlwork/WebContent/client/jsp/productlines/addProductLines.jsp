<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="DoAddProductLines.jsp" method="post">
		<table align="center">
			<tr>
				<td align="center" colspan="2">
					<h2>添加生产线信息</h2>
					<hr>
				</td>				
			</tr>
			<tr>
				<td align="right">生产线名</td>
				<td><input type="text" name="productLine" /></td>
			</tr>
			<tr>
				<td align="right">文本描述</td>
				<td><input type="text" name="textDescription" /></td>
			</tr>
			<tr>
				<td align="right">网址描述</td>
				<td><input type="text" name="htmlDescription" /></td>
			</tr>
			<tr>
				<td align="right">图片</td>
				<td><input type="text" name="image" /></td>
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