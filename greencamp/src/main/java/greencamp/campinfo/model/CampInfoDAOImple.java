package greencamp.campinfo.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class CampInfoDAOImple implements CampInfoDAO {

	private  SqlSessionTemplate sqlMap;
	
	public CampInfoDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	
	public List listCampInfo(CampInfoDTO dto) {
		List list=sqlMap.selectList("listCampInfo", dto);
		return list;
	}
	
	public List campinfoajax(CampInfoDTO dto) {
		List list=sqlMap.selectList("campInfoajax", dto);
		return list;
	}
	
	public List campInfoTypeIndex(CampInfoDTO dto) {
		List list=sqlMap.selectList("campinfoindex", dto);
		return list;
	}
	
	/*캠핑정보 게시글 목록*/
	public List<CampInfoDTO> listCampinfoPost(int cp, int ls) {
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		int start=((cp-1)*ls)+1;
		int end=cp*ls;
		map.put("start", start);
		map.put("end", end);
		List<CampInfoDTO> arr=sqlMap.selectList("listCampinfoPost", map);
		return arr;
	}

	/*캠핑정보 게시글 작성*/
	public int writeCampinfoPost(CampInfoDTO dto) {
		int count=sqlMap.insert("writeCampinfoPost", dto);
		return count;
	}

	/*캠핑정보 게시글 삭제*/
	public int deleteCampinfoPost(int info_no) {
		int count=sqlMap.delete("deleteCampinfoPost", info_no);
		return count;
	}
	
	/*캠핑정보 게시글 총 갯수*/
	public int campinfoPostTotalCnt() {
		int count=sqlMap.selectOne("campinfoPostTotalCnt");
		return count;
	}

}
