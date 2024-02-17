package kr.co.softsoldesk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.co.softsoldesk.beans.OrderBean;
import kr.co.softsoldesk.beans.PlayerBean;
import kr.co.softsoldesk.beans.ProductBean;
import kr.co.softsoldesk.mapper.ProductMapper;

@Repository
public class ProductDao {
	
	@Autowired
	ProductMapper productMapper;
	
	
	
	
	
	  public List<ProductBean> getAllProduct() {
	       List<ProductBean> ProductList=productMapper.selectAllProduct();
	       
	       return ProductList;
	        
	  }
	  
	  public List<ProductBean> getBestProduct() {
	       List<ProductBean> ProductList=productMapper.selecTBestProduct();
	       
	       return ProductList;
	        
	  }
	  
	  public void incrementProductViews(int productId) {
	        productMapper.incrementProductViews(productId);
	    }
	  
	  
	    public ProductBean selectProductById(int productId) {
	        return productMapper.selectProductById(productId);
	    }
	    
	    public int getCountProduct() {
	    	return productMapper.getCountProduct();
	    }
	    
	    public List<ProductBean> findProductsByCategory(String category) {
	        return productMapper.selectProductsByCategory(category);
	    }

	    public int countProductsByCategory(String category) {
	        return productMapper.countProductsByCategory(category);
	    }
	    
	    public void insertProduct(ProductBean product) {
	    	productMapper.insertProduct(product);
	       
	 
	    }
	    public void updateProduct(ProductBean product) {
	        productMapper.updateProduct(product);
	    }

	    // 상품 삭제
	    public void deleteProduct(int productId) {
	        productMapper.deleteProduct(productId);
	    }
	    
	    public void decreaseStockByOrderId(int orderId) {
	        productMapper.decreaseStockByOrderId(orderId);
	    }
	    
	    
	    public List<ProductBean> selectProductsByName(String searchKeyword) {
	        return productMapper.selectProductsByName(searchKeyword);
	    }
	    
	    
	    
	    
	    
	  
}

	   



