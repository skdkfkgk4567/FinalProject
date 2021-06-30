package greencamp.member.model;

public class MemberDTO {
	private int account_no;
	private String id;
	private String nm;
	private String password;
	private String email;
	private String ncnm;
	private String telno;
	private int grade;
	private String bizrno;

	public MemberDTO() {
		super();
	}

	public MemberDTO(int account_no, String id, String nm, String password, String email, String ncnm, String telno,
			int grade, String bizrno) {
		super();
		this.account_no = account_no;
		this.id = id;
		this.nm = nm;
		this.password = password;
		this.email = email;
		this.ncnm = ncnm;
		this.telno = telno;
		this.grade = grade;
		this.bizrno = bizrno;
	}

	public int getAccount_no() {
		return account_no;
	}

	public void setAccount_no(int account_no) {
		this.account_no = account_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNm() {
		return nm;
	}

	public void setNm(String nm) {
		this.nm = nm;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNcnm() {
		return ncnm;
	}

	public void setNcnm(String ncnm) {
		this.ncnm = ncnm;
	}

	public String getTelno() {
		return telno;
	}

	public void setTelno(String telno) {
		this.telno = telno;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getBizrno() {
		return bizrno;
	}

	public void setBizrno(String bizrno) {
		this.bizrno = bizrno;
	}

}
