package greencamp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import greencamp.campinfo.model.CampInfoDTO;
import greencamp.campinfo.service.CampInfoService;
import greencamp.comment.model.CommentDTO;
import greencamp.comment.service.CommentService;

@Controller
public class CampInfoController {
	
	@Autowired
	private CampInfoService campinfoService;
	
	@Autowired
	private CommentService commentService;

	@RequestMapping("/listCampInfo.pi")
	public ModelAndView listCampInfo(CampInfoDTO dto,@RequestParam(value = "ctgry",defaultValue = "캠핑팁")String ctgry) {
		
		dto.setCtgry(ctgry);
		
		List list=campinfoService.listCampInfo(dto);
		List infolist=campinfoService.campInfoTypeIndex(dto);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("infolist", infolist);
		mav.setViewName("campinfo/listCampInfo");
		return mav;
	}
	
	@RequestMapping("/campinfoajax.pi")
	public ModelAndView goodsInfo(CampInfoDTO dto,int info_no,String ctgry,CommentDTO cdto) {
		
		cdto.setCtgry_no(info_no);
		cdto.setCtgry(ctgry);
		
		List list=campinfoService.campinfoajax(dto);
		List clist=commentService.listComment(cdto);
		//int ct_comment=commentService.countComment(cdto);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("clist", clist);
		//mav.addObject("ct_comment", ct_comment);
		mav.setViewName("campinfo/campinfo");
		return mav;
	}
	
	
	
	
	
}
