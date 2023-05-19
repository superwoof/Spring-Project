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

import hiCampBean.ForumCommentBean;
import hiCampDao.ForumCommentDao;

@WebServlet("/UpdateForumComment")
public class UpdateForumComment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        ForumCommentBean forumComment = new ForumCommentBean();
        ForumCommentDao forumCommentDao = new ForumCommentDao();
        String forumNo = request.getParameter("forumNo");

        try {
            Context context = new InitialContext();
            DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/HiCamp");
            conn = ds.getConnection();

            String forumCommentNo = request.getParameter("forumCommentNo");
            String updatedForumComment = request.getParameter("updatedForumComment");
            
            LocalDateTime now = LocalDateTime.now();
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	        String forumDate = now.format(formatter);
	        
	        forumComment.setForumCommentNo(forumCommentNo);
            forumComment.setForumComment(updatedForumComment);
            forumComment.setForumCommentDate(forumDate);
            
            forumCommentDao.updateComment(conn, forumComment);

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        } finally {
            request.setAttribute("forumComment", forumComment);
            response.sendRedirect("GetForumPostDetail?forumNo=" + forumNo);
            
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