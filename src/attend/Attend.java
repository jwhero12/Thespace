package attend;

public class Attend {
	private int attendID;
	private String attendTitle;
	private String userID;
	private String attendDate;
	private String attendContent;
	private int attendAvailable;
	public int getAttendID() {
		return attendID;
	}
	public void setAttendID(int attendID) {
		this.attendID = attendID;
	}
	public String getAttendTitle() {
		return attendTitle;
	}
	public void setAttendTitle(String attendTitle) {
		this.attendTitle = attendTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getAttendDate() {
		return attendDate;
	}
	public void setAttendDate(String attendDate) {
		this.attendDate = attendDate;
	}
	public String getAttendContent() {
		return attendContent;
	}
	public void setAttendContent(String attendContent) {
		this.attendContent = attendContent;
	}
	public int getAttendAvailable() {
		return attendAvailable;
	}
	public void setAttendAvailable(int attendAvailable) {
		this.attendAvailable = attendAvailable;
	}
}
