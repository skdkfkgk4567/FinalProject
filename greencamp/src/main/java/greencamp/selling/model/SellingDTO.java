package greencamp.selling.model;

import java.sql.Date;

public class SellingDTO {
private int cmap_no;
private int nmpr;
private String id;
private Date bgnde;
private int totalde;
private String sitenm;
private int pc;
private String sttus;
private String rm;
public SellingDTO() {
	super();
}
public SellingDTO(int cmap_no, int nmpr, String id, Date bgnde, int totalde, String sitenm, int pc, String sttus,
		String rm) {
	super();
	this.cmap_no = cmap_no;
	this.nmpr = nmpr;
	this.id = id;
	this.bgnde = bgnde;
	this.totalde = totalde;
	this.sitenm = sitenm;
	this.pc = pc;
	this.sttus = sttus;
	this.rm = rm;
}
public int getCmap_no() {
	return cmap_no;
}
public void setCmap_no(int cmap_no) {
	this.cmap_no = cmap_no;
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




}
