package greencamp.event.model;

import java.util.List;

public interface EventDAO {
public int eventWrite(EventDTO EventDto);
public List<EventDTO> geteventList(String id);


}
