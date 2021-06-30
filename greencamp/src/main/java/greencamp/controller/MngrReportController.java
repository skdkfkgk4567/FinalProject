package greencamp.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import greencamp.report.model.ReportDAO;
import greencamp.report.model.ReportDTO;

@Controller
public class MngrReportController {
	
	@Autowired
	private ReportDAO reportDao;
	
	/*신고 목록*/
	@RequestMapping("/listReport.pi")
	public ModelAndView listReport(@RequestParam(value="cp", defaultValue="1")int cp) {
		int totalCnt_rp=reportDao.reportTotalCnt();
		int listSize=10;
		int pageSize=5;

		String pageStr_rp=greencamp.page.PageModule.makePage("listReport.pi", totalCnt_rp, listSize, pageSize, cp);

		List<ReportDTO> list_rp=reportDao.listReport(cp, listSize);

		ModelAndView mav=new ModelAndView();
		
		mav.addObject("pageStr_rp", pageStr_rp);
		mav.addObject("list_rp", list_rp);
		mav.addObject("total_rp", totalCnt_rp);
		mav.setViewName("mngrreport/listReport");
		return mav;
	}
	
	/*캠핑톡 댓글 삭제*/
	@RequestMapping("/deleteReport.pi")
	public ModelAndView deleteReport(int report_no){
		int result=reportDao.deleteReport(report_no);
		
		String msg=result>0?"신고처리 성공하셨습니다.":"신고처리 실패하셨습니다.";
		String gopage="listReport.pi";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("mngrreport/rpMsg");
		return mav;
	}
	
}
