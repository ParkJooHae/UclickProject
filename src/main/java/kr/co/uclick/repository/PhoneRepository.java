package kr.co.uclick.repository;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.QueryHints;

import kr.co.uclick.entity.Phone;
import kr.co.uclick.entity.User;

public interface PhoneRepository extends JpaRepository<Phone, Long> {
		public List<Phone> findByNumContaining(String number);//번호 검색
		public List<Phone> findByNum(String number);
		List<Phone> findByUserId(Long id);
		public boolean existsByNum(String num);
		
		//Query cache 적용 
//		@QueryHints(value= {
//				@QueryHint(name="org.hibernate.cacheable",value="true"),
//				@QueryHint(name="org.hibernate.cacheMode",value="NORMAL"),
//				@QueryHint(name="org.hibernate.cacheRegion",value="user-search-like")
//		})
//		public phone findPhoneByNumLike(String num);	
}
