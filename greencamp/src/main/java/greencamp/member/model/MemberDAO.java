package greencamp.member.model;

import java.util.List;

public interface MemberDAO {
	public List<MemberDTO> getListMemberBsnm(String id);
	public int updateMemberBsnm(MemberDTO MemberDto);
	public int findusercheck(String id); 
	public int joinBsnm(MemberDTO MemberDto);
	public int joinUser(MemberDTO MemberDto);
	public int empIdCheck(String id);
	public int login(MemberDTO MemberDto);
	public int checkusergrade(String id);
	
}
