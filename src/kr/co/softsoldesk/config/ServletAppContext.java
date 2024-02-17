package kr.co.softsoldesk.config;

import javax.annotation.Resource;

import org.apache.commons.dbcp2.BasicDataSource;





import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.client.registration.InMemoryClientRegistrationRepository;
import org.springframework.security.oauth2.core.AuthorizationGrantType;

import kr.co.softsoldesk.beans.BoardInfoBean;
import kr.co.softsoldesk.beans.OrderBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.interceptor.CheckLoginInterceptor;
import kr.co.softsoldesk.interceptor.CheckWriterInterceptor;
import kr.co.softsoldesk.interceptor.TopMenuInterceptor;
import kr.co.softsoldesk.mapper.AwardsMapper;
import kr.co.softsoldesk.mapper.BoardMapper;
import kr.co.softsoldesk.mapper.OrderMapper;
import kr.co.softsoldesk.mapper.OrderitemMapper;
import kr.co.softsoldesk.mapper.PlayerMapper;
import kr.co.softsoldesk.mapper.ProductMapper;
import kr.co.softsoldesk.mapper.QuestionMapper;
import kr.co.softsoldesk.mapper.RecordMapper;
import kr.co.softsoldesk.mapper.StadiumMapper;
import kr.co.softsoldesk.mapper.TeamMapper;
import kr.co.softsoldesk.mapper.TicketMapper;
import kr.co.softsoldesk.mapper.TopMenuMapper;
import kr.co.softsoldesk.mapper.UserMapper;

import kr.co.softsoldesk.service.BoardService;
import kr.co.softsoldesk.service.TopMenuService;

@Configuration
@EnableWebMvc // �뜝�럥裕욅춯 �뀎 �뇡  �뜝�럥�넮�뜝�럡�뀞嶺뚯쉻�삕 �뜝�럡�� 寃ュ뜝�룞�삕 踰� �뜝�럡源삣뜝�럩�굥�뜝�럥裕� 繞벿우삕 Controller �뜝�럥�꽑�뜝�럥嫄쀥뜝�럥 誘��삕 逾졾뜝�럥 �댙�삕 諭�
            // �뤆�룊�삕嶺뚯쉻�삕 �뫅�삕 �뜝�럩肉녑뜝�럥裕� �뜝�럡源삣뜝�럩�굥�뜝�럥裕� �뜝�럥援뜹뜝�럩諭� Controller�슖�댙�삕 �뜝�럥苡삣슖�댙�삕
@ComponentScan(basePackages = "kr.co.softsoldesk.controller")
@ComponentScan(basePackages = "kr.co.softsoldesk.beans")
@ComponentScan("kr.co.softsoldesk.dao")
@ComponentScan("kr.co.softsoldesk.service")
@ComponentScan("kr.co.softsoldesk.interceptor")
@PropertySource("/WEB-INF/properties/db.properties")
@PropertySource("/WEB-INF/properties/kakao.properties")
public class ServletAppContext implements WebMvcConfigurer {
   // Spring MVC �뜝�럥�뒆�슖�돦裕� �젾�뜝�럥諭쒎뜝�럥�뱺  苑닷뜝�룞�삕 議껃뜝�럥彛� �뜝�럡�맟�뜝�럩�젧�뜝�럩諭� �뜝�럥由��뜝�럥裕� �뜝�럡源삣뜝�럩�굥�뜝�럥裕�

   @Value("${db.classname}")
   private String db_classname;

   @Value("${db.url}")
   private String db_url;

   @Value("${db.username}")
   private String db_username;

   @Value("${db.password}")
   private String db_password;
   
   
   @Autowired
   private TopMenuService topMenuService;
   
   @Resource(name = "loginUserBean")
   private UserBean loginUserBean;
   
    
   @Autowired
   private BoardService BoardService;

   
   @Autowired
   private Environment env;
   
   
  
  

   @Override
   public void addResourceHandlers(ResourceHandlerRegistry registry) { // �뜝�럩�젧�뜝�럩�쓤 �뜝�럥�냱�뜝�럩逾� �뇦猿뗫윥餓�  嶺뚮씞�걢�뇡  (�뜝�럩逾졿쾬�꼶梨룟뜝 ,
                                                      // �뜝�럥吏쀥뜝�럩寃ュ뜝�럡留� �뜝�럥苡�)
      WebMvcConfigurer.super.addResourceHandlers(registry);
      registry.addResourceHandler("/**").addResourceLocations("/resources/");
   }

