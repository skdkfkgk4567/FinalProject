package greencamp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController
{
	@RequestMapping("/index.pi")
	public ModelAndView index()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		return mav;
	}
	
	@RequestMapping("/index2.pi")
	public ModelAndView index2()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index2");
		return mav;
	}
}
