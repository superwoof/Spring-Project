package hiCampBean;

public class ActivityBean implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	
	private int activityNo;
	private String activityType;
	private String activityName;
	private String activityLocation;
	private String activityInfo;
	private String activityQuota;
	private String activityPrice;

	public int getActivityNo() {
		return activityNo;
	}

	public String getActivityType() {
		return activityType;
	}

	public String getActivityName() {
		return activityName;
	}

	public String getActivityLocation() {
		return activityLocation;
	}
	
	public String getActivityInfo() {
		return activityInfo;
	}

	public String getActivityQuota() {
		return activityQuota;
	}

	public String getActivityPrice() {
		return activityPrice;
	}
	

	public void setActivityNo(int activityNo) {
		this.activityNo = activityNo;
	}

	public void setActivityType(String activityType) {
		this.activityType = activityType;
	}

	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}

	public void setActivityLocation(String activityLocation) {
		this.activityLocation = activityLocation;
	}

	public void setActivityInfo(String activityInfo) {
		this.activityInfo = activityInfo;
	}
	
	public void setActivityQuota(String activityQuota) {
		this.activityQuota = activityQuota;
	}
	
	public void setActivityPrice(String activityPrice) {
		this.activityPrice = activityPrice;
	}

}

