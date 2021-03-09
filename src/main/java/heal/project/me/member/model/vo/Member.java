package heal.project.me.member.model.vo;

import java.sql.Date;

public class Member {
	private String mid;
	private String id;
	private String pwd;
	private String name;
	private String nick;
	private Date birthday;
	private String gender;
	private String phone;
	private String email;
	private String address;
	private Date join_date;
	private Date enroll_date;
	private String user_now;
	private String user_lv;
	private String etc;
	
	public Member() {}

	public Member(String mid, String id, String pwd, String name, String nick, Date birthday, String gender,
			String phone, String email, String address, Date join_date, Date enroll_date, String user_now,
			String user_lv, String etc) {
		super();
		this.mid = mid;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.nick = nick;
		this.birthday = birthday;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.join_date = join_date;
		this.enroll_date = enroll_date;
		this.user_now = user_now;
		this.user_lv = user_lv;
		this.etc = etc;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	public Date getEnroll_date() {
		return enroll_date;
	}

	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
	}

	public String getUser_now() {
		return user_now;
	}

	public void setUser_now(String user_now) {
		this.user_now = user_now;
	}

	public String getUser_lv() {
		return user_lv;
	}

	public void setUser_lv(String user_lv) {
		this.user_lv = user_lv;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	@Override
	public String toString() {
		return "Member [mid=" + mid + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", nick=" + nick
				+ ", birthday=" + birthday + ", gender=" + gender + ", phone=" + phone + ", email=" + email
				+ ", address=" + address + ", join_date=" + join_date + ", enroll_date=" + enroll_date + ", user_now="
				+ user_now + ", user_lv=" + user_lv + ", etc=" + etc + "]";
	}

	
}
