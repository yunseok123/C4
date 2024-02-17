package kr.co.softsoldesk.beans;

public class OrderItemBean {
	
	private int orderitemid;
    private int orderId; // 필드 이름은 카멜 케이스를 사용합니다.
	private int productId;
	private int quantity;
	private int price;
	private String sizes;
	public int getOrderitemid() {
		return orderitemid;
	}
	public void setOrderitemid(int orderitemid) {
		this.orderitemid = orderitemid;
	}	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductiId(int productId) {
		this.productId = productId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSizes() {
		return sizes;
	}
	public void setSizes(String sizes) {
		this.sizes = sizes;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	
	
	


	
	
	
	
	

}
