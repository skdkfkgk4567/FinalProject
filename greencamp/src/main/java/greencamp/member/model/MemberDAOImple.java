package greencamp.member.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAOImple implements MemberDAO {

	private SqlSessionTemplate sqlMap;

	public MemberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public List<MemberDTO> getListMember(String id) {
		List list = sqlMap.selectList("getListMemberSQL", id);
		return list;
	}

	@Override
	public int updateMemberBsnm(MemberDTO MemberDto) {
		int count = sqlMap.update("updateMemberBsnmSQL", MemberDto);
		return count;
	}

	@Override
	public int findusercheck(String id) {
		int count = sqlMap.selectOne("findusercheck", id);
		return count;
	}

	@Override
	public int joinBsnm(MemberDTO MemberDto) {
		int count = sqlMap.insert("joinBsnmmemberSQL", MemberDto);
		return count;
	}

	@Override
	public int joinUser(MemberDTO MemberDto) {
		int count = sqlMap.insert("joinUsermemberSQL", MemberDto);
		return count;
	}

	@Override
	public int empIdCheck(String id) {
		int count = sqlMap.selectOne("checkId", id);
		return count;
	}

	@Override
	public int login(MemberDTO MemberDto) {
		int count = sqlMap.selectOne("loginSQL", MemberDto);
		return count;
	}

	@Override
	public int checkusergrade(String id) {
		int count = sqlMap.selectOne("checkusergrade", id);
		return count;
	}

	@Override
	public int memberout(MemberDTO MemberDto) {
		int count = sqlMap.delete("memberoutSQL", MemberDto);
		return count;
	}

	@Override
	/*사용자 목록*/
	public List<MemberDTO> listMember(int cp, int ls) {
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		int start=((cp-1)*ls)+1;
		int end=cp*ls;
		map.put("start", start);
		map.put("end", end);
		List<MemberDTO> arr=sqlMap.selectList("listMember", map);
		return arr;
	}


	@Override
	/*사업자 목록*/
	public List<MemberDTO> listBuisnessman(int cp, int ls) {
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		int start=((cp-1)*ls)+1;
		int end=cp*ls;
		map.put("start", start);
		map.put("end", end);
		List<MemberDTO> arr=sqlMap.selectList("listBuisnessman", map);
		return arr;
	}

	@Override
	/*사용자&사업자 블랙리스트 목록*/
	public List<MemberDTO> listBlackList(int cp, int ls) {
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		int start=((cp-1)*ls)+1;
		int end=cp*ls;
		map.put("start", start);
		map.put("end", end);
		List<MemberDTO> arr=sqlMap.selectList("listBlackList", map);
		return arr;
	}

	@Override
	/*사용자&사업자 블랙리스트 등록*/
	public int modiBlackList(MemberDTO dto) {
		int count=sqlMap.update("modiBlackList", dto);
		return count;
	}

	@Override
	/*사용자 수*/
	public int memberTotalCnt() {
		int count=sqlMap.selectOne("memberTotalCnt");
		return count;
	}

	@Override
	/*사업자 수*/
	public int buisnessmanTotalCnt() {
		int count=sqlMap.selectOne("buisnessmanTotalCnt");
		return count;
	}

	@Override
	/*블랙리스트 수*/
	public int blackListTotalCnt() {
		int count=sqlMap.selectOne("blackListTotalCnt");
		return count;
	}

	@Override
	public int mngrloginsubmit(MemberDTO dto) {
		int count = sqlMap.selectOne("mngrloginSQL", dto);
		return count;
	}
}
