package hiCampDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hiCampBean.ForumCommentBean;

public class ForumCommentDao {
	
	 public int insertComment(Connection conn, ForumCommentBean forumComment) throws SQLException {
	       
		   	//新增留言
		   	String sql = "insert into forumComment (memberNo,forumNo,forumComment,forumCommentDate)values(?, ?, ?, ?)";
		       PreparedStatement stmt = conn.prepareStatement(sql);
		       stmt.setString(1, forumComment.getMemberNo());
		       stmt.setString(2, forumComment.getForumNo());
		       stmt.setString(3, forumComment.getForumComment());
		       stmt.setString(4, forumComment.getForumCommentDate());
		       
		       int issuccess = stmt.executeUpdate();
		       stmt.close();
		       
		       return issuccess;
		   }
		   
	 public List<ForumCommentBean> getAllComments(Connection conn, String forumNo) throws SQLException {
	     
			//查詢全部留言
			 List<ForumCommentBean> comments = new ArrayList<>();
			 String sql = "SELECT * FROM forumComment WHERE forumNo = ? ORDER BY forumCommentNo DESC";
			 PreparedStatement stmt = conn.prepareStatement(sql);
			 stmt.setString(1, forumNo);
			 ResultSet rs = stmt.executeQuery();
			
			 while (rs.next()) {
				 ForumCommentBean comment = new ForumCommentBean();
				 comment.setForumCommentNo(rs.getString("forumCommentNo"));
				 comment.setMemberNo(rs.getString("memberNo"));
				 comment.setForumNo(rs.getString("forumNo"));
				 comment.setForumComment(rs.getString("forumComment"));
				 comment.setForumCommentDate(rs.getString("forumCommentDate"));
				 comments.add(comment);
			 }
			
			 rs.close();
			 stmt.close();
			
			 return comments;
	   }
	 public int updateComment(Connection conn, ForumCommentBean forumComment) throws SQLException {
	       
		   	//修改留言
		   	String sql = "update forumComment set forumComment = ?,forumCommentDate = ? where forumCommentNo = ?";
		       PreparedStatement stmt = conn.prepareStatement(sql);
		       stmt.setString(1, forumComment.getForumComment());
		       stmt.setString(2, forumComment.getForumCommentDate());
		       stmt.setString(3, forumComment.getForumCommentNo());
		       
		       int issuccess = stmt.executeUpdate();
		       stmt.close();
		       
		       return issuccess;
		   }   
	 public int deleteComment(Connection conn, ForumCommentBean forumComment) throws SQLException {
	       
		   	//刪除留言
		   	String sql = "delete forumComment where forumCommentNo = ?";
		       PreparedStatement stmt = conn.prepareStatement(sql);
		       stmt.setString(1, forumComment.getForumCommentNo());
		       
		       int issuccess = stmt.executeUpdate();
		       stmt.close();
		       
		       return issuccess;
		   }
}
