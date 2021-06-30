package greencamp.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import greencamp.bbs.model.BbsDAO;
import greencamp.bbs.model.BbsDTO;
import greencamp.comment.model.CommentDAO;
import greencamp.comment.model.CommentDTO;

@Controller
public class MngrBbsController {

	@Autowired
	private BbsDAO bbsDao;
	
	@Autowired
	private CommentDAO commentDao;
	
	/*캠핑톡 게시글 목록*/
	@RequestMapping("/listCampTalkPost.pi")
	public ModelAndView listCampTalkPost(@RequestParam(value="cp", defaultValue="1")int cp) {
		int totalCnt=bbsDao.campTalkPostTotalCnt();
		int listSize=10;
		int pageSize=5;

		String pageStr=greencamp.page.PageModule.makePage("listCampTalkPost.pi", totalCnt, listSize, pageSize, cp);

		List<BbsDTO> list=bbsDao.listCampTalkPost(cp, listSize);

		ModelAndView mav=new ModelAndView();
		
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.addObject("total", totalCnt);
		mav.setViewName("mngrbbs/listCampTalkPost");
		return mav;
	}
	
	/*캠핑톡 게시글 삭제*/
	@RequestMapping("/deleteCampTalkPost.pi")
	public ModelAndView deleteCampTalkPost(int bbs_no, CommentDTO dto, String ctgry){
		int result=bbsDao.deleteCampTalkPost(bbs_no);
		
		dto.setCtgry_no(bbs_no);
	    dto.setCtgry(ctgry);
	    int cresult=commentDao.delBbsComment(dto);
		
		String msg=result>0?"삭제 성공하셨습니다.":"삭제 실패하셨습니다.";
		String gopage="listCampTalkPost.pi";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("mngrbbs/bbsMsg");
		return mav;
	}
	
	/*공지사항 게시글 목록*/
	@RequestMapping("/listNoticePost.pi")
	public ModelAndView listNoticePost(@RequestParam(value="cp", defaultValue="1")int cp) {
		int totalCnt=bbsDao.noticePostTotalCnt();
		int listSize=10;
		int pageSize=5;

		String pageStr=greencamp.page.PageModule.makePage("listNoticePost.pi", totalCnt, listSize, pageSize, cp);

		List<BbsDTO> list=bbsDao.listNoticePost(cp, listSize);

		ModelAndView mav=new ModelAndView();
		
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.addObject("total", totalCnt);
		mav.setViewName("mngrbbs/listNoticePost");
		return mav;
	}
	
	/*공지사항 게시글 등록*/
	@RequestMapping(value="/writeNoticePost.pi",method=RequestMethod.POST)
	public ModelAndView writeNoticePost(BbsDTO dto) {
		int result=bbsDao.writeNoticePost(dto);
		
		String msg=result>0?"글 등록 성공하셨습니다.":"글 등록 실패하셨습니다.";
		String gopage="listNoticePost.pi";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("mngrbbs/bbsMsg");
		return mav;
	}
	
	/*공지사항 게시글 삭제*/
	@RequestMapping("/deleteNoticePost.pi")
	public ModelAndView deleteNoticePost(int bbs_no, CommentDTO dto, String ctgry){
		int result=bbsDao.deleteNoticePost(bbs_no);
		
		dto.setCtgry_no(bbs_no);
	    dto.setCtgry(ctgry);
	    int cresult=commentDao.delBbsComment(dto);
		
		String msg=result>0?"삭제 성공하셨습니다.":"삭제 실패하셨습니다.";
		String gopage="listNoticePost.pi";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("mngrbbs/bbsMsg");
		return mav;
	}
	
}