package greencamp.report.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class ReportDAOImple implements ReportDAO {

	private SqlSessionTemplate sqlMap;

	public ReportDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int Report(ReportDTO rdto) {
		int count = sqlMap.insert("Report", rdto);
		return count;
	}

	/* 신고 목록 */
	public List<ReportDTO> listReport(int cp, int ls) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int start = ((cp - 1) * ls) + 1;
		int end = cp * ls;
		map.put("start", start);
		map.put("end", end);
		List<ReportDTO> arr = sqlMap.selectList("listReport", map);
		return arr;
	}

	/* 신고 처리 */
	public int deleteReport(int report_no) {
		int count = sqlMap.delete("deleteReport", report_no);
		return count;
	}

	/* 신고 목록 수 */
	public int reportTotalCnt() {
		int count=sqlMap.selectOne("reportTotalCnt");
		return count;
	}
}
