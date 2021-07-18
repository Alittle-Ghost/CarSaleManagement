<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,mysqlwork.dao.EmployeesDao,mysqlwork.model.Employees"
	pageEncoding="UTF-8"%>


<%
	request.setCharacterEncoding("UTF-8");
	int currentpage = 1;
	String jobT = String.valueOf(session.getAttribute("jT"));
		if (request.getParameter("page") != null) {
			currentpage = Integer.parseInt(request.getParameter("page"));
		}
		//当前图书的总的数量
		int count = EmployeesDao.findCount();
		//当前总的页数
		int pages = 0;
		if (count % Employees.PAGE_SIZE == 0) {
			pages = count / Employees.PAGE_SIZE;
		} else {
			pages = count / Employees.PAGE_SIZE + 1;
		}
		StringBuffer sb = new StringBuffer();
		for (int i = 1; i < pages; i++) {
			sb.append("<a href='getAll.jsp?page=" + i + "'>'" + i + "</a>");
		}
		request.setAttribute("pagebar", sb.toString());
		if(jobT.equals("Sales Rep")){	
			List<Employees> list = EmployeesDao.getAll(currentpage,jobT);
			request.setAttribute("Alllist", list);
	 	}else{
	 		List<Employees> list = EmployeesDao.getAll(currentpage);
	 		request.setAttribute("Alllist", list);
	 	}
		request.getRequestDispatcher("EmployeesList.jsp").forward(request, response);
	
%>