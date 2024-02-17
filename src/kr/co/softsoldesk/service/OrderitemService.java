package kr.co.softsoldesk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.OrderItemBean;
import kr.co.softsoldesk.dao.OrderitemDao;

@Service
public class OrderitemService {
	
	
	
	@Autowired 
	OrderitemDao orderitemDao;
	
	public void insertProductOrder(OrderItemBean orderitem) {
    	
		orderitemDao.insertProductOrder(orderitem);
    	
    	
    }
	
	
	

}
