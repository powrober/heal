package heal.project.me.board.model.vo;

import java.sql.Date;

public class Board {
	private final static long serialVersionUID = 3333L;
	
	private int bid;
	private String btype;
	private String buser;
	private String btitle;
	private String bcontent;
	private String b_file;
	private String b_rfile;
	private Date b_date;
	private Date b_modfiy_date;
	private int bcount;
	private String bstatus;
	
	public Board() {}

	public Board(int bid, String btype, String btitle, String buser, String bcontent, String b_file, String b_rfile,
			Date b_date, Date b_modfiy_date, int bcount, String bstatus) {
		super();
		this.bid = bid;
		this.btype = btype;
		this.btitle = btitle;
		this.buser = buser;
		this.bcontent = bcontent;
		this.b_file = b_file;
		this.b_rfile = b_rfile;
		this.b_date = b_date;
		this.b_modfiy_date = b_modfiy_date;
		this.bcount = bcount;
		this.bstatus = bstatus;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getBtype() {
		return btype;
	}

	public void setBtype(String btype) {
		this.btype = btype;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBuser() {
		return buser;
	}

	public void setBuser(String buser) {
		this.buser = buser;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public String getB_file() {
		return b_file;
	}

	public void setB_file(String b_file) {
		this.b_file = b_file;
	}

	public String getB_rfile() {
		return b_rfile;
	}

	public void setB_rfile(String b_rfile) {
		this.b_rfile = b_rfile;
	}

	public Date getB_date() {
		return b_date;
	}

	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}

	public Date getB_modfiy_date() {
		return b_modfiy_date;
	}

	public void setB_modfiy_date(Date b_modfiy_date) {
		this.b_modfiy_date = b_modfiy_date;
	}

	public int getBcount() {
		return bcount;
	}

	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	public String getBstatus() {
		return bstatus;
	}

	public void setBstatus(String bstatus) {
		this.bstatus = bstatus;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Board [bid=" + bid + ", btype=" + btype + ", btitle=" + btitle + ", buser=" + buser + ", bcontent="
				+ bcontent + ", b_file=" + b_file + ", b_rfile=" + b_rfile + ", b_date=" + b_date + ", b_modfiy_date="
				+ b_modfiy_date + ", bcount=" + bcount + ", bstatus=" + bstatus + "]";
	}


}
