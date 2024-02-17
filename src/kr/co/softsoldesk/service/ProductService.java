package kr.co.softsoldesk.service;

import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.softsoldesk.beans.OrderBean;
import kr.co.softsoldesk.beans.OrderItemBean;
import kr.co.softsoldesk.beans.PlayerBean;
import kr.co.softsoldesk.beans.ProductBean;
import kr.co.softsoldesk.dao.OrderDao;
import kr.co.softsoldesk.dao.OrderitemDao;
import kr.co.softsoldesk.dao.ProductDao;

@Service
public class ProductService {
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	OrderDao orderDao;
	
	@Autowired
	OrderitemDao orderitemDao;
	
	
    public List<ProductBean> getAllProduct(int page, int size) {
        // 모든 상품을 데이터베이스로부터 가져옵니다.
        List<ProductBean> allProducts = productDao.getAllProduct();

        // 페이징 처리: 스트림을 사용하여 요청된 페이지에 맞는 상품의 서브리스트를 계산합니다.
        return allProducts.stream()
                .skip((long) (page - 1) * size)
                .limit(size)
                .collect(Collectors.toList());
    }
    
    public List<ProductBean> getBestProduct() {
        // 모든 상품을 데이터베이스로부터 가져옵니다.
        List<ProductBean> bestProduct = productDao.getBestProduct();

        
        return bestProduct;
    }

    
    public int getTotalProductCount() {
        return productDao.getCountProduct();
    }
    
    
    public List<ProductBean> getProductsByCategory(String category) {
       
        return productDao.findProductsByCategory(category);
    }

	    public int getTotalPages(String category, int size) {
	        int totalProducts = productDao.countProductsByCategory(category);
	        return (int) Math.ceil((double) totalProducts / size);
	    }
	    
   

    
    public ProductBean getProductid(int productid) {
        productDao.incrementProductViews(productid);

        return productDao.selectProductById(productid);
    }
    
    
    public void insertProduct(ProductBean product) {
    	productDao.insertProduct(product);
    }


    public void updateProduct(ProductBean product) {
        productDao.updateProduct(product);
    }

    // 상품 삭제
    public void deleteProduct(int productId) {
        productDao.deleteProduct(productId);
    }
    
    public List<ProductBean> selectProductsByName(String searchKeyword) {
        return productDao.selectProductsByName(searchKeyword); 
   }
    
    
    
    
   
}

    


   
    
    
