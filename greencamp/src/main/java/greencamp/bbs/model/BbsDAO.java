package greencamp.bbs.model;

import java.util.*;


public interface BbsDAO {
	
	public List listBbs(BbsDTO dto);//공지 리스트
	public List bbsTypeIndex(BbsDTO dto);//공지 타입 상세보기
	public List bbsajax(BbsDTO dto);//공지 클릭 상세보기
	public int registBbs(BbsDTO dto);//공지 등록
	public int goodsUp(BbsDTO dto);//공지 게시글 수정하기
	public int goodsDel(BbsDTO dto);//공지 게시글 삭제

}
