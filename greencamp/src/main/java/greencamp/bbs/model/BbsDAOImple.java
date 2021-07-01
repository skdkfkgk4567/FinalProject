package greencamp.bbs.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class BbsDAOImple implements BbsDAO {

	private  SqlSessionTemplate sqlMap;
	
	public BbsDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public List listBbs(BbsDTO dto) {
		List list=sqlMap.selectList("listBbs",dto);
		return list;
	}

	@Override
	public List bbsTypeIndex(BbsDTO dto) {
		List list=sqlMap.selectList("bbsTypeIndex", dto);
		return list;
	}

	@Override
	public List bbsajax(BbsDTO dto) {
		List list=sqlMap.selectList("bbsAjax",dto);
		return list;
	}

	@Override
	public int registBbs(BbsDTO dto) {
		
		int count=sqlMap.insert("registBbs", dto);
		return count;
	}

	@Override
	public int goodsUp(BbsDTO dto) {
		int count=sqlMap.update("upBbs", dto);
		return count;
	}

	@Override
	public int goodsDel(BbsDTO dto) {
		int count=sqlMap.delete("delBbs", dto);
		return count;
	}

	@Override
	public List getlistbbs(String id) {
		List list = sqlMap.selectList("getListbbsSQL", id);
		return list;
		
	}
	
	/*캠핑톡 게시글 목록*/
	public List<BbsDTO> listCampTalkPost(int cp, int ls) {
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		int start=((cp-1)*ls)+1;
		int end=cp*ls;
		map.put("start", start);
		map.put("end", end);
		List<BbsDTO> arr=sqlMap.selectList("listCampTalkPost", map);
		return arr;
	}
	
	/*캠핑톡 게시글 삭제*/
	public int deleteCampTalkPost(int cm_no) {
		int count=sqlMap.delete("deleteCampTalkPost", cm_no);
		return count;	
	}

	/*캠핑톡 게시글 총 갯수*/
	public int campTalkPostTotalCnt() {
		int count=sqlMap.selectOne("campTalkPostTotalCnt");
		return count;
	}

	/*공지사항 게시글 목록*/
	public List<BbsDTO> listNoticePost(int cp, int ls) {
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		int start=((cp-1)*ls)+1;
		int end=cp*ls;
		map.put("start", start);
		map.put("end", end);
		List<BbsDTO> arr=sqlMap.selectList("listNoticePost", map);
		return arr;
	}

	/*공지사항 게시글 작성*/
	public int writeNoticePost(BbsDTO dto) {
		int count=sqlMap.insert("writeNoticePost", dto);
		return count;
	}

	/*공지사항 게시글 삭제*/
	public int deleteNoticePost(int cm_no) {
		int count=sqlMap.delete("deleteNoticePost", cm_no);
		return count;
	}
	
	/*공지사항 게시글 총 갯수*/
	public int noticePostTotalCnt() {
		int count=sqlMap.selectOne("noticePostTotalCnt");
		return count;
	}

}
