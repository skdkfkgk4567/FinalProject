package greencamp.like.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class LikeDAOImple implements LikeDAO {
	
	private SqlSessionTemplate sqlMap;
public LikeDAOImple(SqlSessionTemplate sqlMap) {
	super();
	this.sqlMap = sqlMap;
}
	
	public int insertlikeuser(LikeDTO LikeDto) {
		int result=sqlMap.insert("inputlikeSQL", LikeDto);
		return result;
	}
	public int deletelikeuser(int like_no) {
		int result=sqlMap.delete("deletelikeSQL", like_no);
		return result;
	}
	
	public List<LikeDTO> getlikebbsnumber(String id) {
		
		return null;
	}
	
}
