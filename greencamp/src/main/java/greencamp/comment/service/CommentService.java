package greencamp.comment.service;

import java.util.List;

import greencamp.comment.model.CommentDTO;
import greencamp.goods.model.GoodsDTO;

public interface CommentService {

	public int addGoodsComment(CommentDTO dto);//댓글 등록
	public List listComment(CommentDTO cdto);//댓글 리스트
	public int delGoodsComment(CommentDTO cdto);//게시글 삭제 시 댓글도 삭제
	public int delComment(CommentDTO dto);//댓글 삭제
	public int countComment(CommentDTO cdto);//댓글 수
	public List<CommentDTO> getcommentlist(String ncnm);//댓글리스트
}
