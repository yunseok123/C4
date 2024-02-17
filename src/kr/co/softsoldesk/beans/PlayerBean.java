package kr.co.softsoldesk.beans;

public class PlayerBean {
    private int player_Id;
    private String name;
    private String position;
    private double tall; // TALL 필드, 키를 나타냄
    private double height; // HEIGHT 필드가 아마 몸무게를 의미할 것 같습니다. 데이터 타입 주의
    private String highSchool;
    private String birthDate;
    private String playerImg;
    private int teamId;
    private String signingBonus;
    private String salary;
    private String joinYear;
    private int jerseyNumber;
    private String draftRank;
    private int index; // 순서를 저장할 필드 추가

    private int playelink;
    
    
	public int getPlayelink() {
		return playelink;
	}
	public void setPlayelink(int playelink) {
		this.playelink = playelink;
	}
	
	public int getPlayer_Id() {
		return player_Id;
	}
	public void setPlayer_Id(int player_Id) {
		this.player_Id = player_Id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public double getTall() {
		return tall;
	}
	public void setTall(double tall) {
		this.tall = tall;
	}
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	public String getHighSchool() {
		return highSchool;
	}
	public void setHighSchool(String highSchool) {
		this.highSchool = highSchool;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public String getPlayerImg() {
		return playerImg;
	}
	public void setPlayerImg(String playerImg) {
		this.playerImg = playerImg;
	}
	public int getTeamId() {
		return teamId;
	}
	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}
	public String getSigningBonus() {
		return signingBonus;
	}
	public void setSigningBonus(String signingBonus) {
		this.signingBonus = signingBonus;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getJoinYear() {
		return joinYear;
	}
	public void setJoinYear(String joinYear) {
		this.joinYear = joinYear;
	}
	public int getJerseyNumber() {
		return jerseyNumber;
	}
	public void setJerseyNumber(int jerseyNumber) {
		this.jerseyNumber = jerseyNumber;
	}
	public String getDraftRank() {
		return draftRank;
	}
	public void setDraftRank(String draftRank) {
		this.draftRank = draftRank;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
    
    
    
    
}