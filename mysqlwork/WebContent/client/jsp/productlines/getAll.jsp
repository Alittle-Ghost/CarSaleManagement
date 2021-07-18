<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="mysqlwork.model.ProductLine,
			mysqlwork.dao.ProductLineDao,java.util.List"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int currentpage = 1;
		if (request.getParameter("page") != null) {
			currentpage = Integer.parseInt(request.getParameter("page"));
		}
		//当前图书的总的数量
		int count = ProductLineDao.findCount();
		//当前总的页数
		int pages = 0;
		if (count % ProductLine.PAGE_SIZE == 0) {
			pages = count / ProductLine.PAGE_SIZE;
		} else {
			pages = count / ProductLine.PAGE_SIZE + 1;
		}
		StringBuffer sb = new StringBuffer();
		for (int i = 1; i < pages; i++) {
			sb.append("<a href='getAll.jsp?page=" + i + "'>'" + i + "</a>");
		}
		request.setAttribute("pagebar", sb.toString());

		List<ProductLine> list = ProductLineDao.getAll(currentpage);
		request.setAttribute("Alllist", list);
		//转发
		request.getRequestDispatcher("productLinesList.jsp").forward(request, response);
	
%>