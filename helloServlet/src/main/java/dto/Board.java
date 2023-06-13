package dto;

// 데이터를 담는 객체(상자) 만들기 new Board DB한줄읽어 ResultSet next() 할때마다 보드가 생성되어야해요
// list 에 담아

public class Board {
	// 멤버 변수 선언
	private String num;
	private String title;
	private String content;
	private String id;
	private String postdate;
	private String viscount;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}

	public Board(String num, String title, String content, String id, String postdate, String viscount) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.id = id;
		this.postdate = postdate;
		this.viscount = viscount;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPostdate() {
		return postdate;
	}

	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}

	public String getViscount() {
		return viscount;
	}

	public void setViscount(String viscount) {
		this.viscount = viscount;
	}

}
