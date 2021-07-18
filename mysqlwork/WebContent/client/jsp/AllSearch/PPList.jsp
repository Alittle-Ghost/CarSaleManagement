<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<div class="container">
		<div class="table-responsive">

<table class="table table-bordered table-hover">
	<tr>
		<td>产品线名称</td>
		<td><%=session.getAttribute("temp") %></td>
	</tr>
	<tr>
		<td>产品描述</td>
		<td><%=session.getAttribute("pD") %></td>
	</tr>
	<tr>
		<td>产品线描述</td>
		<td><%=session.getAttribute("tD") %></td>
	</tr>
</table>
</div>
</div>
</body>
</html>