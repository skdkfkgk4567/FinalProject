package greencamp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import greencamp.member.model.MemberDAO;
import greencamp.message.model.MessageDAO;
import greencamp.message.model.MessageDTO;
import greencamp.message.model.MessageVO;

@Controller
public class MessageController {

	@Autowired
	private MessageDAO MessageDao;
	@Autowired
	private MemberDAO MemberDao;
	
	
	@RequestMapping("listReceptionMsg.pi")
	public ModelAndView getListReceptionMsg(HttpServletRequest request) {
		HttpSession session = request.getSession();

		String user_id = (String) session.getAttribute("user_id");
		String user_ncnm = (String) session.getAttribute("user_ncnm");
		String user_nm = (String) session.getAttribute("user_nm");
		List<MessageDTO> list = MessageDao.getListReceptionMsg(user_id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("msg/listReceptionMsg");
		mav.addObject("list",list);
		return mav;
		
	}
	@RequestMapping("listSendMsg.pi")
	public ModelAndView getListSendMsg(HttpServletRequest request) {
		HttpSession session = request.getSession();

		String user_id = (String) session.getAttribute("user_id");
		String user_ncnm = (String) session.getAttribute("user_ncnm");
		String user_nm = (String) session.getAttribute("user_nm");
		List<MessageDTO> list = MessageDao.getListsendMsg(user_id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("msg/listSendMsg");
		mav.addObject("list", list);
		return mav;
		
	}
	
	
	@RequestMapping("sendMsg.pi")
	public ModelAndView sendMsg() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("msg/sendMsg");
		return mav;
		
	}
	
	@RequestMapping("writesendmsg.pi")
	public ModelAndView writesendmsg(MessageDTO MessageDto,String rcver_id,String cn,HttpServletRequest request) {
		String msg="";
		HttpSession session = request.getSession();

	
		
		MessageDto.setSender_id(rcver_id);
		if(cn==null || cn.equals("")) {
			msg="빈 칸을 확인해주세요";
			ModelAndView mav = new ModelAndView();
			mav.setViewName("msg/msgMsg");
			mav.addObject("msg", msg);
			return mav;
		}
		
		int findusercheckresult = MemberDao.findusercheck(rcver_id);
		if(findusercheckresult!=0) {
			
		int result = MessageDao.writesendmsg(MessageDto);
		msg=result>0?"성공":"실패";
		
		}else {
		msg="아이디를 찾을수 없습니다.";
		
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("msg/msgMsg");
		mav.addObject("msg", msg);
		return mav;
		
	}
	
	
	@RequestMapping("myapgewritesendmsg.pi")
	public ModelAndView mypagewritesendmsg(String sender_id,MessageDTO MessageDto,String rcver_id,String cn,HttpServletRequest request) {
		String msg="";

		MessageDto.setSender_id(sender_id);
		if(cn==null || cn.equals("")) {
			msg="빈 칸을 확인해주세요";
			ModelAndView mav = new ModelAndView();
			mav.setViewName("msg/msgMsg");
			mav.addObject("msg", msg);
			return mav;
		}
		
		int findusercheckresult = MemberDao.findusercheck(rcver_id);
		if(findusercheckresult!=0) {
			
		int result = MessageDao.writesendmsg(MessageDto);
		msg=result>0?"성공":"실패";
		
		}else {
		msg="아이디를 찾을수 없습니다.";
		
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("msg/msgMsg");
		mav.addObject("msg", msg);
		return mav;
		
	}
	
	@RequestMapping("writesendmsglistsend.pi")
	public ModelAndView writesendmsglistsend(MessageDTO MessageDto,String cn,HttpServletRequest request) {
		String msg="";
		if(cn==null || cn.equals("")) {
			msg="내용을 입력해주세요";
			ModelAndView mav = new ModelAndView();
			mav.setViewName("msg/listSendMsg");
			mav.addObject("msg", msg);
			return mav;
		}
		HttpSession session = request.getSession();

		String user_id = (String) session.getAttribute("user_id");
		String user_ncnm = (String) session.getAttribute("user_ncnm");
		String user_nm = (String) session.getAttribute("user_nm");
		int findusercheckresult = MemberDao.findusercheck(user_id);
		if(findusercheckresult!=0) {
			
		int result = MessageDao.writesendmsg(MessageDto);
		msg=result>0?"성공":"실패";
		
		}else {
		msg="아이디를 찾을수 없습니다.";
		
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("msg/listSendMsg");
		mav.addObject("msg", msg);
		return mav;
		
	}
	
	@RequestMapping("writesendmsgreception.pi")
	public ModelAndView writesendmsgreception(MessageDTO MessageDto,String cn,String rcver_id,HttpServletRequest request) {
		String msg="";
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		if(cn==null || cn.equals("")) {
			msg="내용을 입력해주세요";
			ModelAndView mav = new ModelAndView();
			mav.setViewName("msg/msgMsg");
			mav.addObject("msg", msg);
			return mav;
		}
		

		int findusercheckresult = MemberDao.findusercheck(rcver_id);
		
		if(findusercheckresult!=0) {
			MessageDto.setSender_id(user_id);
			MessageDto.setCn(cn);
			
			
		int result = MessageDao.writesendmsg(MessageDto);
		msg=result>0?"성공":"실패";
		
		}else {
		msg="아이디를 찾을수 없습니다.";
		
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("msg/msgMsg");
		mav.addObject("msg", msg);
		return mav;
		
	}
	@RequestMapping("deletemsg.pi")
	public ModelAndView deleteMsg(int msg_no) {
		String msg="";
		int result = MessageDao.deletemsg(msg_no);
		msg=result>0?"성공":"실패";
		ModelAndView mav = new  ModelAndView();
		mav.setViewName("msg/msgMsg");
		mav.addObject("msg", msg);
		return mav;
		
	}
	@RequestMapping("selectdeletemsg.pi")
	public ModelAndView selectdeletemsg(String selectmsg) {
		String msg="";
		int result=0;
		String selectmsg1[] = selectmsg.split("\\ ");
		for(int i=0;i<selectmsg1.length;i++) 
		{
			String msgno_1= selectmsg1[i];
			int msgno = Integer.parseInt(msgno_1);
			result = MessageDao.deletemsg(msgno);
			result++;
			
		}
		msg=result>0?"성공":"실패";
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("msg/msgMsg");
		mav.addObject("msg",msg);
		return mav;
		
	}
	
	//여기부터 마이페이지
	@RequestMapping("mypagereceptionlist.pi")
	public ModelAndView mypagereceptionlist(HttpServletRequest request) {
		HttpSession session = request.getSession();

		String user_id = (String) session.getAttribute("user_id");

		List<MessageDTO> list = MessageDao.getListReceptionMsg(user_id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("msg/mypagereceptionmsg");
		mav.addObject("list",list);
		return mav;
		
		
	}
	@RequestMapping("mypagesendlist.pi")
	public ModelAndView mypagesendlist(HttpServletRequest request) {
		HttpSession session = request.getSession();

		String user_id = (String) session.getAttribute("user_id");

		List<MessageDTO> list = MessageDao.getListsendMsg(user_id);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("msg/mypagelistsendmsg");
		mav.addObject("list", list);
		return mav;
		
	}
	@RequestMapping("mypagesendmsg.pi")
	public ModelAndView mypagesendmsg() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("msg/mypagesendmsg");
		return mav;
		
	}
	
	/* 게시글 메세지 보내기*/
	@RequestMapping(value = "/goodsmsg.pi",method = RequestMethod.POST)
	public ModelAndView goodsmsg(MessageDTO MessageDto) {
		ModelAndView mav = new ModelAndView();
		int result=MessageDao.addmsg(MessageDto);
		String msg=result>0?"메세지전송성공!":"메세지전송실패";
		String gopage="goods.pi";
		mav.setViewName("goods/goodsMsg");
		mav.addObject("msg", msg);
		mav.addObject("gopage", gopage);
		return mav;
	}
	@RequestMapping(value = "/campinfomsg.pi",method = RequestMethod.POST)
	public ModelAndView campinfomsg(MessageDTO MessageDto) {
		ModelAndView mav = new ModelAndView();
		int result=MessageDao.addmsg(MessageDto);
		String msg=result>0?"메세지전송성공!":"메세지전송실패";
		String gopage="listCampInfo.pi";
		mav.setViewName("goods/goodsMsg");
		mav.addObject("msg", msg);
		mav.addObject("gopage", gopage);
		return mav;
	}
	@RequestMapping(value = "/camptalkmsg.pi",method = RequestMethod.POST)
	public ModelAndView camptalkmsg(MessageDTO MessageDto) {
		ModelAndView mav = new ModelAndView();
		int result=MessageDao.addmsg(MessageDto);
		String msg=result>0?"메세지전송성공!":"메세지전송실패";
		String gopage="camptalk.pi";
		mav.setViewName("goods/goodsMsg");
		mav.addObject("msg", msg);
		mav.addObject("gopage", gopage);
		return mav;
	}
	
	@RequestMapping(value = "/bbsmsg.pi",method = RequestMethod.POST)
	public ModelAndView bbsmsg(MessageDTO MessageDto) {
		ModelAndView mav = new ModelAndView();
		int result=MessageDao.addmsg(MessageDto);
		String msg=result>0?"메세지전송성공!":"메세지전송실패";
		String gopage="bbs.pi";
		mav.setViewName("goods/goodsMsg");
		mav.addObject("msg", msg);
		mav.addObject("gopage", gopage);
		return mav;
	}
	
}
