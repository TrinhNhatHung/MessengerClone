package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dao.UserDAO;
import model.User;

@WebServlet (urlPatterns = "/addContact")
public class AddContact extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		int id = (int) session.getAttribute("id");
		User currentUser = User.builder().id(id).build();
		List<User> allUsers = UserDAO.getAllUser(currentUser);
		Gson gson = new Gson();
		String allUserJson = gson.toJson(allUsers);
		req.setAttribute("allUserJson", allUserJson);
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/addcontact.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
