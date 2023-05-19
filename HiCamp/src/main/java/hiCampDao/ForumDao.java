package hiCampDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;
import java.util.List;

import hiCampBean.ForumBean;

public class ForumDao {
	
    public int insertPost(Connection conn, ForumBean forum) throws SQLException {
       
    	//新增貼文
    	String sql = "insert into forum (memberNo,forumType,forumTitle,forumPost,forumAlbum,forumDate)values(?, ?, ?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, forum.getMemberNo());
        stmt.setString(2, forum.getForumType());
        stmt.setString(3, forum.getForumTitle());
        stmt.setString(4, forum.getForumPost());
        String forumAlbum = forum.getForumAlbum();
        if (forumAlbum != null && !forumAlbum.trim().isEmpty()) {
            String base64Image = forumAlbum.split(",")[1];
            byte[] decodedImage = Base64.getDecoder().decode(base64Image);
            stmt.setBytes(5, decodedImage);
        } else {
            stmt.setNull(5, java.sql.Types.VARBINARY);
        }
        stmt.setString(6, forum.getForumDate());
        
        int issuccess = stmt.executeUpdate();
        stmt.close();
        
        return issuccess;
    }
    public int deletePost(Connection conn, ForumBean forum) throws SQLException {
        
    	//刪除貼文
    	String sql = "delete forum where forumNo = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, forum.getForumNo());
       
        int issuccess = stmt.executeUpdate();
        stmt.close();
        
        return issuccess;
    }
    
    public int updatePost(Connection conn, ForumBean forum) throws SQLException {
        
    	//修改貼文類別、主題、內文
    	String sql = "update forum set forumType = ?, forumTitle = ?, forumPost = ?, forumDate = ? where forumNo = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, forum.getForumType());
        stmt.setString(2, forum.getForumTitle());
        stmt.setString(3, forum.getForumPost());
        stmt.setString(4, forum.getForumDate());
        stmt.setString(5, forum.getForumNo());

        int issuccess = stmt.executeUpdate();
        stmt.close();
        
        return issuccess;
    }
    
    public void getPostbyNo(Connection conn, ForumBean forum) throws SQLException {
        
    	//查詢單筆by編號
    	String sql = "select * from forum where forumNo = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, forum.getForumNo());
        ResultSet rs = stmt.executeQuery();
      
        if (rs.next()) {
			forum.setForumNo(rs.getString("forumNo"));
			forum.setMemberNo(rs.getString("memberNo"));
			forum.setForumType(rs.getString("forumType"));
			forum.setForumTitle(rs.getString("forumTitle"));
			forum.setForumPost(rs.getString("forumPost"));
			byte[] imageBytes = rs.getBytes("forumAlbum");
			if (imageBytes != null) {
			    String base64Image = Base64.getEncoder().encodeToString(imageBytes);
			    forum.setForumAlbum(base64Image);
			}
			forum.setForumDate(rs.getString("forumDate"));
		}
        rs.close();
        stmt.close();
  	}
        
   public void getPostbyTitle(Connection conn, List<ForumBean> forums,String keyword) throws SQLException {
        
    	//查詢多筆by標題
    	String sql = "select * from forum where forumTitle like ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, "%" + keyword + "%");
        ResultSet rs = stmt.executeQuery();
      
        while (rs.next()) {
        	ForumBean forum = new ForumBean();
			forum.setForumNo(rs.getString("forumNo"));
			forum.setMemberNo(rs.getString("memberNo"));
			forum.setForumType(rs.getString("forumType"));
			forum.setForumTitle(rs.getString("forumTitle"));
			forum.setForumPost(rs.getString("forumPost"));
			byte[] imageBytes = rs.getBytes("forumAlbum");
			if (imageBytes != null) {
			    String base64Image = Base64.getEncoder().encodeToString(imageBytes);
			    forum.setForumAlbum(base64Image);
			}
			forum.setForumDate(rs.getString("forumDate"));
			forums.add(forum);
		}
        rs.close();
        stmt.close();     
  	}
    
    
   public void getAllPost(Connection conn, List<ForumBean> forums) throws SQLException {
        
    	//查詢全部貼文
    	String sql = "select * from forum order by forumNo desc";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
      
        while (rs.next()) {
        	ForumBean forum = new ForumBean();
			forum.setForumNo(rs.getString("forumNo"));
			forum.setMemberNo(rs.getString("memberNo"));
			forum.setForumType(rs.getString("forumType"));
			forum.setForumTitle(rs.getString("forumTitle"));
			forum.setForumPost(rs.getString("forumPost"));
			byte[] imageBytes = rs.getBytes("forumAlbum");
			if (imageBytes != null) {
			    String base64Image = Base64.getEncoder().encodeToString(imageBytes);
			    forum.setForumAlbum(base64Image);
			}
			forum.setForumDate(rs.getString("forumDate"));
			forums.add(forum);
		}      
        rs.close();
        stmt.close();
 	}
}
