package greencamp.comment.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;

import greencamp.comment.model.CommentDAO;
import greencamp.comment.model.CommentDTO;
import greencamp.goods.model.GoodsDTO;

public class CommentServiceImple implements CommentService {

	@Autowired
	private CommentDAO commentDao;
	
	public int addGoodsComment(CommentDTO dto) {
		int count=commentDao.addGoodsComment(dto);
		return count;
	}
	
	public List listComment(CommentDTO cdto) {
		List clist=commentDao.listComment(cdto);
		return clist;
	}
	
	public int delGoodsComment(CommentDTO cdto) {
		int count=commentDao.delGoodsComment(cdto);
		return count;
	}
	
	public int delComment(CommentDTO dto) {
		int count=commentDao.delComment(dto);
		return count;
	}
	
	public int countComment(CommentDTO cdto) {
		int count=commentDao.countComment(cdto);
		return count;
	}

}
