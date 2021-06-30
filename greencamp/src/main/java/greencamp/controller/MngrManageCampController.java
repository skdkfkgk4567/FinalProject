package greencamp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import greencamp.camp.model.CampDAO;
import greencamp.camp.model.SiteVO;

@Controller
public class MngrManageCampController
{
	@Autowired
	private CampDAO campDAO;
	
	@RequestMapping("manageCamp.pi")
	public ModelAndView manageCamp(HttpServletRequest req,
			@RequestParam(value = "camp_nm", required = false, defaultValue = "all") String camp_nm, SiteVO siteVO)
	{
		ModelAndView mav = new ModelAndView();
		int listCnt = 0;
		String cp_s = req.getParameter("cp");
		if (cp_s == null || cp_s.equals("")) {
			cp_s = "1";
		}

		int cp = Integer.parseInt(cp_s);
		int pagingSize = 10;
		int pageSize = 10;
		siteVO.setCp(cp);
		siteVO.setLs(pageSize);
		listCnt = campDAO.manageCampCount(siteVO);
		String pageStr = greencamp.page.PageModule.makePage("manageCamp.pi", listCnt, pagingSize, pageSize, cp, camp_nm);
		List<SiteVO> list = campDAO.getAcceptManageCampList(siteVO);
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("mngrmanagecamp/manageCamp");
		return mav;
	}
	
	/*이벤트&광고 반려*/
	@RequestMapping("/compCamp.pi")
	public ModelAndView compCamp(int camp_no){
		int result=campDAO.compCamp(camp_no);
		
		String msg=result>0?"캠핑장이 반려되었습니다.":"캠핑장 반려에 실패하셨습니다.";
		String gopage="manageCamp.pi";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("mngrmanagecamp/campMsg");
		return mav;
	}
	
	/*이벤트&광고 승인*/
	@RequestMapping("/recogCamp.pi")
	public ModelAndView recogCamp(SiteVO siteVO) {
		int result=campDAO.recogCamp(siteVO);		
		String msg=result>0?"캠핑장이 승되었습니다.":"캠핑장 승인에 실패하셨습니다.";
		String gopage="manageCamp.pi";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("mngrmanagecamp/campMsg");
		return mav;
	}
}
