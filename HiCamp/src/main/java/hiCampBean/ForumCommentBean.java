package hiCampBean;

public class ForumCommentBean implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	private String forumCommentNo;
	private String memberNo;
	private String forumNo;
	private String forumComment;
	private String forumCommentDate;
	
	public String getForumCommentNo() {
		return forumCommentNo;
	}
	public void setForumCommentNo(String forumCommentNo) {
		this.forumCommentNo = forumCommentNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getForumNo() {
		return forumNo;
	}
	public void setForumNo(String forumNo) {
		this.forumNo = forumNo;
	}
	public String getForumComment() {
		return forumComment;
	}
	public void setForumComment(String forumComment) {
		this.forumComment = forumComment;
	}
	public String getForumCommentDate() {
		return forumCommentDate;
	}
	public void setForumCommentDate(String forumCommentDate) {
		this.forumCommentDate = forumCommentDate;
	}

	
}
