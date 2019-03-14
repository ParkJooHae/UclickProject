package kr.co.uclick.service;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

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
	
	
	@Test
	public void test1() {// 정보 수정
		//userService.Update(2L, "정보수정", "부서명", "직급","경기도","휴가중");
		
		userService.findAllById(1L);
	}
	
	@Ignore
	@Test
	public void test2() {// 사원 추가/ 삭제
		userService.Create("Jung", "사장", "사장","경기","없음"); // 신규 작성
		phoneService.AddNum(1L, "000-3333-6666");
		phoneService.AddNum(1L, "000-3333-7777");
		
		userService.Create("Park", "개발", "부장","경기","없음"); // 신규 작성
		phoneService.AddNum(2L, "000-9999-9999");
		phoneService.AddNum(2L, "000-8888-8888");
		
		//userService.Delete(3L);
		
	}
	
}
