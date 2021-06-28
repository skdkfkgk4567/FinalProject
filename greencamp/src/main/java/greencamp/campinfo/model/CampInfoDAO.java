package greencamp.campinfo.model;

import java.util.*;

public interface CampInfoDAO {
	
	public List listCampInfo(CampInfoDTO dto);//캠핑정보 리스트
	public List campInfoTypeIndex(CampInfoDTO dto);//캠핑정보 타입 상세보기
	public List campinfoajax(CampInfoDTO dto);//캠핑정보 클릭 상세보기

}
