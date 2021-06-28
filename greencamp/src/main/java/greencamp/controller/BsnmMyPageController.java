package greencamp.controller;

import java.util.List;

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
	public ModelAndView getListMemberBsnm() {
		String id="lws5760";
		List list = MemberDao.getListMemberBsnm(id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/memberBsnm/listMemberBsnm");
		mav.addObject("list",list);
		return mav;
	}
	@RequestMapping("updateMemberBsnm.pi")
	public ModelAndView updateMemberBsnm() {
		String id="lws5760";
		List list = MemberDao.getListMemberBsnm(id);
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

}
