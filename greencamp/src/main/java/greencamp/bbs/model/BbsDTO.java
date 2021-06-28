package greencamp.bbs.model;

import java.util.Date;

public class BbsDTO {
	
	private int bbs_no;
	private String sj;
	private String cn;
	private int rdcnt;
	private String ctgry;
	private Date writngde;
	private String ncnm;
	private String videosrc;
	
	public BbsDTO() {
		super();
	}

	public BbsDTO(int bbs_no, String sj, String cn, int rdcnt, String ctgry, Date writngde, String ncnm,
			String videosrc) {
		super();
		this.bbs_no = bbs_no;
		this.sj = sj;
		this.cn = cn;
		this.rdcnt = rdcnt;
		this.ctgry = ctgry;
		this.writngde = writngde;
		this.ncnm = ncnm;
		this.videosrc = videosrc;
	}

	public int getBbs_no() {
		return bbs_no;
	}

	public void setBbs_no(int bbs_no) {
		this.bbs_no = bbs_no;
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

	public String getCtgry() {
		return ctgry;
	}

	public void setCtgry(String ctgry) {
		this.ctgry = ctgry;
	}

	public Date getWritngde() {
		return writngde;
	}

	public void setWritngde(Date writngde) {
		this.writngde = writngde;
	}

	public String getNcnm() {
		return ncnm;
	}

	public void setNcnm(String ncnm) {
		this.ncnm = ncnm;
	}

	public String getVideosrc() {
		return videosrc;
	}

	public void setVideosrc(String videosrc) {
		this.videosrc = videosrc;
	}
	
	

}
