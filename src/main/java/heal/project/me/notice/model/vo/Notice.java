package heal.project.me.notice.model.vo;

import java.sql.Date;

public class Notice {
	private final static long serialVersionUID = 2233L;
	
	private int nid;
	private String ntype;
	private String nuser;
	private String ntitle;
	private String ncontent;
	private String n_file;
	private String n_rfile;
	private Date n_date;
	private Date n_modfiy_date;
	private int ncount;
	private String nstatus;
	
	public Notice() {}

	public Notice(int nid, String ntype, String nuser, String ntitle, String ncontent, String n_file, String n_rfile,
			Date n_date, Date n_modfiy_date, int ncount, String nstatus) {
		super();
		this.nid = nid;
		this.ntype = ntype;
		this.nuser = nuser;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.n_file = n_file;
		this.n_rfile = n_rfile;
		this.n_date = n_date;
		this.n_modfiy_date = n_modfiy_date;
		this.ncount = ncount;
		this.nstatus = nstatus;
	}

	public int getNid() {
		return nid;
	}

	public void setNid(int nid) {
		this.nid = nid;
	}

	public String getNtype() {
		return ntype;
	}

	public void setNtype(String ntype) {
		this.ntype = ntype;
	}

	public String getNuser() {
		return nuser;
	}

	public void setNuser(String nuser) {
		this.nuser = nuser;
	}

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public String getN_file() {
		return n_file;
	}

	public void setN_file(String n_file) {
		this.n_file = n_file;
	}

	public String getN_rfile() {
		return n_rfile;
	}

	public void setN_rfile(String n_rfile) {
		this.n_rfile = n_rfile;
	}

	public Date getN_date() {
		return n_date;
	}

	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}

	public Date getN_modfiy_date() {
		return n_modfiy_date;
	}

	public void setN_modfiy_date(Date n_modfiy_date) {
		this.n_modfiy_date = n_modfiy_date;
	}

	public int getNcount() {
		return ncount;
	}

	public void setNcount(int ncount) {
		this.ncount = ncount;
	}

	public String getNstatus() {
		return nstatus;
	}

	public void setNstatus(String nstatus) {
		this.nstatus = nstatus;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Notice [nid=" + nid + ", ntype=" + ntype + ", nuser=" + nuser + ", ntitle=" + ntitle + ", ncontent="
				+ ncontent + ", n_file=" + n_file + ", n_rfile=" + n_rfile + ", n_date=" + n_date + ", n_modfiy_date="
				+ n_modfiy_date + ", ncount=" + ncount + ", nstatus=" + nstatus + "]";
	}

}
