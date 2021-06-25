package greencamp.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import greencamp.camp.model.*;

@Controller
public class CampController {
	@Autowired
	private CampDAO campDAO;
	private CampVO campVO;
	private SiteVO siteVO;

	@RequestMapping("/searchTheme.pi")
	public ModelAndView searchTheme(HttpServletRequest req,
			@RequestParam(value = "facilities", required = false, defaultValue = "") String fac,
			@RequestParam(value = "camp_nm", required = false, defaultValue = "all") String camp_nm,
			@RequestParam(value = "nature", required = false, defaultValue = "") String nat, CampVO campVO,
			SiteVO siteVO) {
			camp_nm = "테마검색";
			siteVO.setCamp_nm(camp_nm);
		int listCnt = 0;
		String cp_s = req.getParameter("cp");
		if (cp_s == null || cp_s.equals("")) {
			cp_s = "1";
		}

		int cp = Integer.parseInt(cp_s);
		int pagingSize = 10;
		int pageSize = 10;
		siteVO.setCp(cp);
		siteVO.setLs(pageSize);
		String pageFac = fac; 
		String pageNat = nat; 
		ModelAndView mav = new ModelAndView();
		String facilities[];
		String nature[];
		String query = "";
		String pageStr = null;
		fac = fac.replaceAll("\\]\\[", "+").replaceAll("\\[", "").replaceAll("\\]", "");
		facilities = fac.split("\\+");
		for (int i = 0; i < facilities.length; i++) {
			if (i < facilities.length - 1) {
				query += "cvntl LIKE \'%" + facilities[i] + "%\' AND ";
			} else {
				query += "cvntl LIKE \'%" + facilities[i] + "%\'";

			}

		}
		nat = nat.replaceAll("\\]\\[", "+").replaceAll("\\[", "").replaceAll("\\]", "");
		nature = nat.split("\\+");
		query += " AND ";
		for (int i = 0; i < nature.length; i++) {
			if (i < nature.length - 1) {
				query += "camp_surround LIKE \'%" + nature[i] + "%\' AND ";
			} else {
				query += "camp_surround LIKE \'%" + nature[i] + "%\'";

			}

		}
		List<SiteVO> themeList;
		siteVO.setQuery(query);
		listCnt = campDAO.searchThemeCount(siteVO);
		
		themeList = campDAO.searchTheme(siteVO);
		pageStr = greencamp.page.Pagination.makeThemePage("searchTheme.pi", listCnt, pagingSize, pageSize, cp, pageNat,pageFac);
		if(themeList.size()<1)
		{
			String msg = "검색결과가 없습니다.";
			String url = "index.pi";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("searchMsg");
			return mav;
		}
		mav.addObject("camp_nm", camp_nm);
		mav.addObject("list", themeList);
		mav.addObject("pageStr", pageStr);
		mav.addObject("lat", themeList.get(0).getLat());
		mav.addObject("lon", themeList.get(0).getLongti());
		mav.setViewName("searchCamp");
		return mav;

	}

	@RequestMapping("/searchCamp.pi")
	public ModelAndView searchCamp(HttpServletRequest req,
			@RequestParam(value = "camp_nm", required = false, defaultValue = "all") String camp_nm, CampVO campVO, SiteVO siteVO) {
		campVO.setCamp_nm(camp_nm);

		int listCnt = 0;

		String cp_s = req.getParameter("cp");
		if (cp_s == null || cp_s.equals("")) {
			cp_s = "1";
		}

		int cp = Integer.parseInt(cp_s);
		int pagingSize = 10;
		int pageSize = 10;
		campVO.setCp(cp);
		campVO.setLs(pageSize);

		ModelAndView mav = new ModelAndView();
		List<CampVO> list = null;
		String pageStr = null;

		if (camp_nm.equals("all")) {
			list = campDAO.getAllCampList(campVO);
			listCnt = campDAO.getAllCampListCnt();
		} else {
			list = campDAO.getCampList(campVO);
			listCnt = campDAO.getCampListCnt(camp_nm);
		}
		pageStr = greencamp.page.Pagination.makePage("searchCamp.pi", listCnt, pagingSize, pageSize, cp, camp_nm);

		if (camp_nm.equals("all")) {
			camp_nm = "전체검색";
		}
		if(list.size()<1)
		{
			String msg = "검색결과가 없습니다.\\n검색어를 확인해주세요.";
			String url = "index.pi";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("searchMsg");
			return mav;
		}
		mav.addObject("camp_nm", camp_nm);
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		mav.addObject("lat", list.get(0).getLat());
		mav.addObject("lon", list.get(0).getLongti());
		mav.setViewName("searchCamp");
		return mav;
	}

