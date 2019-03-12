package kr.co.uclick.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.uclick.entity.User;
import kr.co.uclick.repository.UserRepository;

@Service
@Transactional
public class UserService {
	
	@Autowired 
	UserRepository userRepository;
	
	@Transactional(readOnly = true)
	public List<User> findAllByOrderByIdDesc() {// 전체 조회
		return userRepository.findAllByOrderByIdDesc();
	}
	

}
