package controller;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;

import dao.ChatDAO;
import model.UsersChat;
import model.UsersChat.TypeMessage;
import socket.Server.KindMessage;

@WebServlet(urlPatterns = "/send-message")
public class SendMessageController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2442128254657410014L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendError(404);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		int withUserId = 0;
		int currentId = 0;
		try {
		     withUserId =(int)session.getAttribute("withUser");
			 currentId = (int)session.getAttribute("id");
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(fileItemFactory);

		try {
			List<FileItem> fileItems = upload.parseRequest(req);
			for (FileItem fileItem : fileItems) {
				String nameFileDefault = fileItem.getName();
				if (!nameFileDefault.equals("")) {
					String dirUrl = getServletContext().getRealPath("") + File.separator + "FileMessage";

					File dir = new File(dirUrl);
					if (!dir.exists()) {
						dir.mkdir();
					}

					String extension = nameFileDefault.substring(nameFileDefault.lastIndexOf("."));
					Long time = Calendar.getInstance().getTimeInMillis();

					String filePath = dirUrl + File.separator + time + extension;
					String nameFileChanged = time + extension;
					File file = new File(filePath);
					try {
						if (file.exists()) {
							file.delete();
						}
						fileItem.write(file);
						String typeFile = fileItem.getContentType();
						TypeMessage type = TypeMessage.IMAGE;
						if (!typeFile.substring(0,typeFile.indexOf("/")).equals("image")) {
							type = TypeMessage.FILE;
						}
						
						UsersChat usersChat = UsersChat.builder()
								                       .senderId(currentId)
								                       .receiverId(withUserId)
								                       .type(type)
								                       .time(time)
								                       .content(nameFileDefault + "/" + nameFileChanged)
								                       .build();
						boolean status = ChatDAO.sendMessage(usersChat);
						if (status) {
							KindMessage kindMessage = new KindMessage("message",usersChat , currentId);
							String kindMessageJson = new Gson().toJson(kindMessage);
							session.setAttribute("FileNeededSend", kindMessageJson);
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		}

		resp.sendRedirect(req.getContextPath() + "/home?with=" + withUserId);
	}
}
