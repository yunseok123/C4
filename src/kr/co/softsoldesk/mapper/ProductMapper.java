package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;



import kr.co.softsoldesk.beans.ProductBean;




public interface ProductMapper {
	
	
	  @Select("select * FROM product order by(views)desc")
	    List<ProductBean> selectAllProduct();
	  
	  
	  @Select("select * FROM product order by(views)desc")
	    List<ProductBean> selecTBestProduct();
	  
	  @Update("UPDATE product SET views = views + 1 WHERE product_id = #{productId}")
	    void incrementProductViews(@Param("productId") int productId);

	  
	    
	
	
	  @Select("SELECT * FROM product WHERE product_id = #{productId}")
	  ProductBean selectProductById(@Param("productId") int productId);
	    
	  @Select("select count(*) from product" )
	  int getCountProduct();
	    
	    
	    
	  @Select("SELECT * FROM PRODUCT WHERE CATEGORY = #{category}")
	  List<ProductBean> selectProductsByCategory(@Param("category") String category);
	    
	    
	   

	  @Select("SELECT COUNT(*) FROM PRODUCT WHERE CATEGORY = #{category}")
	  int countProductsByCategory(@Param("category") String category);
	    
	    
	    
	@Insert("INSERT INTO PRODUCT (product_id, name,price,product_img,category) VALUES (product_seq.NEXTVAL, #{name}, #{price}, #{product_Img},#{category})")
	  void insertProduct(ProductBean productBean);

	@Update("UPDATE PRODUCT SET name=#{name}, price=#{price}, product_img=#{product_Img}, category=#{category}, stock=#{stock} WHERE product_id=#{product_Id}")
	    void updateProduct(ProductBean product);

	    // 상품 삭제
	 @Delete("DELETE FROM PRODUCT WHERE product_id=#{productId}")
	    void deleteProduct(@Param("productId") int productId);
	
	 

	    @Update("UPDATE product SET stock = stock - (SELECT quantity FROM orderitems WHERE order_id = #{orderId} AND product.product_id = orderitems.product_id) WHERE product_id IN (SELECT product_id FROM orderitems WHERE order_id = #{orderId})")
	    void decreaseStockByOrderId(@Param("orderId") int orderId);
	    
	    
	    
	    @Select("SELECT * FROM product WHERE Name LIKE '%' || #{searchKeyword} || '%' ORDER BY views DESC")
	    List<ProductBean> selectProductsByName(@Param("searchKeyword") String searchKeyword);

	}


	