   @Override
   public void configureViewResolvers(ViewResolverRegistry registry) { // Controller�뜝�럩踰� 嶺뚮∥�뾼�땻�슪�삕獄��쑚泥롥뜝  �뛾�룇瑗� �꼶�뜝�럥由��뜝�럥裕� �뜝�럥�냱�뜝�럩逾�
                                                      // �뜝�럥留곩뜝�럥痢잌뜝�럥�뱺 �뇦猿뗫윥餓λ뜉�삕�뜝  �뜝�럩�꼪�뜝�럩�궋�뜝�럩�겱  鍮딃겫�룞�삕
      WebMvcConfigurer.super.configureViewResolvers(registry);
      registry.jsp("/WEB-INF/views/", ".jsp");
   }

   @Bean
   public BasicDataSource dataSource() {
      //  �쑓 �뵠 苑ｈ린醫롮뵠 �뮞  �젔 �꺗  �젟癰�  �꽴 �뵳 
      BasicDataSource source = new BasicDataSource();
      source.setDriverClassName(db_classname);
      source.setUrl(db_url);
      source.setUsername(db_username);
      source.setPassword(db_password);

      return source;
   }

   @Bean
   public SqlSessionFactory factory(BasicDataSource source) throws Exception {
      // MyBatis  肉� 苑�  �젫�⑤벏釉� �뮉 揶쏆빘猿�, SQL  苑� �� �뱽  源� 苑�
      SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
      factoryBean.setDataSource(source);
      SqlSessionFactory factory = factoryBean.getObject();

      return factory;
   }

   
   @Bean
   public ClientRegistrationRepository clientRegistrationRepository() {
       ClientRegistration kakaoClientRegistration = ClientRegistration
           .withRegistrationId("kakao")
           .clientId(env.getProperty("kakao.client.id"))
           .clientSecret(env.getProperty("kakao.client.secret"))
           .redirectUriTemplate("http://localhost:9090/oauth2/kakao")
           .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
           .tokenUri("https://kauth.kakao.com/oauth/token")
           .authorizationUri("https://kauth.kakao.com/oauth/authorize")
           .userInfoUri("https://kapi.kakao.com/v2/user/me")
           .userNameAttributeName("id")
           .build();

       return new InMemoryClientRegistrationRepository(kakaoClientRegistration);
   }
 


   
   
   @Bean
   public MapperFactoryBean<UserMapper> getUserMapper(SqlSessionFactory factory) throws Exception { //  �쐩 �닑 遊� �닱榮먭쑴諭�

      MapperFactoryBean<UserMapper> factoryBean = new MapperFactoryBean<UserMapper>(UserMapper.class);

      factoryBean.setSqlSessionFactory(factory);

      return factoryBean;
   }
   @Bean
   public MapperFactoryBean<TeamMapper> getTeamMapper(SqlSessionFactory factory) throws Exception {
       MapperFactoryBean<TeamMapper> factoryBean = new MapperFactoryBean<TeamMapper>(TeamMapper.class);
       factoryBean.setSqlSessionFactory(factory);
       return factoryBean;
   }
   
   @Bean
   public MapperFactoryBean<StadiumMapper> getStadiumMapper(SqlSessionFactory factory) throws Exception {
       MapperFactoryBean<StadiumMapper> factoryBean = new MapperFactoryBean<StadiumMapper>(StadiumMapper.class);
       factoryBean.setSqlSessionFactory(factory);
       return factoryBean;
   }
   
   @Bean
   public MapperFactoryBean<PlayerMapper> getPlayerMapper(SqlSessionFactory factory) throws Exception {
       MapperFactoryBean<PlayerMapper> factoryBean = new MapperFactoryBean<PlayerMapper>(PlayerMapper.class);
       factoryBean.setSqlSessionFactory(factory);
       return factoryBean;
   }
 @Bean
   public MapperFactoryBean<AwardsMapper> getAwardsMapper(SqlSessionFactory factory) throws Exception {
       MapperFactoryBean<AwardsMapper> factoryBean = new MapperFactoryBean<AwardsMapper>(AwardsMapper.class);
       factoryBean.setSqlSessionFactory(factory);
       return factoryBean;
   }
   @Bean
   public MapperFactoryBean<RecordMapper> getRecordMapper(SqlSessionFactory factory) throws Exception {
       MapperFactoryBean<RecordMapper> factoryBean = new MapperFactoryBean<RecordMapper>(RecordMapper.class);
       factoryBean.setSqlSessionFactory(factory);
       return factoryBean;

   }
   
