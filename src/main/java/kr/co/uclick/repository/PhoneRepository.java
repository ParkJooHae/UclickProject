package kr.co.uclick.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import kr.co.uclick.entity.Phone;
import kr.co.uclick.entity.User;

public interface PhoneRepository extends JpaRepository<Phone, Long> {
		public List<Phone> findByNumContaining(String number);//번호 검색
		public List<Phone> findByNum(String number);
		List<Phone> findByUserId(Long id);
		public boolean existsByNum(String num);
		
}
