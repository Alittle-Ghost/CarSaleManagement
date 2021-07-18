<%@ page language="java" contentType="text/html; charset=UTF-8"
import="mysqlwork.model.Order,
		mysqlwork.dao.OrderDao,
		mysqlwork.model.Orderdetails,
		mysqlwork.dao.OrderdetailsDao,
		java.util.*"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Order or = new Order();
	or.setOrderNumber(Integer.parseInt(request.getParameter("orderNumber")));
	List<Order> oaolist = OrderDao.searchOrderByNumber(or);
	
	Orderdetails orD = new Orderdetails();
	orD.setOrderNumber(Integer.parseInt(request.getParameter("orderNumber")));
	List<Orderdetails> odlist = OrderdetailsDao.searchOrderdetails(orD);
	
	boolean isSuccess = OrderDao.searchOrderByNumberT(or);
	if(isSuccess){
		session.setAttribute("oaolist", oaolist);
		session.setAttribute("odlist",odlist);
		response.sendRedirect("orderList.jsp");
	}else{
		response.sendRedirect("../failed.jsp");
	}


%>