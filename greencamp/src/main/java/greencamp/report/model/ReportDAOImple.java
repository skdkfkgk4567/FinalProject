package greencamp.report.model;

import org.mybatis.spring.SqlSessionTemplate;

public class ReportDAOImple implements ReportDAO {
	
	private  SqlSessionTemplate sqlMap;
	
	public ReportDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int Report(ReportDTO rdto) {
		int count=sqlMap.insert("Report", rdto);
		return count;
	}

}
