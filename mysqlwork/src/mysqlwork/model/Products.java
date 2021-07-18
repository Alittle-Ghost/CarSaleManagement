package mysqlwork.model;


public class Products {
	public static int PAGE_SIZE=10;
	private String ProductCode;
	private String ProductName;
	private String ProductLine;
	private String ProductScale;
	private String ProductVendor;
	private String ProductDescription;
	private String QuantityInStock;
	private String BuyPrice;
	private String MSRP;
	public Products() {};
	public String getProductCode() {
		return ProductCode;
	}
	public void setProductCode(String productCode) {
		ProductCode = productCode;
	}
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String productName) {
		ProductName = productName;
	}
	public String getProductLine() {
		return ProductLine;
	}
	public void setProductLine(String productLine) {
		ProductLine = productLine;
	}
	public String getProductScale() {
		return ProductScale;
	}
	public void setProductScale(String productScale) {
		ProductScale = productScale;
	}
	public String getProductVendor() {
		return ProductVendor;
	}
	public void setProductVendor(String productVendor) {
		ProductVendor = productVendor;
	}
	public String getProductDescription() {
		return ProductDescription;
	}
	public void setProductDescription(String productDescription) {
		ProductDescription = productDescription;
	}
	public String getQuantityInStock() {
		return QuantityInStock;
	}
	public void setQuantityInStock(String quantityInStock) {
		QuantityInStock = quantityInStock;
	}
	public String getBuyPrice() {
		return BuyPrice;
	}
	public void setBuyPrice(String buyPrice) {
		BuyPrice = buyPrice;
	}
	public String getMSRP() {
		return MSRP;
	}
	public void setMSRP(String mSRP) {
		MSRP = mSRP;
	}
}
