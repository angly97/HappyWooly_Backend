//package com.ssafy.interceptor;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.stereotype.Component;
//import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.github.pagehelper.Page;
//import com.github.pagehelper.PageHelper;
//import com.ssafy.model.service.ReviewService;
//import com.ssafy.util.PageNavigationForPageHelper;
//
//// 어떤 어노테이션? - 컴포넌트
//// 상속받아야 할 것은? - HandlerInterceptor
//// 어디에 설정??
//@Component
//public class PagingInterceptor implements HandlerInterceptor{
//
//	// service 필요
//	@Autowired
//	ReviewService service;
//	
//	@Value("${paging.perpage}")
//	int per;
//	
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		
//		String pageStr = request.getParameter("page");
//		int page = (pageStr == null)? 1 : Integer.parseInt(pageStr);
//		
//		PageHelper.startPage(page, per);
//		
//		return HandlerInterceptor.super.preHandle(request, response, handler);
//	}
//	
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		
//		Object infoObj = modelAndView.getModel().get("info");
//		if(infoObj != null) {
//			Page<?> info = (Page<?>) infoObj;
//			PageNavigationForPageHelper helper = new PageNavigationForPageHelper(info, request.getServletPath()+"?page");
//			modelAndView.addObject("info", helper);
//		}
//		
//		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
//	}
//}
