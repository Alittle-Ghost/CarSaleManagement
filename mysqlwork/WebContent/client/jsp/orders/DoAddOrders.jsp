<%@ page language="java" contentType="text/html;
 charset=UTF-8"
import="mysqlwork.dao.OrderDao"
    pageEncoding="UTF-8"%>
    <jsp:useBean id = "cus" class = "mysqlwork.model.Order"></jsp:useBean>
	<jsp:setProperty property="*" name="cus" />
<%
	request.setCharacterEncoding("UTF-8");
	boolean isSuccess = OrderDao.addOrder(cus);
	if(isSuccess){
		response.sendRedirect("getAll.jsp");
	}else{
		out.println("添加失败");
	}
%>