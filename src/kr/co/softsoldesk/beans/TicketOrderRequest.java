package kr.co.softsoldesk.beans;

import java.math.BigDecimal;
import java.util.List;

public class TicketOrderRequest {
	private String userName;       // ����� �̸�
    private String userBirthdate;  // ����� �������
    private String userPhone;      // ����� ��ȭ��ȣ
    private String userEmail;      // ����� �̸���
    private String orderName;      // ������ ����
    private String gameDate;       // ��� ��¥
    private String startTime;      // ��� ���� �ð�
    private String seats;          // ������ �¼� ���, ��ǥ�� ���е� ���ڿ�
    private BigDecimal amount;     // �� �ݾ�
    private String gameId;         // ��� ID
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
