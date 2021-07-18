<%@ page language="java" contentType="text/html; charset=UTF-8"
import="mysqlwork.model.Products,
		mysqlwork.dao.ProductsDao,
		mysqlwork.model.ProductLine,
		mysqlwork.dao.ProductLineDao,
		java.util.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	Products p = new Products();
	p.setProductCode(request.getParameter("productCode"));
	List<Products> pdlist = ProductsDao.searchProductByNumber(p);
	//System.out.print(pdlist);
	String pln = ProductsDao.searchProductLineNameByNumber(p);
	//System.out.print(pln);
	ProductLine pl = new ProductLine();
	String textDescription = ProductLineDao.searchtextDescription(pln);
	
	String pD = ProductsDao.searchProductDescriptionByName(pln);
	
	//System.out.print(pD);
	//System.out.print(textDescription);
	boolean isSuccess = ProductsDao.searchProduct(p);
	if(isSuccess){
		session.setAttribute("pdlist",pdlist);
		//session.setAttribute("pD",pD);
		//session.setAttribute("tD",textDescription);
		response.sendRedirect("productsList.jsp");
	}else{
		response.sendRedirect("../failed.jsp");
	}

%>