	@RequestMapping("/getSiteList.pi")
	public ModelAndView getSiteList(int camp_no, SiteVO siteVO, String startDe, String endDe) throws ParseException {
		ModelAndView mav = new ModelAndView();
		String camp_name = campDAO.getCampNm(camp_no);

		mav.addObject("camp_no", camp_no);
		mav.addObject("camp_name", camp_name);
		startDe = startDe.replaceAll("-", "");
		endDe = endDe.replaceAll("-", "");
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		Date d1 = df.parse(startDe);
		Date d2 = df.parse(endDe);
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();

		c1.setTime(d1);
		c2.setTime(d2);
		SimpleDateFormat tttt = new SimpleDateFormat("yyyy/MM/dd");
		String bgnde = tttt.format(c1.getTime());
		String values = "";
		values += "\'" + bgnde + "\'";
		c1.add(Calendar.DATE, 1);
		while (c1.compareTo(c2) != 1) {
			bgnde = tttt.format(c1.getTime());
			values += "," + "\'" + bgnde + "\'";
			c1.add(Calendar.DATE, 1);
		}
		siteVO.setValues(values);
		List<SiteVO> siteList = campDAO.getSiteList(siteVO);
		mav.addObject("siteList", siteList);
		mav.setViewName("siteList");
		return mav;

	}

	@RequestMapping("/resveCamp.pi")
	public ModelAndView resveCamp(int camp_no, SiteVO siteVO) {
		ModelAndView mav = new ModelAndView();
		String camp_name = campDAO.getCampNm(camp_no);

		mav.addObject("camp_no", camp_no);
		mav.addObject("camp_name", camp_name);
		mav.setViewName("resveCamp");
		return mav;
	}

	@RequestMapping("/detailCamp.pi")
	public ModelAndView detailCamp(int camp_no) {
		ModelAndView mav = new ModelAndView();
		List<CampVO> siteList = campDAO.getCampDetail(camp_no);

		List<SiteVO> sitepc = campDAO.getCampSitePc(camp_no);
		mav.addObject("lat", siteList.get(0).getLat());
		mav.addObject("lon", siteList.get(0).getLongti());
		mav.addObject("camp_nm", siteList.get(0).getCamp_nm());
		mav.addObject("sitepc", sitepc);
		mav.addObject("list", siteList);
		mav.setViewName("detailCamp");
		return mav;
	}

	@RequestMapping("/orderCamp.pi")
	public ModelAndView orderCamp(SiteVO siteVO, String siteno, String startDe, String camp_no) {
		ModelAndView mav = new ModelAndView();
		String camp_no_split[] = camp_no.split(",");
		String camp_dc = campDAO.getCampDc();
		if (startDe == null || startDe.equals("")) {
			String msg = "체크인 체크아웃 날짜를 선택해주세요.";
			String url = "resveCamp.pi";
			mav.addObject("url", url);
			mav.addObject("camp_no", camp_no_split[0]);
			mav.addObject("msg", msg);
			mav.setViewName("campMsg");
			return mav;
		}
		mav.addObject("camp_dc", camp_dc);

		mav.setViewName("orderCamp");
		return mav;
	}

	@RequestMapping("/completeOrderCamp.pi")
	public ModelAndView completeOrderCamp(SiteVO siteVO) throws ParseException {
		ModelAndView mav = new ModelAndView();
		String startDe = siteVO.getBgnde();
		String endDe = siteVO.getEndde();
		startDe = startDe.replaceAll("-", "");
		endDe = endDe.replaceAll("-", "");
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		Date d1 = df.parse(startDe);
		Date d2 = df.parse(endDe);

		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();

		c1.setTime(d1);
		c2.setTime(d2);
		SimpleDateFormat tttt = new SimpleDateFormat("yyyy-MM-dd");
		String bgnde = tttt.format(c1.getTime());
		String values = "";
		values += "select " + siteVO.getCamp_no() + "," + siteVO.getNmpr() + ",\'admin\',\'" + bgnde + "\',"
				+ siteVO.getTotalde() + ",\'" + siteVO.getSitenm() + "\'," + siteVO.getPc() + ",\'" + siteVO.getSttus()
				+ "\',\'" + siteVO.getRm() + "\' from dual ";
		c1.add(Calendar.DATE, 1);
		while (c1.compareTo(c2) != 1) {
			values += "union all ";
			tttt = new SimpleDateFormat("yyyy-MM-dd");
			bgnde = tttt.format(c1.getTime());
			values += "select " + siteVO.getCamp_no() + "," + siteVO.getNmpr() + ",\'admin\',\'" + bgnde + "\',"
					+ siteVO.getTotalde() + ",\'" + siteVO.getSitenm() + "\'," + siteVO.getPc() + ",\'"
					+ siteVO.getSttus() + "\',\'" + siteVO.getRm() + "\' from dual ";
			c1.add(Calendar.DATE, 1);
		}
		siteVO.setValues(values);
		int result = campDAO.completeOrderCamp(siteVO);
		if (result < 1) {
			String msg = "예약에 실패하셨습니다.<br>관리자에게 문의 바랍니다.";
			String url = "index.pi";
			mav.addObject("url", url);
			mav.addObject("msg", msg);
			mav.setViewName("campMsg");
			return mav;
		}
		mav.setViewName("completeOrderCamp");
		return mav;
	}
}
