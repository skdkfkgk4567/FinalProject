package greencamp.selling.model;

import java.util.Date;

public class SellingVO
{
	private int camp_no;
	private int nmpr;
	private String id;
	private Date bgnde;
	private int totalde;
	private String sitenm;
	private int pc;
	private String sttus;
	private String rm;
	private int rownum;
	
	public SellingVO()
	{
		super();
	}

	public SellingVO(int camp_no, int nmpr, String id, Date bgnde, int totalde, String sitenm, int pc, String sttus,
			String rm, int rownum) {
		super();
		this.camp_no = camp_no;
		this.nmpr = nmpr;
		this.id = id;
		this.bgnde = bgnde;
		this.totalde = totalde;
		this.sitenm = sitenm;
		this.pc = pc;
		this.sttus = sttus;
		this.rm = rm;
		this.rownum = rownum;
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

	public Date getBgnde() {
		return bgnde;
	}

	public void setBgnde(Date bgnde) {
		this.bgnde = bgnde;
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

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	
	
}
