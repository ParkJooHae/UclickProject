package kr.co.uclick.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import kr.co.uclick.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
	
	public List<User> findUserByName(String name);//검색
	public List<User> findUserByNameContaining(String name);//포함 검색
	public List<User> findAllByOrderByIdDesc();//전체검색
	
}
