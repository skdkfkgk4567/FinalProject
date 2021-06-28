package greencamp.report.model;

import java.util.Date;

public class ReportDTO {
	
	private int report_no;
	private String ctgry;
	private int rptcnt;
	private Date rptde;
	private int ctgry_no;
	
	public ReportDTO() {
		super();
	}

	public ReportDTO(int report_no, String ctgry, int rptcnt, Date rptde, int ctgry_no) {
		super();
		this.report_no = report_no;
		this.ctgry = ctgry;
		this.rptcnt = rptcnt;
		this.rptde = rptde;
		this.ctgry_no = ctgry_no;
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public String getCtgry() {
		return ctgry;
	}

	public void setCtgry(String ctgry) {
		this.ctgry = ctgry;
	}

	public int getRptcnt() {
		return rptcnt;
	}

	public void setRptcnt(int rptcnt) {
		this.rptcnt = rptcnt;
	}

	public Date getRptde() {
		return rptde;
	}

	public void setRptde(Date rptde) {
		this.rptde = rptde;
	}

	public int getCtgry_no() {
		return ctgry_no;
	}

	public void setCtgry_no(int ctgry_no) {
		this.ctgry_no = ctgry_no;
	}
	
	

}
