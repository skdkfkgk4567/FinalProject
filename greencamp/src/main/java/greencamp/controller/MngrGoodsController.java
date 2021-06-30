package greencamp.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import greencamp.comment.model.CommentDAO;
import greencamp.comment.model.CommentDTO;
import greencamp.goods.model.GoodsDAO;
import greencamp.goods.model.GoodsDTO;

@Controller
public class MngrGoodsController {
	
	@Autowired
	private GoodsDAO goodsDao;
	
	@Autowired
	private CommentDAO commentDao;
	
	/*중고거래 게시글 목록*/
	@RequestMapping("/listGoodsPost.pi")
	public ModelAndView listGoodsPost(@RequestParam(value="cp", defaultValue="1")int cp) {
		int totalCnt=goodsDao.goodsPostTotalCnt();
		int listSize=10;
		int pageSize=5;

		String pageStr=greencamp.page.PageModule.makePage("listGoodsPost.pi", totalCnt, listSize, pageSize, cp);

		List<GoodsDTO> list=goodsDao.listGoodsPost(cp, listSize);

		ModelAndView mav=new ModelAndView();
		
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.addObject("total", totalCnt);
		mav.setViewName("mngrbbs/listGoodsPost");
		return mav;
	}

	/*중고거래 게시글 삭제*/
	@RequestMapping("/deleteGoodsPost.pi")
	public ModelAndView deleteGoodsPost(int delng_no, CommentDTO dto, String delngtp){
		int result=goodsDao.deleteGoodsPost(delng_no);
		
		dto.setCtgry_no(delng_no);
	    dto.setCtgry(delngtp);
	    int cresult=commentDao.delBbsComment(dto);
		
		String msg=result>0?"삭제 성공하셨습니다.":"삭제 실패하셨습니다.";
		String gopage="listGoodsPost.pi";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("mngrbbs/bbsMsg");
		return mav;
	}
	
}
