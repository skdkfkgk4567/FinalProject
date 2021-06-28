package greencamp.message.model;

import java.util.Date;

public class MessageDTO {
private String rcver_id;
private String sender_id;
private String cn;
private String senddate;
private int msg_no;

public MessageDTO() {
	super();
}
public MessageDTO(String rcver_id, String sender_id, String cn, String senddate, int msg_no) {
	super();
	this.rcver_id = rcver_id;
	this.sender_id = sender_id;
	this.cn = cn;
	this.senddate = senddate;
	this.msg_no = msg_no;
}
public String getRcver_id() {
	return rcver_id;
}
public void setRcver_id(String rcver_id) {
	this.rcver_id = rcver_id;
}
public String getSender_id() {
	return sender_id;
}
public void setSender_id(String sender_id) {
	this.sender_id = sender_id;
}
public String getCn() {
	return cn;
}
public void setCn(String cn) {
	this.cn = cn;
}
public String getSenddate() {
	return senddate;
}
public void setSenddate(String senddate) {
	this.senddate = senddate;
}
public int getMsg_no() {
	return msg_no;
}
public void setMsg_no(int msg_no) {
	this.msg_no = msg_no;
}





}
