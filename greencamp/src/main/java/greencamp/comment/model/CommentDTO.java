package greencamp.comment.model;

import java.util.Date;

public class CommentDTO {
	
	private int cm_no;
	private String ctgry;
	private String ncnm;
	private String cn;
	private int ref;
	private int level;
	private int index;
	private int ctgry_no;
	private Date writngde;
	public CommentDTO() {
		super();
	}
	public CommentDTO(int cm_no, String ctgry, String ncnm, String cn, int ref, int level, int index, int ctgry_no,
			Date writngde) {
		super();
		this.cm_no = cm_no;
		this.ctgry = ctgry;
		this.ncnm = ncnm;
		this.cn = cn;
		this.ref = ref;
		this.level = level;
		this.index = index;
		this.ctgry_no = ctgry_no;
		this.writngde = writngde;
	}
	public int getCm_no() {
		return cm_no;
	}
	public void setCm_no(int cm_no) {
		this.cm_no = cm_no;
	}
	public String getCtgry() {
		return ctgry;
	}
	public void setCtgry(String ctgry) {
		this.ctgry = ctgry;
	}
	public String getNcnm() {
		return ncnm;
	}
	public void setNcnm(String ncnm) {
		this.ncnm = ncnm;
	}
	public String getCn() {
		return cn;
	}
	public void setCn(String cn) {
		this.cn = cn;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public int getCtgry_no() {
		return ctgry_no;
	}
	public void setCtgry_no(int ctgry_no) {
		this.ctgry_no = ctgry_no;
	}
	public Date getWritngde() {
		return writngde;
	}
	public void setWritngde(Date writngde) {
		this.writngde = writngde;
	}
	
	
	
}
