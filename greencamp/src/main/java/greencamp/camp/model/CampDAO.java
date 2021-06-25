package greencamp.camp.model;

import java.util.List;

public interface CampDAO
{
	public List<CampVO> getCampList(CampVO campVO);
	public List<CampVO> getAllCampList(CampVO campVO);
	public String getCampNm(int camp_no);
	public List<SiteVO> getSiteList(SiteVO siteVO);
	public int getCampListCnt(String camp_nm);
	public int getAllCampListCnt();
	public List<CampVO> getCampDetail(int camp_no);
	public String getCampDc();
	public int completeOrderCamp(SiteVO siteVO);
	public List<SiteVO> getCampSitePc(int camp_no);
	public List<SiteVO> searchTheme(SiteVO siteVO);
	public int searchThemeCount(SiteVO siteVO);
}
