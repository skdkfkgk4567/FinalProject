package greencamp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import greencamp.event.model.EventDAO;
import greencamp.event.model.EventDTO;

@Controller
public class BsnmEventController {
	
	@Autowired
	private EventDAO EventDao;
	
	@RequestMapping("eventWriteBsnm.pi")
	public ModelAndView eventWriteBsnm(HttpServletRequest request) {
		
		HttpSession session = request.getSession();

		String user_id = (String) session.getAttribute("user_id");
		String user_ncnm = (String) session.getAttribute("user_ncnm");
		String user_nm = (String) session.getAttribute("user_nm");
		
		List list = EventDao.geteventList(user_id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/eventBsnm/eventWriteBsnm");
		mav.addObject("list", list);
		return mav;
		
	}
	
	@RequestMapping("eventsend.pi")
	public ModelAndView eventwrite(EventDTO EventDto,
			String sj,String ctgry,int pc,String id,String cn) {
		String msg="";
		
	System.out.println(pc);
		if(pc==0) {
			msg="할인율을 입력해주세요";
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/eventBsnm/eventMsg");
			mav.addObject("msg", msg);
			return mav;
		}
		if(sj.equals("")) {
			msg="제목을 입력해주세요";
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/eventBsnm/eventMsg");
			mav.addObject("msg", msg);
			return mav;
		}
		if(cn.equals("")) {
			msg="행사/광고내용을 입력해주세요";
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/eventBsnm/eventMsg");
			mav.addObject("msg", msg);
			return mav;
		}
		
		int result = EventDao.eventWrite(EventDto);
		msg=result>0?"성공":"실패";
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/eventBsnm/eventMsg");
		mav.addObject("msg", msg);
		return mav;
		
	}
}
