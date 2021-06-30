package greencamp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import greencamp.member.model.MemberDAO;
import greencamp.member.model.MemberDTO;
import greencamp.resve.model.ResveDAO;
import greencamp.resve.model.ResveDTO;

@Controller
public class MemberController {
	@Autowired
	MemberDAO MemberDao;
	@Autowired
	private ResveDAO ResveDao;

	
	@RequestMapping("joinSelect.pi")
	public ModelAndView joinForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/joinSelect");
		return mav;
	}
	@RequestMapping("joinUser.pi")
	public ModelAndView joinUser() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/joinUser");
		return mav;
	}
	@RequestMapping("joinBsnm.pi")
	public ModelAndView joinBsnm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/joinBsnm");
		return mav;
	}
	
	@RequestMapping("joinBsnmComplete.pi")
	public ModelAndView insertjoinBsnmmember(MemberDTO MemberDto) {
		String msg = "";
		int result = MemberDao.joinBsnm(MemberDto);
		msg=result>0?"성공":"실패";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "login.pi");
		mav.setViewName("member/memberMsg");
		return mav;
	}
	
	@RequestMapping("joinUserComplete.pi")
	public ModelAndView insertjoinUsermember(MemberDTO MemberDto) {
		String msg = "";
		int result = MemberDao.joinUser(MemberDto);
		msg=result>0?"성공":"실패";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "login.pi");
		
		mav.setViewName("member/memberMsg");
		return mav;
	}
	
	@RequestMapping("login.pi")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login");
		return mav;
		
	}
	@RequestMapping("idCheck.pi")
	public ModelAndView idCheck(String id) {
		ModelAndView mav = new ModelAndView();
        int result = MemberDao.empIdCheck(id);

        Boolean check = (id==null);

        if(result>0)
        {
            mav.addObject("msg", "사용불가");
        }
        else
        {
            if(check)
            {
                mav.addObject("msg", "");
            }
            else
            {
                mav.addObject("msg", "사용가능");
            }
        }
        mav.setViewName("member/msg");
        return mav;
    }
	
	@RequestMapping("loginsubmit.pi")
	public ModelAndView loginsubmit(MemberDTO MemberDto,HttpServletRequest request) {
		String msg="";
		String url="";
		HttpSession session = request.getSession();

		int result = MemberDao.login(MemberDto);
		msg=result>0?"로그인성공":"로그인실패";
		if(result>0) {
			int grade = MemberDao.checkusergrade(MemberDto.getId());
			List<MemberDTO> list = MemberDao.getListMember(MemberDto.getId());
			
			session.setAttribute("grade", list.get(0).getGrade());
			session.setAttribute("user_nm", list.get(0).getNm());
			session.setAttribute("user_ncnm", list.get(0).getNcnm());
			session.setAttribute("user_id", MemberDto.getId());
			if(grade==3) {			
				url="index.pi";

			}else if(grade==2) {
				url="index2.pi";
				
			}
			else if(grade == 1)
			{
				url="mngrIndex.pi";
			}
		}
		
		
		String user_id = (String) session.getAttribute("user_id");
		String user_ncnm = (String) session.getAttribute("user_ncnm");
		String user_nm = (String) session.getAttribute("user_nm");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberMsg");
		mav.addObject("msg", msg);
		mav.addObject("url",url );
		return mav;

	}
	
	@RequestMapping("logout.pi")
	public String logout(HttpServletRequest request) {
		
		  HttpSession session = request.getSession();
	      session.invalidate();
	        	return "member/login";
	}	
	
	@RequestMapping("mypage.pi")
	public ModelAndView mypage(HttpServletRequest request) {
		HttpSession session = request.getSession();

		String user_id = (String) session.getAttribute("user_id");
		List<MemberDTO> list = MemberDao.getListMember(user_id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/mypage");
		mav.addObject("list", list);
		return mav;
		
	}
	
	@RequestMapping("mypageshowmemberinfo.pi")
	public ModelAndView mypageshowmemberinfo(HttpServletRequest request) {
		HttpSession session = request.getSession();

		String user_id = (String) session.getAttribute("user_id");
		List<MemberDTO> list = MemberDao.getListMember(user_id);
		List<ResveDTO> list1 = ResveDao.getlistresve(user_id);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/mypage");
		mav.addObject("list", list);
		mav.addObject("list1", list1);
		
		return mav;
		
	}	
	@RequestMapping("mypagememberinfoupdate.pi")
	public ModelAndView mypagememberinfoupdate(HttpServletRequest request) {
		HttpSession session = request.getSession();

		String user_id = (String) session.getAttribute("user_id");
		List<MemberDTO> list = MemberDao.getListMember(user_id);
		List<ResveDTO> list1 = ResveDao.getlistresve(user_id);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/mypagememberinfoupdate");
		mav.addObject("list", list);
		mav.addObject("list1", list1);
		
		return mav;
		
	}	
	@RequestMapping("mypageoutmember.pi")
	public ModelAndView mypageoutmember() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/mypageoutmember");
		return mav;
		
	}
	@RequestMapping("updatememberinfo.pi")
	public ModelAndView  updatebsnmmemberinfo(MemberDTO MemberDto,
			String nm,String email,String ncnm,String telno){
		String msg="";
		if(nm.equals("")|| email.equals("") || ncnm.equals("") || telno.equals("")) {
			msg="빈 칸을 입력해주세요.";
			ModelAndView mav = new ModelAndView();
			mav.setViewName("member/msg");
			mav.addObject("msg", msg);
			return mav;
		}
		int result = MemberDao.updateMemberBsnm(MemberDto);
		msg = result>0?"수정성공":"수정실패";
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/msg");
		mav.addObject("msg", msg);
		return mav;
	}
	
	@RequestMapping("memberout.pi")
	public ModelAndView memberout(HttpServletRequest request,MemberDTO MemberDto,String id,String password) {
		String msg="";
		if(id.equals("") || password.equals("")) {
			msg="빈 칸을 확인해주세요";
			ModelAndView mav = new ModelAndView();
			mav.setViewName("member/msg");
			mav.addObject("msg", msg);
			return mav;
		}
		
		int result = MemberDao.memberout(MemberDto);
		msg = result>0?"회원탈퇴성공":"회원탈퇴실패";
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/msg");
		mav.addObject("msg", msg);
		HttpSession session = request.getSession();
	      session.invalidate();
		return mav;
	}


}
