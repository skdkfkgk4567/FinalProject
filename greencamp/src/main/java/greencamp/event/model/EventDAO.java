package greencamp.event.model;

import java.util.List;

public interface EventDAO {
	public int eventWrite(EventDTO EventDto);

	public List<EventDTO> geteventList(String id);

	public List eventList(EventDTO dto);

	public List eventinfo(EventDTO dto);

	public List eventajax(EventDTO dto);

	public List<EventDTO> listEvent(int cp, int ls); /* 이벤트&광고 목록 */

	public int recogEvent(EventDTO dto); /* 이벤트&광고 승인 */

	public int compEvent(int evnt_no); /* 이벤트&광고 반려 */

	public int eventTotalCnt(); /* 이벤트&광고 총 갯수 */

}
