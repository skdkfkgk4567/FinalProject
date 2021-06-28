package greencamp.goods.service;

import java.util.List;

import greencamp.goods.model.GoodsDTO;

public interface GoodsService {

	public int registGoods(GoodsDTO dto);//중고거래 등록
	public List listGoods(GoodsDTO dto);//중고거래 리스트
	public List listGoodsTypeBuy(GoodsDTO dto);//중고거래 삽니다 리스트
	public List listGoodsTypeSale(GoodsDTO dto);//중고거래 팝니다 리스트
	public List goodsInfoIndex(GoodsDTO dto);//중고거래 상세보기
	public List goodsInfoTypeIndex(GoodsDTO dto);//중고거래 타입 상세보기
	public List goodsajax(GoodsDTO dto);//중고거래 클릭 상세보기
	public int goodsUp(GoodsDTO dto);//중고거래 게시글 수정하기
	public int goodsDel(GoodsDTO dto);//중고거래 게시글 삭제
	public int getTotalCnt();
	
}
