package greencamp.goods.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;

import greencamp.goods.model.GoodsDAO;
import greencamp.goods.model.GoodsDTO;

public class GoodsServiceImple implements GoodsService {

	@Autowired
	private GoodsDAO goodsDao;
	
	public int registGoods(GoodsDTO dto) {
		int count=goodsDao.registGoods(dto);
		return count;
	}
	
	public List listGoods(GoodsDTO dto) {
		List list=goodsDao.listGoods(dto);
		return list;
	}
	
	public int getTotalCnt() {
		int count=goodsDao.getTotalCnt();
		return count;
	}
	
	public List goodsajax(GoodsDTO dto) {
		List list=goodsDao.goodsajax(dto);
		return list;
	}
	
	public int goodsUp(GoodsDTO dto) {
		int count=goodsDao.goodsUp(dto);
		return count;
	}
	
	public int goodsDel(GoodsDTO dto) {
		int count=goodsDao.goodsDel(dto);
		return count;
	}
	
	public List listGoodsTypeBuy(GoodsDTO dto) {
		List list=goodsDao.listGoodsTypeBuy(dto);
		return list;
	}
	
	public List listGoodsTypeSale(GoodsDTO dto) {
		List list=goodsDao.listGoodsTypeSale(dto);
		return list;
	}
	
	public List goodsInfoIndex(GoodsDTO dto) {
		List list=goodsDao.goodsInfoIndex(dto);
		return list;
	}
	
	public List goodsInfoTypeIndex(GoodsDTO dto) {
		List list=goodsDao.goodsInfoTypeIndex(dto);
		return list;
	}
	
	
	
	
	
	
	
}
