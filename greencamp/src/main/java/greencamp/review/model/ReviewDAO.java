package greencamp.review.model;
import java.util.List;

import greencamp.like.model.LikeDTO;
public interface ReviewDAO {
 public List<ReviewDTO> getListReviewBsnmService(int camp_no);
 public int likesup(int bbs_no);
 public int likesdown(int bbs_no);
 public int showlikesnumber(int bbs_no);
 public List<LikeDTO> getlikebbsnumber(String id);
 public int findcampnobsnm(String id);
}
