package kr.co.uclick.dto;

import java.util.List;

import kr.co.uclick.entity.User;

public class UserDto {
	
	List<User> users;
	
	Long totalpage;
	
	int blockstart;
	
	int blockend;
	
	int prevpage;
	
	int nextpage;
	
	int pagenow;
	
	int firstPage;
	
	int lastPage;
	
	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public int getPagenow() {
		return pagenow;
	}

	public void setPagenow(int pagenow) {
		this.pagenow = pagenow;
	}

	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		if(lastPage <= 1) {
			lastPage = 1;
		}
		this.lastPage = lastPage;
	}

	public Long getTotalpage() {
		return totalpage;
	}

	public void setTotalpage(Long totalpage) {
		this.totalpage = totalpage;
	}

	public int getBlockstart() {
		return blockstart;
	}

	public void setBlockstart(int blockstart) {
		this.blockstart = blockstart;
	}

	public int getBlockend() {
		return blockend;
	}

	public void setBlockend(int blockend) {
		this.blockend = blockend;
	}

	public int getPrevpage() {
		return prevpage;
	}

	public void setPrevpage(int prevpage) {
		this.prevpage = prevpage;
	}

	public int getNextpage() {
		return nextpage;
	}

	public void setNextpage(int nextpage) {
		this.nextpage = nextpage;
	}


}
