package kr.co.uclick.service;

import java.util.List;

import kr.co.uclick.dto.UserDto;
import kr.co.uclick.entity.Phone;
import kr.co.uclick.entity.User;

public interface UserService {
	
	public List<User> findUserByName(String name);//검색
	public List<User> findUserByNameContaining(String name,int page, int cnt);//포함 검색
	public List<User> findAllByOrderByIdDesc(int page, int cnt);//전체검색
	
	
	void Create(String name, String depart, String position, String address, String special); // 신규 작성
	void Update(Long id, String name, String depart, String position, String address, String special); // 정보 수정
	void Delete(Long id);// 삭제
	public List<User> findAllById(Long id);//하나 조회
	
	UserDto findPage(int page, int cnt, int searchOption, String keyword);//전체 페이지를 계산
	
	UserDto makePage(int page, int pagenum, int lastpage);// 현재 페이지 계산
	
	UserDto pagenow(String page);
	
}
