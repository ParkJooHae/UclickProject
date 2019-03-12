package kr.co.uclick.service;

import java.util.List;

import kr.co.uclick.entity.User;

public interface UserService {

	public List<User> findUserByName(String name);//검색
	public List<User> findUserByNameContaining(String name);//포함 검색
	public List<User> findAllByOrderByIdDesc();//전체검색
	void Create(String name, String depart, String position); // 신규 작성
	void Update(Long id, String name, String depart, String position); // 정보 수정
	void Delete(Long id);// 삭제
	
}
