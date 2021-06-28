package greencamp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import greencamp.member.model.MemberDAO;
import greencamp.message.model.MessageDAO;
import greencamp.message.model.MessageDTO;

@Controller
public class MessageController {

	@Autowired
	private MessageDAO MessageDao;
	@Autowired
	private MemberDAO MemberDao;
	
	
	@RequestMapping("listReceptionMsg.pi")
	public ModelAndView getListReceptionMsg(String id) {
		id="lws5760";
		List list = MessageDao.getListReceptionMsg(id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/msg/listReceptionMsg");
		mav.addObject("list",list);
		return mav;
		
	}
	
	
	

	@RequestMapping("listSendMsg.pi")
	public ModelAndView getListSendMsg() {
		String id="lws5760";
		
		List list = MessageDao.getListsendMsg(id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/msg/listSendMsg");
		mav.addObject("list", list);
		return mav;
		
	}
	
	
	@RequestMapping("sendMsg.pi")
	public ModelAndView sendMsg() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/msg/sendMsg");
		return mav;
		
	}
	
	@RequestMapping("writesendmsg.pi")
	public ModelAndView writesendmsg(MessageDTO MessageDto,String cn) {
		String msg="";
		String id= "lws5760";
		if(cn==null || cn.equals("") || id==null || id.equals("")) {
			msg="빈 칸을 확인해주세요";
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/msg/msgMsg");
			mav.addObject("msg", msg);
			return mav;
		}
		
		int findusercheckresult = MemberDao.findusercheck(id);
		System.out.print(findusercheckresult);
		if(findusercheckresult!=0) {
			
		int result = MessageDao.writesendmsg(MessageDto);
		msg=result>0?"성공":"실패";
		
		}else {
		msg="아이드를 찾을수 없습니다.";
		
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/msg/msgMsg");
		mav.addObject("msg", msg);
		return mav;
		
	}
	
	@RequestMapping("writesendmsglistsend.pi")
	public ModelAndView writesendmsglistsend(MessageDTO MessageDto,String cn) {
		String msg="";
		if(cn==null || cn.equals("")) {
			msg="내용을 입력해주세요";
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/msg/listSendMsg");
			mav.addObject("msg", msg);
			return mav;
		}
		String id= "lws5760";
		int findusercheckresult = MemberDao.findusercheck(id);
		System.out.print(findusercheckresult);
		if(findusercheckresult!=0) {
			
		int result = MessageDao.writesendmsg(MessageDto);
		msg=result>0?"성공":"실패";
		
		}else {
		msg="아이드를 찾을수 없습니다.";
		
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/msg/listSendMsg");
		mav.addObject("msg", msg);
		return mav;
		
	}
	
	@RequestMapping("writesendmsgreception.pi")
	public ModelAndView writesendmsgreception(MessageDTO MessageDto,String cn,String rcver_id) {
		String msg="";
		if(cn==null || cn.equals("")) {
			msg="내용을 입력해주세요";
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/msg/msgMsg");
			mav.addObject("msg", msg);
			return mav;
		}
		String id= "lws5760";
		int findusercheckresult = MemberDao.findusercheck(id);
		System.out.print(findusercheckresult);
		if(findusercheckresult!=0) {
			MessageDto.setCn(cn);
			
			MessageDto.setRcver_id(rcver_id);
		int result = MessageDao.writesendmsg(MessageDto);
		msg=result>0?"성공":"실패";
		
		}else {
		msg="아이드를 찾을수 없습니다.";
		
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/msg/msgMsg");
		mav.addObject("msg", msg);
		return mav;
		
	}
	@RequestMapping("deletemsg.pi")
	public ModelAndView deleteMsg(int msg_no) {
		String msg="";
		int result = MessageDao.deletemsg(msg_no);
		msg=result>0?"성공":"실패";
		ModelAndView mav = new  ModelAndView();
		mav.setViewName("bsnm/msg/msgMsg");
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
		mav.setViewName("bsnm/msg/msgMsg");
		mav.addObject("msg",msg);
		return mav;
		
	}
	
	
}
