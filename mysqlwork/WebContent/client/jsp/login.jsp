<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户登陆</title>
<link href="../css/login.css" rel="stylesheet">
<style type="text/css">
table {
	margin: auto;
	margin-top: 165px;
	color: #FFD700 ;
	border-radius: 20px;
}

</style>
</head>

<body>
	<form action="Control.jsp" method="post" name="forms">

		<table>
			<tr>
				<td align="center" colspan="3">
					<h1>Login</h1>
					<hr>
				</td>
			</tr>
			<tr>
				<td align="right">Please enter your email：</td>
				<td><input type="text" name="email" /></td>
			</tr>
			<tr>
				<td align="right">Please enter your password：</td>
				<td><span id="box"><input type="password" name="pwd" /></span></td>
				<td><span id="click"><a href="javascript:showps()" style="color: #FFD700">show password</a></span>
			</tr>
			<tr>
				<td></td>
				<td align="left" height="15px"><input type="submit" value="Login" font-size 14px;
					style="width: 160px ;font-size: 16px" /></td>
			</tr>
		</table>

	</form>
</body>
<script type="text/javaScript">   
                function showps(){   
                    if (this.forms.pwd.type="password") {  
                        document.getElementById("box").innerHTML="<input type=\"text\" name=\"pwd\"  value="+this.forms.pwd.value+">";   
                        document.getElementById("click").innerHTML="<a href=\"javascript:hideps()\">hide password</a>"  
                    }  
                }   
                function hideps(){   
                    if (this.forms.pwd.type="text") {  
                        document.getElementById("box").innerHTML="<input type=\"password\" name=\"pwd\"  value="+this.forms.pwd.alue+">";   
                        document.getElementById("click").innerHTML="<a href=\"javascript:showps()\">show password</a>"  
                    }   
                }  
             	
    </script>
</html>