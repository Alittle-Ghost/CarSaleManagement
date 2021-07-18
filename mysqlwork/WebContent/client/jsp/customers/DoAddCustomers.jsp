<%@ page language="java" contentType="text/html; charset=UTF-8"
import="mysqlwork.dao.CustomersDao"
    pageEncoding="UTF-8"%>
    <jsp:useBean id = "cus" class = "mysqlwork.model.Customers"></jsp:useBean>
	<jsp:setProperty property="*" name="cus" />
<%
	request.setCharacterEncoding("UTF-8");
	boolean isSuccess = CustomersDao.addCustomer(cus);
	if(isSuccess){
		response.sendRedirect("getAll.jsp");
	}else{
		out.println("添加失败");
	}
%>