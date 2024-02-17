package kr.co.softsoldesk.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.softsoldesk.beans.OrderBean;
import kr.co.softsoldesk.beans.OrderItemBean;
import kr.co.softsoldesk.beans.PageBean;
import kr.co.softsoldesk.beans.ProductBean;
import kr.co.softsoldesk.beans.QuestionBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.dao.ProductDao;
import kr.co.softsoldesk.service.OrderService;
import kr.co.softsoldesk.service.OrderitemService;
import kr.co.softsoldesk.service.ProductService;
import kr.co.softsoldesk.service.QuestionService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	
	
	@Autowired
	private  ProductService productService; 
	
	@Autowired
	private OrderService orderService;
	
	
	@Autowired
	private QuestionService questionService;
	
	
	

	

   
    
	
	@GetMapping("/Market")
	public String Market(
						@RequestParam(value = "page", defaultValue = "1") int page,
            			 @RequestParam(value = "size", defaultValue = "10") int size, Model model) {	
		 	List<ProductBean> productAll = productService.getAllProduct(page, size);
		 	List<ProductBean> productBest = productService.getBestProduct();
	        // 전체 상품 수를 기반으로 총 페이지 수를 계산합니다.
	        int totalProducts = productService.getTotalProductCount();
	        int totalPages = (int) Math.ceil((double) totalProducts / size);

	        // 모델에 데이터를 추가합니다.
	        model.addAttribute("productAll", productAll);
	        model.addAttribute("productBest", productBest);
	        model.addAttribute("totalPages", totalPages);
	        model.addAttribute("currentPage", page);

	        return "product/Market";
	}
	 

	    @GetMapping("/Market_order")
	    public String Market_order(@RequestParam("product_id") int productId,
                @RequestParam(value = "category", required = false) String category, // 카테고리 파라미터 추가
                	Model model){
	    	ProductBean product=productService.getProductid(productId);	   
	        model.addAttribute("product", product);
	        model.addAttribute("product_id", productId); 
	        List<QuestionBean> questions = questionService.getQuestions(productId);
	        model.addAttribute("category", category); // 모델에 카테고리 추가

	        model.addAttribute("questions", questions);
	        boolean showUniformOptions = "유니폼".equals(category);
	        model.addAttribute("showUniformOptions", showUniformOptions);
	        model.addAttribute("questionBean", new QuestionBean()); 
	        return "product/Market_order";
	    }
	    
	   

	    
	    @GetMapping("/write")
	    public String write(Model model) {
	        if (loginUserBean.isUserLogin() == false) {
	                  
	            return "redirect:/user/not_login";
	        }
	        
	        model.addAttribute("writequestionbean", new QuestionBean());
	        return "product/write";
	    }

	  @PostMapping("/write_pro")
		public String write_pro(@Valid @ModelAttribute("questionBean") QuestionBean questionbean,
								@RequestParam("product_id") int productId,
								
								BindingResult result , Model model) {
			if(result.hasErrors()) {
				return "product/write";
			}
		    questionbean.setProductId(productId);
			
			questionService.createQuestion(questionbean);
			
		
			return "product/write_success";
			
		}
	    @GetMapping("/read")
		public String read(@RequestParam("questionid") int questionid,Model model) {
			
			QuestionBean questionBean1 = questionService.getQuestionContent(questionid);
			
			model.addAttribute("questionBean", questionBean1);
			model.addAttribute("questionid", questionid);
			model.addAttribute("loginUserBean", loginUserBean);
			
			
			return "product/read";
		}
	   @GetMapping("/delete")
		public String delete(@RequestParam("questionid") int questionid,
							 Model model) {
			questionService.deleteQuestion(questionid);
		
			return "product/delete";
		}
	   	@GetMapping("/answer")
	    public String addAnswer(@RequestParam("questionid") int questionid, 
	                 @ModelAttribute("answerBean") QuestionBean answerBean, Model model) {
	        
	        // 기존 답변을 answerBean에 설정
	        model.addAttribute("questionid", questionid);
	        QuestionBean tempAnswerBean = questionService.getQuestionContent(questionid);
	        
	        answerBean.setAnswertext(tempAnswerBean.getAnswertext());
	        answerBean.setQuestionstatus(tempAnswerBean.getQuestionstatus());
	        answerBean.setQuestionid(questionid); // 폼에 questionid를 전달하여, 답변이 해당 질문에 연결되도록 합니다.
	        
	        model.addAttribute("answerBean",answerBean);
	        
	        return "product/answer";
	    }

  		@PostMapping("/answer_success")
	    public String answer_success(@Valid @ModelAttribute("answerBean") QuestionBean answerBean,
	                              BindingResult result) {
	        if(result.hasErrors()) {
	            return "product/answer";
	        }
	        
	        System.out.println(answerBean.getAnswertext());
	        System.out.println(answerBean.getAnswertext());
	        
	        questionService.updateAnswer(answerBean); // 답변 업데이트 및 상태 변경 로직을 수행
	        return "product/answer_success";
	    }
	    
	    @GetMapping("/cart")
	    public String cart(@RequestParam("product_id") int productId,
	                       @RequestParam("total_price") int totalPrice,
	                       @RequestParam("quantity") int quantity,
	                       @RequestParam(value = "category", required = false) String category,
	                    
	                       Model model) {
	        ProductBean product = productService.getProductid(productId); // 상품 정보 조회
	        model.addAttribute("product", product);
	        model.addAttribute("totalPrice", totalPrice);
	        model.addAttribute("quantity", quantity);
	        model.addAttribute("category", category); 

	        return "product/cart"; // 장바구니 페이지로 이동
	    }

		
		
		
		
		@GetMapping("/ordersheet")
		public String ordersheet(@RequestParam("product_id") int productId,
		                        
		                         Model model) {
		    // product_id를 사용하여 상품 정보를 조회
		    ProductBean product = productService.getProductid(productId);

		    // 모델에 조회한 상품 정보 및 받은 파라미터 추가
		    model.addAttribute("product", product);
		 
		    // 주문 객체를 모델에 추가
		    model.addAttribute("order", new OrderBean());

		    return "product/ordersheet";
		}


		@PostMapping("/placeOrder")
		public String placeOrder(@Valid @ModelAttribute("order") OrderBean order,
		                         @RequestParam("finalPriceHidden") BigDecimal finalPriceHidden,
		                         @RequestParam("productId") int productId,
		                         @RequestParam("quantity") int quantity,
		                         @RequestParam("price") int price,
		                         @RequestParam("productSize") String productSize,
		                        
		                         RedirectAttributes redirectAttributes) {
		    
		    // 주문 상태 설정 및 최종 가격 설정
		    order.setOrderStatus("입고대기");
		    order.setFinalPrice(finalPriceHidden);

		    // OrderItemBean 객체를 생성하고 설정
		    OrderItemBean orderItem = new OrderItemBean();
		    orderItem.setOrderId(0); // 임시로 0을 설정, 실제 ID는 OrderService에서 설정됩니다.
		    orderItem.setProductiId(productId);
		    orderItem.setQuantity(quantity);
		    orderItem.setPrice(price);
		    orderItem.setSizes(productSize);

		    // 주문 정보와 주문 항목을 데이터베이스에 저장
		    orderService.addOrderAndOrderItem(order, orderItem);

		    // 성공적으로 주문이 완료되면 결제 페이지로 리디렉션
		    return "redirect:/pay/payment?amount=" + finalPriceHidden;
		}
		

		 @GetMapping("/userQuestionRead")
			public String userQuestionRead(@RequestParam("questionid") int questionid,Model model) {
				
				QuestionBean questionBean1 = questionService.getQuestionContent(questionid);
				
				model.addAttribute("questionBean", questionBean1);
				model.addAttribute("questionid", questionid);
				model.addAttribute("loginUserBean", loginUserBean);
				
				
				return "product/userQuestionRead";
			}
		 @GetMapping("/UserDelete")
			public String UserDelete(@RequestParam("questionid") int questionid,
								 Model model) {
				questionService.deleteQuestion(questionid);
			
				return "product/UserDelete";
			}
		

}
