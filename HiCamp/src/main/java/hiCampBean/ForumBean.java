package hiCampBean;

import java.util.List;

public class ForumBean implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	private String forumNo;
	private String memberNo;
	private String forumType;
	private String forumTitle;
	private String forumPost;
	private String forumDate;
	private String forumAlbum;
	private List<ForumCommentBean> forumComments;
	
	public List<ForumCommentBean> getForumComments() {
		return forumComments;
	}

	public void setForumComments(List<ForumCommentBean> forumComments) {
		this.forumComments = forumComments;
	}

	public String getForumAlbum() {
	    return forumAlbum;
	}

	public void setForumAlbum(String forumAlbum) {
	    this.forumAlbum = forumAlbum;
	}
	public String getForumTitle() {
		return forumTitle;
	}
	public void setForumTitle(String forumTitle) {
		this.forumTitle = forumTitle;
	}
	
	public String getForumNo() {
		return forumNo;
	}
	public void setForumNo(String forumNo) {
		this.forumNo = forumNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getForumType() {
		return forumType;
	}
	public void setForumType(String forumType) {
		this.forumType = forumType;
	}
	public String getForumPost() {
		return forumPost;
	}
	public void setForumPost(String forumPost) {
		this.forumPost = forumPost;
	}
	public String getForumDate() {
		return forumDate;
	}
	public void setForumDate(String forumDate) {
		this.forumDate = forumDate;
	}
}
