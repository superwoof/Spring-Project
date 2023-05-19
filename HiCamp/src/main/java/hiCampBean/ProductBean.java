package hiCampBean;

public class ProductBean implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private int productNo;
	private String productType;
	private String productName;
	private int productPrice;
	private int productQuantity;
	private String productInfo;
	private String productStutas;
	
	
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getProductQuantity() {
		return productQuantity;
	}
	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}
	public String getProductInfo() {
		return productInfo;
	}
	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}
	public String getProductStutas() {
		return productStutas;
	}
	public void setProductStutas(String productStutas) {
		this.productStutas = productStutas;
	}
	


}