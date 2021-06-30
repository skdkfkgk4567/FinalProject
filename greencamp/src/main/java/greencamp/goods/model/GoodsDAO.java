package greencamp.goods.model;

import java.util.*;

public interface GoodsDAO {

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
	public List<GoodsDTO> listGoodsPost(int cp, int ls); /*중고거래 게시글 목록*/
	public int deleteGoodsPost(int delng_no); /*중고거래 게시글 삭제*/
	public int goodsPostTotalCnt(); /*중고거래 게시글 총 갯수*/
	public int goodssttus(GoodsDTO dto);//거래완료
}
