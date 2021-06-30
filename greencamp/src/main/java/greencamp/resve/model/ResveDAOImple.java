package greencamp.resve.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class ResveDAOImple implements ResveDAO {
	private  SqlSessionTemplate sqlMap;
	public ResveDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
@Override
public List<ResveDTO> getlistresve(String id) {
	List<ResveDTO> list = sqlMap.selectList("getListresveSQL", id);
	return list;
}
}
