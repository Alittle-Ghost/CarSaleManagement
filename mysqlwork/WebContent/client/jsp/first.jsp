<%@ page language="java" contentType="text/html; charset=UTF-8"
import="mysqlwork.model.Employees,
			mysqlwork.dao.EmployeesDao,
			java.util.*"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台管理主页</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/home.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="background-color:black">
<body>
<%
	List<Employees> em = (List<Employees>)session.getAttribute("Emlist");
%>

	<!--顶部导航栏部分-->
	<nav class="navbar2">
		<div class="container-fluid">
		
			<!-- logo设置 -->
			<a class="navbar-brand" href="#">
			    <img src="../image/3.jpg" alt="logo" style="width:40px;">
			</a>
			
			<div class="navbar-header">
				<a class="logo" title="logoTitle" href="welcome.jsp" target="mainFrame">Miss.Ren汽车销售管理系统平台</a>
			</div>

			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li role="presentation"><a href="#">${jT }:<span
							class="badge" id="badge"> ${name} </span></a></li>
					<li><a href="../jsp/login.jsp"><span
							class="glyphicon glyphicon-lock"></span>退出登录</a></li>
				</ul>
			</div>

		</div>
		<!-- .container-fluid -->
	</nav>

	<!-- 中间主体内容部分 -->
	<div class="pageContainer">
		<!-- 左侧导航栏 -->
		<div class="pageSidebar">
			<div class="panel-group" id="accordion" role="tablist"
				aria-multiselectable="true">
				<!-- 个人中心 -->
				<div class="panel2">

					<div class="panel-heading" role="tab">
						<h4 class="panel-title">
							<a href="selfinfo.jsp" target="mainFrame"> <span
								class="glyphicon glyphicon-fire"></span> 个人中心
							</a>
						</h4>
					</div>

				</div>

				<!-- 员工管理 -->
				<div class="panel2">

					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion"
								href="#collapseOne" aria-expanded="true"
								aria-controls="collapseOne"> <span
								class="glyphicon glyphicon-user"></span> 员工管理 <span
								class="glyphicon glyphicon-menu-right pull-right"></span>
							</a>
						</h4>
					</div>

					<div id="collapseOne" class="collapse panel3" role="tabpanel"
						aria-labelledby="headingOne">
						<div class="panel-body">
							<p>
								<span class="glyphicon glyphicon-record"></span> <a
									href="employees/getAll.jsp" target="mainFrame">员工列表</a>
							</p>
							<p>
								<span class="glyphicon glyphicon-record"></span> <a
									href="employees/changeEmployeesList.jsp" target="mainFrame">完善员工信息</a>
							</p>
						</div>
					</div>
				</div>
				<!-- 查询 -->
				<div class="panel2">

					<div class="panel-heading" role="tab" id="headingZero">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion"
								href="#collapseZero" aria-expanded="true"
								aria-controls="collapseZero"> <span
								class="glyphicon glyphicon-user"></span> 查 询<span
								class="glyphicon glyphicon-menu-right pull-right"></span>
							</a>
						</h4>
					</div>

					<div id="collapseZero" class="collapse panel3" role="tabpanel"
						aria-labelledby="headingZero">
						<div class="panel-body">
							<p>
								<span class="glyphicon glyphicon-record"></span> <a
									href="AllSearch/CustomersOrderSearch.jsp"
									target="mainFrame">客户订单查询</a>
							</p>
							<p>
								<span class="glyphicon glyphicon-record"></span> <a
									href="AllSearch/OrderAndOrderdetailsSearch.jsp"
									target="mainFrame">订单查询</a>
							</p>
							<p>
								<span class="glyphicon glyphicon-record"></span> <a
									href="AllSearch/ProductsAndProductLineSearch.jsp"
									target="mainFrame">产品查询</a>
							</p>
						</div>
					</div>
				</div>

				<!-- 客户管理 -->
				<div class="panel2">

					<div class="panel-heading" role="tab" id="headingThree">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion"
								href="#collapseThree" aria-expanded="true"
								aria-controls="collapseThree"> <span
								class="glyphicon glyphicon-screenshot"></span> 客户管理 <span
								class="glyphicon glyphicon-menu-right pull-right"></span>
							</a>
						</h4>
					</div>

					<div id="collapseThree" class="collapse panel3" role="tabpanel"
						aria-labelledby="headingThree">
						<div class="panel-body">
							<p>
								<span class="glyphicon glyphicon-record"></span> <a
									href="customers/getAll.jsp" target="mainFrame">客户列表</a>
							</p>
							<p>
								<span class="glyphicon glyphicon-record"></span>
								<a href="customers/changeCustomersList.jsp" target="mainFrame">完善客户信息</a>
							</p>
						</div>
					</div>
				</div>

				<!-- 商品管理 -->
				<div class="panel2">

					<div class="panel-heading" role="tab" id="headingTwo">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion"
								href="#collapseTwo" aria-expanded="true"
								aria-controls="collapseTwo"> <span
								class="glyphicon glyphicon-gift"></span> 商品管理 <span
								class="glyphicon glyphicon-menu-right pull-right"></span>
							</a>
						</h4>
					</div>

					<div id="collapseTwo" class="collapse panel3" role="tabpanel"
						aria-labelledby="headingTwo">
						<div class="panel-body">
							<p>
								<span class="glyphicon glyphicon-record"></span> <a
									href="products/getAll.jsp" target="mainFrame">商品列表</a>
							</p>
							<p>
								<span class="glyphicon glyphicon-record"></span> <a
									href="productlines/getAll.jsp" target="mainFrame">厂商列表</a>
							</p>
							<p>
								<span class="glyphicon glyphicon-record"></span> <a
									href="products/changeProducts.jsp" target="mainFrame">完善商品信息</a>
							</p>
						</div>
					</div>
				</div>

				<!-- 订单管理 -->
				<div class="panel2">

					<div class="panel-heading" role="tab" id="headingFour">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion"
								href="#collapseFour" aria-expanded="true"
								aria-controls="collapseFour"> <span
								class="glyphicon glyphicon-tasks"></span> 订单管理 <span
								class="glyphicon glyphicon-menu-right pull-right"></span>
							</a>
						</h4>
					</div>

					<div id="collapseFour" class="collapse panel3" role="tabpanel"
						aria-labelledby="headingFour">
						<div class="panel-body">
							<p>
								<span class="glyphicon glyphicon-record"></span> <a
									href="orders/getAll.jsp" target="mainFrame">订单状态</a>
							</p>
							<p>
								<span class="glyphicon glyphicon-record"></span> <a
									href="orders/Changeorders.jsp" target="mainFrame">完善订单状态</a>
							</p>
							<p>
								<span class="glyphicon glyphicon-record"></span> <a
									href="orderdetails/getAll.jsp" target="mainFrame">订单详情</a>
							</p>
							<p>
								<span class="glyphicon glyphicon-record"></span> <a
									href="orderdetails/ChangeOrderdetails.jsp" target="mainFrame">完善订单详情</a>
							</p>
						</div>
					</div>

				</div>

				<div class="panel2">
					<div class="panel-heading" role="tab" id="headingFive">
						<h4 class="panel-title">
							<a href="OfficesList.jsp" target="mainFrame"> <span
								class="glyphicon glyphicon-lock"></span> 办公室查询
							</a>
						</h4>
					</div>

				</div>
			</div>
		</div>

		<!-- 左侧导航和正文内容的分隔线 -->
		<!-- <div class="splitter" background="file:///Users/macbookpro/eclipse-workspace/mysqlwork/WebContent/client/image/a.jpg"></div> -->
		

			<!-- 		正文内容部分 -->
			<div class="pageContent" >
				<iframe src="welcome.jsp" id="mainFrame" name="mainFrame"
					frameborder="0" width="100%" height="100%" frameBorder="0">
				</iframe>
			</div>


			<!-- 	主体部分结束 -->

			<!-- 底部页脚部分 -->
<nav class="navbar navbar-default navbar-fixed-bottom" role="navigation">
	<div class="container-fluid"> 
    	<div class="navbar-header">			
			
			<div class="footer">
				<div class="showTime text-center">
				<script>
					var t = null;
					t = setTimeout(time, 1000);//开始运行
					function time(){
						clearTimeout(t);//清除定时器
						dt = new Date();
						var y = dt.getFullYear();
						var mt = dt.getMonth() + 1;
						var day = dt.getDate();
						var h = dt.getHours();
						var m = dt.getMinutes();
						var s = dt.getSeconds();
						document.querySelector(".showTime").innerHTML =
							 "汽车销售管理"+
							y + "年" + mt + "月" + day + "日" + h + "时" + m + "分" + s + "秒";
						t = setTimeout(time,1000);//设定定时器，循环运行
					}
				</script>
				</div>	
			</div>

    	</div>
	</div>
</nav>			
</body>
</html>		



