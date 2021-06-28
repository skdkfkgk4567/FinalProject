package greencamp.campinfo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import greencamp.campinfo.model.CampInfoDAO;
import greencamp.campinfo.model.CampInfoDTO;

public class CampInfoServiceImple implements CampInfoService {
	
	@Autowired
	private CampInfoDAO campinfoDao;

	public List listCampInfo(CampInfoDTO dto) {
		List list=campinfoDao.listCampInfo(dto);
		return list;
	}
	
	public List campinfoajax(CampInfoDTO dto) {
		List list=campinfoDao.campinfoajax(dto);
		return list;
	}
	
	public List campInfoTypeIndex(CampInfoDTO dto) {
		List list=campinfoDao.campInfoTypeIndex(dto);
		return list;
	}

}
