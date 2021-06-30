package greencamp.like.model;

public class LikeDTO {
	private int like_no;
	private String like_ncnm;
	public LikeDTO() {
		super();
	}
	public LikeDTO(int like_no, String like_ncnm) {
		super();
		this.like_no = like_no;
		this.like_ncnm = like_ncnm;
	}
	public int getLike_no() {
		return like_no;
	}
	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}
	public String getLike_ncnm() {
		return like_ncnm;
	}
	public void setLike_ncnm(String like_ncnm) {
		this.like_ncnm = like_ncnm;
	}
	
	
	
	
}
