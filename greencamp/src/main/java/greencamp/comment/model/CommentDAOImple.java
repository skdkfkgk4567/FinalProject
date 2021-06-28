package greencamp.comment.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class CommentDAOImple implements CommentDAO {
	
	private  SqlSessionTemplate sqlMap;
	
	public CommentDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int addGoodsComment(CommentDTO dto) {
		int count=sqlMap.insert("addGoodsComment", dto);
		return count;
	}
	
	public List listComment(CommentDTO cdto) {
		List clist=sqlMap.selectList("listComment", cdto);
		return clist;
	}
	
	public int delGoodsComment(CommentDTO cdto) {
		int count=sqlMap.delete("delGoodsComment", cdto);
		return count;
	}
	
	public int delComment(CommentDTO dto) {
		int count=sqlMap.delete("delComment", dto);
		return count;
	}

	public int countComment(CommentDTO cdto) {
		int count=sqlMap.selectOne("countComment");
		return count;
	}
	
	
	
}
