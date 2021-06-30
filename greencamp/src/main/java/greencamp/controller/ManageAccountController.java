package greencamp.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import greencamp.member.model.MemberDAO;
import greencamp.member.model.MemberDTO;

@Controller
public class ManageAccountController {
	
	@Autowired
	private MemberDAO memberDao;
	
	/*사용자 목록*/
	@RequestMapping("/manageAccount.pi")
	public ModelAndView listMember(@RequestParam(value="cp", defaultValue="1")int cp, MemberDTO dto) {
		int totalCnt_mb=memberDao.memberTotalCnt();
		int totalCnt_bm=memberDao.buisnessmanTotalCnt();
		int totalCnt_bl=memberDao.blackListTotalCnt();
		
		int listSize=3;
		int pageSize=5;

		String pageStr_mb=greencamp.page.PageModule.makePage("listMember.pi", totalCnt_mb, listSize, pageSize, cp);
		String pageStr_bm=greencamp.page.PageModule.makePage("listBuisnessman.pi", totalCnt_bm, listSize, pageSize, cp);
		String pageStr_bl=greencamp.page.PageModule.makePage("listBlackList.pi", totalCnt_bl, listSize, pageSize, cp);
		
		List<MemberDTO> list_mb=memberDao.listMember(cp, listSize);
		List<MemberDTO> list_bm=memberDao.listBuisnessman(cp, listSize);
		List<MemberDTO> list_bl=memberDao.listBlackList(cp, listSize);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("pageStr", pageStr_mb);
		mav.addObject("list_mb", list_mb);
		mav.addObject("total_mb", totalCnt_mb);
		mav.addObject("pageStr", pageStr_bm);
		mav.addObject("list_bm", list_bm);
		mav.addObject("total_bm", totalCnt_bm);
		mav.addObject("pageStr", pageStr_bl);
		mav.addObject("list_bl", list_bl);
		mav.addObject("total_bl", totalCnt_bl);
		mav.setViewName("mngrmanageaccount/manageAccount");
		return mav;
	}
	
	@RequestMapping("/modiBlackList.pi")
	public ModelAndView modiBlackList(MemberDTO dto) {
		int result=memberDao.modiBlackList(dto);
		
		String msg=result>0?"블랙리스트 등록 성공하셨습니다.":"블랙리스트 등록 실패하셨습니다.";
		String gopage="manageAccount.pi";
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("gopage", gopage);
		mav.addObject("msg", msg);
		mav.setViewName("mngrmanageaccount/maMsg");
		return mav;
	}
	
	/*로그인*/
	@RequestMapping(value="/mngrlogin.pi", method=RequestMethod.POST)
	public ModelAndView mngrlogin(MemberDTO dto) {
		int result = memberDao.mngrloginsubmit(dto);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("mngrcomment/listCampTalkComment");
		return mav;
	}
	
	/*로그아웃*/
	@RequestMapping("mngrlogout.pi")
	public ModelAndView mngrlogout() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("mngrIndex");
		return mav;
		
	}
	
}