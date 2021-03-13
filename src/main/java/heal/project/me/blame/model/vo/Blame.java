package heal.project.me.blame.model.vo;

import java.sql.Date;

public class Blame {
	private final static long serialVersionUID = 4312L;
	
	private int blame_no; 				//신고번호
	private String blame_type;			//신고 글 구분
	private String reporter;			//신고회원
	private String targetuser;		//신고 당한 회원
	private Date blame_date;			//신고번호 일자
	private String blame_content;		//신고자 신고내용

	public Blame() {}

	public Blame(int blame_no, String blame_type, String reporter, String targetuser, Date blame_date,
			String blame_content) {
		super();
		this.blame_no = blame_no;
		this.blame_type = blame_type;
		this.reporter = reporter;
		this.targetuser = targetuser;
		this.blame_date = blame_date;
		this.blame_content = blame_content;
	}

	public int getBlame_no() {
		return blame_no;
	}

	public void setBlame_no(int blame_no) {
		this.blame_no = blame_no;
	}

	public String getBlame_type() {
		return blame_type;
	}

	public void setBlame_type(String blame_type) {
		this.blame_type = blame_type;
	}

	public String getReporter() {
		return reporter;
	}

	public void setReporter(String reporter) {
		this.reporter = reporter;
	}

	public String getTargetuser() {
		return targetuser;
	}

	public void setTargetuser(String targetuser) {
		this.targetuser = targetuser;
	}

	public Date getBlame_date() {
		return blame_date;
	}

	public void setBlame_date(Date blame_date) {
		this.blame_date = blame_date;
	}

	public String getBlame_content() {
		return blame_content;
	}

	public void setBlame_content(String blame_content) {
		this.blame_content = blame_content;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Blame [blame_no=" + blame_no + ", blame_type=" + blame_type + ", reporter=" + reporter + ", targetuser="
				+ targetuser + ", blame_date=" + blame_date + ", blame_content=" + blame_content + "]";
	}

	
}
