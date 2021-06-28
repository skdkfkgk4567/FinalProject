package greencamp.goods.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class GoodsDAOImple implements GoodsDAO {

	private  SqlSessionTemplate sqlMap;
	
	public GoodsDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public int registGoods(GoodsDTO dto) {
		int count=sqlMap.insert("registGoods", dto);
		return count;
	}

	public List listGoods(GoodsDTO dto) {
		List list=sqlMap.selectList("listGoods",dto);
		return list;
	}
	
	public int getTotalCnt() {
		int count=sqlMap.selectOne("goodsTotalCnt");
		return count;
	}
	
	public List goodsajax(GoodsDTO dto) {
		List list=sqlMap.selectList("goodsajax",dto);
		return list;
	}
	
	public int goodsUp(GoodsDTO dto) {
		int count=sqlMap.update("upGoods", dto);
		return count;
	}
	
	public int goodsDel(GoodsDTO dto) {
		int count=sqlMap.delete("delGoods", dto);
		return count;
	}
	
	public List listGoodsTypeBuy(GoodsDTO dto) {
		List list=sqlMap.selectList("listGoodstypeBuy", dto);
		return list;
	}
	
	public List listGoodsTypeSale(GoodsDTO dto) {
		List list=sqlMap.selectList("listGoodstypeSale", dto);
		return list;
	}
	
	public List goodsInfoIndex(GoodsDTO dto) {
		List list=sqlMap.selectList("goodsinfoindex", dto);
		return list;
	}
	
	public List goodsInfoTypeIndex(GoodsDTO dto) {
		List list=sqlMap.selectList("goodsinfotypeindex", dto);
		return list;
	}
	
	
	
	
	
}
