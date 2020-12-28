package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;

@WebServlet(urlPatterns = "/signin")
public class SigninController extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4842461756381851892L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("views/signin.jsp");
		rd.forward(req, resp);;
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		HttpSession session = req.getSession();
			User user = UserDAO.checkLogin(username, password);
			if (user != null) {
				session.setAttribute("username", user.getUsername());
				session.setAttribute("id", user.getId());
				resp.sendRedirect(req.getContextPath() + "/home");
			} else {
				req.setAttribute("username", username);
				req.setAttribute("password", password);
				RequestDispatcher rd = req.getRequestDispatcher("/views/signin.jsp?invalid=true");
				rd.forward(req, resp);
			}			
	}
}
