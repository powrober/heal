package heal.project.me.b_reply.model.vo;

import java.sql.Date;

public class B_Reply implements java.io.Serializable {
	private final static long serialVersionUID = 4577L;
	
	private int brid;
	private String brcontent;
	private int b_ref_bid;
	private String bruser;
	private Date br_date;
	private Date br_modify_date;
	private String br_status;
	
	public B_Reply() {}

	public B_Reply(int brid, String brcontent, int b_ref_bid, String bruser, Date br_date, Date br_modify_date,
			String br_status) {
		super();
		this.brid = brid;
		this.brcontent = brcontent;
		this.b_ref_bid = b_ref_bid;
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

	public int getB_ref_bid() {
		return b_ref_bid;
	}

	public void setB_ref_bid(int b_ref_bid) {
		this.b_ref_bid = b_ref_bid;
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
		return "B_Reply [brid=" + brid + ", brcontent=" + brcontent + ", b_ref_bid=" + b_ref_bid + ", bruser=" + bruser
				+ ", br_date=" + br_date + ", br_modify_date=" + br_modify_date + ", br_status=" + br_status + "]";
	}

	
}
