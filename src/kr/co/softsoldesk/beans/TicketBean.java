package kr.co.softsoldesk.beans;

import java.sql.Date;




public class TicketBean {

   private String GAME_ID;
   private Date GAME_DATE;
   private String HOMETEAM_ID;
   private String AWAYTEAM_ID;
   private String STADIUM_ID;
   private String START_TIME;
   
   private String HOMETEAM_NAME;
    private String AWAYTEAM_NAME;
    
    private String DAY_OF_WEEK;
    
    private String RESERVATION_ID;
    private String SEATTYPE;
    private String SEATLOCATION;
    private Double WEEKDAY_PRICE;
    private Double WEEKEND_PRICE;
    private int Available;
    
    private String STADIUM_NAME;

    public Double getWEEKDAY_PRICE() {
      return WEEKDAY_PRICE;
   }

   public void setWEEKDAY_PRICE(Double wEEKDAY_PRICE) {
      WEEKDAY_PRICE = wEEKDAY_PRICE;
   }

   public Double getWEEKEND_PRICE() {
      return WEEKEND_PRICE;
   }

   public void setWEEKEND_PRICE(Double wEEKEND_PRICE) {
      WEEKEND_PRICE = wEEKEND_PRICE;
   }

   private String STADIUM_SEATIMG;
    
    public String getRESERVATION_ID() {
      return RESERVATION_ID;
   }

   public String getSTADIUM_SEATIMG() {
      return STADIUM_SEATIMG;
   }

   public void setSTADIUM_SEATIMG(String sTADIUM_SEATIMG) {
      STADIUM_SEATIMG = sTADIUM_SEATIMG;
   }

   public void setRESERVATION_ID(String rESERVATION_ID) {
      RESERVATION_ID = rESERVATION_ID;
   }

   public String getSEATTYPE() {
      return SEATTYPE;
   }

   public void setSEATTYPE(String sEATTYPE) {
      SEATTYPE = sEATTYPE;
   }

   public String getSEATLOCATION() {
      return SEATLOCATION;
   }

   public void setSEATLOCATION(String sEATLOCATION) {
      SEATLOCATION = sEATLOCATION;
   }

   public int getAvailable() {
      return Available;
   }

   public void setAvailable(int available) {
      Available = available;
   }

   public void setHOMETEAM_NAME(String homeTeamName) {
        this.HOMETEAM_NAME = homeTeamName;
    }

    public void setAWAYTEAM_NAME(String awayTeamName) {
        this.AWAYTEAM_NAME = awayTeamName;
    }

    public String getDAY_OF_WEEK() {
        return DAY_OF_WEEK;
    }

    public void setDAY_OF_WEEK(String dayOfWeek) {
        this.DAY_OF_WEEK = dayOfWeek;
    }

   public String getGAME_ID() {
      return GAME_ID;
   }

   public void setGAME_ID(String gAME_ID) {
      GAME_ID = gAME_ID;
   }

   public Date getGAME_DATE() {
      return GAME_DATE;
   }

   public void setGAME_DATE(Date gAME_DATE) {
      GAME_DATE = gAME_DATE;
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

   public String getSTADIUM_ID() {
      return STADIUM_ID;
   }

   public void setSTADIUM_ID(String sTADIUM_ID) {
      STADIUM_ID = sTADIUM_ID;
   }

   public String getSTART_TIME() {
      return START_TIME;
   }

   public void setSTART_TIME(String sTART_TIME) {
      START_TIME = sTART_TIME;
   }

   public String getHOMETEAM_NAME() {
      return HOMETEAM_NAME;
   }

   public String getAWAYTEAM_NAME() {
      return AWAYTEAM_NAME;
   }

public String getSTADIUM_NAME() {
	return STADIUM_NAME;
}

public void setSTADIUM_NAME(String sTADIUM_NAME) {
	STADIUM_NAME = sTADIUM_NAME;
}
   
   

}