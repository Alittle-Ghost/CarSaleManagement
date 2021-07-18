<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="DoAddProducts.jsp" method="post">
		<table align="center">
			<tr>
				<td align="center" colspan="2">
					<h2>添加产品信息</h2>
					<hr>
				</td>				
			</tr>
			<tr>
				<td align="right">产品编号</td>
				<td><input type="text" name="productNumber" /></td>
			</tr>
			<tr>
				<td align="right">产品名称</td>
				<td><input type="text" name="productName" /></td>
			</tr>
			<tr>
				<td align="right">生产线名称</td>
				<td><input type="text" name="productLine" /></td>
			</tr>
			<tr>
				<td align="right">产品规模</td>
				<td><input type="text" name="productScale" /></td>
			</tr>
			<tr>
				<td align="right">产品供应商</td>
				<td><input type="text" name="productVender" /></td>
			</tr>
			<tr>
				<td align="right">商品描述</td>
				<td><input type="text" name="productDescription" /></td>
			</tr>
			<tr>
				<td align="right">进货数量</td>
				<td><input type="text" name="quantityStock" /></td>
			</tr>
			<tr>
				<td align="right">购入价格</td>
				<td><input type="text" name="buyPrice" /></td>
			</tr>
			<tr>
				<td align="right">建议零售价</td>
				<td><input type="text" name="MSRP" /></td>
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