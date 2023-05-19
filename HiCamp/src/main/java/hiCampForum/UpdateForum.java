package hiCampForum;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import hiCampBean.ForumBean;
import hiCampDao.ForumDao;

@WebServlet("/UpdateForum")
public class UpdateForum extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = null;
		ForumBean forum = new ForumBean();
		ForumDao forumDao = new ForumDao();
		int issuccess = 0;
	
		try {
			 Context context = new InitialContext();
	         DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/HiCamp");
	         conn = ds.getConnection();
	         
	         String forumNo = request.getParameter("forumNo");
	         String forumType = request.getParameter("forumType");
	         String forumTitle = request.getParameter("forumTitle");
	         String forumPost = request.getParameter("forumPost");
	         
	         ForumBean originalForum = new ForumBean();
	         originalForum.setForumNo(forumNo);
	         forumDao.getPostbyNo(conn, originalForum);
	         
	         LocalDateTime now = LocalDateTime.now();
	         DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	         String forumDate = now.format(formatter);
	         
	         forum.setForumNo(forumNo);
	         
	         forum.setForumType(forumType.isEmpty() ? originalForum.getForumType() : forumType);
	         forum.setForumTitle(forumTitle.isEmpty() ? originalForum.getForumTitle() : forumTitle);
	         forum.setForumPost(forumPost.isEmpty() ? originalForum.getForumPost() : forumPost);
	         forum.setForumDate(forumDate);
	
	         issuccess = forumDao.updatePost(conn, forum);
	         
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
	            if (issuccess > 0) {
	                request.setAttribute("result", "修改成功");
	            } else {
	                request.setAttribute("result", "修改失敗");
	            }
			request.setAttribute("forum", forum);
			request.getRequestDispatcher("/forum/UpdateForum.jsp").forward(request, response);
			
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request,response);
	}
}