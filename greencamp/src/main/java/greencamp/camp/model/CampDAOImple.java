package greencamp.camp.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class CampDAOImple implements CampDAO {

	private SqlSessionTemplate sqlMap;

	public CampDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public List<SiteVO> getAllCampList(SiteVO siteVO) {
		List<SiteVO> allList = sqlMap.selectList("getAllCampList", siteVO);
		return allList;
	}

	@Override
	public List<SiteVO> getCampList(SiteVO siteVO) {
		List<SiteVO> allList = sqlMap.selectList("getCampList", siteVO);

		return allList;
	}

	@Override
	public String getCampNm(int camp_no) {
		String camp_nm = sqlMap.selectOne("getCampNm", camp_no);
		return camp_nm;
	}

	@Override
	public List<SiteVO> getSiteList(SiteVO siteVO) {
		List<SiteVO> allList = sqlMap.selectList("getSiteList", siteVO);
		return allList;
	}

	@Override
	public int getCampListCnt(String camp_nm) {
		int listCnt = sqlMap.selectOne("getCampListCnt", camp_nm);
		return listCnt;
	}

	@Override
	public int getAllCampListCnt() {
		int listCnt = sqlMap.selectOne("getAllCampListCnt");
		return listCnt;
	}

	@Override
	public List<SiteVO> getCampDetail(int camp_no) {
		List<SiteVO> campDetail = sqlMap.selectList("getCampDetail", camp_no);
		return campDetail;
	}

	@Override
	public String getCampDc() {
		String campDc = sqlMap.selectOne("getCampDc");
		return campDc;
	}

	@Override
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

	public int getLikeCamp(SiteVO siteVO) {
		int like = sqlMap.selectOne("getLikeCamp", siteVO);
		return like;
	}

	public int addLikeCamp(SiteVO siteVO) {
		int count = sqlMap.insert("addLikeCamp", siteVO);
		return count;
	}

	public int deleteLikeCamp(SiteVO siteVO) {
		int count = sqlMap.delete("deleteLikeCamp", siteVO);
		return count;
	}
	
	public List<SiteVO> getAcceptManageCampList(SiteVO siteVO) {
		List<SiteVO> list = sqlMap.selectList("getAcceptManageCampList", siteVO);
		return list;
	}

	public List<SiteVO> getDenyManageCampList(SiteVO siteVO) {
		List<SiteVO> list = sqlMap.selectList("getDenyManageCampList", siteVO);
		return list;
	}

	public int manageCampCount(SiteVO siteVO) {
		int listCnt = sqlMap.selectOne("manageCampCount", siteVO);
		return listCnt;
	}

	@Override
	public int recogCamp(SiteVO siteVO) {
		int count=sqlMap.update("recogCamp", siteVO);
		return count;
	}

	@Override
	public int compCamp(int camp_no) {
		int count=sqlMap.delete("compCamp", camp_no);
		return count;
	}

}
