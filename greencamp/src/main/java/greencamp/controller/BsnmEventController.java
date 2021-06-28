package greencamp.controller;

import java.util.List;

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
	public ModelAndView eventWriteBsnm() {
		String id="lws5760";
		List list = EventDao.geteventList(id);
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
			msg="�������� �Է����ּ���";
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/eventBsnm/eventMsg");
			mav.addObject("msg", msg);
			return mav;
		}
		if(sj.equals("")) {
			msg="������ �Է����ּ���";
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/eventBsnm/eventMsg");
			mav.addObject("msg", msg);
			return mav;
		}
		if(cn.equals("")) {
			msg="���/�������� �Է����ּ���";
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/eventBsnm/eventMsg");
			mav.addObject("msg", msg);
			return mav;
		}
		
		int result = EventDao.eventWrite(EventDto);
		msg=result>0?"����":"����";
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/eventBsnm/eventMsg");
		mav.addObject("msg", msg);
		return mav;
		
	}
}
