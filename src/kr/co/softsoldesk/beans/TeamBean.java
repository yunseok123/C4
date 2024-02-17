package kr.co.softsoldesk.beans;

public class TeamBean {
    private int team_ID; // SQL�뿉�꽌 �궗�슜�븯吏� �븡�쑝誘�濡� 洹몃�濡� �몼�땲�떎.
    private String teamName; // SQL�뿉�꽌 �궗�슜�븯吏� �븡�쑝誘�濡� 洹몃�濡� �몼�땲�떎.
    private String team_Name; // SQL�쓽 team_Name怨� �씪移�
    private int gamesPlayed; // SQL�뿉�꽌 �궗�슜�븯吏� �븡�쑝誘�濡� 洹몃�濡� �몼�땲�떎.
    private int Wins; // SQL�쓽 Wins�� �씪移�
    private int Losses; // SQL�쓽 Losses�� �씪移�
    private int Draws; // SQL�쓽 Draws�� �씪移�
    
    private String team_LogoURL;
    private double winRate; // SQL�뿉�꽌 �궗�슜�븯吏� �븡�쑝誘�濡� 洹몃�濡� �몼�땲�떎.
    private int entries; // SQL�뿉�꽌 �궗�슜�븯吏� �븡�쑝誘�濡� 洹몃�濡� �몼�땲�떎.
    
    
    private String gamesBehind; // 寃쎄린 �닔
    
    private String teamLogoURL;
    
    private String team_Description;
    private int pitcher_Total;
    private int catcher_Total;
    private int infielder_Total;
    private int outfielder_Total;
    private int coach_Total; 

    
    
    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    
    
    
    
 

	public int getTeam_ID() {
		return team_ID;
	}
	public void setTeam_ID(int team_ID) {
		this.team_ID = team_ID;
	}
	public String getTeam_Name() {
		return team_Name;
	}
	public void setTeam_Name(String team_Name) {
		this.team_Name = team_Name;
	}
	public int getGamesPlayed() {
		return gamesPlayed;
	}
	public void setGamesPlayed(int gamesPlayed) {
		this.gamesPlayed = gamesPlayed;
	}
	public int getWins() {
		return Wins;
	}
	public void setWins(int wins) {
		Wins = wins;
	}
	public int getLosses() {
		return Losses;
	}
	public void setLosses(int losses) {
		Losses = losses;
	}
	public int getDraws() {
		return Draws;
	}
	public void setDraws(int draws) {
		Draws = draws;
	}
	public double getWinRate() {
		return winRate;
	}
	public void setWinRate(double winRate) {
		this.winRate = winRate;
	}
	public int getEntries() {
		return entries;
	}
	public void setEntries(int entries) {
		this.entries = entries;
	}
	public String getGamesBehind() {
		return gamesBehind;
	}
	public void setGamesBehind(String gamesBehind) {
		this.gamesBehind = gamesBehind;
	}
	public String getTeam_LogoURL() {
		return team_LogoURL;
	}
	public void setTeam_LogoURL(String team_LogoURL) {
		this.team_LogoURL = team_LogoURL;
	}
	public String getTeamLogoURL() {
		return teamLogoURL;
	}
	public void setTeamLogoURL(String teamLogoURL) {
		this.teamLogoURL = teamLogoURL;
	}
	public String getTeam_Description() {
		return team_Description;
	}
	public void setTeam_Description(String team_Description) {
		this.team_Description = team_Description;
	}
	public int getPitcher_Total() {
		return pitcher_Total;
	}
	public void setPitcher_Total(int pitcher_Total) {
		this.pitcher_Total = pitcher_Total;
	}
	public int getCatcher_Total() {
		return catcher_Total;
	}
	public void setCatcher_Total(int catcher_Total) {
		this.catcher_Total = catcher_Total;
	}
	public int getInfielder_Total() {
		return infielder_Total;
	}
	public void setInfielder_Total(int infielder_Total) {
		this.infielder_Total = infielder_Total;
	}
	public int getOutfielder_Total() {
		return outfielder_Total;
	}
	public void setOutfielder_Total(int outfielder_Total) {
		this.outfielder_Total = outfielder_Total;
	}
	public int getCoach_Total() {
		return coach_Total;
	}
	public void setCoach_Total(int coach_Total) {
		this.coach_Total = coach_Total;
	}




 
}
