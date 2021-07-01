package greencamp.review.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import greencamp.like.model.LikeDTO;

public class ReviewDAOImple implements ReviewDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public ReviewDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
public List<ReviewDTO> getListReviewBsnmService(int camp_no) {
	List<ReviewDTO> list = sqlMap.selectList("getListReviewBsnmSQL", camp_no);
	return list;
}

public int likesdown(int bbs_no) {
	int result = sqlMap.update("likesdownSQL", bbs_no);
	return result;
}

public int likesup(int bbs_no) {
	int result = sqlMap.update("likesupSQL", bbs_no);
	return result;
}
public int showlikesnumber(int bbs_no) {
	int number = sqlMap.selectOne("showlikesnumber", bbs_no);
	return number;
	
}
public List<LikeDTO> getlikebbsnumber(String id) {
	List<LikeDTO> list = sqlMap.selectList("getlikebbsnumberSQL", id);
	return list;
}
@Override
public int findcampnobsnm(String id) {
	int camp_no = sqlMap.selectOne("findcampnobsnm", id);
	return camp_no;
}
}
