package kr.co.softsoldesk.beans;

import java.util.Map;

public class PriceCalculationRequest {
   private Map<String, Integer> seatSelections;
    private String gameId;
    
   public Map<String, Integer> getSeatSelections() {
      return seatSelections;
   }
   public void setSeatSelections(Map<String, Integer> seatSelections) {
      this.seatSelections = seatSelections;
   }
   public String getGameId() {
      return gameId;
   }
   public void setGameId(String gameId) {
      this.gameId = gameId;
   }
    
    
}