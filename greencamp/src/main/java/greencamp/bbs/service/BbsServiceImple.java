package greencamp.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import greencamp.bbs.model.BbsDAO;
import greencamp.bbs.model.BbsDTO;

public class BbsServiceImple implements BbsService {

	@Autowired
	private BbsDAO bbsDao;
	
	public List listBbs(BbsDTO dto) {
		List list=bbsDao.listBbs(dto);
		return list;
	}

	public List bbsTypeIndex(BbsDTO dto) {
		List list=bbsDao.bbsTypeIndex(dto);
		return list;
	}

	public List bbsajax(BbsDTO dto) {
		List list=bbsDao.bbsajax(dto);
		return list;
	}

	public int registBbs(BbsDTO dto) {
		int count=bbsDao.registBbs(dto);
		return count;
	}

	public int goodsUp(BbsDTO dto) {
		int count=bbsDao.goodsUp(dto);
		return count;
	}

	public int goodsDel(BbsDTO dto) {
		int count=bbsDao.goodsDel(dto);
		return count;
	}

}
