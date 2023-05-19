package hiCampBean;

public class ActivityPictureBean implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	
	private int activityPitcuteNo;
	private String activityNo;
	private byte[] activityPicture;
	
	public int getActivityPitcuteNo() {
		return activityPitcuteNo;
	}
	public String getActivityNo() {
		return activityNo;
	}
	public byte[] getActivityPicture() {
		return activityPicture;
	}
	
	public void setActivityPitcuteNo(int activityPitcuteNo) {
		this.activityPitcuteNo = activityPitcuteNo;
	}
	public void setActivityNo(String activityNo) {
		this.activityNo = activityNo;
	}
	public void setActivityPicture(byte[] activityPicture) {
		this.activityPicture = activityPicture;
	}

}

