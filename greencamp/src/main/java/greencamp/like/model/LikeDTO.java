package greencamp.like.model;

public class LikeDTO {
	private int like_no;
	private String like_id;
	public LikeDTO() {
		super();
	}
	public LikeDTO(int like_no, String like_id) {
		super();
		this.like_no = like_no;
		this.like_id = like_id;
	}
	public int getLike_no() {
		return like_no;
	}
	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}
	public String getLike_id() {
		return like_id;
	}
	public void setLike_id(String like_id) {
		this.like_id = like_id;
	}
	
	
}
