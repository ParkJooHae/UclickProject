package kr.co.uclick.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import kr.co.uclick.configuration.SpringConfiguration;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = SpringConfiguration.class)
public class PhoneServiceTest {
	@Autowired
	UserService userService;
	@Autowired
	PhoneService phoneService;
	
	@Test
	public void test1() {
//		phoneService.AddNum(2L, "000-3434-3434");// 번호 추가
//		
//		phoneService.UpdateNum(11L, "010-4545-9292");// 번호 수정
//		
//		phoneService.deleteNum(11L); // 번호 삭제
//		
		
	}
	
	
}
