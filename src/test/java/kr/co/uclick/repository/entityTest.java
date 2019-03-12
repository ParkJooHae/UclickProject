package kr.co.uclick.repository;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import kr.co.uclick.repository.UserRepository;
import kr.co.uclick.configuration.SpringConfiguration;
import kr.co.uclick.entity.Phone;
import kr.co.uclick.entity.User;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = SpringConfiguration.class)
public class entityTest {

	@Autowired
	UserRepository userRepository;
	@Autowired
	PhoneRepository phoneRepository;

//	@Test
//	public void test() {
//		User testt = new User("park","운영","사원");//등록확인
//		testt.addPhone(new Phone("010-1111-1111"));
//		testt.addPhone(new Phone("010-1111-2222"));
//		testt.addPhone(new Phone("010-1111-3333"));
//		
//		userRepository.save(testt);
//	}
	
	@Ignore
	@Test
	public void testRepo1() {
		List<User> list = userRepository.findAll();
		System.out.println(list);
	}
	@Ignore
	@Test
	public void testRepo2() {
		List<User> list = userRepository.findUserByName("park");
		System.out.println(list);
	}
	
	@Test
	public void testRepo3() {
		List<Phone> list = phoneRepository.findByNumContaining("1111");
		System.out.println(list);
	}
	
}