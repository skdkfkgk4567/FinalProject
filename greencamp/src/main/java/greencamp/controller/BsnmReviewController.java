package greencamp.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import greencamp.camp.model.CampDAO;
import greencamp.camp.model.CampDTO;
import greencamp.like.model.LikeDAO;
import greencamp.like.model.LikeDTO;
import greencamp.review.model.ReviewDAO;
import greencamp.review.model.ReviewDTO;

@Controller
public class BsnmReviewController {
	
	@Autowired
	private ReviewDAO ReviewDao;
	@Autowired
	private LikeDAO LikeDao;
	
	@RequestMapping("listReviewBsnm.pi")
	public ModelAndView getListReviewBsnm(HttpServletRequest request) {
		HttpSession session = request.getSession();

		String user_id = (String) session.getAttribute("user_id");
		String user_ncnm = (String) session.getAttribute("user_ncnm");
		
		int camp_no = ReviewDao.findcampnobsnm(user_id);
		List<ReviewDTO> list = ReviewDao.getListReviewBsnmService(camp_no);
		List<LikeDTO> listnum = ReviewDao.getlikebbsnumber(user_ncnm);
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
	public ModelAndView likesup(String bbs_no,LikeDTO LikeDto,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String user_ncnm = (String) session.getAttribute("user_ncnm");
		int check = Integer.parseInt(bbs_no);
		int result = ReviewDao.likesup(check);
		LikeDto.setLike_ncnm(user_ncnm);
		LikeDto.setLike_no(check);
		int insertliketable = LikeDao.insertlikeuser(LikeDto);
		int showlikes =ReviewDao.showlikesnumber(check);
		ModelAndView mav= new ModelAndView();
		
		mav.setViewName("bsnm/reviewBsnm/reviewMsg");
		mav.addObject("msg", showlikes);
		return mav;
	}
	
	@RequestMapping("likenoclick.pi")
	public ModelAndView likesdown(String bbs_no,HttpServletRequest request) {
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
