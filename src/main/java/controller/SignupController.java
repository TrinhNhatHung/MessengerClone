package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;

import dao.UserDAO;
import model.User;

@WebServlet ( urlPatterns =  "/signup")
public class SignupController extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8387487067040817281L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/views/signup.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String password = req.getParameter("password");
		String passwordSHA256 = DigestUtils.sha256Hex(password);
		String email = req.getParameter("email");
		String gender = req.getParameter("gender");
		String phone = req.getParameter("phonenumber");
		
		User user = User.builder().username(name).password(passwordSHA256).email(email).gender(gender).phone(phone).build();
		
		User newUser = UserDAO.register(user);
		if (newUser != null) {
			HttpSession session = req.getSession();
			session.setAttribute("username", newUser.getUsername());
			session.setAttribute("id", newUser.getId());
			resp.sendRedirect(req.getContextPath() + "/home");
		} else {
			req.setAttribute("name", name);
			req.setAttribute("password", password);
			req.setAttribute("email", email);
			req.setAttribute("gender", gender);
			req.setAttribute("phonenumber", phone);
			RequestDispatcher rd = req.getRequestDispatcher("/views/signup.jsp?error=true");
			rd.forward(req, resp);
		}
	}
}