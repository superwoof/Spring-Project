package hiCampBean;

public class CampsiteBean implements java.io.Serializable {
	private static final long serialVersionUID = 1L;

	private String campsiteNo;
	private String campsiteName;
	private String campsiteQuantity;
	private String campsiteLocation;
	private String campsiteInfo;
	
	public String getCampsiteNo() {
		return campsiteNo;
	}
	public void setCampsiteNo(String campsiteNo) {
		this.campsiteNo = campsiteNo;
	}
	public String getCampsiteName() {
		return campsiteName;
	}
	public void setCampsiteName(String campsiteName) {
		this.campsiteName = campsiteName;
	}
	public String getCampsiteQuantity() {
		return campsiteQuantity;
	}
	public void setCampsiteQuantity(String campsiteQuantity) {
		this.campsiteQuantity = campsiteQuantity;
	}
	public String getCampsiteLocation() {
		return campsiteLocation;
	}
	public void setCampsiteLocation(String campsiteLocation) {
		this.campsiteLocation = campsiteLocation;
	}
	public String getCampsiteInfo() {
		return campsiteInfo;
	}
	public void setCampsiteInfo(String campsiteInfo) {
		this.campsiteInfo = campsiteInfo;
	}
	
}
