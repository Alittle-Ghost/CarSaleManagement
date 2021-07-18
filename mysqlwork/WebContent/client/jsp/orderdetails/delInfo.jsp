<%@ page language="java" contentType="text/html; charset=UTF-8"
import="mysqlwork.dao.OrderdetailsDao"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id = "cus" class = "mysqlwork.model.Orderdetails"></jsp:useBean>
<jsp:setProperty property="*" name="cus" />

<%
	boolean isSuccess = OrderdetailsDao.delOrderdetails(cus);
	if(isSuccess){
		//out.println("添加成功");
		response.sendRedirect("getAll.jsp");
	}else{
		out.println("Delete fail!");
	}
%>