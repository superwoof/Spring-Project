package hiCampBean;

import java.sql.Date;

public class ActivityPeriodBean implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	
	private int activityPeriodNo;
	private int activityNo;
	private Date activityDepartureDate;
	private Date activityReturnDate;
	private Date signupDeadline ;
	private int activityQuota;
	private int activityPrice;
	
	public int getActivityPeriodNo() {
		return activityPeriodNo;
	}
	
	public int getActivityNo() {
		return activityNo;
	}

	public Date getActivityDepartureDate() {
		return activityDepartureDate;
	}

	public Date getActivityReturnDate() {
		return activityReturnDate;
	}
	
	public Date getSignupDeadline() {
		return signupDeadline;
	}

	public int getActivityQuota() {
		return activityQuota;
	}

	public int getActivityPrice() {
		return activityPrice;
	}
	
	
	public void setActivityPeriodNo(int activityPeriodNo) {
		this.activityPeriodNo = activityPeriodNo;
	}
	
	public void setActivityNo(int activityNo) {
		this.activityNo = activityNo;
	}

	public void setActivityDepartureDate(Date activityDepartureDate) {
		this.activityDepartureDate = activityDepartureDate;
	}

	public void setactivityReturnDate(Date activityReturnDate) {
		this.activityReturnDate = activityReturnDate;
	}

	public void setSignupDeadline(Date signupDeadline) {
		this.signupDeadline = signupDeadline;
	}
	
	public void setactivityQuota(int activityQuota) {
		this.activityQuota = activityQuota;
	}
	
	public void setActivityPrice(int activityPrice) {
		this.activityPrice = activityPrice;
	}

}

