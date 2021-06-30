package greencamp.member.model;

import java.util.List;

public interface MemberDAO {
	public List<MemberDTO> getListMember(String id);

	public int updateMemberBsnm(MemberDTO MemberDto);

	public int findusercheck(String id);

	public int joinBsnm(MemberDTO MemberDto);

	public int joinUser(MemberDTO MemberDto);

	public int empIdCheck(String id);

	public int login(MemberDTO MemberDto);

	public int checkusergrade(String id);

	public int memberout(MemberDTO MemberDto);

	public List<MemberDTO> listMember(int cp, int ls); /* 사용자 목록 */

	public List<MemberDTO> listBuisnessman(int cp, int ls); /* 사업자 목록 */

	public List<MemberDTO> listBlackList(int cp, int ls); /* 사용자&사업자 블랙리스트 목록 */

	public int modiBlackList(MemberDTO dto); /* 사용자&시압지 블랙리스트 등록 */

	public int memberTotalCnt(); /* 사용지 수 */

	public int buisnessmanTotalCnt(); /* 사업자 수 */

	public int blackListTotalCnt(); /* 블랙리스트 수 */

	public int mngrloginsubmit(MemberDTO dto);
}
