package kr.co.softsoldesk.service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.TicketBean;
import kr.co.softsoldesk.dao.TeamDao;
import kr.co.softsoldesk.dao.TicketDao;
import kr.co.softsoldesk.mapper.TicketMapper;
import kr.co.softsoldesk.beans.TeamBean;

@Service
public class TicketService {

	@Autowired
    private TicketDao ticketDao;

    @Autowired
    private TeamDao teamDao;

    public List<TicketBean> getGameInfo() {
    	List<TicketBean> gameInfoList = ticketDao.gameinfo();

    	for (TicketBean game : gameInfoList) {
            TeamBean homeTeam = teamDao.selectTeamById(Integer.parseInt(game.getHOMETEAM_ID()));
            TeamBean awayTeam = teamDao.selectTeamById(Integer.parseInt(game.getAWAYTEAM_ID()));

            game.setHOMETEAM_NAME(homeTeam.getTeam_Name());
            game.setAWAYTEAM_NAME(awayTeam.getTeam_Name());
        }

        return gameInfoList;
    }
    

    public List<TicketBean> getReservationInfo(String gameId) {
        return ticketDao.getReservationInfo(gameId);
    }

    public List<String> extractUniqueSeatTypes(List<TicketBean> tickets) {
        return tickets.stream()
            .map(TicketBean::getSEATTYPE)
            .distinct()
            .collect(Collectors.toList());
    }
    public List<String> getUniqueSeatTypesByGameId(String gameId) {
        List<TicketBean> tickets = ticketDao.getReservationInfo(gameId);
        return extractUniqueSeatTypes(tickets); 
    }
    
    public Map<String, List<String>> getSeatLocationsByType(String gameId) {
        List<TicketBean> tickets = ticketDao.getReservationInfo(gameId);
        Map<String, List<String>> seatLocationsByType = new HashMap<>();
        for (TicketBean ticket : tickets) {
            if (!seatLocationsByType.containsKey(ticket.getSEATTYPE())) {
                seatLocationsByType.put(ticket.getSEATTYPE(), new ArrayList<>());
            }
            seatLocationsByType.get(ticket.getSEATTYPE()).add(ticket.getSEATLOCATION());
        }
        return seatLocationsByType;
    }

    public double calculateTotalPrice(String gameId, Map<String, Integer> seatSelections) {
        TicketBean gameInfo = getGameInfoById(gameId); // 특정 게임 정보 조회
        LocalDate gameDate = gameInfo.getGAME_DATE().toLocalDate();
        DayOfWeek dayOfWeek = gameDate.getDayOfWeek();
        boolean isWeekend = dayOfWeek == DayOfWeek.SATURDAY || dayOfWeek == DayOfWeek.SUNDAY;
        
        double totalPrice = 0.0;
        List<TicketBean> reservationInfo = getReservationInfo(gameId);
        for (Map.Entry<String, Integer> entry : seatSelections.entrySet()) {
            for (TicketBean ticket : reservationInfo) {
                if (ticket.getSEATTYPE().equals(entry.getKey())) {
                    double price = isWeekend ? ticket.getWEEKEND_PRICE() : ticket.getWEEKDAY_PRICE();
                    totalPrice += entry.getValue() * price;
                    break;
                }
            }
        }
        return totalPrice;
    }
    
    public TicketBean getGameInfoById(String gameId) {
        return this.ticketDao.getGameInfoById(gameId);
    }
    
    public String getStadiumSeatImg(String stadiumId) {
        return ticketDao.getStadiumSeatImg(stadiumId);
    }

    public String findStadiumId(String gameId) {
        return ticketDao.findStadiumId(gameId);
    }
    
    public List<Map<String, Object>> mergeSeatInfo(List<TicketBean> reservationInfo) {
        List<Map<String, Object>> mergedList = new ArrayList<>();

        for (TicketBean ticket : reservationInfo) {
            String seatType = ticket.getSEATTYPE();
            double weekdayPrice = ticket.getWEEKDAY_PRICE();
            double weekendPrice = ticket.getWEEKEND_PRICE();

            // 좌석 유형이 이미 리스트에 존재하는지 확인
            boolean isExisting = false;
            for (Map<String, Object> map : mergedList) {
                String existingSeatType = (String) map.get("seatType");
                if (existingSeatType.equals(seatType)) {
                    // 이미 존재하는 경우 주말 가격과 주중 가격을 갱신
                    map.put("weekdayPrice", weekdayPrice);
                    map.put("weekendPrice", weekendPrice);
                    isExisting = true;
                    break;
                }
            }

            // 새로운 좌석 유형인 경우 리스트에 추가
            if (!isExisting) {
                Map<String, Object> seatInfo = new HashMap<>();
                seatInfo.put("seatType", seatType);
                seatInfo.put("weekdayPrice", weekdayPrice);
                seatInfo.put("weekendPrice", weekendPrice);
                mergedList.add(seatInfo);
            }
        }

        return mergedList;
    }
    
    public List<TicketBean> getGameInfo5() {
        List<TicketBean> gameInfoList = ticketDao.gameinfo5();

         return gameInfoList;
     } 

}