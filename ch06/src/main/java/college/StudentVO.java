package college;

public class StudentVO {
	private String stdNO;
	private String stdName;
	private String stdHp;
	private int stdYear;
	private String stdAddress;
	@Override
	public String toString() {
		return "StudentVO [stdNO=" + stdNO + ", stdName=" + stdName + ", stdHp=" + stdHp + ", stdYear=" + stdYear
				+ ", stdAddress=" + stdAddress + "]";
	}
	public String getStdNO() {
		return stdNO;
	}
	public void setStdNO(String stdNO) {
		this.stdNO = stdNO;
	}
	public String getStdName() {
		return stdName;
	}
	public void setStdName(String stdName) {
		this.stdName = stdName;
	}
	public String getStdHp() {
		return stdHp;
	}
	public void setStdHp(String stdHp) {
		this.stdHp = stdHp;
	}
	public int getStdYear() {
		return stdYear;
	}
	public void setStdYear(int stdYear) {
		this.stdYear = stdYear;
	}
	public String getStdAddress() {
		return stdAddress;
	}
	public void setStdAddress(String stdAddress) {
		this.stdAddress = stdAddress;
	}
}
