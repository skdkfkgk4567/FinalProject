package greencamp.campinfo.service;

import java.util.List;

import greencamp.campinfo.model.CampInfoDTO;

public interface CampInfoService {
	
	public List listCampInfo(CampInfoDTO dto);//캠핑정보 리스트
	public List campInfoTypeIndex(CampInfoDTO dto);//캠핑정보 타입 상세보기
	public List campinfoajax(CampInfoDTO dto);//캠핑정보 클릭 상세보기

}
