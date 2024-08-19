package user.dto;

public class TermsDTO {
	private String terms;
	private String privacy;
	@Override
	public String toString() {
		return "Terms [terms=" + terms + ", privacy=" + privacy + "]";
	}
	public String getTerms() {
		return terms;
	}
	public void setTerms(String terms) {
		this.terms = terms;
	}
	public String getPrivacy() {
		return privacy;
	}
	public void setPrivacy(String privacy) {
		this.privacy = privacy;
	}
}
