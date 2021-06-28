package greencamp.campinfo.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class CampInfoDAOImple implements CampInfoDAO {

	private  SqlSessionTemplate sqlMap;
	
	public CampInfoDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	
	public List listCampInfo(CampInfoDTO dto) {
		List list=sqlMap.selectList("listCampInfo", dto);
		return list;
	}
	
	public List campinfoajax(CampInfoDTO dto) {
		List list=sqlMap.selectList("campInfoajax", dto);
		return list;
	}
	
	public List campInfoTypeIndex(CampInfoDTO dto) {
		List list=sqlMap.selectList("campinfoindex", dto);
		return list;
	}
	
	

}
