package greencamp.event.model;

import java.util.HashMap;
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
		List list = sqlMap.selectList("getListEventBsnmSQL", id);
		return list;
	}

	public List eventList(EventDTO dto) {
		List list = sqlMap.selectList("eventList", dto);
		return list;
	}

	public List eventinfo(EventDTO dto) {
		List list = sqlMap.selectList("eventinfo", dto);
		return list;
	}

	public List eventajax(EventDTO dto) {
		List list = sqlMap.selectList("eventajax", dto);
		return list;
	}
	/*이벤트&광고 목록*/
	public List<EventDTO> listEvent(int cp, int ls) {
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		int start=((cp-1)*ls)+1;
		int end=cp*ls;
		map.put("start", start);
		map.put("end", end);
		List<EventDTO> arr=sqlMap.selectList("listEvent", map);
		return arr;
	}

	/*이벤트&광고 승인*/
	public int recogEvent(EventDTO dto) {
		int count=sqlMap.update("recogEvent", dto);
		return count;
	}

	/*이벤트&광고 반려*/
	public int compEvent(int evnt_no) {
		int count=sqlMap.delete("compEvent", evnt_no);
		return count;
	}

	/*이벤트&광고 총 갯수*/
	public int eventTotalCnt() {
		int count=sqlMap.selectOne("eventTotalCnt");
		return count;
	}
}
