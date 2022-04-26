package Filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Logfilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("这是过滤器的销毁");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
		FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);
		req.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		String request_uri = req.getRequestURI();
		String ctxPath = req.getContextPath();
		String uri = request_uri.substring(ctxPath.length());
		if (uri.contains("index.jsp") || uri.contains("store.jsp")|| uri.contains("6.1.log.jsp")|| uri.contains("check.jsp")) {
			chain.doFilter(request, response);}
		else{
			if (session.getAttribute("log") != null) {
				chain.doFilter(request, response);
			} 
			else {
				out.println("您没有登录，请先登录！5秒后回到登录页面。");
				resp.setHeader("refresh", "5;url=index.jsp");
				return;
			}
		}
		System.out.println("这是session"+session.getAttribute("log"));	
	}
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("这是过滤器的init    "+arg0.getInitParameter("site"));		
	}
}
