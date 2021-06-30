package greencamp.goods.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class GoodsDAOImple implements GoodsDAO {

	private SqlSessionTemplate sqlMap;

	public GoodsDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int registGoods(GoodsDTO dto) {
		int count = sqlMap.insert("registGoods", dto);
		return count;
	}

	public List listGoods(GoodsDTO dto) {
		List list = sqlMap.selectList("listGoods", dto);
		return list;
	}

	public int getTotalCnt() {
		int count = sqlMap.selectOne("goodsTotalCnt");
		return count;
	}

	public List goodsajax(GoodsDTO dto) {
		List list = sqlMap.selectList("goodsajax", dto);
		return list;
	}

	public int goodsUp(GoodsDTO dto) {
		int count = sqlMap.update("upGoods", dto);
		return count;
	}

	public int goodsDel(GoodsDTO dto) {
		int count = sqlMap.delete("delGoods", dto);
		return count;
	}

	public List listGoodsTypeBuy(GoodsDTO dto) {
		List list = sqlMap.selectList("listGoodstypeBuy", dto);
		return list;
	}

	public List listGoodsTypeSale(GoodsDTO dto) {
		List list = sqlMap.selectList("listGoodstypeSale", dto);
		return list;
	}

	public List goodsInfoIndex(GoodsDTO dto) {
		List list = sqlMap.selectList("goodsinfoindex", dto);
		return list;
	}

	public List goodsInfoTypeIndex(GoodsDTO dto) {
		List list = sqlMap.selectList("goodsinfotypeindex", dto);
		return list;
	}

	/* 중고거래 게시글 목록 */
	public List<GoodsDTO> listGoodsPost(int cp, int ls) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int start = ((cp - 1) * ls) + 1;
		int end = cp * ls;
		map.put("start", start);
		map.put("end", end);
		List<GoodsDTO> arr = sqlMap.selectList("listGoodsPost", map);
		return arr;
	}

	/* 중고거래 게시글 삭제 */
	public int deleteGoodsPost(int delng_no) {
		int count = sqlMap.delete("deleteGoodsPost", delng_no);
		return count;
	}

	/* 중고거래 게시글 총 갯수 */
	public int goodsPostTotalCnt() {
		int count = sqlMap.selectOne("goodsPostTotalCnt");
		return count;
	}
	@Override
	public int goodssttus(GoodsDTO dto) {
		int count=sqlMap.update("goodssttus", dto);
		return count;
	}
}
