package greencamp.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import greencamp.comment.model.CommentDTO;
import greencamp.comment.service.CommentService;
import greencamp.goods.model.GoodsDTO;
import greencamp.goods.service.GoodsService;

@Controller
public class GoodsController {
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/goods.pi")
	public ModelAndView goodsList(GoodsDTO dto,@RequestParam(value = "type",defaultValue = "1")int type,CommentDTO cdto) {
		
		ModelAndView mav=new ModelAndView();
		
		
		if(type==1) {
			List list=goodsService.listGoods(dto);
			List infolist=goodsService.goodsInfoIndex(dto);
			mav.addObject("list", list);
			mav.addObject("infolist", infolist);
		}else if(type==2) {
			List list=goodsService.listGoodsTypeBuy(dto);
			dto.setDelngtp("삽니다");
			List infolist=goodsService.goodsInfoTypeIndex(dto);
			mav.addObject("list", list);
			mav.addObject("infolist", infolist);
		}else if(type==3) {
			List list=goodsService.listGoodsTypeSale(dto);
			dto.setDelngtp("팝니다");
			List infolist=goodsService.goodsInfoTypeIndex(dto);
			mav.addObject("list", list);
			mav.addObject("infolist", infolist);
		}
//		cdto.setCtgry(dto.getDelngtp());
//		cdto.setCtgry_no(dto.getDelng_no());
//		List clist=commentService.listComment(cdto);
//		mav.addObject("clist", clist);
		mav.setViewName("goods/goodsList");
		return mav;
	}
	
	@RequestMapping(value = "/goodsWrite.pi",method = RequestMethod.POST)
	public ModelAndView registGoods(GoodsDTO dto) {
		
		int result=goodsService.registGoods(dto);
		
		String msg=result>0?"중고거래등록성공!":"중고거래등록실패";
		String gopage="goods.pi";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("goods/goodsMsg");
		return mav;
	}
	@RequestMapping("/goodsajax.pi")
	public ModelAndView goodsInfo(GoodsDTO dto,int delng_no,String ctgry,CommentDTO cdto) {
		
		cdto.setCtgry_no(delng_no);
		cdto.setCtgry(ctgry);
		
		List list=goodsService.goodsajax(dto);
		List clist=commentService.listComment(cdto);
		//int ct_comment=commentService.countComment(cdto);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("clist", clist);
		//mav.addObject("ct_comment", ct_comment);
		mav.setViewName("goods/goodsinfo");
		return mav;
	}
	@RequestMapping(value = "/goodsupdate.pi",method = RequestMethod.POST)
	public ModelAndView goodsUp(GoodsDTO dto) {

		int result=goodsService.goodsUp(dto);
		
		String msg=result>0?"중고거래수정성공!":"중고거래수정실패";
		String gopage="goods.pi";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("gopage", gopage);
		mav.setViewName("goods/goodsMsg");
		return mav;
	}
	@RequestMapping("/goodsdel.pi")
	public ModelAndView goodsDel(GoodsDTO dto,CommentDTO cdto,int delng_no,String delngtp) {
		int result=goodsService.goodsDel(dto);
		
		cdto.setCtgry_no(delng_no);
		cdto.setCtgry(delngtp);
		int cresult=commentService.delGoodsComment(cdto);
		
		String msg=result>0?"중고거래삭제성공":"중고거래삭제실패";
		String gopage="goods.pi";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("gopage", gopage);
		mav.setViewName("goods/goodsMsg");
		return mav;
	}
}
