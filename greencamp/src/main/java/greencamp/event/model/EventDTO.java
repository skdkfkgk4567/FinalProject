package greencamp.event.model;

public class EventDTO {
private int evnt_no;
private String ctgry;
private String sj;
private String cn;
private int pc;
private String id;
private int state;

public EventDTO(int evnt_no, String ctgry, String sj, String cn, int pc, String id, int state) {
	super();
	this.evnt_no = evnt_no;
	this.ctgry = ctgry;
	this.sj = sj;
	this.cn = cn;
	this.pc = pc;
	this.id = id;
	this.state = state;
}
public EventDTO() {
	super();
}
public int getEvnt_no() {
	return evnt_no;
}
public void setEvnt_no(int evnt_no) {
	this.evnt_no = evnt_no;
}
public String getCtgry() {
	return ctgry;
}
public void setCtgry(String ctgry) {
	this.ctgry = ctgry;
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
public int getPc() {
	return pc;
}
public void setPc(int pc) {
	this.pc = pc;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public int getState() {
	return state;
}
public void setState(int state) {
	this.state = state;
}



}
