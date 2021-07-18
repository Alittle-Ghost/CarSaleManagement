<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="mysqlwork.model.Employees,
			mysqlwork.dao.EmployeesDao,
			java.util.*"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="zh-CN">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0,minimal-ui:ios">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Selfinfo</title>
<link rel="stylesheet" href="">
<script src=""></script>
</head>
<style>
.pname {
	width: 50%;
}

.pimg {
	width: 50%;
}

img {
	width: 450px;
	height: 450px;
}

.jumbotron {
	padding-top: 1px;
	padding-bottom: 5px;
	background-color: #000000;
	color: #ffffff;
}
</style>

<body>

	<div class="jumbotron">
		<h2 style="text-align: center;">个人中心</h2>
	</div>
	<form action="ChangeEmail.jsp" method="post">
	<div style="width: 85%; margin: auto;">
		<div class="pname pull-left">
			<%
				List<Employees> slist = null;
				if (session.getAttribute("slist") != null) {
					slist = (List<Employees>) session.getAttribute("slist");
				}
				if (slist == null || slist.size() == 0) {
					out.println("没有数据！");
				} else {
					for (Employees em : slist) {
			%>


			<div class="alert" style="background: #000; color: #FFF">
				<h3>
					员工号：
					<%
					out.println(em.getEmployeeNumber());
				%>
				</h3>
			</div>
			<div class="alert" style="background: #F0F0F0; color: #000">
				<h3>
					姓：
					<%
					out.println(em.getLastName());
				%>
				</h3>
			</div>
			<div class="alert" style="background: #000; color: #FFF">
				<h3>
					名：
					<%
					out.println(em.getFirstName());
				%>
				</h3>
			</div>
			<div class="alert" style="background: #F0F0F0; color: #000">
				<h3>
					邮箱：
					<%
					out.println(em.getEmail());
				%>
				</h3>
			</div>
			<div class="alert" style="background: #000; color: #FFF">
				<h3>
					职务：
					<%
					out.println(em.getJobTitle());
				%>
				</h3>
			</div>
			<div>
<!-- 				<input type="button" value="修改信息" onclick="javascript:window.location.href='sefControl.jsp'"/> -->
				<input type="submit" value="修改信息" />
			</div>
			
			<% 
				} 
				} 
			%> 

		</div>
		<div class="pimg pull-right">
			<img class="pull-right" src="../image/5.jpg">
		</div>
	</div>
	</form>
	<div class="clearfix"></div>

</body>
</html>