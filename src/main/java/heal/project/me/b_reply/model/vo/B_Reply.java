package heal.project.me.b_reply.model.vo;

import java.sql.Date;

public class B_Reply implements java.io.Serializable {
	private final static long serialVersionUID = 4577L;
	
	private int brid;
	private String brcontent;
	private String bruser;
	private Date br_date;
	private Date br_modify_date;
	private String br_status;
	
	public B_Reply() {}

	public B_Reply(int brid, String brcontent, String bruser, Date br_date, Date br_modify_date, String br_status) {
		super();
		this.brid = brid;
		this.brcontent = brcontent;
		this.bruser = bruser;
		this.br_date = br_date;
		this.br_modify_date = br_modify_date;
		this.br_status = br_status;
	}

	public int getBrid() {
		return brid;
	}

	public void setBrid(int brid) {
		this.brid = brid;
	}

	public String getBrcontent() {
		return brcontent;
	}

	public void setBrcontent(String brcontent) {
		this.brcontent = brcontent;
	}

	public String getBruser() {
		return bruser;
	}

	public void setBruser(String bruser) {
		this.bruser = bruser;
	}

	public Date getBr_date() {
		return br_date;
	}

	public void setBr_date(Date br_date) {
		this.br_date = br_date;
	}

	public Date getBr_modify_date() {
		return br_modify_date;
	}

	public void setBr_modify_date(Date br_modify_date) {
		this.br_modify_date = br_modify_date;
	}

	public String getBr_status() {
		return br_status;
	}

	public void setBr_status(String br_status) {
		this.br_status = br_status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "B_Reply [brid=" + brid + ", brcontent=" + brcontent + ", bruser=" + bruser + ", br_date=" + br_date
				+ ", br_modify_date=" + br_modify_date + ", br_status=" + br_status + "]";
	}

}
