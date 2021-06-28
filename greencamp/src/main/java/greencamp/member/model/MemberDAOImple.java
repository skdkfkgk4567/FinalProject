package greencamp.member.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAOImple implements MemberDAO {
	
	private SqlSessionTemplate sqlMap;
	

public MemberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

public List<MemberDTO> getListMemberBsnm(String id) {
	List<MemberDTO> list = sqlMap.selectList("getListMemberBsnmSQL", id);
	return list;
}
public int updateMemberBsnm(MemberDTO MemberDto) {
	int count = sqlMap.update("updateMemberBsnmSQL", MemberDto);
	return count;
}

public int findusercheck(String id) {
	int count = sqlMap.selectOne("findusercheck", id);
	return count;
}
public int joinBsnm(MemberDTO MemberDto) {
	int count = sqlMap.insert("joinBsnmmemberSQL", MemberDto);
	return count;
}
public int joinUser(MemberDTO MemberDto) {
	int count = sqlMap.insert("joinUsermemberSQL", MemberDto);
	return count;
}


public int empIdCheck(String id) {
	int count = sqlMap.selectOne("checkId", id);
	return count;
}

public int login(MemberDTO MemberDto) {
	int count = sqlMap.selectOne("loginSQL", MemberDto);
	return count;
}

public int checkusergrade(String id) {
	int count = sqlMap.selectOne("checkusergrade", id);
	return count;
}
}
