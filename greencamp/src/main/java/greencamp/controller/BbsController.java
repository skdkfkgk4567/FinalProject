package greencamp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import greencamp.event.model.EventDAO;

@Controller
public class BbsController {
	
	@Autowired
	private BbsService bbsService;
	
	@Autowired
	private EventDAO eventDao;
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/bbs.pi")
	public ModelAndView bbsList(BbsDTO dto,@RequestParam(value = "type",defaultValue = "1")int type,CommentDTO cdto) {
		ModelAndView mav=new ModelAndView();
		
		if(type==1) {
			dto.setCtgry("공지사항");
			List list=bbsService.listBbs(dto);
			List infolist=bbsService.bbsTypeIndex(dto);
			mav.addObject("list", list);
			mav.addObject("infolist", infolist);
		}else if(type==2) {
			dto.setCtgry("이용안내");
			List list=bbsService.listBbs(dto);
			List infolist=bbsService.bbsTypeIndex(dto);
			mav.addObject("list", list);
			mav.addObject("infolist", infolist);
		}else if(type==3) {
			dto.setCtgry("자주묻는질문");
			List list=bbsService.listBbs(dto);
			List infolist=bbsService.bbsTypeIndex(dto);
			mav.addObject("list", list);
			mav.addObject("infolist", infolist);
		}
		
		mav.setViewName("notice/listNotice");
		return mav;
	}
	
	@RequestMapping("/camptalk.pi")
	public ModelAndView campTalkList(BbsDTO dto,@RequestParam(value = "type",defaultValue = "1")int type,CommentDTO cdto) {
		ModelAndView mav=new ModelAndView();
		
		if(type==1) {
			dto.setCtgry("가입인사");
			List list=bbsService.listBbs(dto);
			List infolist=bbsService.bbsTypeIndex(dto);
			mav.addObject("list", list);
			mav.addObject("infolist", infolist);
		}else if(type==2) {
			dto.setCtgry("리뷰");
			List list=bbsService.listBbs(dto);
			List infolist=bbsService.bbsTypeIndex(dto);
			mav.addObject("list", list);
			mav.addObject("infolist", infolist);
		}else if(type==3) {
			dto.setCtgry("자유게시판");
			List list=bbsService.listBbs(dto);
			List infolist=bbsService.bbsTypeIndex(dto);
			mav.addObject("list", list);
			mav.addObject("infolist", infolist);
		}
		
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
	
	@RequestMapping(value = "/camptalkWrite.pi",method = RequestMethod.POST)
	public ModelAndView registCampTalk(BbsDTO dto, HttpServletRequest request) {
		HttpSession session = request.getSession();

		String user_id = (String) session.getAttribute("user_id");
		String user_ncnm = (String) session.getAttribute("user_ncnm");
		String user_nm = (String) session.getAttribute("user_nm");
		dto.setNcnm(user_ncnm);
		int result=bbsService.registBbs(dto);
		String msg=result>0?"게시글등록성공!":"게시글등록실패";
		String gopage="camptalk.pi";
		ModelAndView mav=new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("goods/goodsMsg");
		return mav;
	}
	
	@RequestMapping("/camptalkajax.pi")
	public ModelAndView camptalkinfo(BbsDTO dto,int bbs_no,String ctgry,CommentDTO cdto) {
		cdto.setCtgry_no(bbs_no);
		cdto.setCtgry(ctgry);
		List list=bbsService.bbsajax(dto);
		List clist=commentService.listComment(cdto);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("clist", clist);
		mav.setViewName("camptalk/campTalkInfo");
		return mav;
	}
	
	@RequestMapping("/bbsajax.pi")
	public ModelAndView bbsinfo(BbsDTO dto,int bbs_no,String ctgry,CommentDTO cdto) {
		cdto.setCtgry_no(bbs_no);
		cdto.setCtgry(ctgry);
		List list=bbsService.bbsajax(dto);
		List clist=commentService.listComment(cdto);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("clist", clist);
		mav.setViewName("notice/noticeInfo");
		return mav;
	}
	
	@RequestMapping(value = "/bbsupdate.pi",method = RequestMethod.POST)
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
	
	@RequestMapping(value = "/camptalkupdate.pi",method = RequestMethod.POST)
	public ModelAndView camptalkUp(BbsDTO dto) {
		
		int result=bbsService.goodsUp(dto);
		
		String msg=result>0?"게시글수정성공!":"게시글수정실패";
		String gopage="camptalk.pi";
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
	
	@RequestMapping("/camptalkdel.pi")
	public ModelAndView camptalkDel(BbsDTO dto,CommentDTO cdto,int delng_no,String delngtp) {
		
		int result=bbsService.goodsDel(dto);
		cdto.setCtgry_no(delng_no);
		cdto.setCtgry(delngtp);
		int cresult=commentService.delGoodsComment(cdto);
		
		String msg=result>0?"게시글삭제성공":"게시글삭제실패";
		String gopage="camptalk.pi";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("gopage", gopage);
		mav.setViewName("goods/goodsMsg");
		return mav;
	}
	
	//여기부터 마이페이지
	@RequestMapping("mypagebbslist.pi")
	public ModelAndView mypagebbslist(HttpServletRequest request) {
		HttpSession session = request.getSession();

		String user_ncnm = (String) session.getAttribute("user_ncnm");
		List list = bbsService.getlistbbs(user_ncnm);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/mypagebbslist");
		mav.addObject("list", list);
		return mav;
		
	}
	
	

}
