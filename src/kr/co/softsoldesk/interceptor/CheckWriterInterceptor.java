package kr.co.softsoldesk.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.softsoldesk.beans.ContentBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.service.BoardService;

public class CheckWriterInterceptor implements HandlerInterceptor{

		private UserBean loginUserBean;
		private BoardService boardService;
		
		public CheckWriterInterceptor(UserBean loginUserBean, BoardService BoardService) {
			
			this.loginUserBean = loginUserBean;
			this.boardService = BoardService;
		}

		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			String str1 = request.getParameter("community_id");
			int community_id = Integer.parseInt(str1);
			
			ContentBean currentContentBean = boardService.getContentInfo(community_id);
			
			if(currentContentBean.getUser_idx() != loginUserBean.getUser_idx()) {
				String contextPath = request.getContextPath();
				response.sendRedirect(contextPath + "/board/not_writer");
				
				return false;
			}
			
			return true;
		}
		
		
}
