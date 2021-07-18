<%@ page language="java" contentType="text/html; charset=UTF-8"
   import="mysqlwork.dao.EmployeesDao"
    pageEncoding="UTF-8"%>
    <jsp:useBean id ="cus" class="mysqlwork.model.Employees"></jsp:useBean>
	<jsp:setProperty property="*" name="cus" />
<%
	request.setCharacterEncoding("UTF-8");
	boolean isSuccess = EmployeesDao.addEmployee(cus);
	if(isSuccess){
		response.sendRedirect("getAll.jsp");
	}else{
		out.println("添加失败");
	}
%>