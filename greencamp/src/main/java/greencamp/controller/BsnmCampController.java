package greencamp.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import greencamp.camp.model.CampDAO;
import greencamp.camp.model.CampDTO;



@Controller
public class BsnmCampController {
	@Autowired
	private CampDAO CampDao;
	
	@RequestMapping("/listCampBsnm.pi")
	public ModelAndView getListCampBsnm() {
		String id ="lws5760";
		List list = CampDao.bsnmcampList(id);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/bsnmcamp/listCampBsnm");
		mav.addObject("list", list);
		return mav;
}
	@RequestMapping("/registCampBsnm.pi")
	public ModelAndView addRegistCampBsnm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/bsnmcamp/registCampBsnm");
		return mav;
		
	}
	@RequestMapping("updateCampBsnm.pi")
	public ModelAndView updateCampBsnm() {
		String id="lws5760";
		
		List<CampDTO> list = CampDao.campupdateinfo(id);
		String cvntl[] = list.get(0).getCvntl().split("\\+");
		String camp_type[] = list.get(0).getCamp_type().split("\\+");
		String sffc[] = list.get(0).getSffc().split("\\+");
		String camp_ground[] = list.get(0).getCamp_ground().split("\\+");
		String camp_theme[] = list.get(0).getCamp_theme().split("\\+");
		String camp_surround[] = list.get(0).getCamp_surround().split("\\+");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/bsnmcamp/updateCampBsnm");
	
		mav.addObject("cvntl", cvntl);
		mav.addObject("list", list);
		mav.addObject("camp_type", camp_type);
		mav.addObject("sffc", sffc);
		mav.addObject("camp_ground", camp_ground);
		mav.addObject("camp_theme", camp_theme);
		mav.addObject("camp_surround", camp_surround);
		return mav;
		
	}
	@RequestMapping("addregistCampBsnm.pi")
	public ModelAndView registCampBsnm(CampDTO CampDto,String camp_nm,
			String addr,String camp_telno,String bizrno,
			String camp_type,String camp_surround,String camp_theme,
			String camp_ground,String sffc,String cvntl,String checkin,String checkout) {
		
		String msg="";
		if(camp_nm.equals("")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/bsnmcamp/campMsg");
			msg="ķ�����̸��� �Է����ּ���.";
			mav.addObject("msg", msg);
			return mav;
		}
		if(addr.equals("")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/bsnmcamp/campMsg");
			msg="ķ�����ּ��� �Է����ּ���.";
			mav.addObject("msg", msg);
			return mav;
		}
		if(camp_telno.equals("")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/bsnmcamp/campMsg");
			msg="ķ������ȭ��ȣ�� �Է����ּ���.";
			mav.addObject("msg", msg);
			return mav;
		}
		if(bizrno.equals("")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/bsnmcamp/campMsg");
			msg="����ڹ�ȣ�� �Է����ּ���.";
			mav.addObject("msg", msg);
			return mav;
		}
		if(checkin=="" || checkin.equals("")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/bsnmcamp/campMsg");
			msg="üũ���� �������ּ���.";
			mav.addObject("msg", msg);
			return mav;
		}
		if(checkout=="" || checkout.equals("")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/bsnmcamp/campMsg");
			msg="üũ�ƿ��� �������ּ���.";
			mav.addObject("msg", msg);
			return mav;
		}
		if(camp_type=="" || camp_type.equals("")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/bsnmcamp/campMsg");
			msg="ķ�������� üũ���ּ���.";
			mav.addObject("msg", msg);
			return mav;
		}
		if(camp_surround=="" || camp_surround.equals("")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/bsnmcamp/campMsg");
			msg="�ڿ�ȯ���� üũ���ּ���.";
			mav.addObject("msg", msg);
			return mav;
		}
		if(camp_theme=="" || camp_theme.equals("")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/bsnmcamp/campMsg");
			msg="ķ���׸��� üũ���ּ���.";
			mav.addObject("msg", msg);
			return mav;
		}
		if(camp_ground=="" || camp_ground.equals("")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/bsnmcamp/campMsg");
			msg="�ٴ������� üũ���ּ���.";
			mav.addObject("msg", msg);
			return mav;
		}
		if(sffc=="" || sffc.equals("")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/bsnmcamp/campMsg");
			msg="�����ü��� üũ���ּ���.";
			mav.addObject("msg", msg);
			return mav;
		}
		if(cvntl=="" || cvntl.equals("")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/bsnmcamp/campMsg");
			msg="���ǽü��� üũ���ּ���.";
			mav.addObject("msg", msg);
			return mav;
		}


		
		CampDto.setCamp_type(camp_type.replaceAll(" ","+").substring(0,camp_type.length()-1));
		CampDto.setCamp_surround(camp_surround.replaceAll(" ","+").substring(0,camp_surround.length()-1));
		CampDto.setCamp_theme(camp_theme.replaceAll(" ","+").substring(0,camp_theme.length()-1));
		CampDto.setCamp_ground(camp_ground.replaceAll(" ","+").substring(0,camp_ground.length()-1));
		CampDto.setSffc(sffc.replaceAll(" ","+").substring(0,sffc.length()-1));
		CampDto.setCvntl(cvntl.replaceAll(" ","+").substring(0,cvntl.length()-1));
		
		
		
		
		int result = CampDao.addRegistCampBsnm(CampDto);
		if(result>0) {
			msg="��ϼ���";
			
		}else {
			msg="��Ͻ���";
			
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/bsnmcamp/campMsg");
		mav.addObject("msg", msg);
		
		return mav;
	}
	
	
	@RequestMapping("registupdateCampBsnm.pi")
	public ModelAndView registupdateCampBsnm(CampDTO CampDto,String camp_nm,
			String addr,String camp_telno,String bizrno,
			String camp_type,String camp_surround,String camp_theme,
			String camp_ground,String sffc,String cvntl,String checkin,String checkout) {
		String msg="";
		String gourl="";
		if(camp_nm.equals("")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/bsnmcamp/campMsg");
			msg="ķ�����̸��� �Է����ּ���.";
			mav.addObject("msg", msg);
			return mav;
		}
		if(addr.equals("")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/bsnmcamp/campMsg");
			msg="ķ�����ּ��� �Է����ּ���.";
			mav.addObject("msg", msg);
			return mav;
		}
		if(camp_telno.equals("")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/bsnmcamp/campMsg");
			msg="ķ������ȭ��ȣ�� �Է����ּ���.";
			mav.addObject("msg", msg);
			return mav;
		}
		if(bizrno.equals("")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/bsnmcamp/campMsg");
			msg="����ڹ�ȣ�� �Է����ּ���.";
			mav.addObject("msg", msg);
			return mav;
		}
		if(checkin=="" || checkin.equals("")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/bsnmcamp/campMsg");
			msg="üũ���� �������ּ���.";
			mav.addObject("msg", msg);
			return mav;
		}
		if(checkout=="" || checkout.equals("")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/bsnmcamp/campMsg");
			msg="üũ�ƿ��� �������ּ���.";
			mav.addObject("msg", msg);
			return mav;
		}
		if(camp_type=="" || camp_type.equals("")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/bsnmcamp/campMsg");
			msg="ķ�������� üũ���ּ���.";
			mav.addObject("msg", msg);
			return mav;
		}
		if(camp_surround=="" || camp_surround.equals("")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/bsnmcamp/campMsg");
			msg="�ڿ�ȯ���� üũ���ּ���.";
			mav.addObject("msg", msg);
			return mav;
		}
		if(camp_theme=="" || camp_theme.equals("")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/bsnmcamp/campMsg");
			msg="ķ���׸��� üũ���ּ���.";
			mav.addObject("msg", msg);
			return mav;
		}
		if(camp_ground=="" || camp_ground.equals("")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/bsnmcamp/campMsg");
			msg="�ٴ������� üũ���ּ���.";
			mav.addObject("msg", msg);
			return mav;
		}
		if(sffc=="" || sffc.equals("")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/bsnmcamp/campMsg");
			msg="�����ü��� üũ���ּ���.";
			mav.addObject("msg", msg);
			return mav;
		}
		if(cvntl=="" || cvntl.equals("")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bsnm/bsnmcamp/campMsg");
			msg="���ǽü��� üũ���ּ���.";
			mav.addObject("msg", msg);
			return mav;
		}
		
		CampDto.setCamp_type(camp_type.replaceAll(" ","+").substring(0, camp_type.length()-1));
		CampDto.setCamp_surround(camp_surround.replaceAll(" ","+").substring(0, camp_surround.length()-1));
		CampDto.setCamp_theme(camp_theme.replaceAll(" ","+").substring(0, camp_theme.length()-1));
		CampDto.setCamp_ground(camp_ground.replaceAll(" ","+").substring(0, camp_ground.length()-1));
		CampDto.setSffc(sffc.replaceAll(" ","+").substring(0, sffc.length()-1));
		CampDto.setCvntl(cvntl.replaceAll(" ","+").substring(0, cvntl.length()-1));
		CampDto.setId("lws5760");
		
	
														
		int result = CampDao.updateInsertBsnm(CampDto);
		msg=result>0?"����":"����";
		gourl="listCampBsnm.pi";
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/bsnmcamp/campMsg");
		mav.addObject("msg", msg);
		mav.addObject("gourl", gourl);
		
		return mav;
		
	}
	
	@RequestMapping("deletecampBsnm.pi")
	public ModelAndView deletecampBsnm(int camp_no) {
		String msg="";
		
		int result = CampDao.deletecampBsnm(camp_no);
		msg=result>0?"����":"����";
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/bsnmcamp/campMsg");
		mav.addObject("msg",msg);
		return mav;
		
	}
	
	@RequestMapping("detailcampinfobsnm.pi")
	public ModelAndView detailcampinfo() {
		String id="lws5760";
		
		
		List<CampDTO> list = CampDao.campupdateinfo(id);
		String cvntl[] = list.get(0).getCvntl().split("\\+");
		String camp_type[] = list.get(0).getCamp_type().split("\\+");
		String sffc[] = list.get(0).getSffc().split("\\+");
		String camp_ground[] = list.get(0).getCamp_ground().split("\\+");
		String camp_theme[] = list.get(0).getCamp_theme().split("\\+");
		String camp_surround[] = list.get(0).getCamp_surround().split("\\+");
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bsnm/bsnmcamp/campinfobsnm");
		
		mav.addObject("cvntl", cvntl);
		mav.addObject("list", list);
		mav.addObject("camp_type", camp_type);
		mav.addObject("sffc", sffc);
		mav.addObject("camp_ground", camp_ground);
		mav.addObject("camp_theme", camp_theme);
		mav.addObject("camp_surround", camp_surround);
		return mav;
		
	}
}
