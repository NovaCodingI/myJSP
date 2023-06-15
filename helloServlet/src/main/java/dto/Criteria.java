package dto;

public class Criteria {

	// 검색과 페이징이 사용될 객체입니다.
	
	private String searchField; // 검색조건
	private String searchWord; // 검색어
	
	// pageNo와 amount로 startNo와 endNo가 결정된다.
	int pageNo = 1; // 요청한 페이지 번호
	int amount = 10; // 한페이지당 보여질 게시물 수
	
	int startNo = 1;
	int endNo = 10;
	
	// 아래는 생성자니까.. 만들어 봅시다
	
	// pageNo만 올수도 있지요?
	// pageNo가 입력이 되었으면
	public Criteria(int pageNo) {
		
		if(pageNo > 0) {
			this.pageNo = pageNo;
			endNo = pageNo * amount;
			startNo = pageNo * amount - (amount - 1);
		}
	}
	
	public Criteria(int pageNo, int amount) {
		this.pageNo = pageNo;
		this.amount = amount;
	}

	// amount, startNo, endNo는 받는게 아니에요.
	public Criteria(String searchField, String searchWord, int pageNo) {
		this.searchField = searchField;
		this.searchWord = searchWord;
		if(pageNo > 0) {
			this.pageNo = pageNo;
			endNo = pageNo * amount;
			startNo = (pageNo * amount) - (amount - 1);
		}
	}
	
	
	
	public String getSearchField() {
		return searchField;
	}
	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	}
	
	
	
	/*
	 
	private String searchField; // 검색조건
	private String searchWord; // 검색어
	
	int pageNo; // 요청한 페이지 번호
	int amount; // 한페이지당 보여질 게시물 수
	
	public Criteria() {
		// 페이지번호는 초기화를 해주...
		pageNo = 1;
		// 한페이지에 보통 10개..
		amount = 10;
	}
	
	// 
	public Criteria(String searchField, String searchWord) {
		// 생성자 호출하기 this(); = this.Criteria // .오류남
		this();
		this.searchField = searchField;
		this.searchWord = searchWord;
	}

	public Criteria(String searchField, String searchWord, int pageNo, int amount) {
		super();
		this.searchField = searchField;
		this.searchWord = searchWord;
		this.pageNo = pageNo;
		this.amount = amount;
	}

	public String getSearchField() {
		return searchField;
	}

	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	*/


