package model2.mvcboard;

public class MVCPageDto {
	
	int startNo; 			// 페이지 블럭 시작번호
	int endNo; 				// 페이지 블럭 끝 번호
	int realEnd; 			// 게시물의 끝페이지 번호 (<< 끝페이지로 이동 >>)
	boolean prev, next; 	// 이전, 다음 버튼(true:보여주기)
	
	// 페이지블럭을 생성하기 위해 필요한 요소
	int total;				// 총 게시물의 수
	Criterion criterion;		// 페이지 번호, 페이지당 게시물수
	

	public MVCPageDto() {
		// TODO Auto-generated constructor stub
	}

	public MVCPageDto(int total, Criterion criterion) {
		super();
		this.total = total;
		this.criterion = criterion;
		
		endNo = (int)(Math.ceil(criterion.pageNo/10.0) * 10);
		startNo = endNo - (10-1);
		
		realEnd = (int)(Math.ceil( (total*1.0)/criterion.getAmount() ));
		
		endNo = endNo > realEnd ? realEnd : endNo;
		
		// 앞으로이동 / 뒤로이동 설정
		prev = startNo > 1 ? true : false;
		next = endNo == realEnd ? false : true;
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


	public int getRealEnd() {
		return realEnd;
	}


	public void setRealEnd(int realEnd) {
		this.realEnd = realEnd;
	}


	public boolean isPrev() {
		return prev;
	}


	public void setPrev(boolean prev) {
		this.prev = prev;
	}


	public boolean isNext() {
		return next;
	}


	public void setNext(boolean next) {
		this.next = next;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}


	public Criterion getCriterion() {
		return criterion;
	}


	public void setCriterion(Criterion criterion) {
		this.criterion = criterion;
	}

}
