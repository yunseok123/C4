package kr.co.softsoldesk.controller;

import java.math.BigDecimal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/pay")
public class PaymentController {

    @GetMapping("/payment")
    public String pay(@RequestParam("amount") BigDecimal amount, Model model) {
        model.addAttribute("amount", amount);
        return "pay/payment"; 
    }

    @GetMapping("/payment_success")
    public String paymentSuccess() {
        return "pay/payment_success"; 
    }

    @GetMapping("/payment_fail")
    public String paymentFail() {
        return "pay/payment_fail"; 
    }
 


	@GetMapping("/OrderComplete")
	public String OrderComplete() {
		
	
		return "pay/OrderComplete";
	}
}
