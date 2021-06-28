package greencamp.selling.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class SellingDAOImple implements SellingDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public SellingDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
public List<SellingDTO> getListSellingBsnmService(String id) {
	List list = sqlMap.selectList("getListSellingBsnmSQL", id);
	return list;
}
public int totalpc(String id) {
	int totalpc = sqlMap.selectOne("totalpc",id);
	return totalpc;
}
}
