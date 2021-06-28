package greencamp.report.service;

import org.springframework.beans.factory.annotation.Autowired;

import greencamp.report.model.ReportDAO;
import greencamp.report.model.ReportDTO;

public class ReportServiceImple implements ReportService {

	@Autowired
	private ReportDAO reportDao;
	
	public int Report(ReportDTO rdto) {
		int count=reportDao.Report(rdto);
		return count;
	}

}
