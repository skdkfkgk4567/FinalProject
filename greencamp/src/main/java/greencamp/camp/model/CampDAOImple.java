package greencamp.camp.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class CampDAOImple implements CampDAO {

	private SqlSessionTemplate sqlMap;

	public CampDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<SiteVO> getAllCampList(SiteVO siteVO) {
		List<SiteVO> allList = sqlMap.selectList("getAllCampList", siteVO);
		return allList;
	}

	
	public List<SiteVO> getCampList(SiteVO siteVO) {
		List<SiteVO> allList = sqlMap.selectList("getCampList", siteVO);

		return allList;
	}

	
	public String getCampNm(int camp_no) {
		String camp_nm = sqlMap.selectOne("getCampNm", camp_no);
		return camp_nm;
	}

	
	public List<SiteVO> getSiteList(SiteVO siteVO) {
		List<SiteVO> allList = sqlMap.selectList("getSiteList", siteVO);
		return allList;
	}

	
	public int getCampListCnt(String camp_nm) {
		int listCnt = sqlMap.selectOne("getCampListCnt", camp_nm);
		return listCnt;
	}

	public int getAllCampListCnt() {
		int listCnt = sqlMap.selectOne("getAllCampListCnt");
		return listCnt;
	}

	
	public List<SiteVO> getCampDetail(int camp_no) {
		List<SiteVO> campDetail = sqlMap.selectList("getCampDetail", camp_no);
		return campDetail;
	}

	public String getCampDc() {
		String campDc = sqlMap.selectOne("getCampDc");
		return campDc;
	}

	
	public int completeOrderCamp(SiteVO siteVO) {
		int result = sqlMap.insert("completeOrderCamp", siteVO);
		return result;
	}

	
	public List<SiteVO> getCampSitePc(int camp_no) {
		List<SiteVO> campDetail = sqlMap.selectList("getCampSitePc", camp_no);
		return campDetail;
	}

	
	public List<SiteVO> searchTheme(SiteVO siteVO) {

		List<SiteVO> campDetail = sqlMap.selectList("searchTheme", siteVO);
		return campDetail;
	}

	
	public int searchThemeCount(SiteVO siteVO) {
		int listCnt = sqlMap.selectOne("searchThemeCount", siteVO);
		return listCnt;
	}
	
	public List<CampDTO> bsnmcampList(String id) {
		List<CampDTO> list = sqlMap.selectList("getListCampBsnmSQL", id);
		return list;
	}

	public int addRegistCampBsnm(CampDTO CampDto) {
		int count = sqlMap.insert("addRegistCampBsnmSQL", CampDto);
		return count;
	}

	
	public List<CampDTO> campupdateinfo(String id) {
		List<CampDTO> list = sqlMap.selectList("updateCampBsnmSQL", id);
		return list;
	}

	public int updateInsertBsnm(CampDTO CampDto) {
		int count = sqlMap.update("updateInsertBsnmSQL", CampDto);
		return count;
	}

	
	public int deletecampBsnm(int camp_no) {
		int count = sqlMap.delete("deletecampBsnmSQL", camp_no);
		return count;
	}

	
	public int writeReviewCamp(SiteVO siteVO) {
		int count = sqlMap.insert("writeReviewCamp", siteVO);
		return count;
	}

	
	public List<SiteVO> getReviewCamp(int camp_no) {
		List<SiteVO> list = sqlMap.selectList("getRewiewCamp", camp_no);
		return list;
	}

	
	public int deleteReviewCamp(SiteVO siteVO) {
		int count = sqlMap.delete("deleteReviewCamp", siteVO);
		return count;
	}

}
