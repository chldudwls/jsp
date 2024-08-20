package article.dto;

public class CommentDTO {
	private int no;
	private int parent;
	private String content;
	private String writer;
	private String regip;
	private String rdate;
	@Override
	public String toString() {
		return "CommentDTO [no=" + no + ", parent=" + parent + ", content=" + content + ", writer=" + writer
				+ ", regip=" + regip + ", rdate=" + rdate + "]";
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegip() {
		return regip;
	}
	public void setRegip(String regip) {
		this.regip = regip;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	
	
}
