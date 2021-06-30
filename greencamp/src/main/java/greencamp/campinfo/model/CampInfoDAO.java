package greencamp.campinfo.model;

import java.util.*;

public interface CampInfoDAO {
	
	public List listCampInfo(CampInfoDTO dto);//캠핑정보 리스트
	public List campInfoTypeIndex(CampInfoDTO dto);//캠핑정보 타입 상세보기
	public List campinfoajax(CampInfoDTO dto);//캠핑정보 클릭 상세보기
	public List<CampInfoDTO> listCampinfoPost(int cp, int ls); /*캠핑정보 게시글 목록*/
	public int writeCampinfoPost(CampInfoDTO dto); /*캠핑정보 게시글 등록*/
	public int deleteCampinfoPost(int info_no); /*캠핑정보 게시글 삭제*/
	public int campinfoPostTotalCnt(); /*캠핑정보 게시글 총 갯수*/
}
