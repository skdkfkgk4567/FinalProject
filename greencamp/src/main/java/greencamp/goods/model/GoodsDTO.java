package greencamp.goods.model;

import java.util.Date;

public class GoodsDTO {

	private int delng_no;
	private String sj;
	private String cn;
	private int rdcnt;
	private String addr;
	private String delngtp;
	private String img;
	private String sttus;
	private Date writngde;
	private int pc;
	private String how;
	private String telno;
	private int numbershow;
	private String ncnm;
	
	public GoodsDTO() {
		super();
	}

	public GoodsDTO(int delng_no, String sj, String cn, int rdcnt, String addr, String delngtp, String img,
			String sttus, Date writngde, int pc, String how, String telno, int numbershow, String ncnm) {
		super();
		this.delng_no = delng_no;
		this.sj = sj;
		this.cn = cn;
		this.rdcnt = rdcnt;
		this.addr = addr;
		this.delngtp = delngtp;
		this.img = img;
		this.sttus = sttus;
		this.writngde = writngde;
		this.pc = pc;
		this.how = how;
		this.telno = telno;
		this.numbershow = numbershow;
		this.ncnm = ncnm;
	}

	public int getDelng_no() {
		return delng_no;
	}

	public void setDelng_no(int delng_no) {
		this.delng_no = delng_no;
	}

	public String getSj() {
		return sj;
	}

	public void setSj(String sj) {
		this.sj = sj;
	}

	public String getCn() {
		return cn;
	}

	public void setCn(String cn) {
		this.cn = cn;
	}

	public int getRdcnt() {
		return rdcnt;
	}

	public void setRdcnt(int rdcnt) {
		this.rdcnt = rdcnt;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getDelngtp() {
		return delngtp;
	}

	public void setDelngtp(String delngtp) {
		this.delngtp = delngtp;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getSttus() {
		return sttus;
	}

	public void setSttus(String sttus) {
		this.sttus = sttus;
	}

	public Date getWritngde() {
		return writngde;
	}

	public void setWritngde(Date writngde) {
		this.writngde = writngde;
	}

	public int getPc() {
		return pc;
	}

	public void setPc(int pc) {
		this.pc = pc;
	}

	public String getHow() {
		return how;
	}

	public void setHow(String how) {
		this.how = how;
	}

	public String getTelno() {
		return telno;
	}

	public void setTelno(String telno) {
		this.telno = telno;
	}

	public int getNumbershow() {
		return numbershow;
	}

	public void setNumbershow(int numbershow) {
		this.numbershow = numbershow;
	}

	public String getNcnm() {
		return ncnm;
	}

	public void setNcnm(String ncnm) {
		this.ncnm = ncnm;
	}
	
	
}
