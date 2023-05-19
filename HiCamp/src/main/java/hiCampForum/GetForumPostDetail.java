package hiCampForum;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

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
import hiCampBean.ForumCommentBean;
import hiCampDao.ForumCommentDao;
import hiCampDao.ForumDao;

@WebServlet("/GetForumPostDetail")
public class GetForumPostDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		ForumDao forumDao = new ForumDao();
		ForumCommentDao commentDao = new ForumCommentDao();
		
		String forumNo = request.getParameter("forumNo");
		ForumBean forum = new ForumBean();
		forum.setForumNo(forumNo);
		List<ForumCommentBean> comments = null;
		
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/HiCamp");
			conn = ds.getConnection();    
			
			forumDao.getPostbyNo(conn, forum);
			comments = commentDao.getAllComments(conn, forumNo);
			
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
			request.setAttribute("forum", forum);
			request.setAttribute("comments", comments);
			request.getRequestDispatcher("/forum/ForumPostDetail.jsp").forward(request, response);
			
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}