package mysqlwork.model;

public class Order {
	public static int PAGE_SIZE=10;
	private int orderNumber;
	private String orderDate;
	private String requireDate;
	private String ShippedDate;
	private String status;
	private String Comments;
	private int CustomerNumber;
	public int getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getRequireDate() {
		return requireDate;
	}
	public void setRequireDate(String requireDate) {
		this.requireDate = requireDate;
	}
	public String getShippedDate() {
		return ShippedDate;
	}
	public void setShippedDate(String shippedDate) {
		ShippedDate = shippedDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getComments() {
		return Comments;
	}
	public void setComments(String comments) {
		Comments = comments;
	}
	public int getCustomerNumber() {
		return CustomerNumber;
	}
	public void setCustomerNumber(int customerNumber) {
		CustomerNumber = customerNumber;
	}
	
	
	
	
	
}
