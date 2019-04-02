package kr.co.uclick.repository;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.query.Param;

import kr.co.uclick.entity.User;


public interface UserRepository extends JpaRepository<User, Long> {
	
	public List<User> findUserByName(String name);//검색
	public List<User> findUserByNameContaining(String name);//포함 검색
	public List<User> findAllByOrderByIdDesc();//전체검색
	public List<User> findAllById(Long id);
	
	Page<User> findAll(Pageable page);//전체 보기
	
	Page<User> findAllByOrderByIdDesc(Pageable page);//게시판 역순 정렬
	
	@Query("select t from User t where name like concat('%', :searchString ,'%')")
	Page<User> findUserByNameContaining(@Param("searchString") String searchString, Pageable page);
	
	//Query cache 적용 
//	@QueryHints(value= {
//			@QueryHint(name="org.hibernate.cacheable",value="true"),
//			@QueryHint(name="org.hibernate.cacheMode",value="NORMAL"),
//			@QueryHint(name="org.hibernate.cacheRegion",value="user-search-like")
//	})
//	public List<User> findUserByNameLike(String name);		
	
}
