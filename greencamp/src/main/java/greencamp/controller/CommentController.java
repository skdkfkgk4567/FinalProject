package greencamp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import greencamp.comment.model.CommentDTO;
import greencamp.comment.service.CommentService;
import greencamp.goods.model.GoodsDTO;
import greencamp.goods.service.GoodsService;

@Controller
public class CommentController {

	@Autowired
	private CommentService commentService;
	
	@RequestMapping(value = "/goods_comment.pi",method = RequestMethod.POST)
	public ModelAndView addGoodsComment(CommentDTO dto) {
		
		int result=commentService.addGoodsComment(dto);
		
		String msg=result>0?"댓글등록성공!":"댓글등록실패";
		String gopage="goods.pi";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("goods/goodsMsg");
		return mav;
	}
	
	@RequestMapping("/delComment.pi")
	public ModelAndView delComment(CommentDTO dto) {
		
		int result=commentService.delComment(dto);
		
		String msg=result>0?"댓글삭제성공!":"댓글삭제실패";
		String gopage="goods.pi";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("goods/goodsMsg");
		return mav;
	}
}
