package greencamp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import greencamp.selling.model.SellingDAO;
import greencamp.selling.model.SellingDTO;

@Controller
public class BsnmSellingController {
	@Autowired
	private SellingDAO SellingDao;
	@RequestMapping("listSellingBsnm.pi")
	public ModelAndView getListSellingBsnm(HttpServletRequest request) {
		HttpSession session = request.getSession();

		String user_id = (String) session.getAttribute("user_id");
		List<SellingDTO> list= SellingDao.getListSellingBsnmService(user_id);
		if(list.size()==0) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/SellingBsnm/listSellingBsnm");
			mav.addObject("list", list);
			
			return mav;
		}
		int total = SellingDao.totalpc(user_id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/SellingBsnm/listSellingBsnm");
		mav.addObject("list", list);
		mav.addObject("total", total);
		return mav;
	}

}
