package greencamp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import greencamp.goods.model.GoodsDTO;

@Controller
public class TestController {

	@RequestMapping("/test.pi")
	public String test() {
		return "test/test";
	}
	@RequestMapping("/testList.pi")
	public String testList() {
		return "test/testList";
	}
	@RequestMapping("/ajaxtest.pi")
	public String ajaxtest() {
		return "test/ajaxtest";
	}
	@RequestMapping("/ajaxtest2.pi")
	public String ajaxtest2() {
		return "test/ajaxTest2";
	}
	@RequestMapping("/testListInfo.pi")
	public ModelAndView testListInfo(@ModelAttribute("dto") GoodsDTO dto) {
		
		StringBuilder sb = new StringBuilder();
		sb.append("<div>"+dto.getSj()+"</div>");
		sb.append("<div>"+dto.getCn()+"</div>");
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("tag", sb);
		mav.setViewName("test/ajaxTest2");
		return mav;
	}
	
}
