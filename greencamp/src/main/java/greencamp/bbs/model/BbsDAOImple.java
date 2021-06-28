package greencamp.bbs.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class BbsDAOImple implements BbsDAO {

	private  SqlSessionTemplate sqlMap;
	
	public BbsDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	
	public List listBbs(BbsDTO dto) {
		List list=sqlMap.selectList("listBbs",dto);
		return list;
	}

	public List bbsTypeIndex(BbsDTO dto) {
		List list=sqlMap.selectList("bbsTypeIndex", dto);
		return list;
	}

	public List bbsajax(BbsDTO dto) {
		List list=sqlMap.selectList("bbsAjax",dto);
		return list;
	}

	public int registBbs(BbsDTO dto) {
		int count=sqlMap.insert("registBbs", dto);
		return count;
	}

	public int goodsUp(BbsDTO dto) {
		int count=sqlMap.update("upBbs", dto);
		return count;
	}

	public int goodsDel(BbsDTO dto) {
		int count=sqlMap.delete("delBbs", dto);
		return count;
	}

}
