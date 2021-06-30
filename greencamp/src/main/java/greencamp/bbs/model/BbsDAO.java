package greencamp.bbs.model;

import java.util.*;


public interface BbsDAO {
	
	public List listBbs(BbsDTO dto);//공지 리스트
	public List bbsTypeIndex(BbsDTO dto);//공지 타입 상세보기
	public List bbsajax(BbsDTO dto);//공지 클릭 상세보기
	public int registBbs(BbsDTO dto);//공지 등록
	public int goodsUp(BbsDTO dto);//공지 게시글 수정하기
	public int goodsDel(BbsDTO dto);//공지 게시글 삭제
	public List getlistbbs(String id);
	public List<BbsDTO> listCampTalkPost(int cp, int ls); /*캠핑톡 게시글 목록*/
	public int deleteCampTalkPost(int bbs_no); /*캠핑톡 게시글 삭제*/
	public int campTalkPostTotalCnt(); /*캠핑톡 게시글 총 갯수*/
	
	public List<BbsDTO> listNoticePost(int cp, int ls); /*공지사항 게시글 목록*/
	public int writeNoticePost(BbsDTO dto); /*공지사항 게시글 등록*/
	public int deleteNoticePost(int bbs_no); /*공지사항 게시글 삭제*/
	public int noticePostTotalCnt(); /*공지사항 게시글 총 갯수*/
}
