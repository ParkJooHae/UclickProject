package kr.co.uclick.repository;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import kr.co.uclick.repository.UserRepository;
import kr.co.uclick.configuration.SpringConfiguration;
import kr.co.uclick.entity.Phone;
import kr.co.uclick.entity.User;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = SpringConfiguration.class)
public class UserRepositoryTest {

	@Autowired
	UserRepository userRepository;
	@Autowired
	PhoneRepository phoneRepository;
	
	@Test
	public void test() {
		User testt = new User("park","운영","사원");//등록확인
		testt.addPhone(new Phone("010-1111-1111"));
		testt.addPhone(new Phone("010-1111-2222"));
		testt.addPhone(new Phone("010-1111-3333"));
		
		User testtt = new User("kim","인사","대리");//등록확인
		testtt.addPhone(new Phone("010-2222-1111"));
		testtt.addPhone(new Phone("010-2222-2222"));
		
		userRepository.save(testt);
		userRepository.save(testtt);
	}
	
	@Ignore
	@Test
	public void testRepo1() {// 조회 테스트
		List<User> list = userRepository.findAll();
		System.out.println(list);
	}
	@Ignore
	@Test
	public void testRepo2() {// 이름 검색 테스트
		List<User> list = userRepository.findUserByName("park");
		System.out.println(list);
	}
	
	@Ignore
	@Test
	public void testRepo3() { // 번호 검색 테스트
		List<Phone> list = phoneRepository.findByNumContaining("1111");
		System.out.println(list);
	}
	@Ignore
	@Test
	public void testRepo4() {// 사원 등록 테스트
		User usr = new User();
		usr.setName("Lee");
		usr.setDepart("기술지원");
		usr.setPosition("부장");
		userRepository.save(usr);
	}
	
	@Ignore
	@Test
	public void testRepo5() { // 번호 등록 테스트
		User usr = userRepository.findById(2L).get();
		Phone phone = new Phone("000-2424-2424");
		//usr.addPhone(new Phone("000-2424-2424"));
		phone.setUser(usr);
		phoneRepository.save(phone);
	}
	
	
	
}