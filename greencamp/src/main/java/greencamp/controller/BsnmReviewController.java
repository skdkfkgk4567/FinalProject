package greencamp.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import greencamp.camp.model.CampDAO;
import greencamp.camp.model.CampDTO;
import greencamp.like.model.LikeDAO;
import greencamp.like.model.LikeDTO;
import greencamp.review.model.ReviewDAO;

@Controller
public class BsnmReviewController {
	
	@Autowired
	private ReviewDAO ReviewDao;
	@Autowired
	private LikeDAO LikeDao;
	
	@RequestMapping("listReviewBsnm.pi")
	public ModelAndView getListReviewBsnm() {
		String id = "Bresiten";
		List list = ReviewDao.getListReviewBsnmService(id);
		List<LikeDTO> listnum = ReviewDao.getlikebbsnumber(id);
		
		for(int i=0; i<listnum.size();i++) {
			int like_no=listnum.get(i).getLike_no();
			System.out.println(like_no);
			
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/reviewBsnm/listReviewBsnm");
		mav.addObject("list", list);
		
		return mav;
		
	}
	
	@RequestMapping("likeclick.pi")
	public ModelAndView likesup(String bbs_no,LikeDTO LikeDto) {
		String id = "Bresiten";
		int check = Integer.parseInt(bbs_no);
		int result = ReviewDao.likesup(check);
		LikeDto.setLike_id(id);
		LikeDto.setLike_no(check);
		int insertliketable = LikeDao.insertlikeuser(LikeDto);
		int showlikes =ReviewDao.showlikesnumber(check);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/reviewBsnm/reviewMsg");
		mav.addObject("msg", showlikes);
		return mav;
	}
	
	@RequestMapping("likenoclick.pi")
	public ModelAndView likesdown(String bbs_no) {
		String id = "Bresiten";
		int check = Integer.parseInt(bbs_no);
		int result = ReviewDao.likesdown(check);
		int deleteliketable = LikeDao.deletelikeuser(check);
		int showlikes =ReviewDao.showlikesnumber(check);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/reviewBsnm/reviewMsg");
		mav.addObject("msg", showlikes);
		return mav;
	}
	

	

}
