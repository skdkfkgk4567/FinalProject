package greencamp.comment.model;

import java.util.*;

public interface CommentDAO {
	
	public int addGoodsComment(CommentDTO dto);//댓글 등록
	public List listComment(CommentDTO cdto);//댓글 리스트
	public int delGoodsComment(CommentDTO cdto);//게시글 삭제 시 댓글도 삭제
	public int delComment(CommentDTO dto);//댓글 삭제
	public int countComment(CommentDTO cdto);//댓글 수
	public List<CommentDTO> getcommentlist(String ncnm);
	public List<CommentDTO> listCampTalkComment(int cp, int ls); /*캠핑톡 댓글 목록*/
	public int deleteCampTalkComment(int cm_no); /*캠핑톡 댓글 삭제*/
	public int campTalkCommentTotalCnt(); /*캠핑톡 댓글 총 갯수*/
	
	public List<CommentDTO> listTradeComment(int cp, int ls); /*중고거래 댓글 목록*/
	public int deleteTradeComment(int cm_no); /*중고거래 댓글 삭제*/
	public int tradeCommentTotalCnt(); /*중고거래 댓글 총 갯수*/
	
	public List<CommentDTO> listCampsiteComment(int cp, int ls); /*캠핑장 댓글 목록*/
	public int deleteCampsiteComment(int cm_no); /*캠핑장 댓글 삭제*/
	public int campsiteCommentTotalCnt(); /*캠핑장 댓글 총 갯수*/
	
	public List<CommentDTO> listNoticeComment(int cp, int ls); /*공지사항 댓글 목록*/
	public int deleteNoticeComment(int cm_no); /*공지사항 댓글 삭제*/
	public int noticeCommentTotalCnt(); /*공지사항 댓글 총 갯수*/
	
	public List<CommentDTO> listCampTipComment(int cp, int ls); /*캠핑정보 댓글 목록*/
	public int deleteCampTipComment(int cm_no); /*캠핑정보 댓글 삭제*/
	public int campTipCommentTotalCnt(); /*캠핑정보 댓글 총 갯수*/
	
	public int delBbsComment(CommentDTO dto);//게시글 삭제 시 댓글도 삭제
}
