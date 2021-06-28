package greencamp.camp.model;

import java.util.List;

public interface CampDAO
{
	public List<SiteVO> getCampList(SiteVO siteVO);
	public List<SiteVO> getAllCampList(SiteVO siteVO);
	public String getCampNm(int camp_no);
	public List<SiteVO> getSiteList(SiteVO siteVO);
	public int getCampListCnt(String camp_nm);
	public int getAllCampListCnt();
	public List<SiteVO> getCampDetail(int camp_no);
	public String getCampDc();
	public int completeOrderCamp(SiteVO siteVO);
	public List<SiteVO> getCampSitePc(int camp_no);
	public List<SiteVO> searchTheme(SiteVO siteVO);
	public int searchThemeCount(SiteVO siteVO);
	public List<CampDTO> bsnmcampList(String id);
	public int addRegistCampBsnm(CampDTO CampDto);
	public List<CampDTO> campupdateinfo(String id);
	public int updateInsertBsnm(CampDTO CampDto);
	public int deletecampBsnm(int camp_no);
	public int writeReviewCamp(SiteVO siteVO);
	public List<SiteVO> getReviewCamp(int camp_no);
	public int deleteReviewCamp(SiteVO siteVO);
}
