package kr.co.uclick.service;

import java.util.List;

import kr.co.uclick.entity.Phone;

public interface PhoneService {
	public List<Phone> findByUserId(Long id);
	public List<Phone> findByNumContaining(String number);//번호 검색
	public List<Phone> findByNum(String number);
	void AddNum(Long id, String num); // 번호 추가
	void UpdateNum(Long id, String num); //번호 수정 
	void deleteNum(Long id); //번호 삭제 
	public boolean existsByNum(String num);
	
}
