package greencamp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import greencamp.member.model.MemberDAO;
import greencamp.member.model.MemberDTO;

@Controller
public class BsnmMyPageController {
	
	@Autowired
	private MemberDAO MemberDao;
	
	@RequestMapping("listMemberBsnm.pi")
	public ModelAndView getListMemberBsnm(HttpServletRequest request) {
		
		HttpSession session = request.getSession();

		String user_id = (String) session.getAttribute("user_id");
		String user_ncnm = (String) session.getAttribute("user_ncnm");
		String user_nm = (String) session.getAttribute("user_nm");
	
		List list = MemberDao.getListMember(user_id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/memberBsnm/listMemberBsnm");
		mav.addObject("list",list);
		return mav;
	}
	@RequestMapping("updateMemberBsnm.pi")
	public ModelAndView updateMemberBsnm(HttpServletRequest request) {
		
		HttpSession session = request.getSession();

		String user_id = (String) session.getAttribute("user_id");
		String user_ncnm = (String) session.getAttribute("user_ncnm");
		String user_nm = (String) session.getAttribute("user_nm");
		
		List list = MemberDao.getListMember(user_id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/memberBsnm/updateMemberBsnm");
		mav.addObject("list",list);
		return mav;
	}
	
	@RequestMapping("updatebsnmmemberinfo.pi")
	public ModelAndView  updatebsnmmemberinfo(MemberDTO MemberDto,
			String nm,String email,String ncnm,String telno,String bizrno){
		String msg="";
		if(nm.equals("")|| email.equals("") || ncnm.equals("") || telno.equals("") || bizrno.equals("")) {
			msg="빈 칸을 입력해주세요.";
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/memberBsnm/memberMsg");
			mav.addObject("msg", msg);
			return mav;
		}
		int result = MemberDao.updateMemberBsnm(MemberDto);
		msg = result>0?"수정성공":"수정실패";
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/memberBsnm/memberMsg");
		mav.addObject("msg", msg);
		return mav;
	}
	@RequestMapping("bsnmmypageoutmember.pi")
	public ModelAndView bsnmmypageoutmember() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/memberBsnm/bsnmmemberout");
		
		return mav;
		
	}
	
	@RequestMapping("bsnmmemberout.pi")
	public ModelAndView bsnmmemberout(HttpServletRequest request,MemberDTO MemberDto,String id,String password) {
		String msg="";
		if(id.equals("") || password.equals("")) {
			msg="빈 칸을 확인해주세요";
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/memberBsnm/memberMsg");
			mav.addObject("msg", msg);
			return mav;
		}
		int result = MemberDao.memberout(MemberDto);
		msg = result>0?"회원탈퇴성공":"회원탈퇴실패";
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/memberBsnm/memberMsg");
		mav.addObject("msg", msg);
		HttpSession session = request.getSession();
	      session.invalidate();
	        	
		return mav;
		
	}

}