   @Bean
   public MapperFactoryBean<ProductMapper> getProductMapper(SqlSessionFactory factory) throws Exception {
       MapperFactoryBean<ProductMapper> factoryBean = new MapperFactoryBean<ProductMapper>(ProductMapper.class);
       factoryBean.setSqlSessionFactory(factory);
       return factoryBean;

   }
   
   @Bean
   public MapperFactoryBean<TopMenuMapper> getTopMenuMapper(SqlSessionFactory factory)throws Exception{
      
      MapperFactoryBean<TopMenuMapper> factoryBean = new MapperFactoryBean<TopMenuMapper>(TopMenuMapper.class);
      factoryBean.setSqlSessionFactory(factory);
      
      return factoryBean;
   }
   
   @Bean
   public MapperFactoryBean<OrderMapper> getOrderMapper(SqlSessionFactory factory)throws Exception{
      
      MapperFactoryBean<OrderMapper> factoryBean = new MapperFactoryBean<OrderMapper>(OrderMapper.class);
      factoryBean.setSqlSessionFactory(factory);
      
      return factoryBean;
   }
   @Bean
   public MapperFactoryBean<OrderitemMapper> getOrderitemMapper(SqlSessionFactory factory)throws Exception{
      
      MapperFactoryBean<OrderitemMapper> factoryBean = new MapperFactoryBean<OrderitemMapper>(OrderitemMapper.class);
      factoryBean.setSqlSessionFactory(factory);
      
      return factoryBean;
   }
   @Bean
   public MapperFactoryBean<TicketMapper> getTicketemMapper(SqlSessionFactory factory)throws Exception{
      
      MapperFactoryBean<TicketMapper> factoryBean = new MapperFactoryBean<TicketMapper>(TicketMapper.class);
      factoryBean.setSqlSessionFactory(factory);
      
      return factoryBean;
   }
   @Bean
   public MapperFactoryBean<BoardMapper> getBoardMapper(SqlSessionFactory factory)throws Exception{
      
      MapperFactoryBean<BoardMapper> factoryBean = new MapperFactoryBean<BoardMapper>(BoardMapper.class);
      factoryBean.setSqlSessionFactory(factory);
      
      return factoryBean;
   }
   @Bean
   public MapperFactoryBean<QuestionMapper> getQuestionMapper(SqlSessionFactory factory)throws Exception{
      
      MapperFactoryBean<QuestionMapper> factoryBean = new MapperFactoryBean<QuestionMapper>(QuestionMapper.class);
      factoryBean.setSqlSessionFactory(factory);
      
      return factoryBean;
   }
   

   
   




   
   @Bean
   public static PropertySourcesPlaceholderConfigurer placeholderConfigurer() {
      return new PropertySourcesPlaceholderConfigurer();
   }

   
   @Bean
   public ReloadableResourceBundleMessageSource messageSource() {

      ReloadableResourceBundleMessageSource res = new ReloadableResourceBundleMessageSource();

      res.setBasename("/WEB-INF/properties/error_message");

      return res;
   }
   @Override
   public void addInterceptors(InterceptorRegistry registry) {
   
      TopMenuInterceptor topMenuInterceptor = new TopMenuInterceptor(topMenuService, loginUserBean);
      CheckLoginInterceptor checkLoginInterceptor = new CheckLoginInterceptor(loginUserBean);
      CheckWriterInterceptor checkWriterInterceptor = new CheckWriterInterceptor(loginUserBean, BoardService);
      

      InterceptorRegistration reg1 = registry.addInterceptor(topMenuInterceptor);
      InterceptorRegistration reg2 = registry.addInterceptor(checkLoginInterceptor);

      
      
      reg1.addPathPatterns("/**");//紐⑤뱺  슂泥  뿉 꽌  룞 옉
      reg1.excludePathPatterns("/user/modify");
      
      reg2.addPathPatterns("/user/modify", "/user/logout", "/board/*","/product/*","/user/userPurchasehistory","/admin/admin");
     
      reg2.excludePathPatterns("/board/main","/product/Market","/product/Market_order");
    
      InterceptorRegistration reg3 = registry.addInterceptor(checkWriterInterceptor);
      reg3.addPathPatterns("/board/modify", "/board/delete");
		 
      //수정, 삭제 페이지 접근시 인터셉터
   }
   
   @Bean
   public StandardServletMultipartResolver multipartResolver() {
      
      return new StandardServletMultipartResolver();
   }
}




