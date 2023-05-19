package hiCampForum;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
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
import hiCampDao.ForumDao;

@WebServlet("/GetAllForumPostCRUD")
public class GetAllForumPostCRUD extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = null;
		ForumDao forumDao = new ForumDao();
		List<ForumBean> forums = new ArrayList<>();
	
		try {
			 Context context = new InitialContext();
	         DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/HiCamp");
	         conn = ds.getConnection();                   
	         
	         forumDao.getAllPost(conn, forums);
	         
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
	           
			request.setAttribute("forums", forums);
			request.getRequestDispatcher("/forum/ForumHomepage.jsp").forward(request, response);
			
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
