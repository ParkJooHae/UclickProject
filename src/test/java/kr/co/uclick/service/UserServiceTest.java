package kr.co.uclick.service;

import java.util.List;
import java.util.stream.Collectors;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import kr.co.uclick.configuration.SpringConfiguration;
import kr.co.uclick.entity.Phone;
import kr.co.uclick.entity.User;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = SpringConfiguration.class)
public class UserServiceTest {
	
	@Autowired
	UserService userService;
	@Autowired
	PhoneService phoneService;
	
	@Ignore
	@Test
	public void test1() {// 정보 수정
		//userService.Update(2L, "정보수정", "부서명", "직급","경기도","휴가중");
		
		userService.findAllById(1L);
	}
	
	
	@Test
	public void test2() {// 사원 추가/ 삭제
		userService.Create("Jung", "사장", "사장","경기","없음"); // 신규 작성
		phoneService.AddNum(1L, "000-1111-1111");
		phoneService.AddNum(1L, "000-2222-2222");
		phoneService.AddNum(1L, "000-3333-3333");
		
		userService.Create("Park", "개발", "부장","경기","없음"); // 신규 작성
		phoneService.AddNum(2L, "000-4444-4444");
		phoneService.AddNum(2L, "000-5555-5555");
		
		//userService.Delete(3L);
		
	}
	
	@Ignore
	@Test
	@Transactional
	public void test3() {// 전체 불러오기 TEST
		//List<User> list = userService.findAllByOrderByIdDesc();
//		for (int i = 0; i < list.size(); i++) {
//			System.out.println(list.get(i).getName());
//			List<Phone> phones = list.get(i).getPhones().stream().collect(Collectors.toList());
//			for (int j = 0; j < phones.size(); j++) {
//				System.out.println(phones.get(j).getNum());
//			}
//			
//		}
	}
	
}
