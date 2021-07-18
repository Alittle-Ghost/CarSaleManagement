<%@ page language="java" contentType="text/html;
 charset=UTF-8"
import="mysqlwork.dao.OrderdetailsDao"
    pageEncoding="UTF-8"%>
    <jsp:useBean id = "cus" class = "mysqlwork.model.Orderdetails"></jsp:useBean>
	<jsp:setProperty property="*" name="cus" />
<%
	request.setCharacterEncoding("UTF-8");
	boolean isSuccess = OrderdetailsDao.addOrderdetail(cus);
	if(isSuccess){
		response.sendRedirect("getAll.jsp");
	}else{
		out.println("添加失败");
	}
%>