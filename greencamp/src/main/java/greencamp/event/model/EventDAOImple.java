package greencamp.event.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class EventDAOImple implements EventDAO {
	
	private SqlSessionTemplate sqlMap;
	
	
	public EventDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	
public int eventWrite(EventDTO EventDto) {
	int count = sqlMap.insert("writeEvent", EventDto);
	return count;
}

public List<EventDTO> geteventList(String id) {
	List list = sqlMap.selectList("getListEventBsnmSQL",id);
	return list;
}
}
