package greencamp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BsnmReservationController {
	
	@RequestMapping("listResveBsnm.pi")
	public ModelAndView getListResveBsnm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/ResveBsnm/listResveBsnm");
		return mav;
		
	}

}
