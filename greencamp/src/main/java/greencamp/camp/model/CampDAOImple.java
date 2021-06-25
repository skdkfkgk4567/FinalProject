package greencamp.camp.model;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class CampDAOImple implements CampDAO
{
	
	private SqlSessionTemplate sqlMap;
	
	public CampDAOImple(SqlSessionTemplate sqlMap)
	{
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public List<CampVO> getAllCampList(CampVO campVO)
	{
		List<CampVO> allList = sqlMap.selectList("getAllCampList",campVO);
		return allList;
	}

	@Override
	public List<CampVO> getCampList(CampVO campVO)
	{
		List<CampVO> allList = sqlMap.selectList("getCampList",campVO);
		
		return allList;
	}

	@Override
	public String getCampNm(int camp_no)
	{
		String camp_nm = sqlMap.selectOne("getCampNm", camp_no);
		return camp_nm;
	}

	@Override
	public List<SiteVO> getSiteList(SiteVO siteVO)
	{
		List<SiteVO> allList = sqlMap.selectList("getSiteList",siteVO);
		return allList;
	}

	@Override
	public int getCampListCnt(String camp_nm)
	{
		int listCnt = sqlMap.selectOne("getCampListCnt",camp_nm);
		return listCnt;
	}

	@Override
	public int getAllCampListCnt() {
		int listCnt = sqlMap.selectOne("getAllCampListCnt");
		return listCnt;
	}

	@Override
	public List<CampVO> getCampDetail(int camp_no)
	{
		List<CampVO> campDetail = sqlMap.selectList("getCampDetail",camp_no);
		return campDetail;
	}

	@Override
	public String getCampDc()
	{
		String campDc = sqlMap.selectOne("getCampDc");
		return campDc;
	}

	@Override
	public int completeOrderCamp(SiteVO siteVO)
	{
		int result = sqlMap.insert("completeOrderCamp", siteVO);
		return result;
	}

	@Override
	public List<SiteVO> getCampSitePc(int camp_no)
	{
		List<SiteVO> campDetail = sqlMap.selectList("getCampSitePc",camp_no);
		return campDetail;
	}

	@Override
	public List<SiteVO> searchTheme(SiteVO siteVO)
	{
		
		List<SiteVO> campDetail = sqlMap.selectList("searchTheme",siteVO);
		return campDetail;
	}

	@Override
	public int searchThemeCount(SiteVO siteVO)
	{
		int listCnt = sqlMap.selectOne("searchThemeCount", siteVO);
		return listCnt;
	}

}
