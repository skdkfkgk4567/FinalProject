package greencamp.comment.model;

import java.util.HashMap;
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
	
	@Override
	public List<CommentDTO> getcommentlist(String ncnm) {
		List<CommentDTO> list = sqlMap.selectList("getcommentlist", ncnm);
		return list;
	}
	
	/*캠핑톡 댓글 목록*/
	public List<CommentDTO> listCampTalkComment(int cp, int ls) {
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		int start=((cp-1)*ls)+1;
		int end=cp*ls;
		map.put("start", start);
		map.put("end", end);
		List<CommentDTO> arr=sqlMap.selectList("listCampTalkComment", map);
		return arr;
	}
	
	/*캠핑톡 댓글 삭제*/
	public int deleteCampTalkComment(int cm_no) {
		int count=sqlMap.delete("deleteCampTalkComment", cm_no);
		return count;		
	}
	
	/*캠핑톡 댓글 총 갯수*/
	public int campTalkCommentTotalCnt() {
		int count=sqlMap.selectOne("campTalkCommentTotalCnt");
		return count;
	}
	
	/*중고거래 댓글 목록*/
	public List<CommentDTO> listTradeComment(int cp, int ls) {
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		int start=((cp-1)*ls)+1;
		int end=cp*ls;
		map.put("start", start);
		map.put("end", end);
		List<CommentDTO> arr=sqlMap.selectList("listTradeComment", map);
		return arr;
	}
	
	/*중고거래 댓글 삭제*/
	public int deleteTradeComment(int cm_no) {
		int count=sqlMap.delete("deleteTradeComment", cm_no);
		return count;		
	}
	
	/*중고거래 댓글 총 갯수*/
	public int tradeCommentTotalCnt() {
		int count=sqlMap.selectOne("tradeCommentTotalCnt");
		return count;
	}
	
	/*캠핑장 댓글 목록*/
	public List<CommentDTO> listCampsiteComment(int cp, int ls) {
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		int start=((cp-1)*ls)+1;
		int end=cp*ls;
		map.put("start", start);
		map.put("end", end);
		List<CommentDTO> arr=sqlMap.selectList("listCampsiteComment", map);
		return arr;
	}
	
	/*캠핑장 댓글 삭제*/
	public int deleteCampsiteComment(int cm_no) {
		int count=sqlMap.delete("deleteCampsiteComment", cm_no);
		return count;		
	}
	
	/*캠핑장 댓글 총 갯수*/
	public int campsiteCommentTotalCnt() {
		int count=sqlMap.selectOne("campsiteCommentTotalCnt");
		return count;
	}
	
	/*공지사항 댓글 목록*/
	public List<CommentDTO> listNoticeComment(int cp, int ls) {
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		int start=((cp-1)*ls)+1;
		int end=cp*ls;
		map.put("start", start);
		map.put("end", end);
		List<CommentDTO> arr=sqlMap.selectList("listNoticeComment", map);
		return arr;
	}
	
	/*공지사항 댓글 삭제*/
	public int deleteNoticeComment(int cm_no) {
		int count=sqlMap.delete("deleteNoticeComment", cm_no);
		return count;		
	}
	
	/*공지사항 댓글 총 갯수*/
	public int noticeCommentTotalCnt() {
		int count=sqlMap.selectOne("noticeCommentTotalCnt");
		return count;
	}
	
	/*캠핑정보 댓글 목록*/
	public List<CommentDTO> listCampTipComment(int cp, int ls) {
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		int start=((cp-1)*ls)+1;
		int end=cp*ls;
		map.put("start", start);
		map.put("end", end);
		List<CommentDTO> arr=sqlMap.selectList("listCampTipComment", map);
		return arr;
	}
	
	/*캠핑정보 댓글 삭제*/
	public int deleteCampTipComment(int cm_no) {
		int count=sqlMap.delete("deleteCampTipComment", cm_no);
		return count;		
	}
	
	/*캠핑정보 댓글 총 갯수*/
	public int campTipCommentTotalCnt() {
		int count=sqlMap.selectOne("campTipCommentTotalCnt");
		return count;
	}
	
	//게시글 삭제 시 댓글도 삭제
	public int delBbsComment(CommentDTO dto) {
		int count=sqlMap.delete("delBbsComment", dto);
		return count;
	}
	
}
