package college;

public class LectureVO {
	private int lecNO;
	private String lecName;
	private int lecCredit;
	private int lecTime;
	private String lecClass;
	@Override
	public String toString() {
		return "LectureVO [lecNO=" + lecNO + ", lecName=" + lecName + ", lecCredit=" + lecCredit + ", lecTime="
				+ lecTime + ", lecClass=" + lecClass + "]";
	}
	public int getLecNO() {
		return lecNO;
	}
	public void setLecNO(int lecNO) {
		this.lecNO = lecNO;
	}
	public String getLecName() {
		return lecName;
	}
	public void setLecName(String lecName) {
		this.lecName = lecName;
	}
	public int getLecCredit() {
		return lecCredit;
	}
	public void setLecCredit(int lecCredit) {
		this.lecCredit = lecCredit;
	}
	public int getLecTime() {
		return lecTime;
	}
	public void setLecTime(int lecTime) {
		this.lecTime = lecTime;
	}
	public String getLecClass() {
		return lecClass;
	}
	public void setLecClass(String lecClass) {
		this.lecClass = lecClass;
	}
	
}
