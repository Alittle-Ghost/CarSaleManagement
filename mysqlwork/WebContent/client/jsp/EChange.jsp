<%@ page language="java" contentType="text/html; charset=UTF-8"
import="mysqlwork.model.Employees,
		mysqlwork.dao.EmployeesDao,
		java.util.*"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id = "em" class = "mysqlwork.model.Employees"></jsp:useBean>
<jsp:setProperty property="*" name="em" />
    
<%
boolean isSuccess = EmployeesDao.changeEmail(em);
if(isSuccess){
	//out.println("添加成功");
	response.sendRedirect("selfinfo.jsp");
}else{
	out.println("修改失败");
}


%>

