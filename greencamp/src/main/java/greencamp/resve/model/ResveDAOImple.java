package greencamp.resve.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class ResveDAOImple implements ResveDAO {
	private SqlSessionTemplate sqlMap;

	public ResveDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public List<ResveVO> getlistresve(String id) {
		List<ResveVO> list = sqlMap.selectList("getListresveSQL", id);
		return list;
	}

	
}
