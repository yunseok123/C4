package kr.co.softsoldesk.beans;

import java.math.BigDecimal;
import java.util.List;

public class OrderBean {
    private int orderId; // ORDER_ID 시퀀스로 자동 생성됨
    private String orderDate; // ORDER_DATE
    private int totalPrice; // TOTAL_PRICE
    private String shippingAddress; // SHIPPING_ADDRESS
    private String cellphoneNumber; // CELLPHONE_NUMBER
    private String message; // MESSAGE
    private String refundAccount; // REFUND_ACCOUNT
    private String orderStatus; // ORDER_STATUS
    private int userIdx; // USER_IDX, 로그인한 사용자 ID
    private String ordererName; // ORDERER_NAME
    private String email; // EMAIL
    private Integer postalCode;
    private String detailAddress;
    private BigDecimal finalPrice;
    private String productName;
    private int orderItemQuantity;
    private int orderItemPrice;
    private int productPrice;
    private String sizes;
    private int productId;
    private String userBirthdate;
    private String ticketTitle;
    private String gameDate;
    private String startTime; 
    private String ticketSeat; 
    private String gameId;
    private List<String> selectedSeats;
    private String HOMETEAM_ID;
    private String AWAYTEAM_ID;
    private String HOMETEAM_NAME;
    private String AWAYTEAM_NAME;
    private String STADIUM_NAME;
    private String score;
    private String StadiumId;

   
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getShippingAddress() {
		return shippingAddress;
	}
	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}
	public String getCellphoneNumber() {
		return cellphoneNumber;
	}
	public void setCellphoneNumber(String cellphoneNumber) {
		this.cellphoneNumber = cellphoneNumber;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getRefundAccount() {
		return refundAccount;
	}
	public void setRefundAccount(String refundAccount) {
		this.refundAccount = refundAccount;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}
	public String getOrdererName() {
		return ordererName;
	}
	public void setOrdererName(String ordererName) {
		this.ordererName = ordererName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
	public Integer getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(Integer postalCode) {
		this.postalCode = postalCode;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public BigDecimal getFinalPrice() {
		return finalPrice;
	}
	public void setFinalPrice(BigDecimal finalPrice) {
		this.finalPrice = finalPrice;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getOrderItemQuantity() {
		return orderItemQuantity;
	}
	public void setOrderItemQuantity(int orderItemQuantity) {
		this.orderItemQuantity = orderItemQuantity;
	}
	public int getOrderItemPrice() {
		return orderItemPrice;
	}
	public void setOrderItemPrice(int orderItemPrice) {
		this.orderItemPrice = orderItemPrice;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getSizes() {
		return sizes;
	}
	public void setSizes(String sizes) {
		this.sizes = sizes;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getUserBirthdate() {
		return userBirthdate;
	}
	public void setUserBirthdate(String userBirthdate) {
		this.userBirthdate = userBirthdate;
	}
	public String getTicketTitle() {
		return ticketTitle;
	}
	public void setTicketTitle(String ticketTitle) {
		this.ticketTitle = ticketTitle;
	}
	public String getGameDate() {
		return gameDate;
	}
	public void setGameDate(String gameDate) {
		this.gameDate = gameDate;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getTicketSeat() {
		return ticketSeat;
	}
	public void setTicketSeat(String ticketSeat) {
		this.ticketSeat = ticketSeat;
	}
	public String getGameId() {
		return gameId;
	}
	public void setGameId(String gameId) {
		this.gameId = gameId;
	}
	public List<String> getSelectedSeats() {
		return selectedSeats;
	}
	public void setSelectedSeats(List<String> selectedSeats) {
		this.selectedSeats = selectedSeats;
	}
	public String getHOMETEAM_ID() {
		return HOMETEAM_ID;
	}
	public void setHOMETEAM_ID(String hOMETEAM_ID) {
		HOMETEAM_ID = hOMETEAM_ID;
	}
	public String getAWAYTEAM_ID() {
		return AWAYTEAM_ID;
	}
	public void setAWAYTEAM_ID(String aWAYTEAM_ID) {
		AWAYTEAM_ID = aWAYTEAM_ID;
	}
	public String getHOMETEAM_NAME() {
		return HOMETEAM_NAME;
	}
	public void setHOMETEAM_NAME(String hOMETEAM_NAME) {
		HOMETEAM_NAME = hOMETEAM_NAME;
	}
	public String getAWAYTEAM_NAME() {
		return AWAYTEAM_NAME;
	}
	public void setAWAYTEAM_NAME(String aWAYTEAM_NAME) {
		AWAYTEAM_NAME = aWAYTEAM_NAME;
	}
	public String getSTADIUM_NAME() {
		return STADIUM_NAME;
	}
	public void setSTADIUM_NAME(String sTADIUM_NAME) {
		STADIUM_NAME = sTADIUM_NAME;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getStadiumId() {
		return StadiumId;
	}
	public void setStadiumId(String stadiumId) {
		StadiumId = stadiumId;
	} 
	
	

	
}
