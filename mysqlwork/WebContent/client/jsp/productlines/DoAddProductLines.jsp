<%@ page language="java" contentType="text/html;
 charset=UTF-8"
import="mysqlwork.dao.ProductLineDao"
    pageEncoding="UTF-8"%>
    <jsp:useBean id = "cus" class = "mysqlwork.model.ProductLine"></jsp:useBean>
	<jsp:setProperty property="*" name="cus" />
<%
	request.setCharacterEncoding("UTF-8");
	boolean isSuccess = ProductLineDao.addProductLine(cus);
	if(isSuccess){
		response.sendRedirect("getAll.jsp");
	}else{
		out.println("添加失败");
	}
%>