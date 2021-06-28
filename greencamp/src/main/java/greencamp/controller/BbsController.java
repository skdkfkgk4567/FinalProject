package greencamp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import greencamp.bbs.model.BbsDTO;
import greencamp.bbs.service.BbsService;
import greencamp.comment.model.CommentDTO;
import greencamp.comment.service.CommentService;

@Controller
public class BbsController {
	
	@Autowired
	private BbsService bbsService;
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/bbs.pi")
	public ModelAndView bbsList(BbsDTO dto,@RequestParam(value = "type",defaultValue = "1")int type,CommentDTO cdto) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/listNotice");
		return mav;
	}
	
	@RequestMapping("/camptalk.pi")
	public ModelAndView campTalkList(BbsDTO dto,@RequestParam(value = "type",defaultValue = "1")int type,CommentDTO cdto) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("camptalk/listCampTalk");
		return mav;
	}
	
	@RequestMapping(value = "/bbsWrite.pi",method = RequestMethod.POST)
	public ModelAndView registBbs(BbsDTO dto) {
		
		int result=bbsService.registBbs(dto);
		String msg=result>0?"게시글등록성공!":"게시글등록실패";
		String gopage="bbs.pi";
		ModelAndView mav=new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("goods/goodsMsg");
		return mav;
	}
	
	@RequestMapping("/bbsajax.pi")
	public ModelAndView bbsinfo(BbsDTO dto,int delng_no,String ctgry,CommentDTO cdto) {
		cdto.setCtgry_no(delng_no);
		cdto.setCtgry(ctgry);
		List list=bbsService.bbsajax(dto);
		List clist=commentService.listComment(cdto);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("clist", clist);
		mav.setViewName("notice/noticeinfo");
		return mav;
	}
	
	@RequestMapping(value = "/bbsupdate",method = RequestMethod.POST)
	public ModelAndView bbsUp(BbsDTO dto) {
		
		int result=bbsService.goodsUp(dto);
		
		String msg=result>0?"게시글수정성공!":"게시글수정실패";
		String gopage="bbs.pi";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("gopage", gopage);
		mav.setViewName("goods/goodsMsg");
		return mav;
	}
	
	@RequestMapping("/bbsdel.pi")
	public ModelAndView bbsDel(BbsDTO dto,CommentDTO cdto,int delng_no,String delngtp) {
		
		int result=bbsService.goodsDel(dto);
		cdto.setCtgry_no(delng_no);
		cdto.setCtgry(delngtp);
		int cresult=commentService.delGoodsComment(cdto);
		
		String msg=result>0?"게시글삭제성공":"게시글삭제실패";
		String gopage="bbs.pi";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("gopage", gopage);
		mav.setViewName("goods/goodsMsg");
		return mav;
	}
	

}
