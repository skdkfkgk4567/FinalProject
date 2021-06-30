package greencamp.report.model;

import java.util.List;

public interface ReportDAO {
	
	public int Report(ReportDTO rdto);
	public List<ReportDTO> listReport(int cp, int ls); /*신고 목록*/
	public int deleteReport(int report_no); /*신고 처리*/
	public int reportTotalCnt(); /*신고 목록 수*/
}
