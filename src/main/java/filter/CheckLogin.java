package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/home","/setting"})
public class CheckLogin implements Filter {

	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("init");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		 HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		 HttpSession session = httpServletRequest.getSession();
		 HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		 
		 if (session == null || session.getAttribute("username") == null) {
			 httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/signin");
		 } else {
			 chain.doFilter(request, response);
		 }
	}

	public void destroy() {
		System.out.println("destroy");
	}

}
