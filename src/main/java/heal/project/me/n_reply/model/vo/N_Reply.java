package heal.project.me.n_reply.model.vo;

import java.sql.Date;

public class N_Reply implements java.io.Serializable {
	private final static long serialVersionUID = 4577L;
	
	private int nrid;
	private String nrcontent;
	private String nruser;
	private Date nr_date;
	private Date nr_modify_date;
	private String nr_status;
	
	public N_Reply() {}

	public N_Reply(int nrid, String nrcontent, String nruser, Date nr_date, Date nr_modify_date, String nr_status) {
		super();
		this.nrid = nrid;
		this.nrcontent = nrcontent;
		this.nruser = nruser;
		this.nr_date = nr_date;
		this.nr_modify_date = nr_modify_date;
		this.nr_status = nr_status;
	}

	public int getNrid() {
		return nrid;
	}

	public void setNrid(int nrid) {
		this.nrid = nrid;
	}

	public String getNrcontent() {
		return nrcontent;
	}

	public void setNrcontent(String nrcontent) {
		this.nrcontent = nrcontent;
	}

	public String getNruser() {
		return nruser;
	}

	public void setNruser(String nruser) {
		this.nruser = nruser;
	}

	public Date getNr_date() {
		return nr_date;
	}

	public void setNr_date(Date nr_date) {
		this.nr_date = nr_date;
	}

	public Date getNr_modify_date() {
		return nr_modify_date;
	}

	public void setNr_modify_date(Date nr_modify_date) {
		this.nr_modify_date = nr_modify_date;
	}

	public String getNr_status() {
		return nr_status;
	}

	public void setNr_status(String nr_status) {
		this.nr_status = nr_status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "N_Reply [nrid=" + nrid + ", nrcontent=" + nrcontent + ", nruser=" + nruser + ", nr_date=" + nr_date
				+ ", nr_modify_date=" + nr_modify_date + ", nr_status=" + nr_status + "]";
	}
	
	

}
