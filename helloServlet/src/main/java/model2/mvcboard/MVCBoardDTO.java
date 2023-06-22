package model2.mvcboard;

public class MVCBoardDTO {

	// 데이터를 담는 그릇 DTO, DTO를 옮겨서 리퀘스트 영역에 저장해주면 저장된 객체를 화면에 출력할수있습니다.
	// 자바빈즈 객체를 만들때에는 private로 모두 선언해주시고
	// 멤버 변수 선언
	private String idx;
	private String name;
	private String title;
	private String content;
	private String postdate;
	private String ofile;
	private String sfile;
	private int downcount;
	private String pass;
	private int visitcount;
 
	// 생성자는 new 키워드를 만나서 객체를 인스턴트화 할 때 필요합니다.
	public MVCBoardDTO(String idx, String name, String title, String content, String postdate, String ofile, String sfile,
			int downcount, String pass, int visitcount) {
		super();
		this.idx = idx;
		this.name = name;
		this.title = title;
		this.content = content;
		this.postdate = postdate;
		this.ofile = ofile;
		this.sfile = sfile;
		this.downcount = downcount;
		this.pass = pass;
		this.visitcount = visitcount;
	}

	public MVCBoardDTO() {
		// TODO Auto-generated constructor stub
	}


	public String getIdx() {
		return idx;
	}


	public void setIdx(String idx) {
		this.idx = idx;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
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


	public String getPostdate() {
		return postdate;
	}


	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}


	public String getOfile() {
		return ofile;
	}


	public void setOfile(String ofile) {
		this.ofile = ofile;
	}


	public String getSfile() {
		return sfile;
	}


	public void setSfile(String sfile) {
		this.sfile = sfile;
	}


	public int getDowncount() {
		return downcount;
	}


	public void setDowncount(int downcount) {
		this.downcount = downcount;
	}


	public String getPass() {
		return pass;
	}


	public void setPass(String pass) {
		this.pass = pass;
	}


	public int getVisitcount() {
		return visitcount;
	}


	public void setVisitcount(int visitcount) {
		this.visitcount = visitcount;
	}

}
