<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="mysqlwork.model.Payments,
			mysqlwork.dao.PaymentsDao,java.util.List"
	pageEncoding="UTF-8"%>
	
<%
	request.setCharacterEncoding("UTF-8");
	int currentpage = 1;
		if (request.getParameter("page") != null) {
			currentpage = Integer.parseInt(request.getParameter("page"));
		}
		//当前图书的总的数量
		int count = PaymentsDao.findCount();
		//当前总的页数
		int pages = 0;
		if (count % Payments.PAGE_SIZE == 0) {
			pages = count / Payments.PAGE_SIZE;
		} else {
			pages = count / Payments.PAGE_SIZE + 1;
		}
		StringBuffer sb = new StringBuffer();
		for (int i = 1; i < pages; i++) {
			sb.append("<a href='getAll.jsp?page=" + i + "'>'" + i + "</a>");
		}
		request.setAttribute("pagebar", sb.toString());

		List<Payments> list = PaymentsDao.getAll(currentpage);
		request.setAttribute("Alllist", list);
		//转发
		request.getRequestDispatcher("paymentsList.jsp").forward(request, response);
	
%>