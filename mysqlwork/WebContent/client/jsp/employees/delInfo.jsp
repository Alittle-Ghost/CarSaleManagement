<%@ page language="java" contentType="text/html; charset=UTF-8"
import="mysqlwork.dao.EmployeesDao"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id = "cus" class = "mysqlwork.model.Employees"></jsp:useBean>
<jsp:setProperty property="*" name="cus" />

<%
	boolean isSuccess = EmployeesDao.delEmployee(cus);
	if(isSuccess){
		//out.println("添加成功");
		response.sendRedirect("getAll.jsp");
	}else{
		out.println("Delete fail!");
	}
%>