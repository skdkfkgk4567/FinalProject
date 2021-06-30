package greencamp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import greencamp.bbs.model.BbsDTO;
import greencamp.comment.model.CommentDTO;
import greencamp.comment.service.CommentService;
import greencamp.event.model.EventDAO;
import greencamp.event.model.EventDTO;

@Controller
public class EventController {
	
	@Autowired
	private EventDAO eventDao;
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/event.pi")
	public ModelAndView bbsList(EventDTO dto,@RequestParam(value = "type",defaultValue = "1")int type) {
		ModelAndView mav=new ModelAndView();
		
		if(type==1) {
			dto.setCtgry("이벤트");
			List list=eventDao.eventList(dto);
			List infolist=eventDao.eventinfo(dto);
			mav.addObject("list", list);
			mav.addObject("infolist", infolist);
		}else if(type==2) {
			dto.setCtgry("광고");
			List list=eventDao.eventList(dto);
			List infolist=eventDao.eventinfo(dto);
			mav.addObject("list", list);
			mav.addObject("infolist", infolist);
		}
		
		
		mav.setViewName("event/listEvent");
		return mav;
	}
	
	@RequestMapping("/eventajax.pi")
	public ModelAndView camptalkinfo(EventDTO dto,int evnt_no,String ctgry,CommentDTO cdto) {
		cdto.setCtgry_no(evnt_no);
		cdto.setCtgry(ctgry);
		List list=eventDao.eventajax(dto);
		List clist=commentService.listComment(cdto);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("clist", clist);
		mav.setViewName("event/eventInfo");
		return mav;
	}

}
