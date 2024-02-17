package kr.co.softsoldesk.config;

import javax.servlet.Filter;
import javax.servlet.FilterRegistration;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.web.WebApplicationInitializer;   // WebApplicationInitializer �옄諛붿퐫�뱶濡� web.xml ��泥�
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;
// �쎒�뼱�뵆由ъ��씠�뀡 �꽌踰�(�넱罹�)媛� 理쒖큹 援щ룞�떆 媛곸쥌 �꽕�젙 �젙�쓽
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

   // 諛⑸쾿 1
public class SpringConfigClass implements WebApplicationInitializer{

   @Override
   public void onStartup(ServletContext servletContext) throws ServletException {
      
      //web.xml <servlet>
      AnnotationConfigWebApplicationContext servletAppContext = new AnnotationConfigWebApplicationContext();
      //Spring MVC �봽濡쒖젥�듃 �꽕�젙�쓣 �쐞�빐 �옉�꽦�븯�뒗 �겢�옒�뒪�쓽 媛앹껜瑜� �깮�꽦(�뒪�봽留� 而⑦뀒�씠�꼫)
      
      servletAppContext.register(ServletAppContext.class);
      //ServletAppContext瑜� �븷�뵆由ъ��씠�뀡 而⑦뀓�뒪�듃�뿉 �벑濡�
      
      DispatcherServlet dispatcherServlet = new DispatcherServlet(servletAppContext);
      ServletRegistration.Dynamic servlet = servletContext.addServlet("dispatcher", dispatcherServlet);
      
      servlet.setLoadOnStartup(1);      // �슦�꽑�닚�쐞 �꽕�젙
      servlet.addMapping("/");
      
      AnnotationConfigWebApplicationContext rootAppContext = new AnnotationConfigWebApplicationContext();
      rootAppContext.register(RootAppContext.class);            // Bean�쓣 �젙�쓽�븯�뒗 �겢�옒�뒪 吏��젙
      
      ContextLoaderListener listener = new ContextLoaderListener(rootAppContext);   // listener 吏��젙
      servletContext.addListener(listener);   
      // web.xml �뿉�꽌 <listener> �뿭�븷
      
      FilterRegistration.Dynamic filter = servletContext.addFilter("encodingFilter", CharacterEncodingFilter.class);
      filter.setInitParameter("encoding", "UTF-8");
      // web.xml�뿉�꽌 <filter> �뿭�븷
      
      filter.addMappingForServletNames(null, false, "dispatcher");
      MultipartConfigElement multipartConfigElement = new MultipartConfigElement(null, 52428800, 524288000, 0);
      
      servlet.setMultipartConfig(multipartConfigElement);
   }
}

/*  // 諛⑸쾿 2
public class SpringConfigClass extends AbstractAnnotationConfigDispatcherServletInitializer {

   @Override
   protected Class<?>[] getRootConfigClasses() {
      return new Class[] {RootAppContext.class};
   }   // �봽濡쒖젥�듃�뿉�꽌 �궗�슜�븷 Bean�뱾�쓣 �젙�쓽�븯湲� �쐞�븳 �겢�옒�뒪 吏��젙

   @Override
   protected Class<?>[] getServletConfigClasses() {
      return new Class[] {ServletAppContext.class};
   }   // Spring MVC �봽濡쒖젥�듃 �꽕�젙�쓣 �쐞�븳 �겢�옒�뒪 吏��젙

   @Override
   protected String[] getServletMappings() {
      return new String[] {"/"};
   }   //DispatcherServlet�뿉 留ㅽ븨�븷 �슂泥� 二쇱냼瑜� �꽭�똿

   @Override
   protected Filter[] getServletFilters() {
      CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
      encodingFilter.setEncoding("UTF-8");
      return new Filter[] {encodingFilter}; 
   }   // �뙆�씪誘명꽣 �씤肄붾뵫 �븘�꽣 �꽕�젙
   
}
*/