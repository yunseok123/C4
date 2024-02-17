package kr.co.softsoldesk.controller;

import java.math.BigDecimal;
import java.sql.Date;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.softsoldesk.beans.OrderBean;
import kr.co.softsoldesk.beans.PriceCalculationRequest;
import kr.co.softsoldesk.beans.TicketBean;
import kr.co.softsoldesk.beans.TicketOrderRequest;
import kr.co.softsoldesk.service.OrderService;
import kr.co.softsoldesk.service.TicketService;

@Controller
@RequestMapping("/ticket")
public class TicketingController {

	@Autowired
	private TicketService ticketService;
	@Autowired
	private OrderService orderService;

	@GetMapping("/Ticketing")
	public String showTicketingPage(Model model) {
		List<TicketBean> gameInfo = ticketService.getGameInfo();

		for (TicketBean game : gameInfo) {
			LocalDate gameDate = game.getGAME_DATE().toLocalDate();
			String dayOfWeek = gameDate.getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.KOREAN);
			game.setDAY_OF_WEEK(dayOfWeek);
		}

		model.addAttribute("gameInfo", gameInfo);
		return "ticket/Ticketing";
	}

	@GetMapping("/reservation")
	public String reservation(@RequestParam("GAME_ID") String gameId, Model model) {
		List<TicketBean> gameInfo = ticketService.getGameInfo();
		model.addAttribute("gameId", gameId);
		model.addAttribute("gameInfo", gameInfo);
		TicketBean selectedGame = gameInfo.stream().filter(game -> gameId.equals(game.getGAME_ID())).findFirst()
				.orElse(null);

		if (selectedGame != null) {
			Date gameDate = selectedGame.getGAME_DATE();
			LocalDate localGameDate = gameDate.toLocalDate();
			// 날짜를 "yyyy-MM-dd" 형식으로 변환하여 모델에 추가
			String formattedGameDate = localGameDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			model.addAttribute("gameDate", formattedGameDate);

			// 요일 정보 추가 (이미 추가됨)
			String dayOfWeek = localGameDate.getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.KOREAN);
			model.addAttribute("gameDayOfWeek", dayOfWeek);

			// 경기 제목 추가 (이미 추가됨)
			String game_title = selectedGame.getHOMETEAM_NAME() + " VS " + selectedGame.getAWAYTEAM_NAME();
			model.addAttribute("game_title", game_title);

			// 시작 시간 추가
			String startTime = selectedGame.getSTART_TIME();
			model.addAttribute("startTime", startTime);
		}

		String stadiumId = ticketService.findStadiumId(gameId);
		String stadiumImg = ticketService.getStadiumSeatImg(stadiumId);
		model.addAttribute("stadiumImg", stadiumImg);

		List<TicketBean> reservationInfo = ticketService.getReservationInfo(gameId);
		List<String> seatTypeList = ticketService.extractUniqueSeatTypes(reservationInfo);
		model.addAttribute("reservationInfo", reservationInfo);
		model.addAttribute("seatTypeList", seatTypeList);

		// 좌석 정보를 중복 처리한 리스트를 생성하여 모델에 추가
		List<Map<String, Object>> mergedSeatInfo = ticketService.mergeSeatInfo(reservationInfo);
		model.addAttribute("mergedSeatInfo", mergedSeatInfo);

		Map<String, List<String>> seatLocations = ticketService.getSeatLocationsByType(gameId);
		model.addAttribute("seatLocations", seatLocations);

		return "ticket/reservation";
	}

	@PostMapping("/calculate-total-price")
	@ResponseBody
	public ResponseEntity<?> calculateTotalPrice(@RequestBody PriceCalculationRequest request) {
		TicketBean selectedGame = ticketService.getGameInfoById(request.getGameId());
		LocalDate gameDate = selectedGame.getGAME_DATE().toLocalDate();
		DayOfWeek dayOfWeek = gameDate.getDayOfWeek();

		boolean isWeekend = dayOfWeek == DayOfWeek.SATURDAY || dayOfWeek == DayOfWeek.SUNDAY;
		List<TicketBean> reservationInfo = ticketService.getReservationInfo(request.getGameId());
		Map<String, Integer> seatSelections = request.getSeatSelections();

		double totalPrice = 0;
		Map<String, Double> categoryPrices = new HashMap<>();
		Map<String, Integer> categorySeatCounts = new HashMap<>();

		for (Map.Entry<String, Integer> entry : seatSelections.entrySet()) {
			String seatType = entry.getKey();
			Integer count = entry.getValue();

			for (TicketBean ticket : reservationInfo) {
				if (ticket.getSEATTYPE().equals(seatType)) {
					double price = isWeekend ? ticket.getWEEKEND_PRICE() : ticket.getWEEKDAY_PRICE();
					double categoryTotalPrice = count * price;

					categoryPrices.put(seatType, categoryTotalPrice);

					categorySeatCounts.put(seatType, count);

					totalPrice += categoryTotalPrice;
					break;
				}
			}
		}

		Map<String, Object> response = new HashMap<>();
		response.put("totalPrice", totalPrice);

		response.put("categories", categoryPrices);
		response.put("seatCounts", categorySeatCounts);

		return ResponseEntity.ok(response);
	}

	@PostMapping("/ticketOrder")
	public String ticketOrder(@RequestParam("userName") String userName,
	                          @RequestParam("userBirthdate") String userBirthdate,
	                          @RequestParam("userPhone") String userPhone,
	                          @RequestParam("userEmail") String userEmail,
	                          @RequestParam("ticketTitle") String ticketTitle,
	                          @RequestParam("gameDate") String gameDate,
	                          @RequestParam("startTime") String startTime,
	                          @RequestParam("seat") String ticketSeat,
	                          @RequestParam("selectedSeatsList") List<String> selectedSeats,
	                          @RequestParam("amount") BigDecimal amount, // finalPrice를 amount로 받음
	                          @RequestParam("GAME_ID") String gameId,
	                          RedirectAttributes redirectAttributes) {
	    // OrderBean 객체 생성 및 값 설정
	    OrderBean order = new OrderBean();
	    order.setOrdererName(userName);
	    order.setCellphoneNumber(userPhone);
	    order.setEmail(userEmail);
	    order.setTicketTitle(ticketTitle);
	    order.setGameDate(gameDate);
	    order.setStartTime(startTime);
	    order.setTicketSeat(ticketSeat);
	    order.setFinalPrice(amount); // 컨트롤러에서 받은 amount 값을 finalPrice로 설정
	    order.setGameId(gameId);
	    order.setUserBirthdate(userBirthdate);
	    order.setSelectedSeats(selectedSeats);
	    order.setOrderStatus("예약 완료");
	    // 예약 정보 DB에 저장하는 서비스 메서드 호출
	    orderService.saveReservation(order);
	    orderService.updateReservation(order);

	    // 결제 페이지로 리다이렉트
	    return "redirect:/pay/payment?amount=" + amount;
	}


}
