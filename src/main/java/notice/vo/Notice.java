package notice.vo;

import java.util.Date;

public class Notice {
	//컨트롤+쉬프트+y 소문자
	//컨트롤+쉬프트+x 대문자
	
	private String seq;
	private String title;
	private String writer;
	private String content;
	private Date regdate;
	private int hit;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}

	
	
}

