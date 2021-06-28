package greencamp.selling.model;

import java.util.List;

public interface SellingDAO {
public List<SellingDTO> getListSellingBsnmService(String id);
public int totalpc(String id);
}
