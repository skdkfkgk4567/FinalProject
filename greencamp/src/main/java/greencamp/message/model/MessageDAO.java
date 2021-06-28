package greencamp.message.model;

import java.util.List;

public interface MessageDAO {
public int writesendmsg(MessageDTO MessageDto);
public List<MessageDTO> getListReceptionMsg(String id);
public List<MessageDTO> getListsendMsg(String id);
public int deletemsg(int msg_no);
}
