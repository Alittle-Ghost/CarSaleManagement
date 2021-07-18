<%@ page language="java" contentType="text/html; charset=UTF-8"
import="mysqlwork.dao.ProductsDao"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id = "cus" class = "mysqlwork.model.Products"></jsp:useBean>
<jsp:setProperty property="*" name="cus" />

<%
	boolean isSuccess = ProductsDao.delProduct(cus);
	if(isSuccess){
		//out.println("删除成功");
		response.sendRedirect("getAll.jsp");
	}else{
		out.println("Delete fail!");
	}
%>