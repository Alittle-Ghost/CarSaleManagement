package mysqlwork.model;

public class Orderdetails {
	public static int PAGE_SIZE=10;
	private int orderNumber;
	public int getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}
	private String productCode;
	private int quantityOrdered;
	private String priceEach;
	private String orderLineNumber;
	
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public int getQuantityOrdered() {
		return quantityOrdered;
	}
	public void setQuantityOrdered(int quantityOrdered) {
		this.quantityOrdered = quantityOrdered;
	}
	public String getPriceEach() {
		return priceEach;
	}
	public void setPriceEach(String priceEach) {
		this.priceEach = priceEach;
	}
	public String getOrderLineNumber() {
		return orderLineNumber;
	}
	public void setOrderLineNumber(String orderLineNumber) {
		this.orderLineNumber = orderLineNumber;
	}
	
}
