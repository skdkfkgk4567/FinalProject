package greencamp.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import greencamp.event.model.EventDAO;
import greencamp.event.model.EventDTO;

@Controller
public class MngrEventController {

	@Autowired
	private EventDAO eventDao;
	
	/*이벤트&광고 목록*/
	@RequestMapping("/listEvent.pi")
	public ModelAndView listEvent(@RequestParam(value="cp", defaultValue="1")int cp) {
		int totalCnt=eventDao.eventTotalCnt();
		int listSize=10;
		int pageSize=5;

		String pageStr=greencamp.page.PageModule.makePage("listEvent.pi", totalCnt, listSize, pageSize, cp);

		List<EventDTO> list=eventDao.listEvent(cp, listSize);

		ModelAndView mav=new ModelAndView();
		
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.addObject("total", totalCnt);
		mav.setViewName("mngrevent/listEvent");
		return mav;
	}
	
	/*이벤트&광고 반려*/
	@RequestMapping("/compEvent.pi")
	public ModelAndView compEvent(int evnt_no){
		int result=eventDao.compEvent(evnt_no);
		
		String msg=result>0?"이벤트&광고가 반려되었습니다.":"이벤트&광고 반려에 실패하셨습니다.";
		String gopage="listEvent.pi";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("mngrevent/eventMsg");
		return mav;
	}
	
	/*이벤트&광고 승인*/
	@RequestMapping("/recogEvent.pi")
	public ModelAndView recogEvent(EventDTO dto) {
		int result=eventDao.recogEvent(dto);		
		String msg=result>0?"이벤트&광고가 승되었습니다.":"이벤트&광고 승인에 실패하셨습니다.";
		String gopage="listEvent.pi";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("mngrevent/eventMsg");
		return mav;
	}
	
}
