package controller;

import java.io.IOException;
import static java.util.Comparator.*;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dao.ChatDAO;
import dao.MessageDAO;
import dao.UserDAO;
import model.ItemChat;
import model.ItemChat.StatusMessage;
import model.User;
import model.UsersChat;
import model.UsersChat.TypeMessage;

@WebServlet(urlPatterns = "/home")
public class HomeController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3094158079937489295L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		int id = (int) session.getAttribute("id");
		User currentUser = UserDAO.getUser(id);
		req.setAttribute("currentUser", currentUser);

		List<ItemChat> itemChats = ChatDAO.getListChatWith(id);
		itemChats.sort(nullsLast(comparing(ItemChat::getTime,reverseOrder())));

		Gson gson = new Gson();
		String listItemChats = gson.toJson(itemChats);
		req.setAttribute("listItemChats", listItemChats);
		
		int with =0;
		
		if (itemChats.size() > 0) {
			with = itemChats.get(0).getUser().getId();									
		} 
		
		if (req.getParameter("with") != null) {
			try {
				with = Integer.parseInt(req.getParameter("with"));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		MessageDAO.updateStatus(id, with);
		
		long messageUnread = MessageDAO.getUnRead(id);
		req.setAttribute("messageUnread", messageUnread);
		
	    if (messageUnread != 0) {
	    	String lastNameUnread = MessageDAO.getLastNameUnread(id);
	    	req.setAttribute("lastNameUnread", lastNameUnread);
	    }
		
		User withUser = UserDAO.getUser(with);
		req.setAttribute("withUser", withUser);
		
		List<UsersChat> usersChats = ChatDAO.getUsersChat(id, with);
		usersChats.sort(nullsFirst(comparing(UsersChat::getTime)));
		String listUserChats = gson.toJson(usersChats);
		req.setAttribute("listUserChats", listUserChats);
		
	
		RequestDispatcher rd = req.getRequestDispatcher("/views/home.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
