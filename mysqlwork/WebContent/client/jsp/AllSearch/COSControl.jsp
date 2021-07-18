<%@ page language="java" contentType="text/html; charset=UTF-8"
import="mysqlwork.model.Customers,
		mysqlwork.dao.CustomersDao,
		mysqlwork.model.Order,
		mysqlwork.dao.OrderDao,
		mysqlwork.model.Payments,
		mysqlwork.dao.PaymentsDao,
		java.util.*"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Customers cus = new Customers();
	cus.setCustomerNumber(Integer.parseInt(request.getParameter("customerNumber")));
	List<Customers> clist = CustomersDao.searchCustomersInfo(cus);
	
	Order or = new Order();
	or.setCustomerNumber(Integer.parseInt(request.getParameter("customerNumber")));
	List<Order> olist = OrderDao.searchOrder(or);
	
	Payments pay = new Payments();
	pay.setCustomerNumber(Integer.parseInt(request.getParameter("customerNumber")));
	List<Payments> plist = PaymentsDao.searchPayments(pay);
	
	
	boolean isSuccess = CustomersDao.searchCustomers(cus);
	if(isSuccess){
		session.setAttribute("clist", clist);
		session.setAttribute("olist",olist);
		session.setAttribute("plist",plist);
		
		response.sendRedirect("Cout.jsp");
	}else{
		response.sendRedirect("../failed.jsp");
	}


%>