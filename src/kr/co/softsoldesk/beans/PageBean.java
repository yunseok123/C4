package kr.co.softsoldesk.beans;

public class PageBean {

	private int min;

	private int max;

	private int prevPage;

	private int nextPage;

	private int pageCnt;

	private int currentPage;
	
	
	public PageBean(int contentCnt, int currentPage, int contentPageCnt, int paginationCnt) {
		
		this.currentPage = currentPage;
		
	pageCnt = contentCnt / contentPageCnt;
		//533/10=53 �̹Ƿ� 1page�� �ʿ�
		if(contentCnt % contentPageCnt > 0) {
			pageCnt++;
		}

		
		min = ((currentPage - 1) / contentPageCnt) * contentPageCnt + 1;
		max = min + paginationCnt - 1; //1+10=11�̹Ƿ� 1�� ����

		if(max > pageCnt) {
			max = pageCnt;
		}
		
		prevPage = min - 1;
		nextPage = max + 1;
		//�������������� �Ѿ�� �ʵ���
		if(nextPage > pageCnt) {
			nextPage = pageCnt;
		}
	}
	
	public int getMin() {
		return min;
	}
	public int getMax() {
		return max;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	
	
}
