package greencamp.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import greencamp.comment.model.CommentDAO;
import greencamp.comment.model.CommentDTO;

@Controller
public class MngrCommentController {
	
	@Autowired
	private CommentDAO commentDao;
	
	/*캠핑톡 댓글 목록*/
	@RequestMapping("/listCampTalkComment.pi")
	public ModelAndView listCampTalkComment(@RequestParam(value="cp", defaultValue="1")int cp) {
		int totalCnt=commentDao.campTalkCommentTotalCnt();
		int listSize=10;
		int pageSize=5;

		String pageStr=greencamp.page.PageModule.makePage("listCampTalkComment.pi", totalCnt, listSize, pageSize, cp);

		List<CommentDTO> list=commentDao.listCampTalkComment(cp, listSize);

		ModelAndView mav=new ModelAndView();
		
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.addObject("total", totalCnt);
		mav.setViewName("mngrcomment/listCampTalkComment");
		return mav;
	}
	
	/*캠핑톡 댓글 삭제*/
	@RequestMapping("/deleteCampTalkComment.pi")
	public ModelAndView deleteCampTalkComment(int cm_no){
		int result=commentDao.deleteCampTalkComment(cm_no);
		
		String msg=result>0?"삭제 성공하셨습니다.":"삭제 실패하셨습니다.";
		String gopage="listCampTalkComment.pi";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("mngrcomment/commentMsg");
		return mav;
	}
	
	/*중고거래 댓글 목록*/
	@RequestMapping("/listTradeComment.pi")
	public ModelAndView listTradeComment(@RequestParam(value="cp", defaultValue="1")int cp) {
		int totalCnt=commentDao.tradeCommentTotalCnt();
		int listSize=10;
		int pageSize=5;

		String pageStr=greencamp.page.PageModule.makePage("listTradeComment.pi", totalCnt, listSize, pageSize, cp);

		List<CommentDTO> list1=commentDao.listTradeComment(cp, listSize);

		ModelAndView mav=new ModelAndView();
		
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list1);
		mav.addObject("total", totalCnt);
		mav.setViewName("mngrcomment/listTradeComment");
		return mav;
	}
	
	/*중고거래 댓글 삭제*/
	@RequestMapping("/deleteTradeComment.pi")
	public ModelAndView deleteTradeComment(int cm_no){
		int result=commentDao.deleteTradeComment(cm_no);
		
		String msg=result>0?"삭제 성공하셨습니다.":"삭제 실패하셨습니다.";
		String gopage="listTradeComment.pi";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("mngrcomment/commentMsg");
		return mav;
	}
	
	/*캠핑장 댓글 목록*/
	@RequestMapping("/listCampsiteComment.pi")
	public ModelAndView listCampsiteComment(@RequestParam(value="cp", defaultValue="1")int cp) {
		int totalCnt=commentDao.campsiteCommentTotalCnt();
		int listSize=10;
		int pageSize=5;

		String pageStr=greencamp.page.PageModule.makePage("listCampsiteComment.pi", totalCnt, listSize, pageSize, cp);

		List<CommentDTO> list2=commentDao.listCampsiteComment(cp, listSize);

		ModelAndView mav=new ModelAndView();
		
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list2);
		mav.addObject("total", totalCnt);
		mav.setViewName("mngrcomment/listCampsiteComment");
		return mav;
	}
	
	/*캠핑장 댓글 삭제*/
	@RequestMapping("/deleteCampsiteComment.pi")
	public ModelAndView deleteCampsiteComment(int cm_no){
		int result=commentDao.deleteCampTalkComment(cm_no);
		
		String msg=result>0?"삭제 성공하셨습니다.":"삭제 실패하셨습니다.";
		String gopage="listCampTalkComment.pi";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("mngrcomment/commentMsg");
		return mav;
	}
	
	/*공지사항 댓글 목록*/
	@RequestMapping("/listNoticeComment.pi")
	public ModelAndView listNoticeComment(@RequestParam(value="cp", defaultValue="1")int cp) {
		int totalCnt=commentDao.noticeCommentTotalCnt();
		int listSize=10;
		int pageSize=5;

		String pageStr=greencamp.page.PageModule.makePage("listNoticeComment.pi", totalCnt, listSize, pageSize, cp);

		List<CommentDTO> list3=commentDao.listNoticeComment(cp, listSize);

		ModelAndView mav=new ModelAndView();
		
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list3);
		mav.addObject("total", totalCnt);
		mav.setViewName("mngrcomment/listNoticeComment");
		return mav;
	}
	
	/*공지사항 댓글 삭제*/
	@RequestMapping("/deleteNoticeComment.pi")
	public ModelAndView deleteNoticeComment(int cm_no){
		int result=commentDao.deleteNoticeComment(cm_no);
		
		String msg=result>0?"삭제 성공하셨습니다.":"삭제 실패하셨습니다.";
		String gopage="listNoticeComment.pi";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("mngrcomment/commentMsg");
		return mav;
	}
	
	/*캠핑정보 댓글 목록*/
	@RequestMapping("/listCampTipComment.pi")
	public ModelAndView listCampTipComment(@RequestParam(value="cp", defaultValue="1")int cp) {
		int totalCnt=commentDao.campTipCommentTotalCnt();
		int listSize=10;
		int pageSize=5;

		String pageStr=greencamp.page.PageModule.makePage("listCampTipComment.pi", totalCnt, listSize, pageSize, cp);

		List<CommentDTO> list4=commentDao.listCampTipComment(cp, listSize);

		ModelAndView mav=new ModelAndView();
		
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list4);
		mav.addObject("total", totalCnt);
		mav.setViewName("mngrcomment/listCampTipComment");
		return mav;
	}
	
	/*캠핑정보 댓글 삭제*/
	@RequestMapping("/deleteCampTipComment.pi")
	public ModelAndView deleteCampTipComment(int cm_no){
		int result=commentDao.deleteCampTipComment(cm_no);
		
		String msg=result>0?"삭제 성공하셨습니다.":"삭제 실패하셨습니다.";
		String gopage="listCampTipComment.pi";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("mngrcomment/commentMsg");
		return mav;
	}
	
}
