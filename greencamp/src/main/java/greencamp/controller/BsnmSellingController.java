package greencamp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import greencamp.selling.model.SellingDAO;

@Controller
public class BsnmSellingController {
	@Autowired
	private SellingDAO SellingDao;
	@RequestMapping("listSellingBsnm.pi")
	public ModelAndView getListSellingBsnm() {
		String id ="lws5760";
		List list= SellingDao.getListSellingBsnmService(id);
		int total = SellingDao.totalpc(id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/SellingBsnm/listSellingBsnm");
		mav.addObject("list", list);
		mav.addObject("total", total);
		return mav;
	}

}
