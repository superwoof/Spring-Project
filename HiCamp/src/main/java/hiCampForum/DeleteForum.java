package hiCampForum;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

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

@WebServlet("/DeleteForum")
public class DeleteForum extends HttpServlet {
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
	         
	         forum.setForumNo(forumNo);
	
	         issuccess = forumDao.deletePost(conn, forum);
	         
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
	            if (issuccess > 0) {
	                request.setAttribute("result", "刪除成功");
	            } else {
	                request.setAttribute("result", "刪除失敗");
	            }
			request.setAttribute("forum", forum);
			request.getRequestDispatcher("/GetAllForumPostCRUD").forward(request, response);
			
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}