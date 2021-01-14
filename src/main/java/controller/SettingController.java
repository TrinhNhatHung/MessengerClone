package controller;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

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

@WebServlet(urlPatterns = "/setting")
public class SettingController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2811732312295986971L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		int id = (int) session.getAttribute("id");
		User currentUser = UserDAO.getUser(id);
		
		req.setAttribute("currentUser", currentUser);
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/setting.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		int id = (int) session.getAttribute("id");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String passwordSHA256 = DigestUtils.sha256Hex(password);
		String gender = req.getParameter("gender");
		String dateOfBirthStr = req.getParameter("date_of_birth");
		DateFormat format = new SimpleDateFormat("dd/MM/yy");
		Date dateOfBirth = null;
		try {
			if (dateOfBirthStr != null) {
				dateOfBirth = new Date(format.parse(dateOfBirthStr).getTime());
			}
		} catch (ParseException e) {
			
		}
		String address = req.getParameter("address");
		String country = req.getParameter("country");
		String city = req.getParameter("city");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		
		User user = User.builder().id(id).username(username).password(passwordSHA256).gender(gender).address(address).country(country)
				         .city(city).phone(phone).email(email).dateOfBirth(dateOfBirth).build();
		boolean status = UserDAO.update(user);
		if (status == true) {
			session.setAttribute("updateInfo", true);
		} else {
			session.setAttribute("updateInfo", false);
		}
		resp.sendRedirect(req.getContextPath() + "/setting");
	}
}
