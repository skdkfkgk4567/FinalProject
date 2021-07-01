package greencamp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import greencamp.comment.model.CommentDTO;
import greencamp.comment.service.CommentService;

@Controller
public class CommentController {

	@Autowired
	private CommentService commentService;

	@RequestMapping(value = "/goods_comment.pi", method = RequestMethod.POST)
	public ModelAndView addGoodsComment(CommentDTO dto, HttpServletRequest request) {
		HttpSession session = request.getSession();

		String user_ncnm = (String) session.getAttribute("user_ncnm");
		dto.setNcnm(user_ncnm);
		int result = commentService.addGoodsComment(dto);

		String msg = result > 0 ? "댓글등록성공!" : "댓글등록실패";
		String gopage = "goods.pi";

		ModelAndView mav = new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("goods/goodsMsg");
		return mav;
	}

	@RequestMapping(value = "/campinfo_comment.pi", method = RequestMethod.POST)
	public ModelAndView addCampInfoComment(CommentDTO dto, HttpServletRequest request) {
		HttpSession session = request.getSession();

		String user_ncnm = (String) session.getAttribute("user_ncnm");
		dto.setNcnm(user_ncnm);
		int result = commentService.addGoodsComment(dto);

		String msg = result > 0 ? "댓글등록성공!" : "댓글등록실패";
		String gopage = "listCampInfo.pi";

		ModelAndView mav = new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("goods/goodsMsg");
		return mav;
	}

	@RequestMapping(value = "/camptalk_comment.pi", method = RequestMethod.POST)
	public ModelAndView addCampTalkComment(CommentDTO dto, HttpServletRequest request) {
		HttpSession session = request.getSession();

		String user_ncnm = (String) session.getAttribute("user_ncnm");
		dto.setNcnm(user_ncnm);
		int result = commentService.addGoodsComment(dto);

		String msg = result > 0 ? "댓글등록성공!" : "댓글등록실패";
		String gopage = "camptalk.pi";

		ModelAndView mav = new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("goods/goodsMsg");
		return mav;
	}

	@RequestMapping(value = "/notice_comment.pi", method = RequestMethod.POST)
	public ModelAndView addNoticeComment(CommentDTO dto, HttpServletRequest request) {
		HttpSession session = request.getSession();

		String user_ncnm = (String) session.getAttribute("user_ncnm");
		dto.setNcnm(user_ncnm);
		int result = commentService.addGoodsComment(dto);

		String msg = result > 0 ? "댓글등록성공!" : "댓글등록실패";
		String gopage = "bbs.pi";

		ModelAndView mav = new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("goods/goodsMsg");
		return mav;
	}

	@RequestMapping(value = "/evnt_comment.pi", method = RequestMethod.POST)
	public ModelAndView addEvntComment(CommentDTO dto, HttpServletRequest request) {
		HttpSession session = request.getSession();

		String user_ncnm = (String) session.getAttribute("user_ncnm");
		dto.setNcnm(user_ncnm);
		int result = commentService.addGoodsComment(dto);

		String msg = result > 0 ? "댓글등록성공!" : "댓글등록실패";
		String gopage = "event.pi";

		ModelAndView mav = new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("goods/goodsMsg");
		return mav;
	}

	@RequestMapping("/goodsdelComment.pi")
	public ModelAndView goodsdelComment(CommentDTO dto) {

		int result = commentService.delComment(dto);

		String msg = result > 0 ? "댓글삭제성공!" : "댓글삭제실패";
		String gopage = "goods.pi";

		ModelAndView mav = new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("goods/goodsMsg");
		return mav;
	}

	@RequestMapping("/camptalkdelComment.pi")
	public ModelAndView camptalkdelComment(CommentDTO dto) {

		int result = commentService.delComment(dto);

		String msg = result > 0 ? "댓글삭제성공!" : "댓글삭제실패";
		String gopage = "camptalk.pi";

		ModelAndView mav = new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("goods/goodsMsg");
		return mav;
	}

	@RequestMapping("/campinfodelComment.pi")
	public ModelAndView campinfodelComment(CommentDTO dto) {

		int result = commentService.delComment(dto);

		String msg = result > 0 ? "댓글삭제성공!" : "댓글삭제실패";
		String gopage = "listCampInfo.pi";

		ModelAndView mav = new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("goods/goodsMsg");
		return mav;
	}

	@RequestMapping("/noticedelComment.pi")
	public ModelAndView noticedelComment(CommentDTO dto) {

		int result = commentService.delComment(dto);

		String msg = result > 0 ? "댓글삭제성공!" : "댓글삭제실패";
		String gopage = "bbs.pi";

		ModelAndView mav = new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("goods/goodsMsg");
		return mav;
	}

	@RequestMapping("/evntdelComment.pi")
	public ModelAndView evntdelComment(CommentDTO dto) {

		int result = commentService.delComment(dto);

		String msg = result > 0 ? "댓글삭제성공!" : "댓글삭제실패";
		String gopage = "event.pi";

		ModelAndView mav = new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("goods/goodsMsg");
		return mav;
	}

	/*---------------------*/
	@RequestMapping("/delComment.pi")
	public ModelAndView delComment(CommentDTO dto) {

		int result = commentService.delComment(dto);

		String msg = result > 0 ? "댓글삭제성공!" : "댓글삭제실패";
		String gopage = "goods.pi";

		ModelAndView mav = new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("goods/goodsMsg");
		return mav;
	}

	@RequestMapping("mypagereplylist.pi")
	public ModelAndView mypagereplylist(HttpServletRequest request) {

		HttpSession session = request.getSession();

		String user_id = (String) session.getAttribute("user_id");
		String user_ncnm = (String) session.getAttribute("user_ncnm");
		String user_nm = (String) session.getAttribute("user_nm");

		List list = commentService.getcommentlist(user_ncnm);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/mypagereplylist");
		mav.addObject("list", list);
		return mav;

	}

	@RequestMapping("deletecomment.pi")
	public ModelAndView deletecomment(CommentDTO dto) {
		String msg = "";
		int result = commentService.delComment(dto);
		msg = result > 0 ? "삭제성공" : "삭제실패";
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/noticmsg");
		mav.addObject("msg", msg);
		return mav;
	}
}
