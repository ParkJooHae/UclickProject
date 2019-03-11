package kr.co.uclick.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import kr.co.uclick.entity.user;

public interface UserRepository extends JpaRepository<user, Long> {
	public List<user> findUserByName(String name);
}
