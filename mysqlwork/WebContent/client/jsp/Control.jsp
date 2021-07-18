<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="mysqlwork.model.Employees,
			mysqlwork.dao.EmployeesDao,
			java.util.*"
	pageEncoding="UTF-8"%>


<%
	
	request.setCharacterEncoding("UTF-8");
	Employees em = new Employees();
	em.setEmail(request.getParameter("email"));
	em.setPassword(request.getParameter("pwd"));
	List<Employees> slist = EmployeesDao.selfInfo(em);
	
	String name = EmployeesDao.searchName(em);
	String jT = EmployeesDao.searchJobTitle(em);
	int emNum = EmployeesDao.searchemployeeNumber(em);
	//int reportTo = EmployeesDao.searchReportsTO(em);
	List<Employees> list = EmployeesDao.showEmployee(jT);
	
	boolean isSuccess = EmployeesDao.searchUser(em);
	if(isSuccess){
		session.setAttribute("name",name);
		session.setAttribute("jT", jT);
		session.setAttribute("Emlist", list);
		session.setAttribute("emNum", emNum);
		session.setAttribute("slist", slist);
		//.setAttribute("reportTo",reportTo);
		response.sendRedirect("first.jsp");
	}else{
		response.sendRedirect("failed.jsp");
	}
%>