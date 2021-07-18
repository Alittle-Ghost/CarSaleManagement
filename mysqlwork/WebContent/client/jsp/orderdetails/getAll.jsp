<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="mysqlwork.model.Orderdetails,
			mysqlwork.dao.OrderdetailsDao,java.util.List"
	pageEncoding="UTF-8"%>



<%
	request.setCharacterEncoding("UTF-8");
	int currentpage = 1;
		if (request.getParameter("page") != null) {
			currentpage = Integer.parseInt(request.getParameter("page"));
		}
		//当前图书的总的数量
		int count = OrderdetailsDao.findCount();
		//当前总的页数
		int pages = 0;
		if (count % Orderdetails.PAGE_SIZE == 0) {
			pages = count / Orderdetails.PAGE_SIZE;
		} else {
			pages = count / Orderdetails.PAGE_SIZE + 1;
		}
		StringBuffer sb = new StringBuffer();
		for (int i = 1; i < pages; i++) {
			sb.append("<a href='getAll.jsp?page=" + i + "'>'" + i + "</a>");
		}
		request.setAttribute("pagebar", sb.toString());

		List<Orderdetails> list = OrderdetailsDao.getAll(currentpage);
		request.setAttribute("Alllist", list);
		//转发
		request.getRequestDispatcher("orderdetailsList.jsp").forward(request, response);
	
%>