package greencamp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import greencamp.report.model.ReportDTO;
import greencamp.report.service.ReportService;

@Controller
public class ReportController {
	
	@Autowired
	private ReportService reportService;
	
	@RequestMapping("/Report.pi")
	public ModelAndView Report(ReportDTO rdto,int ctgry_no,String ctgry) {
		rdto.setCtgry_no(ctgry_no);
		rdto.setCtgry(ctgry);
		ModelAndView mav=new ModelAndView();
		int result=reportService.Report(rdto);
		String msg=result>0?"댓글신고성공!":"댓글신고실패";
		String gopage="goods.pi";
		
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("goods/goodsMsg");
		return mav;
	}
	
}
