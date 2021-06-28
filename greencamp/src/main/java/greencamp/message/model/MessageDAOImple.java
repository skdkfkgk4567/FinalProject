package greencamp.message.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class MessageDAOImple implements MessageDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public MessageDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
public int writesendmsg(MessageDTO MessageDto) {
	int count = sqlMap.insert("checksendid", MessageDto);
	return count;
}

public List<MessageDTO> getListReceptionMsg(String id) {
	List<MessageDTO> list = sqlMap.selectList("getListReceptionMsgSQL",id);
	return list;
}

public List<MessageDTO> getListsendMsg(String id) {
	List<MessageDTO> list = sqlMap.selectList("getListsendMsgSQL",id);
	return list;
}
public int deletemsg(int msg_no) {
	int count = sqlMap.delete("deletemsg", msg_no);
	return count;
}
}
