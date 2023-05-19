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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import hiCampBean.ForumBean;
import hiCampDao.ForumDao;

@WebServlet("/InsertForum")
@MultipartConfig
public class InsertForum extends HttpServlet {
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
	            
	         String memberNo = "1";
	         String forumType = request.getParameter("forumType");
	         String forumTitle = request.getParameter("forumTitle");
	         String forumPost = request.getParameter("forumPost");
	         String forumAlbum = request.getParameter("forumAlbum");
	         
	         

	         if (forumTitle == null || forumTitle.trim().isEmpty() || forumPost == null || forumPost.trim().isEmpty()) {
	             request.setAttribute("result", "新增失敗：文章標題和內容不能為空");
	         } else {
	         
	         LocalDateTime now = LocalDateTime.now();
	         DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	         String forumDate = now.format(formatter);
	         
	         forum.setMemberNo(memberNo);
	         forum.setForumType(forumType);
	         forum.setForumTitle(forumTitle);
	         forum.setForumPost(forumPost);
	         forum.setForumAlbum(forumAlbum);
	         forum.setForumDate(forumDate);
	         
	         issuccess = forumDao.insertPost(conn, forum);
	         
		         if (issuccess > 0) {
		        	 request.setAttribute("result", "新增成功");
		         } else {
		        	 request.setAttribute("result", "新增失敗");
		         }
	         
	         } 
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
			request.setAttribute("forum", forum);
			request.getRequestDispatcher("/forum/InsertForum.jsp").forward(request, response);
			
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
