package greencamp.resve.model;

import java.util.Date;

public class ResveVO
{
	private String camp_nm;
	private int camp_no;
	private int nmpr;
	private String id;
	private int totalde;
	private String sitenm;
	private int pc;
	private String sttus;
	private String rm;
	private String resvede;
	public String getCamp_nm() {
		return camp_nm;
	}
	public void setCamp_nm(String camp_nm) {
		this.camp_nm = camp_nm;
	}
	public int getCamp_no() {
		return camp_no;
	}
	public void setCamp_no(int camp_no) {
		this.camp_no = camp_no;
	}
	public int getNmpr() {
		return nmpr;
	}
	public void setNmpr(int nmpr) {
		this.nmpr = nmpr;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getTotalde() {
		return totalde;
	}
	public void setTotalde(int totalde) {
		this.totalde = totalde;
	}
	public String getSitenm() {
		return sitenm;
	}
	public void setSitenm(String sitenm) {
		this.sitenm = sitenm;
	}
	public int getPc() {
		return pc;
	}
	public void setPc(int pc) {
		this.pc = pc;
	}
	public String getSttus() {
		return sttus;
	}
	public void setSttus(String sttus) {
		this.sttus = sttus;
	}
	public String getRm() {
		return rm;
	}
	public void setRm(String rm) {
		this.rm = rm;
	}
	public String getResvede() {
		return resvede;
	}
	public void setResvede(String resvede) {
		this.resvede = resvede;
	}
	public Date getBgnde() {
		return bgnde;
	}
	public void setBgnde(Date bgnde) {
		this.bgnde = bgnde;
	}
	public ResveVO(String camp_nm, int camp_no, int nmpr, String id, int totalde, String sitenm, int pc, String sttus,
			String rm, String resvede, Date bgnde) {
		super();
		this.camp_nm = camp_nm;
		this.camp_no = camp_no;
		this.nmpr = nmpr;
		this.id = id;
		this.totalde = totalde;
		this.sitenm = sitenm;
		this.pc = pc;
		this.sttus = sttus;
		this.rm = rm;
		this.resvede = resvede;
		this.bgnde = bgnde;
	}
	private Date bgnde;
	public ResveVO() {
		super();
	}
	
}
