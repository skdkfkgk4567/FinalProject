package greencamp.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import greencamp.campinfo.model.CampInfoDAO;
import greencamp.campinfo.model.CampInfoDTO;

@Controller
public class MngrCampInfoController {
	
	@Autowired
	private CampInfoDAO campInfoDao;
	
	/*캠핑정보 게시글 목록*/
	@RequestMapping("/listCampinfoPost.pi")
	public ModelAndView listCampinfoPost(@RequestParam(value="cp", defaultValue="1")int cp) {
		int totalCnt=campInfoDao.campinfoPostTotalCnt();
		int listSize=10;
		int pageSize=5;

		String pageStr=greencamp.page.PageModule.makePage("listCampinfoPost.pi", totalCnt, listSize, pageSize, cp);

		List<CampInfoDTO> list=campInfoDao.listCampinfoPost(cp, listSize);

		ModelAndView mav=new ModelAndView();
		
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.addObject("total", totalCnt);
		mav.setViewName("mngrbbs/listCampinfoPost");
		return mav;
	}
	
	/*캠핑정보 게시글 등록*/
	@RequestMapping(value="/writeCampinfoPost.pi",method=RequestMethod.POST)
	public ModelAndView writeCampinfoPost(CampInfoDTO dto) {
		int result=campInfoDao.writeCampinfoPost(dto);
		
		String msg=result>0?"글 등록 성공하셨습니다.":"글 등록 실패하셨습니다.";
		String gopage="listCampinfoPost.pi";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("mngrbbs/bbsMsg");
		return mav;
	}
	
	/*캠핑정보 게시글 삭제*/
	@RequestMapping("/deleteCampinfoPost.pi")
	public ModelAndView deleteCampinfoPost(int info_no){
		int result=campInfoDao.deleteCampinfoPost(info_no);
		
		String msg=result>0?"삭제 성공하셨습니다.":"삭제 실패하셨습니다.";
		String gopage="listCampinfoPost.pi";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("mngrbbs/bbsMsg");
		return mav;
	}
	
}
