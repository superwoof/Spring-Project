package hiCampBean;

public class ActivityReviewBean implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	
	private int activityReviewNo;
	private int activityNo;
	private String activityReview;
	
	public int getActivityReviewNo() {
		return activityReviewNo;
	}
	public int getActivityNo() {
		return activityNo;
	}
	public String getActivityReview() {
		return activityReview;
	}

	public void setActivityReviewNo(int activityReviewNo) {
		this.activityReviewNo = activityReviewNo;
	}
	public void setActivityNo(int activityNo) {
		this.activityNo = activityNo;
	}	
	public void setActivityReview(String activityReview) {
		this.activityReview = activityReview;
	}
}