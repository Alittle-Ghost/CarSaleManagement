<%@ page language="java" contentType="text/html; charset=UTF-8"
import="mysqlwork.dao.CustomersDao"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id = "cus" class = "mysqlwork.model.Customers"></jsp:useBean>
<jsp:setProperty property="*" name="cus" />

<%
	boolean isSuccess = CustomersDao.delCustomer(cus);
	if(isSuccess){
		//out.println("添加成功");
		response.sendRedirect("getAll.jsp");
	}else{
		out.println("Delete fail!");
	}
%>