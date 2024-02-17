package kr.co.softsoldesk.beans;

import java.math.BigDecimal;
import java.util.List;

public class TicketOrderRequest {
	private String userName;       // 사용자 이름
    private String userBirthdate;  // 사용자 생년월일
    private String userPhone;      // 사용자 전화번호
    private String userEmail;      // 사용자 이메일
    private String orderName;      // 선택한 경기명
    private String gameDate;       // 경기 날짜
    private String startTime;      // 경기 시작 시간
    private String seats;          // 선택한 좌석 목록, 쉼표로 구분된 문자열
    private BigDecimal amount;     // 총 금액
    private String gameId;         // 경기 ID
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserBirthdate() {
		return userBirthdate;
	}
	public void setUserBirthdate(String userBirthdate) {
		this.userBirthdate = userBirthdate;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
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
	public String getSeats() {
		return seats;
	}
	public void setSeats(String seats) {
		this.seats = seats;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public String getGameId() {
		return gameId;
	}
	public void setGameId(String gameId) {
		this.gameId = gameId;
	}
    

    
}
